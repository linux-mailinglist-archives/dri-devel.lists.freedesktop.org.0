Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E1B41840
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CBC10E47A;
	Wed,  3 Sep 2025 08:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AMaAgRDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A4710E47A;
 Wed,  3 Sep 2025 08:21:06 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3da4c14a5f9so405378f8f.0; 
 Wed, 03 Sep 2025 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756887665; x=1757492465; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V+oQBUiR0fs5f1jGdxGBuHkx9I/qpPK1NnThL15aM4w=;
 b=AMaAgRDXJgpXgIVYf1JkgEqP9XdsmC9n30dWnypt0qYMSwbZexNcjTS5R5s643SMdT
 kqKJt3N8/+I+Z3XwIucowXPTOQWkji6yDMO623RzARxFkweeq4SWrD+hQkb4zg1Rb/R+
 ycUIblpBAigXbUHScBOaZZ9BJp14YksZv9oxpd8iwD3XmvfWJ0pHjzUXBZSZpkqIx+cP
 76uBaxsCHitEtJ36KFvHI61HnmwumNAdJ/XxkuOaDMXgGa8tcZXcPaufnrw+fZ9Ibm1F
 TOwgOXH6JhlmRLVzV0NSlg58AT/cqKWyFyHXKooH43Jln0MtGzZpOBADvEbRpMkP849r
 UhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756887665; x=1757492465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V+oQBUiR0fs5f1jGdxGBuHkx9I/qpPK1NnThL15aM4w=;
 b=qeeQRjuyBW6pjYaTXkT13sXzFbHLKfAOKPopUYJzMbt1CUwSRLEe7LWrOtuKkCnjaJ
 yPsVIfbOSk/pHdsyQJdY1g+4u1NFcVNRMFY/kPrhWKDR6rGiAqvqn6XDeYNVvNg1Ddnr
 GDV8gnD2m0z5aFL4yUEBGro97FzYX7HsWDJ+Uwu2n1SLPbXeEbtIu12BF853t3CS/6Hx
 zrvfuaoRxkTcpdAM1/Xtyh414xCiZQ0YYHeEEfxoxN7lnQiFIU5KxQgG0Fe52bSG+UBA
 sV18h4jlR7QzFf3/ZPxYCNGkNN5TwG+FeYtZYhLvr8SuRJBfpH3c591he8WaJBKR49dx
 yI5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/JxTUEl8lyeuanGYx1KPt6jKiP51wQOcMB1HOuKWc5J02aJw7h4ii9quUiWayg25jewNAh4jI@lists.freedesktop.org,
 AJvYcCXk0Uma4++Ns5sMq9QVUnOf8SpovD3eNOCA3pHTfxZa025Rn5gMaRKdD6iTkHfGFEgd87lKOMQFzgms@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUX53NVydm6tYRzee3CGJhXMTNupYwYrkF5Q9mvp/e8/gH2zjM
 LiA+NW9vPggqWSU05HKMbWvpJ2eu7apj4SSI/0DQ3EiaUialkGIWstg66K3PzR+wY4sN1A==
X-Gm-Gg: ASbGncsRdKaKTmmQptaLdC/Bq4av5zkTa/CQs8X0ckBeyFDb/YoS1QNactIwQgqgWuG
 oipCBao7s/5P1Og/Krg2wx2zwi3Z6BF1L6kqCuUQLCf58NPamYDYc8MRi1QnSg/vyQNk710M2Cv
 bM/MFYTWLUrOheINjeJau1RQ+tERZijIHNfdSo2gJ5xT6wzwKDYx7WUEJpOVYXBuiGJwDaZ9Fum
 hUQUnE8hRuOniy09Cf7NnCWqaQijMTU6SMxJ0aC9uSWKF9b5XE1npNKkvvLAMJ4lz/ZgJvGp8Ju
 1EABPPDMqQ1g+6U1LJ+VObbwJXQSMtUM+m15J1vFIT3BwVgvFgBHOxvDx0zr60X3kZPBAkMFd9m
 UEexY4Zw6ld26J9+TzMOy
X-Google-Smtp-Source: AGHT+IEHvf7b/CRSNGcUf7t++ZZJaW7tRGbsmvmOkYlRwH6ByjCb2owYmmiEGN45nff71XkD6CxVgw==
X-Received: by 2002:a05:6000:420f:b0:3c4:2f45:1503 with SMTP id
 ffacd0b85a97d-3d1b16f0bd5mr14924110f8f.16.1756887665095; 
 Wed, 03 Sep 2025 01:21:05 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3db72983560sm4115452f8f.1.2025.09.03.01.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 01:21:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/amdgpu: Fix a less than zero check on a
 uint32_t struct field
Date: Wed,  3 Sep 2025 09:20:18 +0100
Message-ID: <20250903082018.2702769-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Currently the error check from the call to mes_v12_inv_tlb_convert_hub_id
is always false because a uint32_t struct field hub_id is being used to
to perform the less than zero error check. Fix this by using the int
variable ret to perform the check.

Fixes: 87e65052616c ("drm/amd/amdgpu : Use the MES INV_TLBS API for tlb invalidation on gfx12")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
index cd5c966cee95..ff5df28b57ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
@@ -899,6 +899,7 @@ static int mes_v12_0_inv_tlbs_pasid(struct amdgpu_mes *mes,
 				    struct mes_inv_tlbs_pasid_input *input)
 {
 	union MESAPI__INV_TLBS mes_inv_tlbs;
+	int ret;
 
 	memset(&mes_inv_tlbs, 0, sizeof(mes_inv_tlbs));
 
@@ -911,9 +912,10 @@ static int mes_v12_0_inv_tlbs_pasid(struct amdgpu_mes *mes,
 	mes_inv_tlbs.invalidate_tlbs.inv_sel_id = input->pasid;
 
 	/*convert amdgpu_mes_hub_id to mes expected hub_id */
-	mes_inv_tlbs.invalidate_tlbs.hub_id = mes_v12_inv_tlb_convert_hub_id(input->hub_id);
-	if (mes_inv_tlbs.invalidate_tlbs.hub_id < 0)
+	ret = mes_v12_inv_tlb_convert_hub_id(input->hub_id);
+	if (ret < 0)
 		return -EINVAL;
+	mes_inv_tlbs.invalidate_tlbs.hub_id = ret;
 	return mes_v12_0_submit_pkt_and_poll_completion(mes, AMDGPU_MES_KIQ_PIPE,
 			&mes_inv_tlbs, sizeof(mes_inv_tlbs),
 			offsetof(union MESAPI__INV_TLBS, api_status));
-- 
2.51.0

