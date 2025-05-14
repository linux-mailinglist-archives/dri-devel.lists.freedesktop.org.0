Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A2AB73B1
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781B810E6F3;
	Wed, 14 May 2025 17:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aY4hWuLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AE510E6F3;
 Wed, 14 May 2025 17:57:32 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-30a93117e1bso185571a91.1; 
 Wed, 14 May 2025 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245452; x=1747850252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
 b=aY4hWuLTEjjFzo6PgtOB/5c0Ys7USyFjQNu/98IC1yvYKxIIAVMkiFVRrtMAAC4PCQ
 8vN87GiNdE8oNtQxu36tnpKWs70nhWGKXdnSs3SZFtHDWx17X7fY3ci9L/96rfxgiPVy
 LbgqBRe+igcYj8Hyg9JtPtAPZd3Uf8YpVd4V3xxZFnYaY2Sj1+I6ufh6FEjekveSm4K9
 GsQDgW/0v9i6IZmNamjgILrRUubfeteCnDR/uL1KlRK/8EqrjG7VUNX9Ke+cXadAqQ3v
 zAFdLo7+bRi61/ySPeMLvP2KPSmhpuzXgtIxzwEok/RZ2xnt13T0TbIU6SWK5/aCjmS8
 sTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245452; x=1747850252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/hXTxlFJMrvU7CPa2JHrx2ogSsPgBPZqjeavvvUR14=;
 b=fCB92NX21TfdaaHcJxD0fABUA9TfnN3+WsCnFZ1Yai/5zK5jlNpCaOKdnx2wAmbOz4
 2kun0k05CjUHoneb8lad1hWpSiNPkN6eRSXPxc9K9HDiEtNVW1zlokMjn5II6NsRUGRR
 cAnWK4FwoKJGtuglg2IeeiGuxfcU9XNC9kFNpjVuK9Bq980yz6JCz2OixV0834yPtNQR
 gVhHpkogjP0PsI50Lq0nU3RbqkHU//4910u+CElxc8qGxquswMQ9WZVHfdvKDQPDqFpT
 +9ZeiD7Y1XYI6QsYxHmJgtm8ijjgbJRh3YA2m2iJV3T+7qv6TfBezP9GktXunPDUHT+S
 Vp8w==
X-Gm-Message-State: AOJu0Yxrh5e0XxNwVpx8Di5JRnf29d1e4dTArdcdekDXJAJfjaEeP+aP
 1U/W/L8usx16/Q71ioTLi+QM8X15smgBw2RGVeR0G2++HA6/gGbVixolHA==
X-Gm-Gg: ASbGncsxjOPJQtnJFIWOeLM7mhRVq1VTQ+Sky7q5YG8y91hfkUC2HtzG5XWVf8F3/u8
 RXKNBTwZKeBqWVe8DxqbIKnDa0I33wOM36dn6uieTcJkNsM4GCucbmC+08SGx2M6kB3NY9gCHaW
 hKbMeN0+wPSL2a5bDtPZnFNC/Bw+HwuI4UCv3LT5aRIQ1egk8/gtlHdLZP/FrDNvwL8IgjLdc7/
 XDl7JVAwFbN8xAFL+L/5O2mpGGiwziggm+OQYIaDiXE0jm7A8YLeBHYPB1tCWaHk+J7u+SM/ELu
 ZfeSJaiBL1+9HiI4MS0N/gbRfYpi3hXUjfJCjhwr6eJo7p6hVAe7ClSlVBqZb+P3APM6ozTpwIf
 jmEZelPv/w3kEzHqilGZkhK+tDg==
X-Google-Smtp-Source: AGHT+IHAxJdvLlS2EwkSbHFXeJ3TPDuCVzs7/JvyYweyaRi/Z5Yo4VbPzwpmGqdAQ5yMI+ogbPa0Ag==
X-Received: by 2002:a17:90b:2d4b:b0:2ee:5bc9:75c3 with SMTP id
 98e67ed59e1d1-30e2e583ebamr6823107a91.5.1747245451870; 
 Wed, 14 May 2025 10:57:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e334256d6sm1885621a91.15.2025.05.14.10.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 40/40] drm/msm: Bump UAPI version
Date: Wed, 14 May 2025 10:53:54 -0700
Message-ID: <20250514175527.42488-41-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index bdf775897de8..710046906229 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.49.0

