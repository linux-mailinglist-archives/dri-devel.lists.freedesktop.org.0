Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E147A9EAFDB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D93610E8AD;
	Tue, 10 Dec 2024 11:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hQ6+1CSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F275510E69C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 09:49:28 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7b1b224f6c6so456558285a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733737768; x=1734342568;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9EDuUMhlmnYK+wM/JuvYjnlnvtaYqlg7DBKQ07VIjqs=;
 b=hQ6+1CSX7PHZOibpmXw50bv8HoDClyTixv091cKAlDm61BDZhq9BSKOfBjKLY15YlE
 TZHuYggVM41Y4k3gzTEg0GvpV3rzj8SUmmjnjXYsWbD4opdVOYFE7kc0rt63+wM1R3ap
 ue4GSKEUx0NpJv3ud+vzxCALdI5iPAagkXO88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733737768; x=1734342568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9EDuUMhlmnYK+wM/JuvYjnlnvtaYqlg7DBKQ07VIjqs=;
 b=CQoPbWCDvYNysC0hbv5ME6643NcMe8jHlaRysQFeEWs0WTe0hE8UZznHyWm4qe6FSq
 OMj/o7XIH3htrFbmwUMEMC5lMA0dUKK9nHR7ySwK4e8xZUcCOqjI5v8eQXu2Y2ccZpja
 GilNk6Zd3jLuP015P3s3ivnpmxdEdvEVwK7ObXAiOn1VaJPMSLysa5LbYXekiZ3EJOrw
 f25jJBq665N8FHl8pGLtrqDmNJbRxl+yeebn9xpTUkjY+DbRmIChVW3tnIC4s88rsiRO
 cdLZiciDoIh3EFdPrivXo7ZfxpZ6ahMsYFIBmYbfuX7r2nMwYp8Vtv0STRVISUNfhyTg
 P3XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl03FklQRjYjDl/dW3cZmvy76KYUXwr+C7hHohsl4sLEIr40l4Xn6NBoQQ8Ij+tgB2cboTVibnyGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu3OXWs277DqCA4e8vsso57PjXzpiS1ez4K8xdIvi3m+ZLFf9j
 L9TT+Fk33ohp5gzEp/0jZQRn2UsjVPplsSaeSw6wCqb3HSEY+sp+3hfupW+fHA==
X-Gm-Gg: ASbGnctpZVjXMlaV/6YZspBEH23fV8UtlPWm1qjQUp5aVyj/HVBd5IpypNwZkfMEdsk
 YxfORkGzxYEkfiKSUNAJ4nEAwDmqLNlfo7NvUqA1wnNnWDSQjRGsnFYpMAjr+UL2QI+rdeAin3s
 U6yXwGMqgZKu9lnGQ76iEFso3U2GnRcp4Puzj4E7x5kF0T2ZQG66RncveSanW0OFpbOsRl6Kb+L
 xpu49AEX8/KEr5g016vzwuTpZ0bQFmd3HVf/xOQkumKU8YMxHyBdms7fOJ4ROREhgnoZDB9VArD
 yww=
X-Google-Smtp-Source: AGHT+IGDirteSvb5DALYHWHfiDyNjzV8hd+4Qsw6aBhUE7dWDiM8ElQadmrnt8I6rCPmsaGeC+aonQ==
X-Received: by 2002:a05:620a:454e:b0:7b6:6e7c:8efd with SMTP id
 af79cd13be357-7b6bcb982dcmr1967606585a.58.1733737767733; 
 Mon, 09 Dec 2024 01:49:27 -0800 (PST)
Received: from photon-dev.. ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6d2147ff2sm128409085a.70.2024.12.09.01.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 01:49:26 -0800 (PST)
From: Ajay Kaher <ajay.kaher@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com,
 christian.koenig@amd.com, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com
Subject: [PATCH v6.1.y 0/2] drm/ttm: fixes for vmwgfx when SEV enabled
Date: Mon,  9 Dec 2024 09:49:02 +0000
Message-Id: <20241209094904.2547579-1-ajay.kaher@broadcom.com>
X-Mailer: git-send-email 2.39.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

drm/ttm patches for v6.1.y to fix vmwgfx when SEV enabled.

Zack Rusin (2):
  drm/ttm: Make sure the mapped tt pages are decrypted when needed
  drm/ttm: Print the memory decryption status just once

 drivers/gpu/drm/ttm/ttm_bo_util.c | 13 +++++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c      | 12 ++++++++++++
 include/drm/ttm/ttm_tt.h          |  7 +++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.39.4

