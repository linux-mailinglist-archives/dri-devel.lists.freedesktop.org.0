Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0072C330DD1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 13:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF4A6E171;
	Mon,  8 Mar 2021 12:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1289D6E04A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 12:34:04 +0000 (UTC)
Date: Mon, 08 Mar 2021 12:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1615206841;
 bh=BNhDdUiS76UCPYaB/Wh1c4p5iqvTo14lRDgfk7ZH4kE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=NfXc7dWf0b9dZSOsN5CXSX/fSn2ijFD4GFTpOVVShCjuxjrLaTodeXzmxAsOQLsb6
 qPUig94VJ6XJqzunCuV0xpjjtLKmVkFJacc6hXGb6omkWNsbdxDrSpYkGjUgaaUrrP
 GO+cOA2nc4yhf+QYq5FgRWrwIk3WLUezsWkikNwjhqwwv0gqGsIopsAm7uEv+x2pOH
 yEsPnDvRPEsRs0ewaBH6Ow5VISbOA1q1b12xWrd+FvkrNRGVibd2wifatjuxMkBSoN
 SkD/pC5prEWtEzgBKhVK8cchMfn1FKqi6MSffnoLj+pB+Ov9l5zfdjZ4ULnYmANwaq
 kSlLZ23xtrZGg==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/uapi: document kernel capabilities
Message-ID: <wzOYTxXx9Bn2Uqy1nbW9F1pwM6DTKz2O8PZ2_a6c5ZyTQ3UIX9EQaEiHGDa05CNpcnwK7vAkaeBZxyqfNlfj-DASzrXZdjj2kdQu3z5Zg1c=@emersion.fr>
In-Reply-To: <20210308102043.7246e484@eldfell>
References: <20210304221057.657146-1-contact@emersion.fr>
 <20210305102850.769bf34d@eldfell>
 <zaAAWSkCocn-BDN-fR6Oi8EA0pCVhc3gwthb6JWi84iyYmdyCJ1sWiYgtw6POBH6TseYGQ9x-NWTPAJ-9gKfCFFWv9lyt6s0F7sRrEQW-yI=@emersion.fr>
 <20210308102043.7246e484@eldfell>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, March 8th, 2021 at 9:20 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> > > > +/**
> > > > + * DRM_CAP_CRTC_IN_VBLANK_EVENT
> > > > + *
> > > > + * If set to 1, the kernel supports reporting the CRTC ID in
> > > > + * &drm_event_vblank.crtc_id.
> > >
> > > Does this not apply also to the pageflip / atomic completion event?
> >
> > Both DRM_EVENT_VBLANK and DRM_EVENT_FLIP_COMPLETE use the struct
> > drm_event_vblank, so yes. I'll mention these two events explicitly.
>
> They do? Seems like I have been spoiled by the libdrm API that uses
> drmEventContext with different callbacks for these things.

Yeah, see drmHandleEvent [1] in libdrm.

[1]: https://gitlab.freedesktop.org/mesa/drm/-/blob/7d6a1759900ffde0a7aac2fa0cbd7c2bf4989476/xf86drmMode.c#L922
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
