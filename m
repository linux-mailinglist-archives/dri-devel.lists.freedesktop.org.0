Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19BC999EE7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075AC10EA79;
	Fri, 11 Oct 2024 08:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nqgBZ9k0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03BE10EA71
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 08:22:40 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4311ac1994dso9492455e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 01:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728634959; x=1729239759; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v7rKBQHeJUHT/EPLGnX2cgKnO/4DvqGgqeog50htBSk=;
 b=nqgBZ9k0SFQOwC4B0H7v0KEspHjuIyzQC0+sew/a+AkLcmGf51Hx1FY/lYSX6oRg0B
 RidTVkLDJbRY7o35Qk9wuX9hKR//mabqin6Xg/8Lv6BeC21k3I27P6w0y2zPCjT0FyEn
 t5RuvV/uyr5y+ThuLaSF/I9OmFBbJgD1zDRQtPFW1HM5usyXc5iYHOfAbt3yh4+5YjNq
 xD3k2JrNjwr+l0ihxaoATDCPY88ZuGgR/KccxbEFyI2QooZIiPjcxD1huuNMV6x5A2ez
 vv06ebuHdfdGbVkolhI6o04gFmCzGyhZt6XEqrDN5plUeGZfOOhObG8cxHCjtW8cHHCb
 TfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728634959; x=1729239759;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v7rKBQHeJUHT/EPLGnX2cgKnO/4DvqGgqeog50htBSk=;
 b=aT25o7HtT43IxyT45Yhduai3zCF48Ec+k4mNKyuvsJ7syBvV/Sci1VeyU3MNnkzqR+
 5FqJjhcq00jVKN7eFGeX2ZV3ENj6PoqMO/FYPiOaBpU82581HQs0NOtCvKsec+TyjRt5
 uxMkrsBXwMGJ8Gx6aPt4UQ6GCtiCeqECm/hGoNI+PyTX0/JPRGidwiFV86LpT706q4dE
 EQF8wA8oIqWX7PsgB2xceLsged9mjbPvWpK70+VlIyHFGJcUKAReXfTKVbdU1jswMCJc
 R9mUtc1c9WbEHSSqonnD9yShruzdfE33TtZUVj2AnDvi96tGJgI5vlA33Vl1xQifmiJ7
 pDzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoP83+INMzeFKt6/d0ubvPKtYTQWmkxeHsSxYGuAdMIuFv3Q/h7BVDy9TpJvKLEaI1QAp97OE/vFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNEtOgVuNIR9aEflFxbHdFpiaWRrcf0iG1Ae55EFch1hlBUgEQ
 FXvKULilp3cdz7C2AlcF16AY/bkSVn+nVlaMT7pr+YpBPztK3gi/faXYIIoCuBqsGQsh2WlRZke
 Q
X-Google-Smtp-Source: AGHT+IFflvSLy/Ib1LKPjbGSYVVloaJDGWYg0ETsz+8F1CCqSEtNUjVntXoKKxJcAfRJpWQnMrv6qA==
X-Received: by 2002:a05:600c:4f8e:b0:42c:acb0:ddbd with SMTP id
 5b1f17b1804b1-4311dea4649mr13582445e9.7.1728634959121; 
 Fri, 11 Oct 2024 01:22:39 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43117ff5930sm36314085e9.0.2024.10.11.01.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:22:38 -0700 (PDT)
Date: Fri, 11 Oct 2024 11:22:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm: add DRM_SET_CLIENT_NAME ioctl
Message-ID: <6c528564-598b-4a32-b4be-5f730fb94254@stanley.mountain>
References: <d3f0d4ff-f14a-45f8-bd51-2d57159d919a@stanley.mountain>
 <0c91f3be-4d9a-4c78-be2f-a43e1c6f1b10@damsy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c91f3be-4d9a-4c78-be2f-a43e1c6f1b10@damsy.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 11, 2024 at 10:20:03AM +0200, Pierre-Eric Pelloux-Prayer wrote:
> 
> Hi,
> 
> Le 10/10/2024 à 12:02, Dan Carpenter a écrit :
> > Hello Pierre-Eric Pelloux-Prayer,
> > 
> > Commit 56c594d8df64 ("drm: add DRM_SET_CLIENT_NAME ioctl") from Oct
> > 3, 2024 (linux-next), leads to the following Smatch static checker
> > warning:
> > 
> > 	drivers/gpu/drm/drm_debugfs.c:104 drm_clients_info()
> > 	warn: was precision intended? '64'
> > 
> > drivers/gpu/drm/drm_debugfs.c
> >      73 static int drm_clients_info(struct seq_file *m, void *data)
> >      74 {
> >      75         struct drm_debugfs_entry *entry = m->private;
> >      76         struct drm_device *dev = entry->dev;
> >      77         struct drm_file *priv;
> >      78         kuid_t uid;
> >      79
> >      80         seq_printf(m,
> >      81                    "%20s %5s %3s master a %5s %10s %*s\n",
> >                                                            ^^^
> > this was probably intended to be %.*s
> 
> No. The intent is to right-align the string, similar to what is done for the other
> string fields.
> It could have been written %64s, but since DRM_CLIENT_NAME_MAX_LEN exist, I've used
> the %*s syntax.
> 

Ah, fine.  Sorry for the noise.

regards,
dan carpenter

