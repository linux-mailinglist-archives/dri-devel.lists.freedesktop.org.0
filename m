Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HOPEcYOkmlLqAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB113F5DB
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 19:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAD210E373;
	Sun, 15 Feb 2026 18:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyNm6z+3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V10OF1nE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285AD10E373
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61FIBDfE2368691
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=dgIREKXxj6b
 F+RK+0EKrSCsOy0Evz93lE4MQnPBprCM=; b=GyNm6z+3I0pB2OU0aKhe0aSTdQT
 HTxBeG08B5yKu37p+ohkm8k7DwfncUn30Xhiv5u82zMbEi9MGbV/QkwghlCkFBBW
 SRy7kUfI1TXKM+Dp3aEOlp6Q60EoMNvnvJPjLkUWutnuS0WSLRQ0CaIqjMnj0ZMu
 raTpAhosaFg5btRJQDhkcpcQSY3762iPdAM2Dt0whLRNY7N0bNrDzFO1pDCDLulF
 V9vib4AjbW7/Vxf2jz3DmHpaZvJL7M3KOuMufPj/q8QWz8Ta1zNa8VOD8wUN6pjF
 l7mOPC3Xh7QmZmuC6PY3pDcOstRucw8nTc1sQHT4vcxbOwBF3ptn9cgg0XA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcjkhx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 18:21:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-352e6fcd72dso7765747a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771179713; x=1771784513;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgIREKXxj6bF+RK+0EKrSCsOy0Evz93lE4MQnPBprCM=;
 b=V10OF1nEPA8Mba6xye6VOKpxakOb0RtQCL/Pt1zN89nK9KdsqXDRdwzKpfGcb5ZAf2
 r2vyyVzqBM8z2J9k7SYXxZizcyTyR7fChDjs86wBG3PxREjG2mK6FrSzeg7o47On8INa
 pvWlk9ExAuY38Jjrf6Zf8qm4iNrqPi5A49DU653ltPSaG//DuboVZhiME6G6m5LuRdJX
 A3IMr3aBosGPklHkIiE5mga/gWqGFIdokoojlMTif8QCxmnMmErkl7eoe04trJvCjb9F
 zQUM/nx1A4xpFYThnWIyKB1KGg085IdmrCJT4jaWu/HMW67gy9XCAoVmSOt8PV5+VPzX
 C5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771179713; x=1771784513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dgIREKXxj6bF+RK+0EKrSCsOy0Evz93lE4MQnPBprCM=;
 b=qgCK56bvCwBQNiyONCzt2DSS2lx75T3nhgQD+UiRelN8TfXoMbhK4MGKKBD7F8DHzB
 yVpkFAoAXZn1Qr6FShnnpVe1uLRHaMe4tDmoAb+Zog2Tv56pyk2jMmQctjdm76qx2zfA
 GUqtWty9BMgg+CFACeain/7x/1oMudlck8Q9jgTGWDrLIfcc+A0JOEttxxjBxqTOUd9x
 iu9gtrkU5PDh3wDy9eKqymTdtochftYXJVAgv8RumtbH7xACZHUeLOMomgdmRi8o901y
 TSQT4io5MLgBywP0buIa4nIxcGWf9LD880nWHYSvcH2SSWjUw4h2UeXDPbaDEVdvckw8
 CAuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULZ7WNxb/TDXJr/YIC2ccjU4OaqZjar/MqngUnQc0c82fSlRJO/HxUI9J4qqbyoA7rdck9xO9HQUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhffkL8OIaTVC0F6e+MGsBmxf9ookeJ0nRzYB8FDdxToRDaSw1
 LWgPPKdq51iSMTwNBvjBzAUFAtobhGjs6IF3x4HbKaI9FbOpXxj4K+brkM2ZrVwofZt8UXnXOu+
 8C1KLMp11dsstMSPM6KkH98OQ0ocgen1ZLoZ6An79vnlncu6KdOgdYgXAHbxEDaLS1vzGKd4=
