Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B7AC89052
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382610E56C;
	Wed, 26 Nov 2025 09:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8dRJe9l";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ry/Dj0pF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0554110E56C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQ9F8B54049007
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=kbs0K887OX5uGgjudk2p0d
 FLEi8N6+nMPFNSw+qTSoo=; b=J8dRJe9lzn6eHkGXG918s8NV/UMbe1IIRWSZJw
 Z9aUb1+AICF8tix4ogZ+JC4oGWMc/82h4tWJm9vStR7JVI6XGeVVuP5aaPxP/xXg
 5HW/uILkJwnVYl4Kqd3359QMIkUBrSSLdmcDAZvwru1lLKJCyYoOW1TZ4E5/+MGQ
 6UJDBxrZS5bGlZJWV+kFg9+bBMwELIeXsJZCwkQWxgDzvVhYma6sZ1epQ0NvH+7R
 5aTtl1zvZAZ9kClh0XeFwGzviyhy4fxmjiEgIkPZIEH1XAZR2IFp652U2wmoNQAk
 urcVjagxhhWc4dPYiw5LJP/wIXT+Blbs2IhbveuN7/gbCVlg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nhfsv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8824d5b11easo154686146d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764150120; x=1764754920;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kbs0K887OX5uGgjudk2p0dFLEi8N6+nMPFNSw+qTSoo=;
 b=Ry/Dj0pFCZyCwsMJqWjHcEeFEQJy//98V1p4ToiIn/k8gmjd3ZHw/T/BIlm5xT507t
 mbFHgaYGmlYXQymxG3tCbYUw1rfB+Z1AYQ2ZTc2KZr+9X8ESkUs6wM4K2SNb+oKrTF6F
 rDefbrczzjvW8vzByBJrgddcrCIYla/wM4ap/DjLgAIshdBmu0DEYPhcrzTsFAVb0aQN
 alEuise8Hlo2sxj/AE0ExVm/YBDR37PWQ0gZOlVpMAQvifpNS9EpImZArjyBuDgmUWpb
 6mE0/IcEbgeIyzsnLi96JZQeBy1TX9IujYEOEO3s2nKV/O8tLdQ0tfo/me1baKdCkDrw
 3rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764150120; x=1764754920;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbs0K887OX5uGgjudk2p0dFLEi8N6+nMPFNSw+qTSoo=;
 b=erb4dRew3C/9nmhursf7LamGBDF6zukU3jqBaHeq2JWqJq2AEhMFe1mRPI+kcHQq77
 8bomzZ7IPzbGMyx+9arvUpDsK6Bnj5A2XS9C433x11PYvz6xSSKfrSN1fIt9gD1xmPRk
 oKdH9TckcOSGLSrGyvwxZJ0OLFqIgRhyX2rFczZOODzJtSqjeMOgEvTtkXElWCh/Qu5t
 EpRpiQbZfs/Ep+/GWY7qamH9kUX40zaTpPrXrUTHJZzam25MShQgdesS/nX/xiht6MY3
 xF59YUbAsmJe0xgyM5jI55W0DbNfjkt9eXqKfCFPjYIaGgdDbxv/AAmn2D0NhSsyUwUO
 BzSQ==
X-Gm-Message-State: AOJu0YzKOg8S4hIWonx5wGKz7/0Tmz8cDZIPYFu7GjDAVagCQ/LTiLgN
 Sp0+Ijar0lJToVAUWPN+SDCK2sqveTbbKigzP4q33qfkmElK2cTJbkr4oWXSEjF+XazIpnmSzWX
 kQEOib8SsPzFHkJjhEaHi5hLSTB7I3L0hkLtBZaFwqkgzd14Giuju/sgQOc1zOE079mOIzZw=
X-Gm-Gg: ASbGnctJAVLwbHduD+VgRjiyZTVFiM/Zb3pBwIsbZxu0UGjfQ2VRCG48ZXWvfgc4N9z
 4KDF2VyJ6fAI3ChZJjIZQTiXkCL0nqzJabCeFDisM+yg7lkGD4RaijRzxHVC7EvHDmpOWqpcrNh
 SAvkTgOSAyR6Ro87Fc9z71f3c2ntrN0dp2TH6N/snFX1JgOJJtdlpXbE5FWcRZOQDnJNEfUh0qv
 /DMNXPNpAHckotfynsufcpzLXfbP6F3r60hDXqJU9LmykNJDRqwUrFWdBsrPhFXif3TybxcneEw
 vkZ5KV7xlxkK2EJaqx9hDyf35MZegv8RLasMaZbGLgcZfU0v844VKo/Xyz2E6+6CKwNzGVfgzKA
 MtjxsKUvNuhhVHmGUOM0yJhf27Yr+ClFxX+My85BcRzrWpR2kl5wBc3mV7bOu0NvFUUHqf9Fdgo
 JhOxFci/msqHLpEn4tEblyxnQ=
