Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJJbA8aYimkvMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51C116504
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DDA10E4A8;
	Tue, 10 Feb 2026 02:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A3gbN7Zd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1341A10E4A8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:32:35 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-5014e1312c6so1962601cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 18:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770690754; x=1771295554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wB96g5tBmbZcB3Dn6OFX+n3pGQOYEK523R4mr+xrtp0=;
 b=A3gbN7Zd31/Pb10lcWkI5K4BOBCvkT/Ps7Av0HPlPyRMKADd8Yq/KS9To13KPlpUkC
 DwzpB9y7Qss+yR0F6132S0hB6o7aGncXLrH8xpnQD1pEzfPV2vbB6KiG4dNE/R5xRFc+
 vK9Jx4cZNYzLEAsHNbDizYuoEstEhguGeyXQgiJla0l30KH0H2ihmGWiOSKKhjFcGAcU
 /aW6TemYaift6moprmmmvzy9EAGyb0mkFljc55jYPZy/7A0qOWeA5lPx+gzVCoHOZhz5
 KkesS3M4Jf4ZGQvuq212cR3BJCXzYgs4tMO/738+O3byR6eKnWt2T6sZp2/WAD+TVSaM
 V24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770690754; x=1771295554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wB96g5tBmbZcB3Dn6OFX+n3pGQOYEK523R4mr+xrtp0=;
 b=JzohhHbKcFNtQ0MvWePyyleEArrehdpQjKXfYK8+AB/Q9fbimRpzuqpe1CtzDTzktU
 M6jYNZoa4EU1Cztgsn08DRFPbk76L9LAiAzmH9+RZiAMF4Q/keYnp7wVBw/z0PxBLNgH
 8PPIWeGqv/KlEvQiWOEOS+i6Su86/WRebhbYypgPgD8lNcvwQSB6/1ZD9QtoE1q8PNDW
 krZDleCXLvRmD9LzTGERGZTHP06+g5pG5wOdp42NJ9SaGFrPgRUuoX/y+5MEKogHRumX
 /zCOMxDdwlm8mABtkVpVfvmRp/B2eb/SeQkllrT95NLPTt8IwKHuOiOS0bFz/Qpx3Oy6
 g5wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMk/uikzVa+Krvca5QzNTSz5I17hU6/J2KCQ2j8AQ6kN9S6mBg5C6IG3cp8lCFtwqB9BWasgFuJkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgiVgs852CLjozI6zNhEOoQg/uIhIyZqYP82RJgGfg983LJls5
 4sJ0hfs+YFtfRx3/LYZazTZDs8IoGvahF+Upey3oMDuZ+svDzC3fZasQ
X-Gm-Gg: AZuq6aIPebF6hv2Jvs94bOUkyrh1SVprPQOWYpmp9Ou/0vfAiKpSp2BR2TBrxI42TQc
 OhqFUNCQwIXsu6MgWfENOiwoeM+BRcelQ1nHT/KcPDzCtQvKhi5xmvi29eZkC/J2cRUKlUlSWWq
 ZtJQ7Rx4K9EOn5VuXmOeS+oPPv8vsuTlBNvojMJjOML6Fke0P6QNf9+lFr97TLgwfvSaO0JLEZJ
 nbpqQUJRiCAiIzhylbzLp7VjKc9LJwp1+5WyokFMTnL5mCqF9BTynpOFZdKj8ytJJ8XA9XUnb0B
 ngoEipMElO7Yuv17o4VfzJEP2q9EyynTmZZ8MVbCS/6eyYwyPt2lrAQfsXrxqvwlhDN8pqbqD/G
 o7+ayC//GcRW9LQglkg5Z/+HgURjT8PzNutJPtOfRETZ7vx+pntQEH7CyfrJyEiVNeucqAHUThr
 N663nfpxvQScCLAX3ZgSo42SgBb6nElEfhXYxV+06LT81VTXAe/u6rVMb5aJqwnz55omEfBqOrQ
 CErwj2K+5vYA1KbgdHmdOIwZQ==
X-Received: by 2002:a05:622a:646:b0:502:9e5b:2d83 with SMTP id
 d75a77b69052e-50639a1b166mr168701701cf.75.1770690753937; 
 Mon, 09 Feb 2026 18:32:33 -0800 (PST)
Received: from localhost
 (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-506392902f9sm88729861cf.18.2026.02.09.18.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 18:32:33 -0800 (PST)
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
Subject: [PATCH 4/6] arm64: dts: qcom: sdm670-google-sargo: add touchscreen
 and display labels
Date: Mon,  9 Feb 2026 21:32:58 -0500
Message-ID: <20260210023300.15785-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210023300.15785-1-mailingradian@gmail.com>
References: <20260210023300.15785-1-mailingradian@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,0.0.0.1:email,0.0.0.12:email,9c000000:email]
X-Rspamd-Queue-Id: 6A51C116504
X-Rspamd-Action: no action

The touchscreen and framebuffer can have different resolutions on the
Pixel 3a and 3a XL. Label them so the resolutions can be modified, in
anticipation of the addition of the Pixel 3a XL.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index e925cba0381f..2e86bed9ea8c 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -48,7 +48,7 @@ chosen {
 		#size-cells = <2>;
 		ranges;
 
-		framebuffer@9c000000 {
+		framebuffer: framebuffer@9c000000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
 			width = <1080>;
@@ -516,7 +516,7 @@ rmi4-f01@1 {
 			syna,nosleep-mode = <1>;
 		};
 
-		rmi4-f12@12 {
+		rmi4_f12: rmi4-f12@12 {
 			reg = <0x12>;
 			touchscreen-x-mm = <62>;
 			touchscreen-y-mm = <127>;
@@ -533,7 +533,7 @@ &mdss_dsi0 {
 	vdda-supply = <&vreg_l1a_1p225>;
 	status = "okay";
 
-	panel@0 {
+	panel: panel@0 {
 		compatible = "samsung,s6e3fa7-ams559nk06";
 		reg = <0>;
 
-- 
2.53.0

