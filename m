Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHX7Ao30emnDAAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 06:47:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFD3AC0B7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 06:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A3A10E7C9;
	Thu, 29 Jan 2026 05:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lW518QdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C688110E7C9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 05:47:52 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-8c07bc2ad13so52181385a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769665672; x=1770270472; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1IVPvbiKHqb1wJCwFPWETEeAl2aF1oAt9knBh3vkK+g=;
 b=lW518QdAVcmRPh+Blw62gW1hvVimt1mNMEPPCt+zsZXJ4t1C8kZvuCtt5pHDaB2H0v
 BpE8OJc1vPpR+PIdGUvK9gzmOBpl4KwjczBYfobYiU9gkAaNmtMm+7D+NJA+dNjJjRCU
 4ms+C0iiW16MuHu8PbWy4h2fyQ6/7OlEc/NW1nfCyPF/FZd4ERET/f2g+EcQDYc2pQE2
 vr9l903ijyivNzP61lur1sM1CcYRdEnd4I7CHMmfXBnGUu2IyjdeuaTu/fmoOXRKAt4g
 CUShd5WVQB1ZZvgAuc9cC3Hdw0rzxfTFCp1zyxD37pozzDl2ld9NKeAjFSOjLZSPUsiq
 N7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769665672; x=1770270472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1IVPvbiKHqb1wJCwFPWETEeAl2aF1oAt9knBh3vkK+g=;
 b=uI/htZcjZXBmrDLcdnSOvCsL6Z+k5ZNs739AJGhMKVAhZUUqGhnjVL4I+3i2fhH3tv
 tW/iZGidz49Xs6HTespVlkswsCygRZDxKJq+ixSASsPMhZSrzR5kIoVvVLHrA7ZCT9T3
 RpGzPFcoouAPyVhjMqgvBpEbWIIL/Crq1muL8baD12z+k1ojb7UypXLTxcSo9ZBJ9wzl
 QiKFBp08wy4ofX7DR7LUWase9FCdm7XisltLDcoO/5G/UZhP9OwF7xDzslZZLgSMJ3ly
 7thxodea13c1/TlM8IhwJSGf8RfnLIpIgvZbs0KNGC5gOwu9lmEklr+qpY4hETNXcH9R
 t5jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmw6NaXXDoCFo+CFpocGjnPzhCKzNBq9WdGpd4DDwEQfDFyzu7/PBkSKUt9WIcZyjOuxX9xKpclms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz70awZKlvGC34zexkIC83l5ptwayhxNONIW45jnAKL/Uz0iGjR
 aAAH8aoHFLud70O+EqqbyzGjaLe1uFNsOUaCuBoWcsPH6Oyk7bW6hdQb
X-Gm-Gg: AZuq6aKPwfclzyW+uE2xk4nIQrVPVHNXdmeN5wQ1/dqVkoPhWOLMgMzA27Ic4uuujbd
 GNd3GXxN6oeNGrcAUcGj/Pyj48SVrOaUIJW8hzvaB6x1mQ0//98aAnGh3zSyHOmzWfvSzp+eJLa
 1sa0KKeHe1iPJvcn5i1zCGuFC2UnlXaaiD1mGdqhGdcF1JRl3zPQf9ZFLipFK9AYLvqbK8V0pX3
 Bu2+r3pHbxRvVyjoXcVduvxaj8+1/vMPG/qRyFNhnJdG4ps0aDySLq+0YjniUMPm5cWKcq6fcot
 pe1gBWow5ZsDPAt8xkI+We0ainy87gCMlsulLb2wf4CZpHsfitVk+lJQi+ubvJptiaVPjj16+Bb
 kSD7Wyy8tsxTjAiKbCiEg895mXTmL37seRq3wdw3zdT1CWtP0O9bLwobxvFdWup1Pl17E5wCQQM
 UCY3QvhEuqZyHe7TTVfI+LkXg45hCUuDtdxy50LS6iRtWeIDQ3yoEKpjKln2I0LCsKbJKV/AY=
X-Received: by 2002:a05:622a:3c8:b0:503:2d06:8e1f with SMTP id
 d75a77b69052e-5032f774707mr95808421cf.19.1769665671643; 
 Wed, 28 Jan 2026 21:47:51 -0800 (PST)
Received: from mighty.stonybrook.edu (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d36dd1cfsm30903216d6.25.2026.01.28.21.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 21:47:51 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, airlied@gmail.com, andreas@kemnade.info,
 conor+dt@kernel.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jesszhan0024@gmail.com,
 rfoss@kernel.org, robh@kernel.org, rogerq@kernel.org, simona@ffwll.ch,
 thierry.reding@gmail.com, tony@atomide.com, tzimmermann@suse.de,
 andrzej.hajda@intel.com, bavishimithil@gmail.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 4/8] dt-bindings: display: panel-lvds: Add compatibles for
 Samsung LTN070NL01 and LTN101AL03 panels
Date: Thu, 29 Jan 2026 00:47:05 -0500
Message-ID: <20260129054709.3878-5-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129054709.3878-1-bavishimithil@gmail.com>
References: <20260129054709.3878-1-bavishimithil@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:andreas@kemnade.info,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:bavishimithil@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[iki.fi,gmail.com,kemnade.info,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bavishimithil@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: ADFD3AC0B7
X-Rspamd-Action: no action

The LTN070NL01 is a 7.0 inch 1024x600, 24 bit, VESA Compatible, TFT
display panel
The LTN101AL03 is a 10.1 inch 800x1280, 24 bit, VESA Compatible, TFT
display panel

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index dbc01e640..b31c67bab 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,10 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - samsung,ltn070nl01
+          # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
+          - samsung,ltn101al03
           - tbs,a711-panel
           # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - winstar,wf70a8syjhlnga
-- 
2.43.0

