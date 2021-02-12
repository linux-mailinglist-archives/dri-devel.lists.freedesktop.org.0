Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D331A1F3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 16:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207BF6E122;
	Fri, 12 Feb 2021 15:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CD26E122;
 Fri, 12 Feb 2021 15:45:16 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id y123so4998070vsy.13;
 Fri, 12 Feb 2021 07:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KBmnem5bXapMhZ3AHo+vomjF3xbe9tfsjub6bcY0Y+I=;
 b=gmREjj2UGg+TH5/nBXrH2CjuGlsTNdz+Wzh7jLeXZkpbZfFfPaf81jegeTj/7/oTO7
 gERhGZwAHndkARDfIETIuDZNq6ubVqQQIvCDYVRz8Ydp+dzywUoK0k7VkMRxbpuNBzDY
 qwA/tTzCxtCntmceKAGDMflxLskVPC7BXaHCNZ2+S8erkiaSUnyEwcZ1Y/XMxms2NhV9
 R8dbhQY8mjFcqnhlGnMdOYAmTDuagaX+7kAclBJ4FsjDxgTcbj0Qxj+q70Gp7tj9bqzw
 Vot/AQCvHvB/+SSJWeq9ob0wu7ZejZ/2nvhirNZWjeKLDSexxFn/6sYuJF1Hq96Ww52F
 3RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KBmnem5bXapMhZ3AHo+vomjF3xbe9tfsjub6bcY0Y+I=;
 b=XjXqEWQSQV1TvR95oWzsPnD+Hbiy0dvKNswjVAj9VsyvX7ANmOqs/KDjM7I4ZUYHNt
 96yMnnbDTk6NizTzfOVI0svOFQVfbST8NMU1gaNs/c1Co0/PasDtHlx/gZeB7v2cY2aB
 CBIMbhzpfxwdJmSFmHpZgpV799u4Svoe7T1js7pts3gsXp9v2X1NBbky/8nYZ/lpTb5t
 sUPCRROIIGEU1iOu8my56xLspw5XdrX+HGXHq6JHbA6LLtvtdo5h8yRrIygynQJU5cM0
 NjZ4WwvXAGlAyrN7ubOtLWHV5BNOgE+qn18yFTnIVOeWfLfEqI8Oh97UzxZS63SzZV2m
 zrIw==
X-Gm-Message-State: AOAM5327SWJTor9+5vbGOrFfxr8U6eWRuwklq7ppBDo0OLPI7KEcD3Bp
 uIdNY4SLbwZKIknBjq8UHL8R+UorpKGrR2+Qa4gDBXq47oSIuA==
X-Google-Smtp-Source: ABdhPJxvx3w8uaeShjW1bmGXLr+nuWPtjIznz99ug2/sLtUxi+4SX9YTj8hiSLPJwl19l4/L4WwadM0lsPfy1BZgTn8=
X-Received: by 2002:a67:fb8b:: with SMTP id n11mr1954371vsr.22.1613144715796; 
 Fri, 12 Feb 2021 07:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20210204121121.2660-1-chris@chris-wilson.co.uk>
 <20210204121121.2660-3-chris@chris-wilson.co.uk>
 <CACvgo51auuU-AR5nPPo-7Q8Ho84cqOYXuTjgjGDzmPjXRtjZ0w@mail.gmail.com>
 <161314296740.4581.15495829753022855916@build.alporthouse.com>
In-Reply-To: <161314296740.4581.15495829753022855916@build.alporthouse.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 12 Feb 2021 15:45:04 +0000
Message-ID: <CACvgo50CUgQbBb2=Y4BXyUyoP0x+mwAzT35Oc-kQm+sJyESzcg@mail.gmail.com>
Subject: Re: [RFC 3/3] drm/i915/gt: Export device and per-process runtimes via
 procfs
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Feb 2021 at 15:16, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Emil Velikov (2021-02-12 14:57:56)
> > Hi Chris,
> >
> > On Thu, 4 Feb 2021 at 12:11, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > >
> > > Register with /proc/gpu to provide the client runtimes for generic
> > > top-like overview, e.g. gnome-system-monitor can use this information to
> > > show the per-process multi-GPU usage.
> > >
> > Exposing this information to userspace sounds great IMHO and like the
> > proposed "channels" for the device engines.
> > If it were me, I would have the channel names a) exposed to userspace
> > and b) be a "fixed set".
>
> - Total
> - Graphics
> - Compute
> - Unified
> - Video
> - Copy
> - Display
> - Other
>
> Enough versatility for the foreseeable future?
> But plan for extension.
>
With a bit of documentation about "unified" (is it a metric also
counted towards any of the rest) it would be perfect.
For future extension one might consider splitting video into
encoder/decoder/post-processing.

> The other aspect then is the capacity of each channel. We can keep it
> simple as the union/average (whichever the driver has to hand) runtime in
> nanoseconds over all IP blocks within a channel.

Not sure what you mean with capacity. Are you referring to having
multiple instances of the same engine (say 3 separate copy engines)?
Personally I'm inclined to keep these separate entries, since some
hardware can have multiple ones.

For example - before the latest changes nouveau had 8 copy engines,
3+3 video 'generic' video (enc,dec)oder engines, amongst others.

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
