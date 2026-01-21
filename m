Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Hde8Oqv4cGnibAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:02:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D7599F2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 17:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050AF10E826;
	Wed, 21 Jan 2026 16:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxoGDr0G";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KS7F9/fJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AEC10E825
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:02:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LDWpwn2727048
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=aMdXQSvss6tWFyMGcNBPhn
 c7uNK1YRXhNFqpjDjbWyo=; b=DxoGDr0GkOfW2gIbT31Uz4ZqrMqx2/E5LGQbyM
 RumwKOKl8XAi3mebUuhlcrDRXWDNZOS4zg86xfbrczh10X16bAi/DeYJxnvPDjTW
 2NEVeNvgp61UWDbaeY5pBfWpEcMb09Nj0xY7W2COoLuJ3fQyGmRA5geanm5BOGsH
 6QqzjpJC4Um8ZTypX72LqL4oJF+3g3IVeFeSHPgNL9GmT7BlrJAo30PWvR1B9r4U
 20YaugDfvhM8DN1FW9NT7noOwpZ7a1eJI7P5VlD+Xt0qHKMYSQR3zJyFCjg37yVR
 gNs/kwNV72K01edCnY1p3sFuZycL1olbFIM6Py/J2KqoxJow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btysfrhdy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 16:02:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34e70e2e363so24493a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769011365; x=1769616165;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
 b=KS7F9/fJScT0cIu0VMKBGJ9HoTfeW3cnFIrM3oVS/pp4naPIF4Hb4OG+B/+M0M9r6x
 YUu4WHrn2zyC/rhHuANtNgDEPdYJs9zozmX/VWGCFGISTdpXHCVMJBCHCGdDBDxn65ep
 q7m9WSpC6uSv8sozfiVsfc1QI/ugofuzAWRf57FIsnbPNfhgBFV6jNvNBw95BPp4WkwI
 lGFXYgA775OMxTFP7nhXSL7IKFN8DmtQ9XioCaDUEWolGV7+GwXXsaZyRFnmShAtuC8s
 DVBYto44k+4x9CgjOImzidHoJuaKj+2UZhQYam5Lnd6V3fAfdDmMWT4Ss8glhKEz4+4E
 2d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769011365; x=1769616165;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
 b=TI0qa/WDZzVsCUvgHAN+cvrrGICdAjon4imHcjQ6bNw4+rPZSRnMP9UOnwBBoia3Xu
 fowEgonWFPjnkHP4ytaJMIBwupQs3kNsNHunED3LsfFFKKzL3ogT9ADgquQ+9SIWs1Vf
 4h2ck8BDyn9wVjB5nIe9kbM4+dZoCSogEAij5M9YVqRDOBukN5FdtVvvkLjTuIWyLLJx
 jDadfAqLJAHoGC1BzZSjsN4zXNf6Oa15EWvk5mEkOeu0GpOHSH8LugVgAWHd39Bndouw
 n+pFCWOm5zjqCShO4e6PZO8pY0TRFP+ZEDJBLVKks0sh/+qGTGjc+yQWj8FkU+Objq5R
 67bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXabPCKZZVmSuV0DS+iidwcuxY5kYHn+da2KivBX7DAglusPRLfN10jh1sIeByzeaZNn8h5oSDf71Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ//sYuLTSvSwWFPKvAmcABRBEOqZjWiKq0Ar/it2TPfwE1NqP
 fIf7isMMfWOUOQ3JTGfPA2UtrwQhrYMPa0EDcS6QW3ETUN/nEvHfRlBVMen8TnWZ46QoUefF8E6
 8cmwzj4TNZ/QDZEj/eC8A4JJrtvLV7ncabcq7tqb/Gsmnb4gWM9cCvdW++/XUi8o6LsH3ll8=
