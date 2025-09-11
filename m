Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FACB53E1E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 23:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CD510E155;
	Thu, 11 Sep 2025 21:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BXaDSszT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B3810E160
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 17:02:19 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-622b4b14a75so1913265a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757610138; x=1758214938; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FJk0hVL26JapxqBeuQwzrSE0cPApYyqFtLP73ac9uj4=;
 b=BXaDSszTw1A/Yu8WzEH1yLwn8TG/UNYN0lN68pz9HusqFQVMgmysya21TpjKO1v3gf
 OJCDXhV/sqYg21NMPZI0+gnj1//ZpHeISaxseAue/ucwbqysfA3Ubl+XVy3n/rzRcz0A
 p77IQvkxk/AMjhVKRmmj5x+EDCwL+X+nhNbrXdPQOp1VNQR+vBc1h3L8D8wTnVb1lcQc
 8uwrG5id72Up1nkCgKB3m7uw46hLO3IcN6XIKIq+2e4GOIUlj1yJn5cLO6kUTG69bpkd
 XViIM4LZpGvMmWRAIt+DotsUDaaLvMMPSafyUVLL6HiTYAhIJt+DeDqL4EQ8fv3pxH7S
 4OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757610138; x=1758214938;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJk0hVL26JapxqBeuQwzrSE0cPApYyqFtLP73ac9uj4=;
 b=Wsylb5HijdDognSC0hOAanVS+cwh8HOh29tLAmn86bTMZwcHCh5OVyPGetP+IOBkiD
 G7N3D+h4yfvLt4dhPFfOiuO/8HDcPjEb69V7aYpRKtZQi04igtJPX45t/BdRIxvU+usj
 kANOqtFVyJkKYay5toSzwKVuA4O/WovpxREK2yTOqBSfsCe36LcH1p3itcQkQE7wjVFu
 8JmuY168lu9rQQq5UDk2p70n6uPbVv9kpFbxSqW/88veB2Qnj8ceiEoGO3R/DyRy8uEu
 IROMnx3eNS8wVEMYQk+HZ0DbAetcREqADgeSIsHIu/SJpqqrjB1gRNF1kKpJgQbxYuS8
 roJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrkTwO9fufUUON/jCzywzZpcb1NW3c86+3SF00hgdNidl/U3eOtLOYhGeDWASpRRixlCF5ooEqXME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxRZfsr/DRcn5CdCxYo6JrZopaIlHBg8qUSOC7U5E/5qaM1RUh
 Nkc6nbFwQ8paF1gjAtaNsM7aHJfsmavtuCXvyf9E/c2fzFAKX6ePpR4=
X-Gm-Gg: ASbGncun7E9PSYiC9xXzTHtWuDkM7QKQDAM+ABlWVnFbSuJSGUr+XO8oDFAVDMA9jJL
 JVWODxOe5gcrFYe6MT6cx2KlH80qHh1j8ZFUaR+VKuAJ2DkZAdF2gBDrSP+QzdZDS/pnHLFEbia
 h/vll2x3OehVF8ISfBfwyzhJOl8qbwEwTXEyLKJv7dRVyv3hAGK6oRvcSiMeI82KG05AKxQvRk1
 32Fb3MXOcMkrjEE0O9lwmpCyw1jjGeepdCRZ9EoqrOO7rugHYtJkKmidym+illoU3BhpDFEwWoQ
 lHw0OaxA+DoM7Q30NdudJ3i5S49GvBe09XZLnvu5oYWefMfK4b0WakG8cVw1f9ldG9czHPsOIrF
 rF0CjXitTBTd2CmQ6/Xq+higImB/XbMvObX7rnTHwIew/Q6TKtqwHECToVrSry7BB0OXdDhFfpI
 vHHoDIAdAI3e6nYzigSi+Nu12RrMd/5/o=
X-Google-Smtp-Source: AGHT+IHx2KcsYmCWeBeWcnkZxEbDJE1L/17SMXH4yrK85mCe32s1OPDe2bxpZe+SNwy+ZLdoE3wGEg==
X-Received: by 2002:a17:907:3f92:b0:b07:a76e:db6e with SMTP id
 a640c23a62f3a-b07a76edcecmr394044366b.21.1757610137790; 
 Thu, 11 Sep 2025 10:02:17 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-163-148.retail.telecomitalia.it.
 [79.12.163.148]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da43esm166632966b.14.2025.09.11.10.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 10:02:17 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 11 Sep 2025 19:01:04 +0200
Subject: [PATCH 1/2] drm/msm/registers: Sync GPU registers from mesa
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-preemption_aware_hangcheck-v1-1-974819876819@gmail.com>
References: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
In-Reply-To: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757610134; l=980;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=zJg6XHeseMqyVJBkLEj26VisHJUB1RXdwSibXem5MNs=;
 b=6yDKz4TF8Fm0al2rGgmBcFOPLrGluHEtzD0SQuvnW97plvnBs59JWWYiRVtR2tY23untSlWyE
 w3opJ7KenRxCmtic1o7RGJPWob1R6omI5Jfn4+0zw1wZKsTDtm+q/1+
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Thu, 11 Sep 2025 21:52:23 +0000
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

In particular bring in `CP_ALWAYS_ON_CONTEXT`

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 9459b603821711a1a7ed44f0f1a567cf989b749b..6ea5479670970cc610ca25e71aa41af5f328f560 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -254,6 +254,7 @@ by a particular renderpass/blit.
 		<bitfield name="CONTEXT" low="4" high="5"/>
 	</bitset>
 	<reg64 offset="0x0980" name="CP_ALWAYS_ON_COUNTER"/>
+	<reg64 offset="0x0982" name="CP_ALWAYS_ON_CONTEXT"/>
 	<reg32 offset="0x098D" name="CP_AHB_CNTL"/>
 	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" variants="A6XX"/>
 	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" type="a7xx_aperture_cntl" variants="A7XX-"/>

-- 
2.51.0

