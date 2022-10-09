Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E05F88CF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 04:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AD910E28C;
	Sun,  9 Oct 2022 02:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B6510E28C
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 02:15:15 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id y4so1682888iof.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Oct 2022 19:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JpkrynInBk4Gig68d82GDSuRNyz+N99lUi3tPpqQn1Y=;
 b=KUBfVvEt03ilQTj5FK8GWOnIjci2oqtZdj15FaXJERjrMf8jRDPzUAqqmZV1tLO4gM
 M6PY1EQogYxy2bbzRSOZB2vELb/ehxzCXwUp7qKAZSKNryXSA43UqQhOtjlQj1owlQqX
 cTEjL3mjTEvtpaJ+hBMwTRMynyWhjsNjXTjVvAG5nIfk1PdMTu0TwOYWz3PtoPR2pVcn
 wWbjNOWLe2m5JfgESdOzTLT5C+CIN1q+Djn41ezD1TlQ82HMRy1ngxURJJelY5VylGdR
 hB61xPCEi2jpPc0d489v6o2jpxTX/wn2YnsbWoUko9ZzooRMr4f/3Zvdb72N3y83wQYc
 +mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JpkrynInBk4Gig68d82GDSuRNyz+N99lUi3tPpqQn1Y=;
 b=Z+smhrQLXd/iQjuClfo/z1ujG2mPJxXbhYZywI1c9S8gv0TNiovR0JO+uFp8FI97Uw
 QL4ZaFhcSLCbH+fL/m54AZ2MhbmJA5/2YiDTDydjbJUFd3FIYMULpYO6qJ7jDSqbzubz
 gT1iHAvhsO5rfXmPBVmR/c1RHZhlC0CIl5x2mW8zbDigU1Bktov45ld6U9S8qRQPoEj7
 0ipacPsPY4c5twtFh/1U79pC462crvNu8P8JgTdgyms/phlxdLg0CxWt+rlOKFjl2gM2
 i7ds1l3B+bzqxEDrJC70Q7qkCOefVxAHaBKpghjHLsTP//5nQQYO9yCtgUhOAXDMW4UM
 QE3A==
X-Gm-Message-State: ACrzQf1TAlRo5ruRk0ca5qr0v4DCm79VrxPY8OYG4lONDsBNv0MJb3QE
 FPumsVPxAknXpdS4YVoTHLeFFfps2t9yr3c231g=
X-Google-Smtp-Source: AMsMyM5vG7sqy2eAPyqqAVTb/Ry1BFCa6AaLshQqgXZYNF8utqWbUUFQSIhAymSpj5T7j475tUW6Nn0dVCSEMDMPQHs=
X-Received: by 2002:a05:6638:2385:b0:35a:623b:b2ca with SMTP id
 q5-20020a056638238500b0035a623bb2camr6145496jat.24.1665281714718; Sat, 08 Oct
 2022 19:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220928093103.64014-1-khalid.masum.92@gmail.com>
 <CACRpkdbZWMk9+wH8ndFEzZyUwKecjNfgT2xJnZEQx0ACPzLWbw@mail.gmail.com>
In-Reply-To: <CACRpkdbZWMk9+wH8ndFEzZyUwKecjNfgT2xJnZEQx0ACPzLWbw@mail.gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Sun, 9 Oct 2022 08:15:03 +0600
Message-ID: <CAABMjtGFKK2EJojFMqzMPmRfcJzo1yzdOqDVT804WnhOQ1O79Q@mail.gmail.com>
Subject: Re: [PATCH] drm/tve200: Use drm_* variants for logging
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 4, 2022 at 12:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Sep 28, 2022 at 11:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> > We have routines like drm_info/warn/err for logging. Use them instead
> > of dev_* variants to get drm-formatted log messages.
> >
> > Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
>
> So is this the new thing? We've been through:
> - DRM_INFO_ETC BIG CAPITAL LETTER MACROS
> - Just use dev_info() & friends like everyone else
> - Now drm_info() & co
>
> Note I don't wanna bikeshed about this, just tell me there is
> consensus now so we know what to do.

Hi,

I was working on a TODO described here:
https://github.com/torvalds/linux/blob/master/Documentation/gpu/todo.rst#convert-logging-to-drm_-functions-with-drm_device-paramater

"Convert logging to drm_* functions with drm_device paramater". I do not
know of any consensus by the way.

>
> Yours,
> Linus Walleij

Thanks,
  -- Khalid Masum