X-Gm-Gg: AZuq6aI6R2iVs5q9zFKp3tufWPsClAU4q6WrSjabwSQyz8LZyNj48wAvWE69sohbLvU
 BynrFMXb/0rqrmY8wuVS3BbqJxi+UVFuNynFzuVCgn3+dsU3PJ9LtX/w9hkDGlICgRbreCNFquS
 p7pERM/v7wpJY8lOOl3qsi5XrlrHF4yEOByjtReKUcj5+0YIliGh5YMI+yhvB4ylKiBVQgIP6ef
 bCWB7sCqtJTNX8s8PcZVQkBBgcm2DHjnyVQ2hhsuoWCbIDvyv2WKwdhBR7nVO1Ou318Nt4adGhP
 ySDD5kpvxBiQuwv0uhAdNDCAzAcRPHPC9Xn6g91xQEk23aHrH/+edlGxQZ7JHfZN+Xs6fePsnvJ
 XH6foHdomgPKI7uPmIc7dMXb+Gn+6mn6Tbw==
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id
 98e67ed59e1d1-352d59a0c07mr3968692a91.19.1769011364545; 
 Wed, 21 Jan 2026 08:02:44 -0800 (PST)
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id
 98e67ed59e1d1-352d59a0c07mr3968652a91.19.1769011363854; 
 Wed, 21 Jan 2026 08:02:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-353032f5e46sm1123495a91.7.2026.01.21.08.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 08:02:43 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 21:31:57 +0530
Subject: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHT4cGkC/3XQzY6DIBQF4FcxrIeWH63aVd9jMguES0tmEAtq2
 jS+e281mXRBF5AcyP044UESRAeJHIsHiTC75EKPofoqiL6o/gzUGcxEMFGxVrT0V6le0fMw0TQ
 NQ4gj5dwIrhuruNEE54YI1t1W8/tnyxGuE9Ljdkg6lYDq4L0bj0UEH/Bib6KnPvk9LtrDbSSv2
 YtLY4j3td7M1+GtiWSZJjOnjNaykqxjNWNgTiGl3XVSf6/Hdrit6Cz+Ic55FhIIdWB5o7SpoC0
 /QPIdKnOQRKgVkjFdA/6R/QCV71CTg0qEmgNA10ArbXfIQMuyPAHCiVk30AEAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769011355; l=1710;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PaTkkbTLymilZT5IHeccGXhs5FbYXmRp0kXnIdLl+/0=;
 b=rXu9YJKS9ujSb5yaEUR2l2aYorjvlsWV7pynHqrZWZahhpAS72Vx7fVtv4Qe6+d7fBolYwErJ
 VKSvfw4oiHkCxTeAcGIyxWG23AW5Gb6Kk9n8pIY61s6/gq+UvyO+cuO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=N8Ik1m9B c=1 sm=1 tr=0 ts=6970f8a6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dVXzBuOjJOJ3YG4SI_cA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: p9MdapW95H-cBLtIHMdjGmMDBCFy11JP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEzNSBTYWx0ZWRfXy4KH/2zL0Axe
 KgDnkmiuXZ/N6ERQumtvu9Fmp6JJim9BusrK1atP2FBVr6FZYUCGvcKmIFMUO8eN8yW4IhbA31D
 2ghdSzHvegYL0wu0vvwcuHWOIvoPiTnm0ChXwhu0Jaz5ur4Ms7bslGuna9Rxhz2mKOxx2WlGxe4
 B93AQWZjAojoA5AFd4hy2qhsuXOUwOxQorl30zHWfiE1aJKhcFdlzyHC5NMeYhkmZyHLohVIEEP
 xAqhToOONPhebCp9hzKEyhhnHGWKUsBzbCCTaQtVLJZjG6DZ9OC+u15LPq8d5oQCVsxH5yq7ZKY
 ywpDp2M8yR26oAjfDBvoR5k7BO1bATc72hBtY2E+FjDAwn3CktznlX43b5XlBT9aN7QFyJ9Jr0i
 9KWsfTuGzNkbLVsX94LYuMYNg0Fj0ucIx0MIbNeBXN/qGtUE4clpftxMPJxsb3rHhF8jxW9nZ9R
 /eM+7nj5V8r9VFlH5sg==
X-Proofpoint-ORIG-GUID: p9MdapW95H-cBLtIHMdjGmMDBCFy11JP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210135
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:sean@poorly.run,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:jordan@cosmicpenguin.net,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:cwabbott0@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,cosmicpenguin.net,arm.com,8bytes.org,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A49D7599F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
<< Trimmed the cover letter since b4 folds it into the single patch >>

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

The single pending patch in this series in now ready to pick up into
the msm-next.
---
Changes in v5:
- Dropped merged patches
- Rebased on top of msm-next tip
- Link to v4: https://lore.kernel.org/r/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

---
base-commit: f185076da44c774241a16a82a7773ece3c1c607b
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

