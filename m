Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463AFBC244E
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 19:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D05B10E09C;
	Tue,  7 Oct 2025 17:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CT/cUf4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4632510E09C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 17:42:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETNBp022572
 for <dri-devel@lists.freedesktop.org>; Tue, 7 Oct 2025 17:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=wyee24WrVjcVFhMjw/FwWzhQ76MJ3q6OE06
 +avcYD2Q=; b=CT/cUf4QmhWp5E8vv/Ju+k9rJMGonB6z7OffDioGKS04Mh6VO7F
 wZ/NNLbAS1WvQJ99FWKiDGaR5UyJg7ZzHl91+ituRRJh2Pwe1++guIyBXVfiPoaZ
 98SvTR/1S8HOEHpPsY8ES3A8JZe/kJ0/rbJqIAUQifiv7KBRv+Flrdwyfv160qHZ
 MclszSlf4j9y/oc0myWVDXb/hbW1iQMccWZoh0H0l938om+Dc+vkXFUBIccCNuQh
 n5usQE58osCFtlxT9blruyIP99mkl0s5JRKUEyMgVHOCmkdbDCmLSg6dvHxLrF+y
 YnwagA3qR4tNmCIjFV1lmqcdoRw2fK6wQ4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu83fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 17:42:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4df10fb4a4cso237093971cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 10:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759858941; x=1760463741;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wyee24WrVjcVFhMjw/FwWzhQ76MJ3q6OE06+avcYD2Q=;
 b=gnZZ0bzZUP84z8nKeyjSlekSvezQM6bv61dtFmFd5/O+AUGUcMIgxDhxRt9gxT2/ZS
 5IszRg9vJ3+8njZVHc6iRJ2pOQU9G24CE9hlsiRG1FOJ7K5ibwUWds5c85d9rclCS6tF
 77+E0DM3h8SgecYntHjhML2mV9U197A+WPCY++3yUHmbUGhtb+c66xhwpfWZaOe+HyZS
 medtKEehuoU7lhYFR+rNKsLuq1fRGwCg82VbU4IUR6CPskVycaFpDMeuGVrroFclti/P
 cp2HnTqO4ZPnQUYycVXZSCU4tHkGW2wajgvOYi1ulSvDMZHz5VoGOw6FRzFSWhwCrbY8
 3YLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU59q36azXhNrrw1JBNi7FFdP91PoksY957jHOGuwsB9vGUudIBSd5sNkuDKjf+X2EcYEN0EQN/AZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHaDW5iDQMxzn9cfeZTA9W2pFrNApaE9eIUyvVnVqrpDOYoROo
 fyK+hKaEnBk57jiWZU5CraWeuWqAe1MlgNZcwnNcbZha9Wfousl6u6K3Er+Oxz9geIuXRfi6ua5
 lf3nqw9RGQXRc4jIkkIBpmwE8cR890crQF6XeYiyEkjFNZzNMsj/kXrXfK+yFaStdsQc8y3Y=
X-Gm-Gg: ASbGnctFNniZqcUaVgevIPOxip5qyAUzVGMSTpE54cDro4iptLcV7Ve4YVryZ/gqeM7
 VH9uJQaOeXIbN+tIS821ZLFG0Ge78fqoMZx5a/V1XASkWEuS4sQQpx5lKC6wpEILiQkKzndl8m5
 oq7pWwGJDOeINYiq4PBO9//Ewd0R6CnPIxJq05TO18yvWUUTVTy56bVxPJ00FMWCGXugKSUTRB+
 9q3FEdpcCETXuR06J4wsirA6UQYAlcJ9OcJkKO3WMs07JW9jSdshGw5yWhO6eJLOfXXKVYiKA5S
 nbfwDW7Og+967UvVCavUOYwZgWpGcX6ZFqpn1SO/3S2+iFlSHu5rg6lK2ztGgD6bNhfwCWTxW01
 QRjfx4g7PAw==
X-Received: by 2002:ac8:584c:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4e6ead859f5mr5978581cf.64.1759858941451; 
 Tue, 07 Oct 2025 10:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN+OrkX5PkvcLg4ILXeqCV6PcawkdSZcDb1ry08Nud168rwL5N+vcwI1vQWZ4gau5HDN2Jpg==
X-Received: by 2002:ac8:584c:0:b0:4b5:ea1f:77f4 with SMTP id
 d75a77b69052e-4e6ead859f5mr5978011cf.64.1759858940762; 
 Tue, 07 Oct 2025 10:42:20 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639773d4d8esm7043132a12.30.2025.10.07.10.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 10:42:20 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Use overflow check function instead of division
Date: Tue,  7 Oct 2025 19:42:18 +0200
Message-ID: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1CUBHWtxWehv_9N6lGb0wHduJ-lHDXNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXw861/yD/eMra
 8IXH1vrcqriepK1oBMttL9DzSSuteaN6mRbzn0ylygKnfnbELAS0XHL8y4eupD2DaoT3JCsU1dC
 XoUxR7oa73ysuCmKl/W15P2cJopMcOT6wqxp2ychd8wJ0w3twSXNc0rAiauqNYyAf2vZYcnrT7v
 iMjLYWrtFAxxFtk6h4r6fmMWd2BtMKFsZjK27+Ufsf/WkGzTxx8Wb6MyzxPhk6hoMjQVY5puNJr
 loUBZEUOel1ktRFeTAzbA0xy9tTKevsaGvvUIueOW2PX+IAZeuRfVuVM1Gx70FmVbsKmPVzY+ob
 OHIYr5R5Z+LFPBXbIKHmojWs0gwwXJ/HHKMXfhKlJddJ5xwhIKFj0DBaGVbVVuGJ38ftGAe2szL
 22XmEa7kMz17yoGCl7JY+fgQ7omYhQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e550fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fuhP_ZXRh-4HPPFbgo0A:9
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1CUBHWtxWehv_9N6lGb0wHduJ-lHDXNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

From: Carl Vanderlip <quic_carlv@quicinc.com>

Division is an expensive operation. Overflow check functions exist
already. Use existing overflow check functions rather than dividing to
check for overflow.

Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 5 +++--
 drivers/accel/qaic/qaic_data.c    | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d8bdab69f800..7c809757c325 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -655,8 +655,9 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 		return -EINVAL;
 
 	nelem = in_trans->queue_size;
-	size = (get_dbc_req_elem_size() + get_dbc_rsp_elem_size()) * nelem;
-	if (size / nelem != get_dbc_req_elem_size() + get_dbc_rsp_elem_size())
+	if (check_mul_overflow((u32)(get_dbc_req_elem_size() + get_dbc_rsp_elem_size()),
+			       nelem,
+			       &size))
 		return -EINVAL;
 
 	if (size + QAIC_DBC_Q_GAP + QAIC_DBC_Q_BUF_ALIGN < size)
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..7c304a9e5048 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -953,8 +953,9 @@ int qaic_attach_slice_bo_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	if (args->hdr.count == 0)
 		return -EINVAL;
 
-	arg_size = args->hdr.count * sizeof(*slice_ent);
-	if (arg_size / args->hdr.count != sizeof(*slice_ent))
+	if (check_mul_overflow((unsigned long)args->hdr.count,
+			       (unsigned long)sizeof(*slice_ent),
+			       &arg_size))
 		return -EINVAL;
 
 	if (!(args->hdr.dir == DMA_TO_DEVICE || args->hdr.dir == DMA_FROM_DEVICE))
-- 
2.43.0

