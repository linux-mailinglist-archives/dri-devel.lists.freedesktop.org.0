Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6354DE62
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD51113DBD;
	Thu, 16 Jun 2022 09:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBF3113DBD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:48:13 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z7so1384090edm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivwPC76/EpddR8aIRsz8R66y1gZE1lQxH18cuBuNh9w=;
 b=IJ2ZEfa444Gxt/Z0FZZ4GxV5yN+erEsufLcKmomyhw5fUOVqzQdQAIRayiYb+Qm1Eh
 yWb0C9Z4DfUvu9mfAkALWTkSfIlkhL8URQbQyX4zqIAQALQZ+ZkNOjNHTp0nctBRXGzs
 smm0dQAuc/7v2WAGrIwapBT2KvBs8Uf6SRXKqp9TXwYgYVovJ1x3xu2/sKq6Kicvl27E
 s6RLHZVpYbgh44S8H6x14rYBSph+HXSFRdfR49SS5nx2uRdHNTHeOBxga0XY/BA+T1fk
 HyoQvjfxwcX68sONS75Y/cnOhdPnzGcz1UJXxuOsnIg5+PseWCZyYoCdjwdj7np1I3q9
 2d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivwPC76/EpddR8aIRsz8R66y1gZE1lQxH18cuBuNh9w=;
 b=evUEsfWZK4xqfaAAu6hZyZmNB6Sk0AaMWGLa8jeS99LfeQ9l+kBGpoZmbHD3yzkBNH
 4OjDGsIPOoIQtvqXFkHsFmiNxUXhzJkyYQKvCeEvD6sPtSLMfHBIbaYEY5OIePJVDcSM
 rnWCjkQteNivSEEt0g1x4Sy813mmdMUvQ1n+8edNS0wPaRVyrd1eyqEW0BEjHt+aUPxD
 nHM5Ny5Yg/H4ph56p2DwhJoyzG7sum8VEAyzQikFbdFTwKbmWiAp7WOyESBvM/ZJwVlF
 rM3KOoWwWrN1W7RJ97BsgVwKfijnKSlJE/dlp7ziyUr7gv6TJYPTfP/EdfjsCdktRP6z
 6URg==
X-Gm-Message-State: AJIora9jZldkzD/Hs3jpLIX+9SPqnTBPDwDi/vTnyJdw7lSbiFdAfo1w
 EIwml5rmeYyCeRvPYGunwi5k+U0DloZGc+/2eYUGEg==
X-Google-Smtp-Source: AGRyM1t+DUrFOhYWTqYmwbszJ5vdd6m0yXDtl1WdsW5yg4WF1e9HUj1DD3qrlxHVGBJhQa1T7eHrhGb2Cf3tPKEQ2vY=
X-Received: by 2002:a05:6402:524d:b0:42e:332:dd04 with SMTP id
 t13-20020a056402524d00b0042e0332dd04mr5310981edd.258.1655372892115; Thu, 16
 Jun 2022 02:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-26-maxime@cerno.tech>
 <CAPY8ntDemhFi3ZFfOE_9kxtmc7v8Wse0C+dz0xxLrBGvSPh12w@mail.gmail.com>
 <20220616083835.2e7jfrlicbkgkra2@houat>
In-Reply-To: <20220616083835.2e7jfrlicbkgkra2@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jun 2022 10:47:56 +0100
Message-ID: <CAPY8ntCB-_o0Td41PxeZ6NC004aQ8jvNrsVfO_SFpTVENT4U8w@mail.gmail.com>
Subject: Re: [PATCH 25/64] drm/vc4: dpi: Add action to disable the clock
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 at 09:38, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Tue, Jun 14, 2022 at 05:47:28PM +0100, Dave Stevenson wrote:
> > Hi Maxime.
> >
> > On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Adding a device-managed action will make the error path easier, so let's
> > > create one to disable our clock.
> >
> > The DPI block has two clocks (core and pixel), and this is only
> > affecting one of them (the core clock).
>
> Thanks for the suggestion, I've amended the commit message.
>
> > (I'm actually puzzling over what it's wanting to do with the core
> > clock here as it's only enabling it rather than setting a rate. I
> > think it may be redundant).
>
> Could it be that it a "bus" clock that we need it to access the
> registers?

No idea. Normally it's the power domain that is required to access registers.
AFAIK the core clock is never turned off, so the request for it is
just a little odd.
It is what it is though, so fine to leave it alone.

  Dave