X-Gm-Gg: AZuq6aJxns4obR6K8VbR4b9wMamaRyojGNI/2dsUXyxHoG8iUjVyIzgx7kBjJTCxoCo
 CHG5QzNsH4d6ftUPYn7dRNZ2CGwTVVCmshTVLf7vFqoLDsdx0jcxRcIHg9rx1aKvWdGIq4H64hc
 fezNHwPTUPfyDhvaUFjQ1k+iI7hJhOTvKb8YnlIlFKDnWcxGL5AcLrnH5s+JhfNHU+MFUl4fu+2
 tiwUJZq/eQ/13kF2bVHp3Bt3CNAmkTOw3ORPCpgkRa8cAj2gKYCeimKgZYIOeVuoJ508uYdztHz
 rNA5si08yx1oarCRGMril9LieYYQGobjx7RhDZTY3R/ee3diKykmMLfxBsiB6g2T9PhuJBdcKHy
 mlIEUtsqexdSIPMkc1zOLbQU/ZgqdderzVA+sDnaPwFDxH247khYAIQ==
X-Received: by 2002:a17:90b:554d:b0:34a:b1ea:6648 with SMTP id
 98e67ed59e1d1-35844819f9amr4757691a91.2.1771179713103; 
 Sun, 15 Feb 2026 10:21:53 -0800 (PST)
X-Received: by 2002:a17:90b:554d:b0:34a:b1ea:6648 with SMTP id
 98e67ed59e1d1-35844819f9amr4757678a91.2.1771179712598; 
 Sun, 15 Feb 2026 10:21:52 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35662e537desm17425381a91.4.2026.02.15.10.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 10:21:52 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v6 3/4] misc: fastrpc: Expand context ID mask for DSP polling
 mode support
Date: Sun, 15 Feb 2026 23:51:34 +0530
Message-Id: <20260215182136.3995111-4-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NCBTYWx0ZWRfXx5N6JcG/e9YW
 5/4/JJN5MnSrNYYrT+IOtPApU/w4fmbf9rl9M/vxc2AyD/saS5GvTl+pE1wZbUa13fWAVdsHLiR
 kAqeXnBAhIdAkgAWx/59kNa1O+FnJxgE4ZVe94rl+oSJuo5QCAvFYzQnJwtYVZ1IIf6DLYLwG4o
 ijN/8v0tT56SHaSlhWWVU+htzfk+55q+ceAcpF5uI+CwpOBCnNOCQUVZiDvEvoOWMM+u1KhW0ay
 pnNj+mmHwR1D4eXp5/+OuP0tTvEJoRIVrV+m1+tfZLpn24g0aV1n5zgSTC3EyXmyopU46Sh7RNO
 LUrWHe6LKizgzqU4iVNDeVMIMjtOBznqMG6BJ7ffTS9jFXC80k+ATVE/hsmlJXPlEwGn/yORtTd
 XxGKuJZ9oDbIp/UAtVi6vRppXPWe2r35tY4euE5Y/Qmyy+suwREuDQLJLcF3S+pqxq28e8WdCmW
 bG4hJLkNAnmbqFGb1fQ==
X-Proofpoint-ORIG-GUID: NtQc9clnOQB_N8_gXR9LgOPccBHEOSyV
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=69920ec1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=JTa3dIKMUYn8LlmgGFYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NtQc9clnOQB_N8_gXR9LgOPccBHEOSyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602150154
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: CCCB113F5DB
X-Rspamd-Action: no action

Current FastRPC context uses a 12-bit mask:
  [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)

This works for normal calls but fails for DSP polling mode.
Polling mode expects a 16-bit layout:
  [15:8] = context ID (8 bits)
  [7:5]  = reserved
  [4]    = async mode bit
  [3:0]  = PD type (4 bits)

If async bit (bit 4) is set, DSP disables polling. With current
mask, odd IDs can set this bit, causing DSP to skip poll updates.

Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
byte and lower byte is left for DSP flags and PD type.

Reserved bits remain unused. This change is compatible with
polling mode and does not break non-polling behavior.

Bit layout:
  [15:8] = CCCCCCCC (context ID)
  [7:5]  = xxx (reserved)
  [4]    = A (async mode)
  [3:0]  = PPPP (PD type)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 0d8d89a2e220..e935ae3776b4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -37,7 +37,7 @@
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
-#define FASTRPC_CTXID_MASK GENMASK(11, 4)
+#define FASTRPC_CTXID_MASK GENMASK(15, 8)
 #define INIT_FILELEN_MAX (2 * 1024 * 1024)
 #define INIT_FILE_NAMELEN_MAX (128)
 #define FASTRPC_DEVICE_NAME	"fastrpc"
-- 
2.34.1

