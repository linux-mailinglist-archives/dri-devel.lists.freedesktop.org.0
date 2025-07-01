Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5576AF0054
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43D410E2C9;
	Tue,  1 Jul 2025 16:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RCZDxKaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8904D10E2C9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:45:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so2337070f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751388304; x=1751993104; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4hKOgFRyrKvN6yRkfPdIZSR+Sh9Aho8zTiYbOui/IAA=;
 b=RCZDxKaPNpLbM4tFypESk7dZJxTLKcsPriLuk38Bn+FwvbX8iYTt+lyancONQDTvXS
 9+SAHWlb3wOn5SA8kWhpK3ME88knibrlEwQFKEpZhOW6KXeDq4OEIvE+QsunJ2RLuFkc
 3kitSeTnaTSVwF5ThrEG8OBNfpiseWksgl5TLMl74N37EXSFPCdy0EIZ4/kIeRlvdLVN
 0PC/yLbgHGAp4SS7l3TP7fuKLV2hrZ9Go3gMAIOuTWpQT7b3KaF9eMD0jxm5P/O+DoBz
 sfRB5knkT+mHwxEMCtXMOW2sFNX5gwJ5+VM7dojb1ecgyI/EIfuiOgnBOgtZmDyKNkFa
 6f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751388304; x=1751993104;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4hKOgFRyrKvN6yRkfPdIZSR+Sh9Aho8zTiYbOui/IAA=;
 b=GbYoE0nna2RW6+URUi9jWM7GnD4ir657f+wpL6QAgdizP/Lkd5hI7CDdL7w0ebXgxm
 yJwX3xiEIsfbB9AyZ0chXieeMczx9OThpByUjIAcXQfqWbxfP8+7Mltrg4zplGL4z7KS
 fuVai3I+TQRqJw3ympga6yCRxpWdMIhdKfRr376ocrnQA6KYB8jmcOwH8NcFnGH43TEK
 uJS2fSOe/V4gtmQ21rUf9sjn0IZan5bNG/EdsZ036HxDhkCLLYcl8cP9FdbVz+aHsVfg
 ERyDMbC43WS+LjA0KU0cibpT6CORznClEnFSjOJhUl8Gx91K2av1SSzDga1CElqbkcIG
 nkzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTWyLN7C4M3OtoFeSLdx9/qp9bQgORHWDr73HqTeb/Kd8MDgpZh5YiWIGqtreL1JTZx7PTiZ8wuvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvYXDJ2X1OiS4sz04fuWMeHKDQLDMxcI4640ZUjajf2jksFv8S
 +6DSkmRnFFjPsUOVV3lWe4J5eM0zkT2tDc53Vr4EWEriHTb1hzDzHCNr
X-Gm-Gg: ASbGnctVuhYyEGFDS3ERQwWcTSyM9qWt76QXbQENhIobj8YI2eysF/avCxRv94m1RMv
 eiWzqcveFaMnCXfw8u01X3CSgh/aXV29UsYcPGH5UDgMhn0La31bwVZYbFGw2lKBxYMgvvN3qLG
 yTMTDVaOCiYq50A6pmL6BkyEUYAEj84kKgzhAFjFZfV7Nv88s81mm949QlPRawU87YQnEYQvgua
 /RMXsjo9+AryfWqyJrObFd2ZVsl76z8kzNaUphvKQPdtu0XqV3P1+J5C0nIbXB5pGHGozjS3YXC
 xa3IR3w6FBQ/A53BOq2QiXMtVM61ylfCexGhk7JhhUMBhHJeWtPNPdH1KmY=
X-Google-Smtp-Source: AGHT+IG1z6GBA6ZOBEYtIe0WmFkvvXf7ObumyBaaSDScfclwPT6cObKXoKOx+J5NUqkR/o4xYrlWKQ==
X-Received: by 2002:a05:6000:4615:b0:3a4:eed9:755d with SMTP id
 ffacd0b85a97d-3a8f577fe74mr14565833f8f.3.1751388303734; 
 Tue, 01 Jul 2025 09:45:03 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ac6ee0d0b9sm8077315f8f.18.2025.07.01.09.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 09:45:03 -0700 (PDT)
Date: Tue, 1 Jul 2025 18:45:01 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, cristian.ciocaltea@collabora.com,
 gcarlos@disroot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/tests: Fix endian warning
Message-ID: <aGQQjTUrG8-p8qAC@fedora>
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
 <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org>
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

Hey Michel,

Thanks for looking into this.

On Tue, Jul 01, 2025 at 10:22:13AM +0200, Michel Dänzer wrote:
> On 30.06.25 11:00, José Expósito wrote:
> > When compiling with sparse enabled, this warning is thrown:
> > 
> >   warning: incorrect type in argument 2 (different base types)
> >      expected restricted __le32 const [usertype] *buf
> >      got unsigned int [usertype] *[assigned] buf
> > 
> > Add a cast to fix it.
> > 
> > Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > index 7299fa8971ce..86829e1cb7f0 100644
> > --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> > @@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
> >  		NULL : &result->dst_pitch;
> >  
> >  	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
> > -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> > +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> >  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> >  
> >  	buf = dst.vaddr; /* restore original value of buf */
> 
> It might be cleaner to use two separate variables instead of using "buf" as both little endian and host byte order. (Same for patch 2)

Yes, however, the same pattern is repeated 10 times in this file.

What do you think about fixing it in a follow up? I don't think it
should block fixing the KUnit tests.

Jose

> 
> -- 
> Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
> https://redhat.com             \               Libre software enthusiast
