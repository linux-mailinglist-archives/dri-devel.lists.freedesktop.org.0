Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D2778E8BF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D7710E5C7;
	Thu, 31 Aug 2023 08:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928CF10E5C7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:51:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9a1c0bbfad9so7837066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1693471863; x=1694076663; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jWDq5kck7RscMt2sEXB5y+sPvFhAbNEGrptUJ7vQOfk=;
 b=RwIsqs+pIzIeY51N/E4MEse1s1f2BNR9epYkINm66FornLGw3FmPv/J938BVG0MvEK
 XALvWDEogs/4HP85pO9g/ip/QMGdWwinefeAh8JzVx7c+XfH0q+X47tYxUpyY1SQWeQv
 FjtzXVnJCjU8VfthSA3nNBxSLY2emIprs3Bbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693471863; x=1694076663;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jWDq5kck7RscMt2sEXB5y+sPvFhAbNEGrptUJ7vQOfk=;
 b=OuhrZOtIBRUsJ2OFbljKdRw1VRy2U3o3RfnTdpMPYGSThbfu/H8mXVSouTHc6q8Mll
 Eg0PRr+HAc4hTI/em9CMqyQsev5FN1zyG6AiiT1UyVUuqAJRhSk+ARM/3+lrNKAWSCv7
 xhbfCohej+5rIvWmxLzSvWwtEM1Viu/6k+/zhcpHsbKVzsL3gs7uveKhjCYW28VBn4ow
 HtXXA4zDglyeJMskF52PLXSwuKF/Qvb1rZiIpYgKME4SYCt5gtzCd96uAIX0C0SdkAEb
 kcUP1cduZiQZJ7VRpHcejP8f8w02jTcq4/XZhcCpWd8OuJWZF5O6ruhH3POqZh8BLFHJ
 moqA==
X-Gm-Message-State: AOJu0YyQNk6DcvpaYUG+9V9KdsjIwtfWSuGQQgMTQcRR/rVhH+Sq/SUO
 gzsCJvzk+Xn35JsEo1kX2TaJOA==
X-Google-Smtp-Source: AGHT+IHL7Z0g4vh5rzA9SEaNtkyHr08VO+jBiI+WkQ1eiFzmLVjUGcuFX9+sxNcwd5J+kRbpi0kN8Q==
X-Received: by 2002:a17:906:19:b0:9a1:f96c:4bb9 with SMTP id
 25-20020a170906001900b009a1f96c4bb9mr3193922eja.6.1693471862805; 
 Thu, 31 Aug 2023 01:51:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a170906951700b0099cf840527csm510831ejx.153.2023.08.31.01.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 01:51:02 -0700 (PDT)
Date: Thu, 31 Aug 2023 10:51:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] fbdev: Update fbdev source file paths
Message-ID: <ZPBUdJwZzvYYrNei@phenom.ffwll.local>
Mail-Followup-To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jingoo Han <jg1.han@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
 <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de>
 <ZPA26xdbTRdfuveS@probook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZPA26xdbTRdfuveS@probook>
X-Operating-System: Linux phenom 6.4.0-2-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 08:44:59AM +0200, Jonathan Neuschäfer wrote:
> On Wed, Aug 30, 2023 at 09:10:26AM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 29.08.23 um 22:02 schrieb Jonathan Neuschäfer:
> > > The files fbmem.c, fb_defio.c, fbsysfs.c, fbmon.c, modedb.c, and
> > > fbcmap.c were moved to drivers/video/fbdev, and subsequently to
> > > drivers/video/fbdev/core, in the commits listed below.
> > > 
> > > Reported by kalekale in #kernel (Libera IRC).
> > > 
> > > Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
> > > Fixes: 19757fc8432a ("fbdev: move fbdev core files to separate directory")
> > > Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> > 
> > IMHO these comments might just be removed.
> 
> I think it's nice to have some sort of visual separation between groups
> of functions in fb.h, which these comments provide at the moment.
> Therefore I'm currently leaning towards my patch as it is, but I'm
> willing to have my mind changed and do a v2 which just removes the
> comments.

Just the filename without the full path maybe? That's enough to find the
right file, and it's also better at highlighting the actual important part
of the comment since the path is very redundant.
-Sima

> 
> 
> Thanks
> 
> > 
> > Best regards
> > Thomas
> > 
> > > ---
> > >   include/linux/fb.h | 12 ++++++------
> > >   1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > > index ce7d588edc3e6..3cda5b9f2469b 100644
> > > --- a/include/linux/fb.h
> > > +++ b/include/linux/fb.h
> > > @@ -592,7 +592,7 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
> > >   	__FB_DEFAULT_SYS_OPS_DRAW, \
> > >   	__FB_DEFAULT_SYS_OPS_MMAP
> > > 
> > > -/* drivers/video/fbmem.c */
> > > +/* drivers/video/fbdev/core/fbmem.c */
> > >   extern int register_framebuffer(struct fb_info *fb_info);
> > >   extern void unregister_framebuffer(struct fb_info *fb_info);
> > >   extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
