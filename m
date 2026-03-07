Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INEyNh8PrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B822B7B5
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A084510E354;
	Sat,  7 Mar 2026 11:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7xJadM8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJEAsO4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A358610E354
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:42:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6274mJTS1250612
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=; b=C7xJadM8gA7u/IHN
 bx4dtl1AbW/A6cZfQt6yenU7Y5LK7ekEYg6RvIcibbyRAJsImpkgbxOYbrCpYEtI
 oqevAFsv8iKFFLexOKYQXpM0l2QqJPVnGMxKl5drDuvkeEU8JmzsMOK05sNKEUq2
 o2gu92anooiqn/tSoEehm0xR8JCq8VorUHZuQc9L2t7poOhjQPaUlCv+V4V/uPv7
 jjXFo/6+6AKqyqAxjZ5hL6l3wYlpI+LTC9N37ZKyDtcL5P7shfnribCKtS/w3WtH
 mKlf2QS8mkf6Hy/qkMeCwZIXk59VMguXNHpVPmieMW48uFGtFyr/Cfrt33m/G1ph
 SY3TJQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda98j10-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:42:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ae4b96c259so69826825ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883739; x=1773488539;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
 b=KJEAsO4Fx86LymqQWacaHbLv7AR9hZNsSORnJV6GFE595Vmq9t9twt4gz09v3PE4vx
 LLQWup10GTCb/a3rH74rLtNK6sq+jtwRr6wPop+GiwQ1G8JKMsSuEfS39sp5awivg/Bq
 gYKUHuTGyzQ0tp66kqjcZXLQ8Dl8MmkJzQQ4xvPt4/lLBVo6I02uujLZmQHtx19qzKqw
 NPWRBopl64JM//4rn6jbOQcbnIhKIwd9MLLxQWgBH5KbnjLjFdSik5CVAKyG/D6liFkp
 Sc1HsbW4yJ98B9X9KKPwt+qekoUC2SpPq6wzTI8DgvV3MsEQhYkV/Xi2WKPKOl4Qx6VX
 4mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883739; x=1773488539;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
 b=cQFEsz/7JzAvxP3Fx7KvmGipLnEeGQltfRHk6bZWSQInXLhhO+FfGUwVyft1xHQI6Y
 4DZtc5NBcl9o/nAFEcSfA4/IA/egv7duIZKvuxLHrBq17qQS4eCHHlbdrC+9e72cSneT
 mge0tXZIzZwEwZKV14J+xfXHAiULBdb2s6Mp2fc16hZwUggLzIKeKpvu6xwCMw3IJ05j
 kmcQdLogOGFEG16XSClFiyTMqv4mpcIbG/2uboHBvlq3GTtcBGd6WIu4f9wCPD4Sfhln
 9KSoZHXVWzFkB8xGH/Y6vF0QtFUR3AypR6VW6b6fdIZSF0b5jutRdgpSIn9PW5W+uwPZ
 7YPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPRahOud0tPR7YDGVbXkdJy5HgdZt/sQNBOPsvEkHXCOadrzca13Ivtk8TvN3smfDp3/+c0Ioi2+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBOTFLII3Z5OG0WJ8e0WIUdI48O0+q6jgegfLeZQ6DhK9FQW3M
 kvi3DE8Wv2pdz0O/f+JJgehmHmjmLDPxh4FFJAaAyiqQgwe+exblAXoc6BVkXipzSI6SA8OLLCJ
 QF5NWQEaIHhgKKbQaDzkeanRH8cOprprILkT7TpGLR4VugSN7lX+9CdkrYvQoaQDIAGffCkg=
