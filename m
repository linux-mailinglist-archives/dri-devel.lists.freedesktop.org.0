Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52D322D82
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8146E842;
	Tue, 23 Feb 2021 15:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314F66E840
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 15:29:26 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id v21so2797408wml.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fh61dZLxlIYhL9DZ4QpbUyEKQf/XaqyHBG4/UJZbjr0=;
 b=EGltyJ0ASGwjGfqlUbNOOs45w20SkNaGjh5pnAILwq9k/M3fyetuc7dAxc/M80sMZ3
 qIQJ7zau3mv+DawHBG9o17p9lcdexhXHJS+GhbukIo/eIoOnzY3vsNGLGzY3jH/xff1V
 iOvSlg1mY44AKWOsLppDUZpzDI6cluQxIGdTBO+OdwBBlzSVtjztDUhCFiEmuW0TDTPw
 aNBN1jz+SfrAlDM0EQCgbW5nyrhqAAIIssIsgJhOdcY7wgUA69ydy3LYuTBZT3ZGUylF
 3spCL/v4t3QYu+t6uq6Q+Yn+pgMIy/FIECKdKVj4IB1XBeC+j6SVtbZ6ynmFO0JEnhhS
 5Gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fh61dZLxlIYhL9DZ4QpbUyEKQf/XaqyHBG4/UJZbjr0=;
 b=R0kOhfrDRXDAgoRFfJxEQKfHQuD0r53JWtc0W/K9okguZ0hVrmGZWkPtIwFBw5e08L
 qJGPaym85sDQBf9ws2YxML/zdGp2HGkUHVcth2tasUJMsStw1f7swrRwa1iP4T76hpWP
 +/j9XytwaLyH2xcORyUucOZG9BQOTmZQ7vp6p5dnBsLKECBpHIQ+2eixS1w0C3sea62e
 elpibp2GuZC1t+kUMsmfZ+mjHcsTgMUOO3Vu1wFsf3rsk+XvA2TLEHEVfXkS60AWxc1o
 r9VckDd/da5TZqnP5mAAr0eJ7YDcsFRiZvDwvY80e8LE/YqDSm4OnZuU+zrlfVdhTdIR
 K49Q==
X-Gm-Message-State: AOAM5312SZd0pKHTKWvw6O+oWGXSLlH8gNECiOcib171I3DcM955j/Tg
 83lIh4SQSgbXv4szvOMI3OjcqNSUEsbnEWz8U3uOpw==
X-Google-Smtp-Source: ABdhPJzkAJcGeMm9WU/64qA/bOQIsqC1fmp4wDXpKnBk9mBD5VoAgwwJJc3IDvDmzhkDivRD7knZWL1eo9I5VieU1J0=
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr25773390wmc.168.1614094164835; 
 Tue, 23 Feb 2021 07:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <20210223145143.7bfayhp32tzdj637@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20210223145143.7bfayhp32tzdj637@DESKTOP-E1NTVVP.localdomain>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 23 Feb 2021 15:29:13 +0000
Message-ID: <CAPj87rMkSdtrHnoLzK6zAVvST2KH8SprNnp5bS92qpr84g=fPg@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Brian Starkey <brian.starkey@arm.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Feb 2021 at 14:58, Brian Starkey <brian.starkey@arm.com> wrote:
> On Tue, Feb 23, 2021 at 02:27:11PM +0000, Daniel Stone wrote:
> > Mark, or others from Rockchip, can you please:
> > - explain if there is a way to enable/disable the YTR transform in the
> > VOP's AFBC decoder, similar to the split-block control bit?
> > - ack this patch which correctly declares that the YTR transform is in
> > use in order to make Panfrost work, so it can be merged through
> > drm-misc, or provide another solution which fixes this API mistake?
> > - if VOP does have a hidden YTR-disable bit, add support to disable
> > YTR so rockchip-drm can continue advertising the non-YTR modifier, and
> > Cc this patch for backporting to every kernel tree which declares AFBC
> > modifier support?
>
> Drive-by $0.02:
>
> As described in https://www.kernel.org/doc/Documentation/gpu/afbc.rst,
> YTR is only valid for "BGR" component order, so this shouldn't be set
> or used for "RGB" order (or YUV) formats. For BGR-order formats, it's
> best to always enable YTR to get the best compression ratio.
>
> In an ideal world, there wouldn't be hardware/drivers which
> support/allow non-standard encodings, but we don't live in that world
> :-(

This implies that RGB component ordering cannot be used together with
AFBC on RK3399, no?

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
