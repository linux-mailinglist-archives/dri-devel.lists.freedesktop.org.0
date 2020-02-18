Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D1162FA3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 20:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208CE6EA6A;
	Tue, 18 Feb 2020 19:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742256EA6A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 19:18:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w15so25354378wru.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 11:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=EDv1Nfe5wsXfzyx8EHU5Go2CXWqnRUT+kGZGsxidLAE=;
 b=gPYG7Up24HLKpZ2gCcBHga9Kdn41TjeEpUn3sEfyxxZOeb7n5ZX/xuScf9tRJaAVx6
 MoH32/VpmVP1Jt3EglGtbe0koWcMmkTEE2/5ECdhSTZ60aSdd0RR2DnfByRsKFU595Os
 uoRd7KoMm5qj6sBTo1P+E6zboAFd3PnBLqEno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=EDv1Nfe5wsXfzyx8EHU5Go2CXWqnRUT+kGZGsxidLAE=;
 b=QBKHhOHnESyqVR1VeJS8SkpVOCCvb/gJmmf0pyxDjIzMYFhr/c9aTQMr9h/q+fdHUm
 uI4WEK2h25SJg0Hkjb8odtDTwwhYhMI1Nfzxk9cvJFg2dXi4K+sI9B81m6pPRPrhxDMe
 +xuVDucF9Lnbv0OvCcHJZ7QQFgxqZYzb0h/fBBvZxJt4pRtVg0gPcBTwI10+cHsPqB8E
 mNy+5oJ84zse66d6s8VMvCuO7SINk8ZuLkbWDYX2joZoPVgKKOUqMLBJdVwPdcRae5lU
 3iZRpF+FKTnZQ3y/7pUCBO9PONRkPck8zyygWJxkElgdq0P6YGptMS/XWlZuSdehfKB2
 dXxg==
X-Gm-Message-State: APjAAAV5jOcHy3fMSkmW5PuwwWhXTH8gNELytzdGw5O2preaIZtTSQra
 Ee7rRJjIoZoAzgqnslNiF6IzXg==
X-Google-Smtp-Source: APXvYqx+/IkcOWLmZ/nIlILF5xmAM7d4Bh9kKuTs/+e2gy8RKNfntjbzdg7t7O97vuabW9+kI7TpgA==
X-Received: by 2002:a5d:5148:: with SMTP id u8mr32125166wrt.132.1582053533137; 
 Tue, 18 Feb 2020 11:18:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x11sm4433598wmg.46.2020.02.18.11.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:18:52 -0800 (PST)
Date: Tue, 18 Feb 2020 20:18:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/arc: make arcpgu_debugfs_init return 0
Message-ID: <20200218191850.GP2363188@phenom.ffwll.local>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <CAKMK7uHeSW-sFCZK09n89mJ66J3sb0EtxYU9Ojfi-adM7czTug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHeSW-sFCZK09n89mJ66J3sb0EtxYU9Ojfi-adM7czTug@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 08:00:30PM +0100, Daniel Vetter wrote:
> On Tue, Feb 18, 2020 at 6:28 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
> >
> > As drm_debugfs_create_files should return void, remove its use as the
> > return value of arcpgu_debugfs_init and have the latter function
> > return 0 directly.
> >
> > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > ---
> >  drivers/gpu/drm/arc/arcpgu_drv.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> > index d6a6692db0ac..660b25f9588e 100644
> > --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> > +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> > @@ -139,8 +139,10 @@ static struct drm_info_list arcpgu_debugfs_list[] = {
> >
> >  static int arcpgu_debugfs_init(struct drm_minor *minor)
> >  {
> > -       return drm_debugfs_create_files(arcpgu_debugfs_list,
> > -               ARRAY_SIZE(arcpgu_debugfs_list), minor->debugfs_root, minor);
> > +       drm_debugfs_create_files(arcpgu_debugfs_list,
> > +                                ARRAY_SIZE(arcpgu_debugfs_list),
> > +                                minor->debugfs_root, minor);
> > +       return 0;
> 
> For cases like these I think we should go a step further and also
> remove the return value from the driver wrapper. And that all the way
> up until there's something that actually needs to return a value for
> some other reason than debugfs.

This ofc applies to almost all the driver patches for this series, most
can be cleaned up quite a bit more.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
