Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM+yDC0PrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D522B7E4
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2984B10E421;
	Sat,  7 Mar 2026 11:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWGB27ll";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4iV37v4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B4110E421
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:42:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6276sspV3325976
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=; b=hWGB27lloBw/FEY7
 X7EQ/4+iRmGn/GWkMXJJkGZLiLCOaaJgDaZMRJN0RYOpZ+mE2U1nrikwHPZBmQ/Q
 MAnHck7YCQg3HMvgfsCTkiBwywFyMkaijDodxWAWHEBoHkF5BdLL3FKp3O6lU/4I
 b3lG+MjcjDU9MKixMHZLksg9kD+nEkJtSaq3/YzjNaY30TYte4XM6KlXgWO5A8/u
 1smd54gyxHbwSnRNxFJRVsoP8BCIbrhAV8+aFvvFQlHW80suvZVsFSIwcJHk7SCc
 nVAWYvwJh08ThDiARVyImfSzXNLAr10J/fa/NeuY2Y0+p3SDa3ZZb8em2Uxl17l6
 38rtSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3v8pyp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:42:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ae65d5cc57so210053215ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883752; x=1773488552;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=;
 b=S4iV37v4+RhN7wwdtEHDGVQdX/vjrFPcRbtoTipV6AdxQXlhXSCsTMvgMZPkJosi9i
 NPnV9vfkRSeTwfOT0fKmmzTKUcjtQNP7+2eSUGooc6IP8U09kItTBNbcbgVw9aiikE5K
 pBhSr90rvTFaOmOIBOGM0e1LyA0VZp83jzohgebIi0uIMk+ytT4/JQUVWDcq9ogDCz8b
 bpZLNGsgHxT8spO7Z+2aZAx75OKDCvx+4/81FQIZ+E9QaFF+/akjZfeonrtKqfquA50o
 PQQYIRLFNtmAkXu3DF0lNGqUsQS3vom/pYi/HcFqEh0oJJkZ9/kv6+ooFsRUnSNyHy8D
 zEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883752; x=1773488552;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x1pj+ok54ZPuMkS+PNjBXQIJn7FjoPSNgDGNG77A/LU=;
 b=Flmik74N93P1FdWz7NVI8aHyIJV9Rk4IUlOefTyQtv0Jti0voNBTKqSdA4VnsccLS+
 7PEjBrc0xjFyea8Sj5l8IU0FHPUt25lrYZHd0zu8g9bVON6lJ1q+nOoUxDfIDNK9Mkd+
 kROc/+RiKKulNgNRlCHkZPgXUQ0AlS9dvXrcYfcx1pog1xVq/NSMMhxrIGYnpBEXoVxi
 nrwCQJAMv+HcgQY8d+eRxC0mQy3qge5IWc7ebW7etMpyE74ABnr8DIKXj6aoxua77U5Q
 WVo43R6WnQnYoG4dw+VPJAp9kUJYXxvGn2sp+iEUXlVbmpCgLo7aDwHyNWqq06lfQq0Z
 /qDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRzhu+VyZdTFmfNDU1Oizz3zazRXig7RyBULbt/Yh83y+nXn9kdHtVZc5844OXLLfFBvT9Gxm19HE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEtREPLYXbafkeeB/jyNWmVWbi6nmX9onAy/nDY4mFf5hqymbV
 KWIy3HAjRM2hvV9rPqFt6AWRMfT1zm4rmTJG6zIMLdMRXESWkXxCqfSfqGkoGySLirWnqorHmpU
 3kqcS9CGfQafFJpPyoGCDAgE651nIfqayLoQQSV68MtmJUvdxa6bqN8DEOdCecB4bmWuBAkQ=
