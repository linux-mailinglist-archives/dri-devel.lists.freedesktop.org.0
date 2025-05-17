Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC0ABA8A9
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 09:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7ED10E13F;
	Sat, 17 May 2025 07:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvd3fKQ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F1D10E13F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 07:24:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H4C5hD030766
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 07:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ateaK2dLn3di3X67T4QDk0Hqoj/IdrKl+Gc
 MTCRfwOY=; b=lvd3fKQ93z/fkFzkqpGK/ORUXu0qLAukvTWKxYt73VBMWBwPnUT
 LaSOBVwrLYwPS0U8gvitONf6RkwAWUCTkqhoOiG10SqJtd/YOtXFUT6CL0ycuXdt
 DZHwkTZnKhc1v5BCta81gKgkutUjo0QEl7hgDZUZRVV8XgGRoyrH7+8+mu9Q+VwC
 Btsm/35cj8EHEf2f9bgVvzvsIhJpC6fVE77xl4wuwC0k2CvuO0NowetqAhmeGfYH
 yJCVvTHw7MZgEpMjUZhKfEm5eE+lDtlgAN58ZNX+snzCbSf9fFANY26ECzuJxUxK
 izt/lbtQq0BLFXYSuiKXz5SjpEkpw4X6DsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g06g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 07:24:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-23209d8ba1bso1162685ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747466678; x=1748071478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ateaK2dLn3di3X67T4QDk0Hqoj/IdrKl+GcMTCRfwOY=;
 b=CXdHZzKPuX3WcufR4KM5TQ0oAAS6dD9CQB11DQPNEOt7LZkn6bg91KQL8eCJWRYkHT
 E0T6DThoiHJp+jdHItGwIJAz3BXPyb/ENSXK0FLSJiNBRqE8g51Vh1VYb07FwOR2j6dG
 IDVQfBPPYf1xNTS25bzwwYXU6JNRrwXdY+mLlZCjw53kI9UKj4/sBPjP92aKsHTiawXL
 p8dWb22xIBOH0wHSPriuY8CwZlgrRw70iHv1D7wW+b1zOF8mB0P/larKnnH98zMxLACx
 MhnbIgLPRKt+XBP4qxCcuESi0haC77I/sU/Nprh599khCLZ+f+xALIYUs6CpqPMSUD/v
 s37Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8fpD0QuZpwGcmFHaDgw3TkO0tZxOHcz07YHOkRQoe199Xl8ELe0MJAjQEuPFw7P+PRzx2FyU9chE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUsg3q2SS1Dwo6mwt4lvWSXLx3jXv7Dolgkb2IoHnwww/jSMa8
 iAdjSZSRwx60s/XMfcWaQQNGIj1/Pfvquy4taBipYLB4F3qN2pfOZoNINW1pp+jdtoSQMjgReTS
 fc4g/87Ml9NqThok2HzOIrYCgjrZNwKw5zvta+sFot9sYQcQFs6zW2s6Ee4kL8P0qfILnxz8=
X-Gm-Gg: ASbGnct2qIZfTJXeifmY285yI15BmhjWW91rPkRJegSkKNAA/44pBxH00SX+LCiIlkN
 A8rXDHgvIWtdBcI5E1WLYyb5UVq04w7B8CDRTQ2O59oeLcIkNbU/1jQ8xSwacuC7Q/dS2t1Qea6
 Hh+DcsgKk+6GxjxuKApbqNa6eI3ANd2/DNBccXrxn6ToEy2MLfcsx/zy3rOhes975Hiav0Pl5Ph
 cVr1skGBaIGP3P/7jIIWHNIRVKkb8KdqvMw0nX3bXgU2oRy5J+7S8k2mKl+szgteRkOE1Hqkt+L
 jj9Wkf1WidqZAoigf+2sYBuZZjwAzcwon0sglRlPlhme
X-Received: by 2002:a17:903:1acf:b0:22d:e5ab:5525 with SMTP id
 d9443c01a7336-231d4596902mr100791555ad.38.1747466677682; 
 Sat, 17 May 2025 00:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFokspCYygX8RNukSar0XI/2+pvDnDJIQBo2sU96XiQL1vom3EPheBI15+XDMJWNISAqmBkhA==
X-Received: by 2002:a17:903:1acf:b0:22d:e5ab:5525 with SMTP id
 d9443c01a7336-231d4596902mr100791305ad.38.1747466677279; 
 Sat, 17 May 2025 00:24:37 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ac959esm25185225ad.33.2025.05.17.00.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 00:24:36 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1] misc: fastrpc: Fix channel resource access in device_open
Date: Sat, 17 May 2025 12:54:32 +0530
Message-Id: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: umAhLZGZlRzfJc71QIKs6TE1AFwL-7eG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDA3MCBTYWx0ZWRfX7iyzGx3+qTEE
 DOqADdYjUykPpKsKP31acasNxHCjRpjIXD9Rxukm/ULEQ+kZG9ADjD4ohRrSA48yWnMpyxK3vgG
 STVMhE0Twrw79NTSbbL0FuXa44AjYgo+u/q9DZxPo+C6BK/5ua+5gAqlo3/tlnWkOCjafnirzpR
 H8U6vtIBvuloF8p0VYx4xcNfl2dYCtnfO0NuxSk6DMuP9PtOCA2QPIZdPX2tzzzPEGbqFeKyaT4
 23fdS0KdpIVx+MDvRNXx7KbIdWki+Ei2whr/4PgwdP9zw7Y+FRFLs7WUGexiti4ei95PhbazQHe
 iXSa344UwpYSO9uEVP08dptkPgEzCZ0xONeU7oglHSOtViKICitMCIoSytCm2TqCORs2dnMAUfY
 H1Z+YfdJqkcaM9op1Qr4M5uDP2HTD+LcNjNvE9anDhRu9s+rEld/3wdS+uxmbyj7qU82mNxj
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=682839b6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9DS800j8OOefGsPzyAsA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: umAhLZGZlRzfJc71QIKs6TE1AFwL-7eG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170070
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

During rpmsg_probe, fastrpc device nodes are created first, then
channel specific resources are initialized, followed by
of_platform_populate, which triggers context bank probing. This
sequence can cause issues as applications might open the device
node before channel resources are initialized or the session is
available, leading to problems. For example, spin_lock is initialized
after the device node creation, but it is used in device_open,
potentially before initialization. Add a check in device_open for
rpdev and update rpdev at the end of rpmsg_probe to resources are
available before applications allocate sessions.

Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..40c7fa048ba7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	fdevice = miscdev_to_fdevice(filp->private_data);
 	cctx = fdevice->cctx;
 
+	if (!cctx->rpdev)
+		return -ENODEV;
+
 	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
@@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	spin_lock_init(&data->lock);
 	idr_init(&data->ctx_idr);
 	data->domain_id = domain_id;
-	data->rpdev = rpdev;
 
 	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
 	if (err)
 		goto populate_error;
 
+	data->rpdev = rpdev;
+
 	return 0;
 
 populate_error:
-- 
2.34.1