X-Received: by 2002:ad4:5742:0:b0:87c:2bb6:741 with SMTP id
 6a1803df08f44-8847c4d3134mr303253176d6.29.1764150120252; 
 Wed, 26 Nov 2025 01:42:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFescXHmeszXPvqF6uHwOtWeRvko/NiK0Q9+a14yaOdIdRFsZA4aE12LTU3tyOg2jLDYVUQBw==
X-Received: by 2002:ad4:5742:0:b0:87c:2bb6:741 with SMTP id
 6a1803df08f44-8847c4d3134mr303252766d6.29.1764150119733; 
 Wed, 26 Nov 2025 01:41:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbbee86sm5772682e87.49.2025.11.26.01.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 01:41:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RFC 0/2] drm: bridge: anx7625: implement Type-C support
Date: Wed, 26 Nov 2025 11:41:55 +0200
Message-Id: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPLJmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMz3cS8CnMzI1PdksqC1GRdA/MUE1PTNBMj45REJaCegqLUtMwKsHn
 RSkFuzkqxtbUA9lTgy2QAAAA=
X-Change-ID: 20251126-anx7625-typec-07d455f423da
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9IfJm9cYFgvTTHHW71T5NZliI4pprXGXeW+8D2Wr7t8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpJstm5Ty0nmzhElMKy3AXnsm67WGRTrj0T+FWW
 Fwf3DYNTj6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSbLZgAKCRCLPIo+Aiko
 1TOzB/9iQBc8sfWSr3SeuIBtpJzY4hArGlzfPYv6wcfxXfWUttOaDJdiWr8VMSEJg/aI+tRzS/W
 JQtJVrL5KOUWwlp2yUpLKdyxW2snz/tRas6oxkZRyGN2EkXSnA2UT7FMPlH2QBmsVWG8SQVAj/G
 J5zs26Evk5Z2YGFqcjsP4t0F2Pbhivljh6KSld/brEb88TDdufVxy90sYq80T0eFe9amG5LNsqX
 0EWyOoCalN0tYrNUN6JdQfdcICeh6Bz4koMDIsriIb2dvp2Fy911Hf8LiZaErlJCqRU5ZyZVf/R
 BogeQeVYpP3ENJvr9TbkIfCMkmzgyPenDVCQH1nXeDf/HiiI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926cb69 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lTOfhhQ1OH7yEsO6ukYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 3FPI1nQBICqKlw5VCXKl7ObaHlkQ2y0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX8d+5rxJLl71t
 LPdCodQ7HneHd/rkk5InN+/s+0FLsFffxc+ZG8912cD2gC31qFkPvmrLngbiijQwe+djtD8gqMU
 SV4H/g+ABbP9g9Dio2AqcJOqC/ACffyW6tKjYHEBAEbH9Gc4BYLm9w/aWTFDuV0YcdxOigHCyMZ
 wn4VpJXKFJ6pqXXc3FweN4+Xn/DKpWaiztRYZWSVV1FpCGwNVMyW6T/1olZ1yYgQrSftSr7DKwU
 vMhCGMM8gIVUk9uz40Ft8pvrWvfD5f4ISEr1EvquMDMmPBPwYWPoHMMShWcUhidL2s7B5bol8HF
 uQtG3rUDj3Z9b6ylgOkulUnBmdu788HGFK5OeaIcb5XGhUWF78G+gyxI1DMhbxQR/jlfilNQQ+P
 jCZqXSUjY6SA66LAR8+3ABfr22v+sg==
X-Proofpoint-ORIG-GUID: 3FPI1nQBICqKlw5VCXKl7ObaHlkQ2y0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079
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

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Provide minimal Type-C support necessary for
ANX7625 to register the Type-C port device and properly respond to data
/ power role events from the Type-C partner.

Notes:
- I'm not 100% happy having Type-C code in the DRM subtree. Should I use
  AUX device and to move Type-C-related code to drivers/usb/typec?

- Current code doesn't register a Type-C partner device. Would it be
  okay or should it be registered?

- The code to change data / power roles from the device isn't a part of
  the series, I'll include it once we settle on the first two items.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: drm/bridge: anx7625: describe Type-C connector
      drm: bridge: anx7625: implement minimal Type-C support

 .../bindings/display/bridge/analogix,anx7625.yaml  |  98 ++++++++++++-
 drivers/gpu/drm/bridge/analogix/Kconfig            |   1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 163 ++++++++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  21 ++-
 4 files changed, 272 insertions(+), 11 deletions(-)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251126-anx7625-typec-07d455f423da

Best regards,
-- 
With best wishes
Dmitry

