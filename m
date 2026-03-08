Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJNnBfIbrWlzyQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 07:49:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D222EC27
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 07:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847410E0CA;
	Sun,  8 Mar 2026 06:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DrWKj7Mq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890D10E0C7
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 06:49:18 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2aae4816912so70318695ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 22:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772952558; x=1773557358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htFMdi0PCVoInWxpb9fYJOUgvIOz96/javA4OzFNMiI=;
 b=DrWKj7MqLmJk6n9Wvvk3UfccDSbGpvvxijt71g7mixO8dEmXO/fEFF+plTsIn72plU
 sf/cMbpNh/ii42OP4FOkYgvEx057dE4IwD3ZG21YHqeHI9r7dRAijeyTT3rCfTEYQS5F
 Z2lPScjpwhmwkwCCZoigMvP1eQ3MZLh31F5PlvnU/xPi+LxedtzWmFrJNHByOT6/AWA+
 rhasKnR2fSg3gkHRfGmzAUprG01m7QMOYxwM+h1CBDcSsrOgTLiFUMqq8fOLh+aq4Gd3
 Ifjkr1J4b1mjxlL89HDGor8h/iRY4MHd5Y22zV31VGE3bXhe6WN+HzLGXhXWVyWygiBS
 ejeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772952558; x=1773557358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=htFMdi0PCVoInWxpb9fYJOUgvIOz96/javA4OzFNMiI=;
 b=LsGfWf32+04AekJfDw11F05UnY+DrPaKs1BxwfgBDTJZ20RdXs+shoQgAdrYTHGl4Q
 /2vKHl/BvJ6Zc0ILgUCVjjGeDS1iY9UyWg5qoFRQob379VaNl0GjP/YD4Z65dsLzmKgQ
 2ncKYVZXStMMcutaELFByfvb3KDHuXwag/DXsKRvIZa5pIgKUI5ChWgNeksowQ385QXi
 37HV0NYcRSJFxAXbwHk+9k7xARjaoyg8EXCDKo3WHF9Y5ehCKUJV0BBClQ/mk2pIU62q
 RjDwrQKsVf6vZSx4MvI6Y7Utje7TVk/kgcw40mYvWC6L5u0TntKfMV2+UyZsbiRp5Sjq
 N8eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtKfyFIP4QS8UzszFE8QUZyprWSvv8hel3SPmgjp1cfLZHRJJXIs8ZHrb+L790wZ3fX0UDH9L43qY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOc0VaJ31EsyhlE8bAdh5ioj5YJerGir/7ihMSvvCK4h2xioZ8
 M9yhxfWoK8sqtMA3SU4xJpet8/e68a4sKq4k7qE9iv9MrN8g84RwUXXJ
X-Gm-Gg: ATEYQzxF8tcjVETfaBUeChwy+484eIVw7TJK30ylLCu7bOMPdaxXY6cxR2o0LSsjfPf
 b72dzQS465cjTin/Vss3VWnwesHoTuZPjIxYE7T0OEm7OuStPbx1GCIviRdoz7arQmEuEzkEK2l
 ZLHeIQOvxn5Fwg2VFLZRKKaX51RksejXmj3xrWtxwDDZGbhC5SpV0FmYaqzHKvOin01YP2lbXqU
 6qtf84BROrxJLC4Cvcm24wGP/Wgr+7nM5kzpd64D8KM42aKkPegRaftUuoBLoFvJHOjZT43/OK4
 EJKNu0nsOdg4z+oKqFZIcta6xnm37BcrJE/bP/5lpddW3a7vdAJATKK9TBTBDD8P1HvOfW/aySE
 kTS1+aabzlv1YoGhtkyPJjMpqqV/5xbJcA3p+wfIafEEOF5kX3XqSHkD3xmTxwOvymniukGsYPW
 eTHkW1yQ6uwAu+j6o7LpoUX57WfcWJ
X-Received: by 2002:a17:902:c401:b0:2ae:4f15:1aba with SMTP id
 d9443c01a7336-2ae82443f7cmr78483015ad.30.1772952558001; 
 Sat, 07 Mar 2026 22:49:18 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 22:49:17 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Sun,  8 Mar 2026 14:48:32 +0800
Message-ID: <20260308064835.479356-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308064835.479356-1-mitltlatltl@gmail.com>
References: <20260308064835.479356-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: B85D222EC27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same values for the REVISION_ID
registers, then we fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4: There were no changes to the patch.
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4abf..532f371829 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm
+              - qcom,sc8280xp-dsi-phy-5nm
           - const: qcom,sa8775p-dsi-phy-5nm
 
   reg:
-- 
2.53.0

