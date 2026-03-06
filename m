Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EPOGKudqmnPUQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:26:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B650C21DDFC
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA68E10ECBB;
	Fri,  6 Mar 2026 09:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NYJVqYf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8DB10ECC7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:25:58 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c7059b9df33so3434846a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772789158; x=1773393958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ewHGacURbR5hWeKGyZInp1e9Eq3/0vuCV0I4zH6dBM=;
 b=NYJVqYf8axiPKJtBGPsuwGwiUCpeee7I/Ht3MO++LSE/LkuOzKRLnvVF/FfOq0GpjD
 w+acskFwb7Ueo4Pp/sw4FskAOUSQg95KmO6Phu9Tc0N3jjAulCThwalKfVhNQibQ0iNQ
 JlY0tJuai+PgICun8WBuhJSC7W9vZmvh4YesalrFThLwSbVzFDcHFCIwZP9SJhVer19L
 bE93j9FpMrebINjEYy+YYtUU8WfQh/7FigUkuVs8dh0YloK3Tw8CQ+85Ity4/xNFCkAb
 7pCs2qmFvsjXzKVdf1fJot0kDUmIc1uJDQz50AfWOIIrOu2+az5OXmOXx4iTjMWRn59z
 0ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789158; x=1773393958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ewHGacURbR5hWeKGyZInp1e9Eq3/0vuCV0I4zH6dBM=;
 b=WjK4+sB9lvcj/tcPexqzW09JQYJGBgB3P5K8R4wixw1XW5aJxCIsFzsh3bjyvhFnCF
 fBxb5MrXpLJkPiA1IsKoYiRddyows0bGzknoMuBrSYpoJZRHMg6PeIIlRi3VsAb8XL6c
 33zcFJZ5SP02QfHx76Z21RM3973ucfFgSg4RC5DbcjvXxZZg0QiuY2VdxA3naxTJhP0p
 IoRCzuLSmSqXHWpE1zjDZIGKICvAUELlpRcnzq1wtyYV5QYInlpf/zv46g+dE6UDs/Q+
 Ek/5oSkHCrH7ibTRXNYiYgVKwnspWjLpN6Y+TwxiSMISTf4cxd18uyIFV8TQS1aUbgoR
 Q0kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNrQuOwj1kPsJNoOlHvA17rfIOn6I/Jy0iHGwWFBjIJ5ZrzmXwzFGjqg0eXJa2XWkl2kMH7VBro98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNZjl+2NKJxPJqVChA2f3gFZu3GcluTX9btEU4wazBXDc2d2b6
 HSgTSTzW+/A6dhPUw/PowuPZKUPhzLVMkxjE/3TS9ac7kNG+GPtJCiJI
X-Gm-Gg: ATEYQzzdnCafj05GG94xFqJ1KGHLnrwTYD8/sHMcSg9GSl4wTffJIJXtUSim3Pze9IB
 fCu4lINS9ZDGUw4nwbiWTEt9ycggx8PEtehO/mX25KVkmOWS6IPe5XpasPPTDD6/pS6r8gU8AVD
 P8F+z039WChyCUZ2cPHL9BDoHazvsAqa2P5HjhtGK1b/4ZfpszfC5IfwadFddcKD3THak1xFIU2
 XGImLnj5mVvTVDdLJzRrFDQsHzX4IMKPsCKZ9Ne54pYIoRz0Pprk7GJTSfGxq504cqYCG3bQno0
 KHA9tacYWcf1LM4K3JNuPGMB3uNUmfflUw0A8Uz8K93RQQZT+qq/ngZ9qDlS1Ohw1+7Xr5ef2MZ
 yPtZPXPzpjd5P4amYBr/KnspXWR2KmHi1HHgOuNph4S0EiLQ+Z0us88Jskm0JSG0EsOGddiy9G5
 tft01rG9zxZ6EYFuphbQ==
X-Received: by 2002:a05:6a20:cd96:b0:38b:e8f3:7065 with SMTP id
 adf61e73a8af0-3985a84978emr1449373637.19.1772789157619; 
 Fri, 06 Mar 2026 01:25:57 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c739e195c40sm1021673a12.31.2026.03.06.01.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:25:57 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Eugene Lepshy <fekz115@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
Date: Fri,  6 Mar 2026 17:25:00 +0800
Message-ID: <20260306092518.37849-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: B650C21DDFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:fekz115@gmail.com,m:danila@jiaxyga.com,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,jiaxyga.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

In upstream the msm, for bpc greater than 8 are not supported yet,
although the hardware block supports this. Remove them until we
support them.

Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..b60b26ddb0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 
 	switch (dsc->bits_per_component) {
 	case 8:
-	case 10:
-	case 12:
 		/*
-		 * Only 8, 10, and 12 bpc are supported for DSC 1.1 block.
-		 * If additional bpc values need to be supported, update
-		 * this quard with the appropriate DSC version verification.
+		 * In the upstream msm, only 8 bpc is supported for DSC 1.1/1.2
+		 * block.
 		 */
 		break;
 	default:
-- 
2.53.0

