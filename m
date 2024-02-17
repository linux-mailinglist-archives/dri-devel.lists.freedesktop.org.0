Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B88590EE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 17:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C7810E35E;
	Sat, 17 Feb 2024 16:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="htUfiyMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F1610E1B1;
 Sat, 17 Feb 2024 16:31:49 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-53fa455cd94so2153715a12.2; 
 Sat, 17 Feb 2024 08:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708187509; x=1708792309; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SbUePhJ5HZco+8XwW7JGmkYmeD0cFur/br8JHm4eCLs=;
 b=htUfiyMC2U+cY7O5OBd3du3N8o1SX7ld2cF2qhRzKzVsX6tR8d1ijN1Xn2f1tTTmhy
 4DXBPXdLqIWvlVn44mOEE5iu5vV4U5boMuGqENbFlKSluv20sALs0X+9bskT7Keugj2L
 ot6B/Fu+djKxrh8TQEGSlcmBfZIWEGbVoEN7lwK8Hgy5b9OGx/u0nKyuzcxOr6KwapnI
 GdP8kFn1HLSH3DEoXEb8ubFYwfGSTz2i4wWce3wylt8ku1i1jp9kuH95aYRaZqjyYaUI
 9OzyQsVcPPEt42lHJkcDadrDJ5BAsMDYgXTeQ04dGP3F97IWyujAkIaU3+vhJ0l7RR0s
 wCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708187509; x=1708792309;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SbUePhJ5HZco+8XwW7JGmkYmeD0cFur/br8JHm4eCLs=;
 b=bd8ntGwifDP54PXdL1ywFD5rQWUYpW37antrkxXfv3n5SZuR9U38nuQbFWlyhGMhs7
 Xd5Dq0wJt9xVBWOV85QbdqmCBeE0D4YJsddxCuja6iH3/Brrws8KQx7iQ+72mRWLvlHc
 c2z2qD4jhEeSmP0xTPuuwWxMLC4CypCjKVtDnxfd8GhOGRI1XmHYs4Smx1xfQ4/+9E2o
 0bf7EDMZv/7cTueTj46dfmjXheF5xp5tS0wlGF6pHOvMFliYpWt+h8Pht+MM0dofxr+O
 68Uvlle1ful733oE8+VNjjz6DvLDvWkSwRHiaCRbmcTVwayxcYXpFbeAr3m0AWs8u6we
 AjSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiChe+uwcJSTKeDRnaKx3WqY9/Gr1C/nf7jfE+klE6Gj6YKUsqWVgpqwr6XGEsZZ//E5VYA5JI7L+omtpIhKu61rSftxk5zI7w4zeXexnoY3rJQXegqgFhbwVgcrz1r9cMh78YwnQs/LeZWPHltg==
X-Gm-Message-State: AOJu0YwmDTVx9RjhUjt4Md1OVF69gMxu7GyumdxzDYeQl/eGBEbFjgRG
 Q9EPNnacwWRRXOZYdFhWTuQLaqE1Faq9fucGL9uP41JwSE6Vrhrt
X-Google-Smtp-Source: AGHT+IGHtXjxjRmzrHmktbFcoQ6AOzSa0j7Xs/41gK9X+A9QlvcrIqXXFxmncHzXmMYB/bcm+P+Igg==
X-Received: by 2002:a17:902:bd0a:b0:1d9:4ebd:b94d with SMTP id
 p10-20020a170902bd0a00b001d94ebdb94dmr7814293pls.55.1708187508931; 
 Sat, 17 Feb 2024 08:31:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902cf4e00b001db523e58f6sm1625357plg.133.2024.02.17.08.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:31:48 -0800 (PST)
Date: Sat, 17 Feb 2024 08:31:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, daniel@ffwll.ch
Subject: Re: [PATCH v2 2/2] drm/tests/drm_buddy: add alloc_contiguous test
Message-ID: <b59f744e-bc3d-4341-8586-4f4730aa351b@roeck-us.net>
References: <20240214131853.5934-1-Arunpravin.PaneerSelvam@amd.com>
 <20240214131853.5934-2-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240214131853.5934-2-Arunpravin.PaneerSelvam@amd.com>
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

On Wed, Feb 14, 2024 at 06:48:53PM +0530, Arunpravin Paneer Selvam wrote:
> From: Matthew Auld <matthew.auld@intel.com>
> 
> Sanity check DRM_BUDDY_CONTIGUOUS_ALLOCATION.
> 
> v2: Fix checkpatch warnings.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: Limonciello <mario.limonciello@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Building csky:allmodconfig ... failed
Building openrisc:allmodconfig ... failed
Building parisc:allmodconfig ... failed
Building xtensa:allmodconfig ... failed

[ and presumably all other 32-bit systems which enable this test ]

--------------
Error log:
ERROR: modpost: "__umoddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
ERROR: modpost: "__moddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!

Guenter
