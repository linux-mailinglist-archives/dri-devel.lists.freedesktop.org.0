Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLafHDIPrGkbjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B870822B7F3
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022EC10E433;
	Sat,  7 Mar 2026 11:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMLBSZCE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kkH6TNkH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A19910E430
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:42:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6276sbgv2456784
 for <dri-devel@lists.freedesktop.org>; Sat, 7 Mar 2026 11:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=MMLBSZCEODmf65KM
 WTGAu6cSZXV8zO7KcZdu1QYppchEuMAjFw9PsZaPDSObGoHSV298OjX4rRlxS31a
 ShLIjSX4e/Il5ULFHLHHdpiOO+0YTvtxszMTTF1v2IotkKKKuueLpqbJcE9pbAHW
 q0N93E2L1djGKr7yNLzYkdDgPwJYxGhSmlWn5sn9PVfOxXZFxK5bSrYiEd1sxYy4
 DvO8k2StvOjyipliFk/crY/2v/2jFHO/RTy3khQm23o8EdGHwQR5hMVfo7SoQ5vx
 +KAs/2nqUXTLOUyCE9CoL8u0YM91zUF3WkeOZi14dDXrqs8XwuLS1HFM2utOrtN/
 N7KKvA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd88nxg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 11:42:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2ae467f128fso65673315ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772883756; x=1773488556;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
 b=kkH6TNkHZpSMqVVusGZ3vk9FsEx8LIk/4BTgSJv7g41zjzVfO3S1j1NuPlT/pk8mAo
 /eoorSlj6bdMXmEmzaUIZcLUAje0tRybwLyoA/cknO6vKKufoyWYZc3M2mhcvt/P6ak6
 KYTckesCEhTN13seESgwT++dfEY8DMICiA17QATVVZaV3qDQsjdXxO0Xn/cxX//OL6WT
 5X+UmzHpWvuAaB3IfEf3RjYylfCYuQlnCRUiFDYP7kiH3ASMjb/f9fxSJnkvT2zmAU+z
 FCfAljwrDPZhYi2zwDLygP6qLGoLUe3JoWx0Yagp35dSCLx01yWbJ8U/Pb0fmaUsgQ78
 CTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772883756; x=1773488556;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
 b=pCGL5WhxOZaJzbTPViGMDuehR+1wFXK7awrB0IzXYQxZARgj6Qy+HBxuK/LqltVRb6
 w4HHIT6PnVZxGnSg0c/ufk5qK2K7kovXL8fr6uuOQcQ/gyI8gHUdwPjziAxqxxi1z5Mj
 97lWi8rBtZ+Rvn6t3qKk0eyIpDHAxIDbCuTsCMyRDQNu5e4XfSM+sxSuFAgVmxdJ/iHm
 wbabUo+BSEwPD5JfVZb/s4avYKkSFRvMixw8YJFpaIoTttD5gTyRLAmDLmvFlqLYM4xX
 fkAEEkd7bBuJ6DTKDnJRAyobrs4WOeA2uGFWFFWJ3MfxcOWPeEje09KyXfMrRV8KGI0U
 CNaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCfR8letGFXBi8PxiWxC4D33mlQsGLbwRkfKx2a++msbc6sqtAMi7R/2oLecL/r/g/Ih4g06OQjoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPViIbiVDcRA4p1hm+6mtVhGAidiubbrUJaAGInT+kuT06ml8b
 3ZMJpX4u4qBCvmIqh75yKzsU50o3N1XiwEQykx6heS6uROLjNLdoTwckOGT2hrVsAJ9mowqzP0K
 44chPwXuwv8Li9U1M4ViYfaoVzgtlPvGtX0WgpTMn6RP0gSd2hLfPk4K9TO1pfhxb7ZAnPuU=
X-Gm-Gg: ATEYQzxWI0AU9m0mqz0EjpBRqam3tNhKPbBHTLJugyYEzJtUFo2EL5WLARxL87JJvO2
 4EUgcA3kqKe6hxL8fUU0RBzWWXLBYRQZRr1EqbLDj6R9CYq3SSX7NvA9roXkOguEOoukcaB+i1x
 /3AsVLpVNLlLgTtfos10HB1iZcgrY4thRJb/bt8XCCGHYr8ldkIiL85TGUChDA00DAmb+8YBrjK
 xAt6Wwqryo9JO3/ZvSXipwbyNWPdMbceSL9gxuWWVeeQfCzjpVEY22bbJ9MfC63EN4iUCFyY1Tt
 sqlASs3i++QuhcIZKQOlDkCbC//cgxa2j2Z7pFlmEGWvlPOHVJjgDLeZrzwS4bUVb5/uuJ3sGvx
 134KD5oEa0hUZwngUdMK7igOx8s7LTjJWFMOHHsWbbYV3nHhHgCI=
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id
 d9443c01a7336-2ae8241685bmr59503365ad.2.1772883756449; 
 Sat, 07 Mar 2026 03:42:36 -0800 (PST)
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id
 d9443c01a7336-2ae8241685bmr59503205ad.2.1772883755994; 
 Sat, 07 Mar 2026 03:42:35 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:42:35 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:30 +0530
Subject: [PATCH v2 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-9-29dc748b5e9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=w+aHsVXwaMyLhL8Goe7uM28s40e002IzrEGaReObHvVofLk2hwgKkxUc87dYK5Uy5uT4SJ0v/
 IsfocM9Rc+BB12kavhO74NwlBai980rYUSUPMwBcVaAgD/rMcxEMAB+
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: 6gUkDVZEKmALEmxdOT4eI859ytSU4Aht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX6MfIssg2fPUJ
 9YAXXAuzq06BDW9Sgfrz3OB5H0OrfW6WEcXnxRgPIVICLT233TORqDij7BIygm73uLGvNMpIJ6X
 PAmtQkqHYt6AzEuW5Qc56NaA7bH5Tbqu/47Mfrute+BQjpZdJFw+Adgs17shSVlJy7AUSS+GF1v
 louJhj8dkQ+ABoUsfJ5o8fGACaq+7SUcEJX1dJe5nhVA+gEwPURTZchMACiZnXs8LBkwpiC8ZHx
 XR0Nqu9p4dFhHgSceZ1TTAhJD0b8hPL9gjvtS7BAX8FQPPP3RYYaEQiyl1uOXjThY1A8Xl48uF1
 /Bkl+Wdu/C/wZlyAJoeBsyrBgJ8Au0jx5qQVSygG2Y22TsWjdCIlY2N8Top2NIAtFdfe9BsyKs0
 9srL+Z/j+iM/hm9btDcIGkk0ueBPBR4KNGqe2a+csvhb8gZvA9puXwko+QyajJGx+nSgpyyQ4SH
 ot53W/wjgZpBUH4qBCA==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ac0f2d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6gUkDVZEKmALEmxdOT4eI859ytSU4Aht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
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
X-Rspamd-Queue-Id: B870822B7F3
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
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add ABI documentation for the DDR training data sysfs attribute exposed by
the sahara MHI driver.

The documented sysfs node provides read-only access to the DDR training
data captured during sahara command mode and exposed via the MHI
controller device. This allows userspace to read the training data and
manage it as needed outside the kernel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.

-- 
2.34.1

