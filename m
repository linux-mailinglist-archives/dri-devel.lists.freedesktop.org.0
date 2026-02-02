Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Mi2AFyLgGnO9wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A031CBAED
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFB010E46A;
	Mon,  2 Feb 2026 11:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NwnskXw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CB610E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:32:40 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-82307c6902eso2190234b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 03:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770031960; x=1770636760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
 b=NwnskXw8/iGr5pgfJah+B54KKrSCHtHSUoOMb7/kUZ5WatNcH7urs6DRbd1ttQxb7K
 VmKkgbZFJ1nmx3sRl8hSOy0nCMsRnunz0jVgWAbz6++kT4JJCrVAewzHz3L8k+S7hsC1
 sVSVqI9lamgWKHKqwBpENvUNtHBUZcLS4v4EKEspKHGV0j1emvwZbqH9ndkEn7VdTqQ5
 0It3y7cdwAGr6cH2kcv4X+c9t5yhxTKT7Ld1rVZqITSm/nkC5csfjF34wBX5+s+JMeo2
 E0sYs0/j8Vel41tZXs8vYuviRwXUarz5kuUJil3qs8a247W7KaugzKOXQvL2k8brO8cz
 577g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770031960; x=1770636760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
 b=RgbTQfb9EtG4vO35CbkWOhs9mfoK3eZkDki8sLGHSQ7eSTmOvAwNRYz9jRStaA1jtC
 ds/xLWA7Kqri9JegZVxDGh+Kxo8qdjagGn4U63izToHd02JhXx9+aqIJalkaOcBU+0BL
 Zdlz9mEOV5GGmoP3cDl0ltTtvfD5lObqr54p3WDJkwsTxxwPRDsEbihMuhcq2ummer9b
 rOJ3AD1+gKHLurrDxTRDlYb1+/vClRvZ9qqFWszsiKbV2vco5+j8zdyKCpP6ANeoFJ8u
 czdvBM4WIKaa1t5M0K5vHkTSlMz/pQSlcpdqBGK+AENuW68hCJyUNok5WiYimkvknWA0
 VhOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMSTD4axllQzMdXZ07R26dEBGJ6J/qxZPad0AgmUkBS+/KDvihXTG/1sOLSPTVXT0u0XW9/wPKO7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuH69P1eRzgYBwgjz5DsmDNIfucM3X43PvptT328tO2TZCFwDv
 NlhSVhg1tb8nmZIUE1XMNuzvB7gWRibn9WaABy6kBY1tHXEYmUaDDlSM
X-Gm-Gg: AZuq6aI0BjHw6nO5aI7qTZWSB8stIRkqy8sHIm/lRtvX+ZjnZ3MTTeBdmeveU0pGtOD
 d61mnh9SHV9BXVpBER050/+DC5cXg12TKr2jxAb3KwOfF4zFVBJ+o9jmxeQBhsR9IeLuOS41heC
 Ss7xdu7UtSb/Su/uy1jpfNg0PEwgp6ohSbwTfM/TfnEBd4n+haC5204jjFV/5l2m39302gvUoQe
 BrHNeQycFP1xi5c9CNu5zaOmwkne7Fiel6eWF6f1oCc/INyNzXUBU21HCMDTmDrH6i5NgbfEMey
 esSxP11I6l7meoUdzSNF3YeAQM94DIvq0UJx8Bn/se4JoEvEFTfQt+bgt37JBoh57/Blnb3MDyI
 M2tFPZ8h8xaCZvtoTIWz20JOLqfpTfyFq724yvk/f9VTX0kb8GreN/cGrcc1PyP8LKgsrAbsnkL
 ADrQUYBxOuC9fG1rJzHleGpuPq/fsyOjMurzJNZw==
X-Received: by 2002:a05:6a20:6a11:b0:38d:f405:709e with SMTP id
 adf61e73a8af0-392e01097aamr11107034637.48.1770031959822; 
 Mon, 02 Feb 2026 03:32:39 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 03:32:39 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 0/3 v2] drm/exynos: vidi: fix various memory corruption bugs
Date: Mon,  2 Feb 2026 20:32:31 +0900
Message-Id: <20260202113234.183393-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,samsung.com,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8A031CBAED
X-Rspamd-Action: no action

This is a series of patches that address several memory bugs that occur
in the Exynos Virtual Display driver.

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)