X-Gm-Gg: ATEYQzzHXZmjFMK7ZLYwCMaKqLswK0G3k6cVIbat5gUOjTIhqUj64fjqxQ9K5SNdDGC
 FGiHkMBRYoEXuFw2adw9gThfGfU9Q/py2TkLw7gq+qAlFe+UJw6HJFNjw3g1p8dJmE7nZyHg8tp
 gWw9dkbfKnqPwoOlSPsMTUftQnYUbhr9t/VzCxl2WVdWnESLqxHOKt01p5oLzsnwRnEGbw5tNH/
 WxzI5udD0pQRrugA2pZ0swB+PVIJH0DNbYDgPC5wDJPIElMI8MWXMI2CVGgm5q2axmWhsgtCcmx
 a5M88WlkV3+kKfYQRfiTf+otYnp/kvY+eHUYKegHUqyZFrNNtJmyH4KbWoxN+ENIQ1AerrsL8oR
 4gXv4hDUJI1gjmYT90hSiQfld7+TQtJGNo6lvnaulQU1GwDPmzHM=
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id
 d9443c01a7336-2ae75c44e3amr81895165ad.24.1772883739470; 
 Sat, 07 Mar 2026 03:42:19 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id
 d9443c01a7336-2ae75c44e3amr81894975ad.24.1772883738917; 
 Sat, 07 Mar 2026 03:42:18 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:42:18 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:26 +0530
Subject: [PATCH v2 5/9] bus: mhi: Add QDU100 firmware image table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-5-29dc748b5e9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=2740;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJFCyjoa95JiLXs7Pz6h5TcdiwCOOqlAIPqInF7ZlGw=;
 b=E0DvBMVt1yhlU2+bl19BSbFkyOv8lNtMG/XoDDP3el3kAeZ8yYxst3r6uOujsj9J/WiJJhau5
 3vsjMZdzA9YC4KOv2yPbPKP9Km3C9tjYx8vksXNq6mmqaYpJDw2zjVs
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfXy9iEfvBWw28X
 MwBXjzFnp/q0g06lF4KBBgZmA0cTKtuzOUfI66nGkVtMgZGX85imtU3U11HXMqaG41Cp4mngbo/
 Bc8VW4AOg/L7qMJjWGShlGSdc1/zQHhMFFq94QaUmBIK5LqS+in6Yo/G0qb+5RBgme235nOboqw
 7jI151uB/ZlFThfjrE/9wSJBds/56CWuBMIgVKsFk4RaJjlmHpueyz+leWlLYgUpd+OOJiU2oYv
 RKEYUgbekENehADHLRV0g+TUzUNEIDkbfwhT59gJafhfeMaHu4MjD1sQnMqSHZT2DyRTXc6ldu+
 rXCSXkojtwQCfZRyqFjTIuRoXSMXNZG5th+SKY6Rr7/dyeMQ+BD1RAJ1KToaj88k29a7KBe3UYL
 /OWsVRinITlQguMw1uN2vgpaue7TbJmXcqk0dTDmTUyzYQYP3e00nM94mQeceXmS5P3/wVAl8AE
 QHkrA+5PDO5EgSLRZBQ==
X-Proofpoint-ORIG-GUID: 0G51WRnNv2wCsnYDmosV2MH8sgG84tsH
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ac0f1c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HyzSnua-yo5JtJyIgQUA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0G51WRnNv2wCsnYDmosV2MH8sgG84tsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
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
X-Rspamd-Queue-Id: 508B822B7B5
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

Add firmware image table support for the Qualcomm QDU100 device to the
sahara protocol driver.

The QDU100 device expose the Sahara protocol directly on the SAHARA MHI
channel. Select the appropriate firmware image table based on the matched
MHI channel, allowing the driver to load QDU100 firmware images without
requiring device specific client drivers or additional registration
mechanisms.

This change integrates QDU100 support into the existing probe time
variant selection logic and does not affect the behavior of existing AIC
devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..73ae722122a35b77760a4816bc60e6607aa53455 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,37 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[43] = "qcom/qdu100/kernel_boot.elf",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
 static const struct sahara_variant sahara_variants[] = {
 	{
 		.match = "AIC100",
@@ -250,6 +281,14 @@ static const struct sahara_variant sahara_variants[] = {
 		.table_size = ARRAY_SIZE(aic200_image_table),
 		.fw_folder = "aic200",
 		.non_streaming = false,
+	},
+	{
+		.match = "SAHARA",
+		.match_is_chan = true,
+		.image_table = qdu100_image_table,
+		.table_size = ARRAY_SIZE(qdu100_image_table),
+		.fw_folder = "qdu100",
+		.non_streaming = false,
 	}
 };
 

-- 
2.34.1

