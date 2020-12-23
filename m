Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5437D2E22B3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Dec 2020 00:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6178189958;
	Wed, 23 Dec 2020 23:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B389958
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 23:32:06 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id n18so231236ual.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 15:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEu2Ywja5d9FNVZ2oyUL01foxq4s/+vbWDIIInwf/3Y=;
 b=FsybICf8L04WVijO5U172s4Ei+vA+6rMA0uLVZa66EuxFBzwpR5A32YtMFWsdH8rkZ
 52B+i1k9lpk65xJn5g64f+G+Ga5RVHtP0kbv3whWfnsA6SbMxIwfLFdjRZEi6DYMBTRH
 zJfN5KXxv4XH9V50X1F4Cimrd3EI5+PwOv14miFgIj/FVxCzPpLLLH5QK0Vx8Nyt1rSB
 VHYLs2aGIA/Qe9K9Q15hUaiBje2fdnZmzfEk8CGNcbhBQP/wRys8sCZUzYkvDcixG6NF
 GxLhw7LgpEuBO5wSSVYzP9pir/fy/DDUoLKaRnA4kcJ4Hq58J8t78zPAgisl3GSvEXXP
 hJ8w==
X-Gm-Message-State: AOAM531YzKreV1a2Vx7Kxt0GcSgVuCOIRVQcZ2cytmklfok4H0TKCSTy
 o/jqjdMoqq3ya3SLtujlA4WaVXrxTxzjXD1XB7A=
X-Google-Smtp-Source: ABdhPJwySkAvYhz8FiJc8VpzujAk3FRX2ZP0d52TcGByCjej5AfIA2XXPb4MfmF1b6chJRb52fMDyWnUbD15LiVpLQM=
X-Received: by 2002:ab0:32cb:: with SMTP id f11mr20373557uao.109.1608766325168; 
 Wed, 23 Dec 2020 15:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
 <20201223212947.160565-5-paul.kocialkowski@bootlin.com>
 <oDsOkjfTYKa11LxfNy4LBLqutkVidfFn8--tjQPZj4w9gzCYNTOFglHqxXohsrYqTJ4uDv2xgJNKXPHzgAsACGnCkbKQis95SScGucOb1PI=@emersion.fr>
In-Reply-To: <oDsOkjfTYKa11LxfNy4LBLqutkVidfFn8--tjQPZj4w9gzCYNTOFglHqxXohsrYqTJ4uDv2xgJNKXPHzgAsACGnCkbKQis95SScGucOb1PI=@emersion.fr>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 23 Dec 2020 18:31:54 -0500
Message-ID: <CAKb7UvhgHPkG5Sn-HLdpsFw0R=kATJKUmjSwPSuwviDCk0RGyw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] NOTFORMERGE: drm/logicvc: Add plane colorkey
 support
To: Simon Ser <contact@emersion.fr>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FWIW this is something I added, hoping it was going to get used at
some point, but I never followed up with support in xf86-video-nouveau
for Xv. At this point, I'm not sure I ever will. I encoded the
"enabled" part into the value with a high bit (1<<24) -- not sure that
was such a great idea. All NVIDIA hardware supports colorkey (and not
actual alpha, until the very latest GPUs - Volta/Turing families),
although my implementation only covers the pre-G80 series (i.e. DX9
and earlier GPUs - pre-2008). Should a determination of usefulness be
reached, it would be easy to implement on the remainder though.

Cheers,

  -ilia

On Wed, Dec 23, 2020 at 5:20 PM Simon Ser <contact@emersion.fr> wrote:
>
> nouveau already has something for colorkey:
> https://drmdb.emersion.fr/properties/4008636142/colorkey
>
> I know this is marked "not for merge", but it would be nice to discuss
> with them and come up with a standardized property.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
