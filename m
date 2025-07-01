Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C9AF022F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 19:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCBC10E107;
	Tue,  1 Jul 2025 17:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vo4ZaDx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC5610E107
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 17:49:48 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2edec6c5511so1661737fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 10:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751392188; x=1751996988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oXXTU/ITEgP2f3aQA8kQDtAM80GdvppngUG0dkE6Fhs=;
 b=vo4ZaDx4000Ykv+pSB/vvppbJ0Du0zBOZPCt29Sknt6utRWCM8fp5jdjvzGUyoJIS7
 LalDXex0FEQ5Gf7DTcUQkFmpMdVRm3J+u5MRxCAKirvRUvIynmWrAjk2rwhn1eiTt6S8
 JQnr43Vc6KTd6Jh5DQiOU4WqVM1Qv0x+E0pvxUmNFYDxoK2X8+0fSqScYkyQauxODEMx
 2mlaQJ2An/JR6imILTZNlyCvHY2CY78iTco+kmX/+znPNVM2vfdQTImSrBOg8oN3wuUV
 sX/BH1vzcCtk+uF96w+ApvbxabGxBXs3FoqTf8hRRZWCM8KIf8k3/xZvwcd4CEZD6x/g
 iM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751392188; x=1751996988;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXXTU/ITEgP2f3aQA8kQDtAM80GdvppngUG0dkE6Fhs=;
 b=MwRkeGe+2gfOSz1+H2/sA3r2srhDUmeC5SCowYsc4VLcXxyIwXynJawLVGfXfta3pI
 oT1lcsaH6gHR83EYL/L2ukk3ghJyCkHupfBU1NUtaI6hGJN/JFHUWRzfOKlIH3bHoP8z
 jA1wKZtrW6wfOAFKtfuEHwUhBsuFr9PRw2EpdTEiAH5evqWg4SOWN8v6YM43Q8Vh7A+A
 fjCpVwjbbeRShIf12OzVji7FzhAAWRz0ed00D21yM7iNACGJmMPImq63mlTyqMeTA94L
 SDvZZxP5eM58G9FApcA4ruU2ULmdBIzycrNlxP9uDUBYhnpP560m9Dx84pLgpyHzPFo4
 C98g==
X-Gm-Message-State: AOJu0YyQyhLYCuPKO0dpF8AX6wPbW2pgOZn7lvkpSv6MBrp2ZS2Se3pW
 98dZifhdbVIlLXRicSORpLuzbHwsxxSC5oT5vgWw2XAGRbp0FeWH/mpUS4WpteNjMUc=
X-Gm-Gg: ASbGnctpsAhWTWpwsPwkkBwk0fDc1mONAMc+MzhpPozdHSp5RjSrnArfM5jfdPs6p9S
 mKLhyt8TPNoDXPxonslq2U6pjjtObVuYTMKsF/vU0Q1w19eFZ5dT/GeowQaybsu+roVwY207fm8
 mIzlCP0wsb+aXGwANV25miPz0S6NxxeKPXJbKrGKjxT6Y8NC5LIyQ7D2vaHFs4t/5zldoWqb86o
 YYwE3hRguNaS9z2JuEgqCe8g56FoUxw+MXXV6Rk6SacG8MEEB9qKcXQy3/irnObS06eMcIM0W+e
 Y3E4EEifC0PBsWEZE32sgkDelhXGjATb+mF5W2uzYxMRp1XSPkm6YSHyUNw163QeL0aEjg==
X-Google-Smtp-Source: AGHT+IF+c7d9npesAZeIadVgHiHNlyuJvujC23j1mtDP5ruHJeRYA3CvB133PYtR30yln6kmqadH6Q==
X-Received: by 2002:a05:6870:e985:b0:2d5:b2ae:2ebd with SMTP id
 586e51a60fabf-2efed7767c5mr13540399fac.34.1751392187872; 
 Tue, 01 Jul 2025 10:49:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d663:8de8:cafb:14e3])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2efd50b4d84sm3370797fac.23.2025.07.01.10.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 10:49:47 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:49:44 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
Message-ID: <1dcd1afb-1e5d-4624-ae3f-9f96ceab6134@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hello Thomas Hellström,

Commit bb8aa27eff6f ("drm/ttm, drm_xe, Implement
ttm_lru_walk_for_evict() using the guarded LRU iteration") from Jun
23, 2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/ttm/ttm_bo_util.c:899 ttm_lru_walk_for_evict()
	warn: 'bo' isn't an ERR_PTR

drivers/gpu/drm/ttm/ttm_bo_util.c
   883  s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
   884                             struct ttm_resource_manager *man, s64 target)
   885  {
   886          struct ttm_bo_lru_cursor cursor;
   887          struct ttm_buffer_object *bo;
   888          s64 progress = 0;
   889          s64 lret;
   890  
   891          ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &walk->arg, bo) {
   892                  lret = walk->ops->process_bo(walk, bo);
   893                  if (lret == -EBUSY || lret == -EALREADY)
   894                          lret = 0;
   895                  progress = (lret < 0) ? lret : progress + lret;
   896                  if (progress < 0 || progress >= target)
   897                          break;
   898          }
   899          if (IS_ERR(bo))
   900                  return PTR_ERR(bo);

The ttm_bo_lru_for_each_reserved_guarded() macro checks for IS_ERR_OR_NULL()
but it can only be NULL.  These things are a bit frustrating to me because
when a function returns both error pointers and NULL then ideally there is a
reason for that and it should be documented.  "This function returns error
pointers if there is an error (kmalloc failed etc) or NULL if the object is
not found".

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

   901  
   902          return progress;

It's strange to me that we returns progress values which are greater than the
target value.

   903  }

regards,
dan carpenter
