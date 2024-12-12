Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9279F0635
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11C210EF39;
	Fri, 13 Dec 2024 08:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UyybEwu0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD7E10ED64
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 11:40:25 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-7e6d04f74faso336013a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 03:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734003624; x=1734608424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKBbyWSIWAlU6Q88Om2Pr2VQVGWUsiombxG6n3b8QFw=;
 b=UyybEwu0CleSWSIQjEjjbyK6dTjkoJLnmHr0HPWVw61qMSVtvtDmcx1I+Gc5EtKFfY
 +YRE39LwMyrw6VAnqsq4QZhyUkzXcU0D7Bc+nClzzR0UeaOYI0ijv051wa06Y1vXhuQY
 eXRt/LrYoplywkfBb6OCacAkrvQu1DJ0CJ+oXVLMvrhUqrDhOO7I2dspDpue3Psi0l/U
 p4WK5Zm2KXuESjx2wTYiSJPSeckHkC4W9FRY8md2GHSRgZxbzlB3Uh5Oqa0iAZikYpWB
 JRv7vIM4CHUPePfN808TVpe/f5r8cbbAfwmcNGr1Gh5w2Byj7ER75rV8wllZMxJnLxPZ
 sUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734003624; x=1734608424;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKBbyWSIWAlU6Q88Om2Pr2VQVGWUsiombxG6n3b8QFw=;
 b=poKdWp3E4jvpCWSbYoXUifqLjOzFxVNRQvUg895hVDSTcc9ySIUjlcxnFH26SgMkBJ
 dT8MfJefOe/rSgG9FKysGvOSIQVo39frUwktmZXfQUdiOGhjDRcnyNRlAKkZcmBXQg3Q
 g3CeIAZqJoUe2OdP9HL7IqdnKZu28zYksmd/hRx7VEJ52k8FcowLW3XmrjxoNEudFv6P
 4AiK5+qm9sz7EYMGrHmnVgTdn01wTCsO36olHt30PWoB1KomNfTp/5Ddkokw6DtPuwoC
 L1T8o60E76gP2aPBv10d7OPErT4ongI/Yku4hlBmS93LgCKWCNJto4o1ySMEYOy3SAl/
 mSgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDtH+rBXS8/2fPiyeEDp7mRMzQs1TfjcB8XkbNRXFw6dVtv29K5tIB2ZQYtVvK9aCsI5k39V7IIuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8GxeSfM+cyDqxzCkb8IT2PZuJbS8jsmlulqu8FjF4Q9jY55Yl
 FvbjXV3+bfm4+j/J4+CuOWOZRp2KgGkLAbj+uRel7uOQP9WvLMDyeOeoMg==
X-Gm-Gg: ASbGncu5UyYBxOeRnYiFaD8e8hAXFGr0KnowXxcaPyjv9Osyteeh6WNGwt85bLcX4/e
 as6UqS4g1H+Z+HB+qVPJxQrTfvLTlsq3muj2/q52IQz1vHGi54BwIto6a9DGxlMKlP0NQjm6QiB
 7D6Vtjw/9RHnX57XE0rDK4lRiJWNxieDhTSvYh8gNlrpPUuj8sgoxcuiXDrRpGoFcFaKWFT92c6
 p0OIwqIcuGaw/sCBlJnfa960Tn7a6iN456d/GrOU29+PK7cUUNf6rRx9KyUAA==
X-Google-Smtp-Source: AGHT+IFpGCuhzB8ZOFkrjWIPuAMTQ/W3yrx4XfVwLDvNPb4nn+N6JY+NQjPQsI0/ddgsRLaYbA+sjQ==
X-Received: by 2002:a17:90a:e7c4:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-2f13abc9468mr4251885a91.8.1734003624302; 
 Thu, 12 Dec 2024 03:40:24 -0800 (PST)
Received: from HOME-PC ([223.185.132.235]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f142c2b1f6sm1052218a91.0.2024.12.12.03.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 03:40:23 -0800 (PST)
Date: Thu, 12 Dec 2024 17:10:21 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Clarification on color parameter in drm_draw_fill24 function
Message-ID: <Z1rLpV+Rx7U0h2J/@HOME-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Dec 2024 08:18:23 +0000
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

Dear Maintainers,

I am writing to seek clarification regarding the implementation of the
drm_draw_fill24 function in the DRM subsystem. Specifically, Coverity has
flagged (CID 1602416) the issue in the following line in drm/drm_draw.c

--> iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);

I have some questions about handling of the color parameter in the function.

The function currently accepts a u16 value as the color parameter and uses
bitwise operations to extract the RGB components. However, the mask 0x00FF0000
refers to bits 16–23, which are always zero for a u16 value. Therefore, the
expression (color & 0x00FF0000) will always result in 0.

Could you please confirm:

  1. Is the truncation of 32-bit color value to 16 bits the intended behavior?
  2. Alternatively, should the function be updated to accept 32-bit values
     as input as the function is called with 32 bit values elsewhere?

Thank you for your time. Please let me know if further information or context
is required.

-Dheeraj
