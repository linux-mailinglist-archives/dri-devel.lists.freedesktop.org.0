Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B9947FF4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA2910E257;
	Mon,  5 Aug 2024 17:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mgmhUTxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A6010E25D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:08:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-428fb103724so3959495e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877700; x=1723482500;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EmiEhoS6BgYdmW1ox9MD/8B00pSFSdxMx9lwzx2VbII=;
 b=mgmhUTxghghNcLDuBYDQSo3NbIog9cBijatJXFJAYou2EPCNrxuQFZ+MSMHv3i4DNf
 CbLMyJ3wO6m27u3l5ALmGRflYIryPMot2twL9pzXVwpWDsbhu7lthOwjcNFSq0Z0LHeN
 pkoSqkzo3BTGAzcbLpvcFviZA1s+zO1tZ5pEvd1aivGs5aAFOiu+B7VMKUvd/lhstp7u
 v5S5bYr1fiOgyCac7W/y2qFCMFvaPtCrXgrm8LEeii9GuEXHcYGL7sPVjCjYZaXzvNSH
 9/CgewHhVXM6OvTqrWIBDq7QjyDoO+BYyW7kzxLMDLavSshHShAbdm6v4/Ngvz2Vm7gs
 pB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722877700; x=1723482500;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EmiEhoS6BgYdmW1ox9MD/8B00pSFSdxMx9lwzx2VbII=;
 b=YzVAhOleTfD6iLZXbAXI0+TpZWtbYEJKBvF5DWt6W0uCtrgMK9rOvHT1hTXX/plYuX
 mtXStk9JoCbFTQJ+x2eoo+5bvK0flxPK5duP+PH/0bDKWAibZDQOWFj+bgNcsfMfan0Q
 Pbj7KgsS+hwFHq/HfWL+yPysWxyBseUA3ZWmEw4FsQ/qMgg1NaXnAffl+x7uRRdKobVf
 8GYfttKlCpVcjWa916Wi+JUNnroRnbBtQ0lEsUFgPtbfz1KuIiEAQPmWl62v12wKIzfG
 8RyMX1+66MTtxjxjaN3X+6Kt03NtMTv8NdXIkeQAFRI31OkjEpatgWK3CCWwdzmczWbW
 UzDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHzUZTWTIn/xbXoIEG8krANQ8L2PZ7IVbhKWLUSvY0nBvo5Uq1MtnPfqh4kiWSE5OIIoAqTeu0HmQHYx9p/j63pZPhNMpzhFgpYXwnlcp8
X-Gm-Message-State: AOJu0YzzymjvRIUVXhr6dMQmmUg3DL82H3ycT3h+tpZxwQWvRazXsTuh
 bq0mJfUBefgnZopbzPZPv5lkJopAlDsiKwh8+/jwGRQoWF/dsO8K8wcjv2cckNI=
X-Google-Smtp-Source: AGHT+IHLa6OMuCX4j0DNyE0gPuB42Fu0JyAzr6x+/y2e7m5rbQe6YTRrgFmyb3RKRnKeM6Z+gugKNg==
X-Received: by 2002:a5d:63c6:0:b0:367:8fee:4434 with SMTP id
 ffacd0b85a97d-36bbbe58c9amr8643179f8f.16.1722877699771; 
 Mon, 05 Aug 2024 10:08:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 10:08:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:05 +0200
Subject: [PATCH v4 4/6] misc: fastrpc: Add support for cdsp1 remoteproc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-4-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NlK6VGdZihNVv+SIfwfvMzqrGtF1lODmEAtLAfz+SWo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb8DWMHVDLnK8twR3IQVFxqQhEG7VPHptopI
 b4+AK1o1/uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG/AAKCRARpy6gFHHX
 cuk3D/9G85vhLg6qshc2VEGhoV2sqvQZsgaUpu/zgGu6VPjgM12MQyB4hcsIeNj0ntRnAzuPyXB
 gdqD5bK5t1XNiL2pQ3Abfz87wa5220/olx8E6a1XMoblikPVxnXj6NbOfOQMBrXV2O9JQ3l2t6M
 z35zBgMgnCI1p3BoscRNdgWqYh60Kls7QM+UfEfCRn27gRNTu6xppP+9gEAhVjONE386vzx57Kp
 CESFr4YoesfZJCSYu8MwkqpvS8dWrYiD58O7J9KPurhbpR1nVb3WgNEbXJDGlzxb8SqgfX+ARpy
 x8irSCRvqKEhzG9GlzFR4VxDvqQF5jZNVIyohDqZyZ6qUV7y3z1yvfEh2RsnEjuMrjGmVlaRQdf
 UhETa8wT4acdBTPLewfBR6ryr8mnEEI1KV0Be9JprH2lhMWjHCF0gXJ9d9uZT3CXQ/nF77gcu/A
 alJ6uraOT2SHxirwJwE5S+pNVJuBbgYSSl8U9glARy3DO9Avu+vhb3JMIMJ2L3JeV5E5fmglfu1
 GZfYXz8RKkpDX8unZKfCsAnKPOeBeJEiFygQG1DezF22O4SV+qG+aPN+XXQ7LIyWzvlIb+d+63d
 MVYmfTZMOR2If3IuQbj7NDm1bedS2AxJicEtNVGgK4A7c49Wsw8KvRbdGwYqHjXfstMkn06gOI5
 nPsIWLcyo1hjEFA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
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

From: Ling Xu <quic_lxu5@quicinc.com>

The fastrpc supports 4 remoteproc. There are some products which
support cdsp1 remoteproc. Add changes to support cdsp1 remoteproc.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
[Bartosz: ported to mainline]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/misc/fastrpc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5204fda51da3..07bf8532557e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,7 +27,8 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
-#define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
+#define CDSP1_DOMAIN_ID (4)
+#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -106,7 +107,7 @@
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
 static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
-						"sdsp", "cdsp"};
+						"sdsp", "cdsp", "cdsp1" };
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -2286,7 +2287,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return err;
 	}
 
-	for (i = 0; i <= CDSP_DOMAIN_ID; i++) {
+	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
 		if (!strcmp(domains[i], domain)) {
 			domain_id = i;
 			break;
@@ -2344,13 +2345,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP*/
+		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
 		if (err)
 			goto fdev_error;
 		break;
 	case CDSP_DOMAIN_ID:
+	case CDSP1_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);

-- 
2.43.0

