Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNbhLJixk2kK7wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:08:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430314833E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A075310E410;
	Tue, 17 Feb 2026 00:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lnlfuAK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A066910E410
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 00:08:53 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-503347e8715so46642911cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771286932; x=1771891732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfrCcwMt9Miameh+PUap2dL04J6Ma+4K1r37+UmYok0=;
 b=lnlfuAK0l3YvuHdNQWzDis/Eq5C5J7evNLE5+SEbSfesIPYMd8Vkv9aP62i0jcoNAO
 c1hmkR7ibRRc9WSpfZm7PBdwM0u16Y4P1YUuy7qkEvTBj4OrIBzbjay27fxBdfyis7Wt
 8Nc2KxU/dObs1ZLryTcVAXCA7u5RGGX14zbOlBLhLuMQVMgsc+yhLqiNwK6M7PmoETQF
 QOjSK2Svuzh2jhs+M8FMvg+KUE7BbugipxZ82H0BnYIhlQc6fTeVNKyQ0Wqf/SJEy5tl
 gi2haBbvMj6BU9ZRIMC4E8AmxcGOcHf7vcXjkv1YxZnGy63mzFZavlw+DOyK5Bnvj7Ka
 dOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771286932; x=1771891732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EfrCcwMt9Miameh+PUap2dL04J6Ma+4K1r37+UmYok0=;
 b=gtimKIx5h/K35ZGYwwQlZVowGzRdf+QHFzXB5+jIUc+Mu9tVZphSsNlZNpNA/BbLWr
 CXKU3eCNYuAgQVA/iWDXdpaxEuJNHr5Iia60uFnxndhef+Nc3QDRnUsVH3hsl6PjnXBx
 XPsWUFoVAsGQp4xd5UEVUXpmRvQtoKLfVfQAT/RIYm1Z400tJRhvrqXGEP5lFBAp2g3H
 frN14D7TKJvGBti/FMbbUnZgrkQCH9j8aQ7tgzlhlTkeGpwQzpL0URdGD/6XoWd2OpvT
 uDzywmkDrXuoklcwBEkvnZUn496DX4Of6lCNGFJQuc9+5Qo1zNx/AmSA/Aig6nDqvhog
 qHcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf5EusvvDISJ5QjQLdROXv1+7mzPmIhuGqYlr2Ph6v8KPtMHV49b5QmpPmyq1BKwvYlMu7VhOTbtw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNh/opZuJmjlhzjGR/yLxgBO1eYKuZgg3mkodpfVgF2BJu7oWG
 qxGaGHt5PNG97jFN5s8HtLJyDWBH11/0QjvJYE9ZzvmORYM928QhlBLr
X-Gm-Gg: AZuq6aJxObFhmapGQNYZ9ZTdDx0JhaY1SGps6yXlGcEemtjVbYC4Zi7f/2Lx9ZNqe37
 4BvHR4w/LGGCdQrVNAllClzPs8aBg0HgE2+2t7WDtI2H8mhcK+mC/jBlKxeR2qrlibg3NiRvmvN
 FZrDcmk3+/XugG3I87R/hb1aDC/am05mW5hXqvDV/gtyvgonqcW0wYL9NkEjHqzd2F68MiiMH3c
 aIADN+SQiGyrblxNBJ7tSOn53YWrIl7GsERXZcdXqfEb+c6PJuNZ4iW0TP0H4X0hSVj+gQ0Maly
 6F2f9Zcg/j+jU5bSLBDcfKXQ5ERuWEAbqCarOJufAP9FwQuv2xLlv/ebq9fhXoPDTUAxQ/fZe83
 07EpyA+XETi1pwgWLQa316Je+b7Ami8C+ogi7ToCmcMvgUm67eMksMFGAIOmKY2Ho0/D+oCHt/C
 Ajdcw0SiLodiKS152rNOHZybv7NABekg==
X-Received: by 2002:ac8:5d46:0:b0:501:17a9:5ff5 with SMTP id
 d75a77b69052e-506b3fa2151mr131086721cf.21.1771286932589; 
 Mon, 16 Feb 2026 16:08:52 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb45f13a61sm857362585a.7.2026.02.16.16.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 16:08:52 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/6] dt-bindings: panel-simple-dsi: add nt37700f compatible
Date: Mon, 16 Feb 2026 19:08:50 -0500
Message-ID: <20260217000854.131242-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 4430314833E
X-Rspamd-Action: no action

Add the compatible for the NT37700F panel found on the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 8d668979b62d..e56865d2771b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -49,6 +49,8 @@ properties:
       - lg,lh500wx1-sd03
         # Lincoln LCD197 5" 1080x1920 LCD panel
       - lincolntech,lcd197
+        # Novatek NT37700F 1080x2160 AMOLED panel
+      - novatek,nt37700f
         # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
       - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
-- 
2.53.0

