Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F559A4513F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 01:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122DF10E1DA;
	Wed, 26 Feb 2025 00:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i7G66RXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4531310E1DA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:10:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22134a64d8cso14739075ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740528623; x=1741133423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uBY2nfE7KwlFz4xK8WDp9wc2SavbvwNmlQeXQVB17oU=;
 b=i7G66RXWvJBkZGiUnSRDjGPR7bU7daUvetqkErNV03CJoMEU/E2KHdgeA1/3v1H0yY
 1VpsgA5HFn1gmlcfOhe5SNK2X3NNbV+xlOyCOaRTF6PNoOx0OyOd6QxoRefgaJ85Enng
 WNa+mLoC3J/c21RkS0Or/pRKzBY3jh0kELvnkXx/DW6IGuXw4+gSW5fBom2hYkO+CkCq
 WxX97gPDV4WTBJtQyP29PSnrCfcjrvnVxEbpFzDd0o4vdelAaVHNjOJCVNfdCB3/fMx2
 vTIXAoNmPH8iUBnyNkthYtk/S/My3jlTKTaVhjLTUt+9SoF/yg0NCCl/NmswOm54Ei1V
 rNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740528623; x=1741133423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uBY2nfE7KwlFz4xK8WDp9wc2SavbvwNmlQeXQVB17oU=;
 b=TBxwD836nWI4aJIe9aXQc+Q4KWjeghVAwAesQ+DtnByFM9F6CNHvHZ7kXn8qKezTUG
 Jur5iU2dF11L1mSOIXWFnx7nBOeJb/1Byrxlfd0hgEeMDLbJJ+Bxn6zE02Jn3j5bzY34
 3MeVrliqsdpGfwMKMT/4MvAXha2wnbnkKMG6S/vmei+EqC33azQAgPMAADBZnbXNVJlu
 tF/fGm8JxCklr6Zr4hIDKFg+tZ0c9dK1B416LiiLtm1SSfs54Hg5caWuxOLFTihK7WPc
 n/fU7t+wy5YbU7Q1JWc/iluojFA8y7s4Ga1PTuUezCWnCfWKlFQYVeqCf593n7ISVO/i
 Y5Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiMIk4GPShtnq2Bf56m1WTxysYipyrdm48z3eZOvU/00Ce8XK2sKIiyqLARq188dYk1YqUR1o3tn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyby0Mq6f+GBZNSkGPot6C4416dFiKm3iHj/+akQ+kSEpbj+s7U
 D7zVdmv3n/g7SMEiC4uosyZQJIwC1a8xmp/A5MmoZ6+PoV3ElHpz
X-Gm-Gg: ASbGncv0E0MoGX/xTeVtqdEHFFGG/Q6jRlQHRYLExYCT63RFoou///rlwn+wQpoQ9n4
 EX0hJPSpv/otj/AAXhfnT0rY10BevsNpeG3KYl0pgv/gJcNLYAQlTf8A5Pu/DJmdyvn34CZXnxK
 VJjz6zWzcXYwZewiwFyKNRB8rLnAJms+XI19jSGlV7JLWkXHDx855RhHRee6JJs1lXR4+YVeDxQ
 X0RQYk6ZFejfW4JzmDQwfhO6VOwq08iOESUDgADUZHL+U1VvNZZlfoP6d9298a5ZeLY7C4crBpS
 5N3hpTsZwsTUJZt45VO5l6JyoJ85jF46WjuCwr7YSj7g
X-Google-Smtp-Source: AGHT+IH3TRviZoVQATCal1hTW8eJ1YFBaKLXfG5od1V9ifxhdFIJk1JzinmmHdL7QXxBqj+hhTlDbQ==
X-Received: by 2002:a17:903:1aee:b0:223:28a8:610b with SMTP id
 d9443c01a7336-22328a867c6mr1806235ad.14.1740528622703; 
 Tue, 25 Feb 2025 16:10:22 -0800 (PST)
Received: from localhost.localdomain ([171.216.136.220])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223234b95e1sm2610165ad.33.2025.02.25.16.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 16:10:22 -0800 (PST)
From: Qianyi Liu <liuqianyi125@gmail.com>
To: markus.elfring@web.de
Cc: airlied@gmail.com, ckoenig.leichtzumerken@gmail.com, dakr@kernel.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liuqianyi125@gmail.com,
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org, phasta@kernel.org, stable@vger.kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH V2] drm/sched: fix fence reference count leak
Date: Wed, 26 Feb 2025 08:10:12 +0800
Message-Id: <20250226001012.111886-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2fabe78f-a527-494f-8c3e-f2226ecbc43d@web.de>
References: <2fabe78f-a527-494f-8c3e-f2226ecbc43d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hello Markus,

>…
>> fence callback add fails.

>                     failed?


>> To fix this, we should decrement the reference count of prev when
>…

> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14-rc4#n94


>> v2:

> Patch version descriptions may be specified behind the marker line.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14-rc4#n763

Thanks for your comments, I will update these in V3.

> Regards,
> Markus

Best Regards
Qianyi