X-Gm-Gg: ATEYQzyBFc/Cn80kKsgWqQZArFVR7JSYBQHqS/RJSs7m9Ihk9vCdririnL+06+Qo/5Z
 rC/Lw08NYnNcwdyLBgQ2wucmduiV9Oe5jUwEKBeMlxK/HcI7lkF/4ld5OXuf2T3drAl7N/0/AaX
 mC1iv7yC6dy4RtjDyQshRat7RCfXusFUCZy5dYzQPOTAobTlpfJ4qvCC3CVJc/KtrpHFgUQ4fDH
 v3DJsL5D/OlXQYXOoJB6arQsJcpg/GnngMRrHdPLCsTc5UJov2DWNeCYfsS4c+9vcUCQAiiO7Ui
 gv3akGDglQHvzxszhbNpJ22IR10YPAGfrKznSasQ/24PV/Dmf/FMeBOGeLo7gM8ced9RwCwSBht
 7Nbsq23K0VTgNlWHh54BhoIq+NLzZUuDfpfJVqiU88nMTl5ZMnks=
X-Received: by 2002:a17:902:e74f:b0:2ae:4ad5:b76a with SMTP id
 d9443c01a7336-2ae823a246bmr55867995ad.21.1772883752157; 
 Sat, 07 Mar 2026 03:42:32 -0800 (PST)
X-Received: by 2002:a17:902:e74f:b0:2ae:4ad5:b76a with SMTP id
 d9443c01a7336-2ae823a246bmr55867845ad.21.1772883751723; 
 Sat, 07 Mar 2026 03:42:31 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:42:31 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:29 +0530
Subject: [PATCH v2 8/9] bus: mhi: Expose DDR training data via controller sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-8-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=RC4ivP66A8RUn2mgY5duP+YJn6Z5mWCRkIxORYBNQHw=;
 b=WTCK3v2dWMuJgvV+WvtdUdlEGdN9Q3tZgllxtaV70N5KpZhm5jlgTO4F899UDqqR4f5zYYf9T
 1QqtJ9iX5efCi7+fx9C1L6G4XBCBD3USOrXwifUqcHoRjDxe0fTw67n
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: P-FcqagSQBFKdv3bqtmnq0imyj1Wwhf3
X-Proofpoint-GUID: P-FcqagSQBFKdv3bqtmnq0imyj1Wwhf3
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ac0f29 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOSBTYWx0ZWRfX2CcEyBeABX4L
 VWwznRmFocpEPyn7gFOhWuyEwVW0kqAJt9rypAN1OnNLCv4Up5EwhgRk794SgaHpaQ8UNV2DAY0
 zZ6kOG/7wbgGpFzCwCHsjZEp3Lme+JGuUpNi4qUWOhdPhty0a7OXA2RzP8QI/9dzvWN7qJzVB+Z
 ZQF9bxaPzp1MXZXQBc9n95ltFiSzV4tHENmgNgeiOjsenWXEhq19LN96iDDT/I2AgynTOEJnbca
 5Q7ADZ8vZgGkgcX7lh3GCyIYZCVO33qdsINUE+xW6/lq3BXK8yrnNtnYyE5EsflnP20kst191qK
 kmOUuVfOpT3xr+irucFYAKsrBIl8oL7c4S11RxrkSAx+QFtu8iDFM3Ry0WPh9eeYDFQ25/KM74s
 WrajgMIl5qBxxo3D9KS+EM5x0n0jNwjAQJ+SSYsX70MUo0kwdHTKQHNqUyBJ0dY4ILWMXkMZEbN
 RlOZQi894k2fpvfL/8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070109
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
X-Rspamd-Queue-Id: D80D522B7E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device. The sysfs file is created under
the controller node, allowing userspace to read the training data even
after the sahara channel device has been removed.

The sysfs attribute reads directly from controller-scoped storage and
relies on device managed resources for cleanup when the controller
device is destroyed. No explicit sysfs removal is required, avoiding
lifetime dependencies on the Sahara channel device.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 1eea93384724f559f3b6b78cb6a6e9a77cd5de6b..147bbe20c768198851ce78b9ea36867c554867be 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -404,6 +404,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_ctrl_trng_data *ct;
+	size_t available;
+
+	ct = sahara_ctrl_trng_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+
+static const struct bin_attribute ddr_training_data_attr = {
+	.attr = {
+		.name = "ddr_training_data",
+		.mode = 0444,
+	},
+	.read = ddr_training_data_read,
+};
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &ddr_training_data_attr);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &ddr_training_data_attr);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &ddr_training_data_attr);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1249,6 +1316,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

