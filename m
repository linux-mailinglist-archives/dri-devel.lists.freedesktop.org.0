Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC503AEC50A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 06:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F5710E058;
	Sat, 28 Jun 2025 04:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ilHWEwp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA5810E058
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 04:59:25 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso539160a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 21:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751086765; x=1751691565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v+Y62Y/ec8sThQYgTDvBjm17W/jeVagSDonchzednA4=;
 b=ilHWEwp2Q6zaYLMChRbZrva/2y7BLWYmf5F206Ae4u/lZm0K+4eun/rqcnfa6tAN+E
 JyGYkMXkvPJsfVHuQzwjQLIY1Aot0z6RjXhT8MVPv7JQshaAhC0O5rr7eobIWUPSGFtl
 ds78H9zp1YzzeNQO55pNDdZ1nfXEn146Utv5oCNOBardR+NtSj6Vtws+vcsDJcvt+9tR
 P3E9OZBS0F7t4q6phkvQg2rfosOtAosF/C5AEJnSjltZqHt/t48qNs57faAooc5S+O9c
 jLQGFWm8RG4J/DH/5Ew8xkIQ2LldquobmmbVaeCzdzT3pppaD1zkLuNsAOZCKJJIiGEM
 +C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751086765; x=1751691565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v+Y62Y/ec8sThQYgTDvBjm17W/jeVagSDonchzednA4=;
 b=jRzL/mvlUsOQmju5WoTk6K8B2aUd4v6oeTi3GhbhPg62z3HHRxe60kpeIudDK3/o9I
 /yfITw7FXESdYq8UsqpgoqYcPDXvQA0PcH2wLBHHo10TH88MIuGWeUkC4rVpe+wu+d5D
 C8rMbJk1f9Kz3BBnxEFZBp1sSaCU146HExSkhvgDG5Rc/06mr40KsM2D8S/VTShkFTeQ
 4c54m+qAhEkQAPSEP/Pue8r4+BE/a+fEXVQk+oF4kZb6hWuDlFs2B6owUJ7poA7vdFaa
 CSt4OJL2X7pmbVtqumnjfx9rR8Z1xTQhwraJxD66ebUMA7YxrhlgfEsqjv89sDDLI5AF
 Vosg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkg38abECpYXOANeG8pNsIbba5aXd0wZkmoLsQS3VIQqg7wUZqEdhADheUzmbRzDn9x1xn5buXjHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYRGsRK1eKLD4xtpo9SAA/zzCBvFTLXQYERCWHeI7NCziXSNBm
 eoAjkEUC0MTs7G0mYpjxKr0wR7dNiPFWVj0lago52wybFCy1gwTRdjzG
X-Gm-Gg: ASbGncsHzHgEctaENPmv1wnxHKgqa2P09s5L+q9lv7r7so1iVIYtbmKDWAMhnTkUj7I
 CXKwyHWei3CB/CEZiNMa8NiqXKjLKbQvzOw2mh9dxmZz4VkVCoT2QyiHS9Cb9vT6DudKS9kRAHe
 JLGG5TqJHfN8crID8/ohzmgGns8AcXVTucTKihBg09LQPR8NGyWVp1XgX3d3vk3OG3Kj4RUG/xJ
 tWyySOHUBz7j7ti0llA7b5Tm4oClOWwF4gIYVcpUXCTafrNr/hLZ2BrD4q4hvieD2Ky8cyjyq+i
 NVu6SBH2rvFp/ir0irwCofJ/aOGK+gtxOnhu7I4ANKED8voCQgL8b599AdJhYmz+HahJAeNzvVs
 7Lw==
X-Google-Smtp-Source: AGHT+IFjBRpEOyLZz+ltarHHoSDBE2VSSqu3F2myfOAXRHpw3MWf9uX5uh2VPQyAfd0HyDKo/Y1myQ==
X-Received: by 2002:a17:90b:2885:b0:311:ff02:3fcb with SMTP id
 98e67ed59e1d1-318c92fa81dmr7733389a91.28.1751086765146; 
 Fri, 27 Jun 2025 21:59:25 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-318c13a271asm3659713a91.17.2025.06.27.21.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 21:59:24 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Date: Sat, 28 Jun 2025 10:29:05 +0530
Message-ID: <cover.1751086324.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

v2:
- Change the earlier patch to also handle the error code returned by
  fb_deferred_io_init() and update Fixes tag to point to the commit that
  introduced the memory allocation (which leads to leak).
- Add second patch to make the error handling order symmetric to
  fbtft_framebuffer_release() and also remove managed allocation for
  txbuf as suggested by Andy and Dan.

Link to v1: https://lore.kernel.org/all/20250626172412.18355-1-abdun.nihaal@gmail.com/

Abdun Nihaal (2):
  staging: fbtft: fix potential memory leak in fbtft_framebuffer_alloc()
  staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()

 drivers/staging/fbtft/fbtft-core.c | 39 +++++++++++++++++-------------
 1 file changed, 22 insertions(+), 17 deletions(-)

-- 
2.43.0

