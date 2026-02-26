Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E4yMygZoGmzfgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:58:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826791A3D9E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 10:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA9110E8A3;
	Thu, 26 Feb 2026 09:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HypGV2jW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509C710E0B0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 09:57:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4806fd9033bso1383545e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772099875; x=1772704675; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CuicWvo8UINIZwVGDJGQjXx8SMx76VGu5TdPPW4dolQ=;
 b=HypGV2jW0PAYe8ok3f0QD7JB21g7ITEcoNgL62vXuVmyjzKaap7lf4wFxJQki4EWai
 bRP9ny3GTmz40S8ARxKnzTzhEWOxKhb24x9SsjwELZ1iYZ9v6hsPiTnLj/b902P+fRHj
 pgRgMnDSY0MVgOHha4CRO/46ga+GvyRjmB7Nd4WV4Uid3zb1UVGGe1OrNlM066K3qUG1
 L5C1qelVTxrFIU6FavXRJ9GoEI2lGaAoYZuYOOI+cZRvX3InKYuBNmaoxXevrCT8jmU0
 5UlL90jxYnkGS0drLIRoJl0f8iAGfrBIlY83vjT96umWyEg6YzQM0qxFEh2hwqhCuxZW
 0ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772099875; x=1772704675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CuicWvo8UINIZwVGDJGQjXx8SMx76VGu5TdPPW4dolQ=;
 b=YtT75VcrR+vSbduy5Kj06GLfaletcNphUf0q2KkSMyfRTnA15wtmUN1kmb3r/iX8PF
 4+GKPurWHfXp8m0lUT/iG3A3YFZaCr3HiaXsmlK/cazZJp5xb9LS3aMibDxIbdrbOEXM
 Xb+EwaTEMAJOOizqjLOz/lgHA7EEugKlDNfmUXX1zs1iBbr9blKQUjVsiWfzrRJc/arW
 ev56koj7Rx1Je8DAw00q+FGgzRfFpX5zsqvkFzrcRSKY01YAG43efDNbGRRL6F5BSC5L
 +H86k7m5xhKxo5Mpr1ri7MeiewdcfFFzjGDMEqrXDMH7aZyLLK8eSdAnCYbjgF16M9Ac
 bx5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPkByw674S6oPmvfTFrEObMbo6DcjB+a14Myu02v4jXWn6I+PBVlRhFGGCG1cxqCUrgRf/G2PcnPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOhUYYmsMYcNFF22ghlaUbh8DxsGQJt5FuOnysDz++23Oz3sId
 z37gFN0QkcV3l8+P+mYllYp1WVKP6plwDhLpq0yG8Dod7IGx7IfGPEp0
X-Gm-Gg: ATEYQzyg/Xptn6b3tbIzNg6QO1UFGPvHoYhj+FgIeF3HIPPaxVSPEXU1Ei2f/6IQmjM
 gL7ZatoqLBzDG/HRS0Xcx2aZHQNw+Xcb0E8tTku6IGsNOG0vkZi6I9Ce2v+Efd315lGhGgp7T+b
 MY6QYYDoheImLRIHwiMmdxvTJNM+033YPCNrC2OnkjNnl0TgCcu1fwAWu6mPKgYK/Ew/O2Wp/lv
 hcgHU4MYuW3Mnd2UVdEWJoi9xQNEB66HLniA2Lors+a3jAUmogs9g+gMlOg0dKFeyprp4tx3tXn
 zpEh4ENZL2SXedPlCdUawzNBSK1hpNCKsEIRbown/PyrNvsm44s3I++M5azjrQHdw75wibL2SpP
 4KrPXZiGlCBZ72Y5WPzMx1Yq55LOiQ5o4fG+fiNxt6Lia8ODVGjT7QLGsNp8g3xKWtIf7X/qizd
 b9j8tyGB886cnYPlVmE34WIOUVEF/5A6upyauhJLc=
X-Received: by 2002:a05:600c:1c24:b0:477:5ca6:4d51 with SMTP id
 5b1f17b1804b1-483a95dc5bfmr209342875e9.3.1772099874447; 
 Thu, 26 Feb 2026 01:57:54 -0800 (PST)
Received: from fedora ([2a04:cec0:1000:5e88:ea60:cef2:e186:48df])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b84023sm34015355e9.12.2026.02.26.01.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 01:57:54 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm: Fix dma_free_attrs() buffer size
Date: Thu, 26 Feb 2026 10:57:11 +0100
Message-ID: <20260226095714.12126-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:stable@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fourierthomas@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 826791A3D9E
X-Rspamd-Action: no action

The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
a2xx_gpummu_new() but freed with size TABLE_SIZE in
a2xx_gpummu_destroy().

Change the free size to match the allocation.

Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1->v2:
  - Fix subject prefix

 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 0407c9bc8c1b..4467b04527cd 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -78,7 +78,7 @@ static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 
-	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
+	dma_free_attrs(mmu->dev, TABLE_SIZE + 32, gpummu->table, gpummu->pt_base,
 		DMA_ATTR_FORCE_CONTIGUOUS);
 
 	kfree(gpummu);
-- 
2.52.0

