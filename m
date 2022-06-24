Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDED55A3ED
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0F10F1C4;
	Fri, 24 Jun 2022 21:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49E110F1C4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:50:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v14so4790121wra.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ifhz7JKl3t26887q2ZrIQf1CUYIRNThSHGf/5kqiQlo=;
 b=It5SrDMEj3GijQEOxS5EBCZlTJJJXwd/H1aziNv3aOLA79384H5yJgS5MTYIzovjtM
 ZL3cCS21Weo0OvEeJEUEfuER0o456t55EKL7iSBJ4lCWJepoIifMgzPkiKYdHjAzDPYs
 GZgK9++I/zQAXCkx4ZZtxNRgtnNL9RuMJ3iu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ifhz7JKl3t26887q2ZrIQf1CUYIRNThSHGf/5kqiQlo=;
 b=sfD5i9vycUXaUNJPOwRftpv6Mj18MS9CX3k6LmUM0eYhgV5avUPKF1xblk7/tS/nzG
 PKCrZ7tJAU6fFauFMctJWyKq2Z7P2QKuquppi/iKPOtMEO6WtIqtKWW1KuMS5D6e0lhL
 5mV2RF/f4T/smrqTvcp67yKAoYeQ6QhPiB/Vo0SgF6ACX/0o8CtHqO7eFRkL3iwyLP4+
 9+gEu43EXKZIYIwCfYVNJ6TVbLTPB8WtBvxqRbURlaDM+J5yR62CA2RGoP7GDHOg8y8O
 VecZTdQaW174pyE+9Bf87Q1UHOUj2znLtsWzj1QMo7N7SuIrAlb3xLNCeRQN4uVZVO3P
 wZ2A==
X-Gm-Message-State: AJIora8pauzrIdueOKK4N9Dh/ngRKUpuGPi6BtwyT0UuQjxVuF84lgGr
 vr3+UOsRQ+tS3Ya2CpX/GGWBfQ5ASHe0ng==
X-Google-Smtp-Source: AGRyM1sTE7Y3Zcx7/Kokk/aae8/BkOmQkSQblRAVCmJnoz9OzLyPBSqbtlrGaJ6FbgPQI6ARbrymdA==
X-Received: by 2002:a5d:4b04:0:b0:21b:8640:273f with SMTP id
 v4-20020a5d4b04000000b0021b8640273fmr1041385wrq.195.1656107408294; 
 Fri, 24 Jun 2022 14:50:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d4f8b000000b0020c7ec0fdf4sm3875791wru.117.2022.06.24.14.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:50:07 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:50:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/fourcc: Add formats for packed YUV 4:4:4 AVUY and
 XVUY permutations
Message-ID: <YrYxjrkQQtVwP8gD@phenom.ffwll.local>
References: <20220616185210.22018-1-laurent.pinchart@ideasonboard.com>
 <YrYpvmInnq5Muahz@phenom.ffwll.local>
 <YrYukw1Z/RjWk/Zv@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrYukw1Z/RjWk/Zv@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 25, 2022 at 12:37:23AM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Fri, Jun 24, 2022 at 11:16:46PM +0200, Daniel Vetter wrote:
> > On Thu, Jun 16, 2022 at 09:52:10PM +0300, Laurent Pinchart wrote:
> > > Add FourCCs for two missing permutations of the packed YUV 4:4:4 color
> > 
> > For a second I thought this 4:4:4 is the bit packing, but it's the 444
> > sampling rate thing.
> > 
> > Man formats are confusing.
> 
> :-)
> 
> > > components, namely AVUY and XVUY.
> > > 
> > > These formats are needed by the NXP i.MX8 ISI. While the ISI is
> > > supported by a V4L2 device (corresponding formats have been submitted to
> > > V4L2), it is handled in userspace by libcamera, which uses DRM FourCCs
> > > for pixel formats.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  include/uapi/drm/drm_fourcc.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > > index f1972154a594..399d950c53e3 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -205,7 +205,9 @@ extern "C" {
> > 
> > I build script to make sure we don't accidentally assign duplicated codes
> > would be nice, this is pain to check.
> 
> Do you mean something like
> 
> cat include/uapi/drm/drm_fourcc.h | \
> 	grep '#define DRM_FORMAT_.*fourcc_code' | \
> 	sed 's/.*fourcc_code(\([^)]*\)).*/\1/' | \
> 	sort | \
> 	uniq -c | \
> 	grep -qv '^ \+1 ' && echo "Duplicate 4CC !!"
> 
> ?
> 
> Where could this live ?

Can we stuff it into Kbuild as a check?
-Daniel

> 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > >  #define DRM_FORMAT_VYUY		fourcc_code('V', 'Y', 'U', 'Y') /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
> > >  
> > >  #define DRM_FORMAT_AYUV		fourcc_code('A', 'Y', 'U', 'V') /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
> > > +#define DRM_FORMAT_AVUY8888	fourcc_code('A', 'V', 'U', 'Y') /* [31:0] A:Cr:Cb:Y 8:8:8:8 little endian */
> > >  #define DRM_FORMAT_XYUV8888	fourcc_code('X', 'Y', 'U', 'V') /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
> > > +#define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
> > >  #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
> > >  #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
