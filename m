Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAVIOLBqrmkvEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:37:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE84234462
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC6910E1E2;
	Mon,  9 Mar 2026 06:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkSgjlrX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YILFw5Mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F9210E1E2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 06:37:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6296HEgu1888903
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Mar 2026 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/
 A9Y0mA1g=; b=AkSgjlrXNbn+wUffsmmd6f+go94gDEr2bj43OEHe82/5M/iAncp
 8CGuUIrd9M1BXzqpV74ji7lobUKarCC5lnERETIdLmjj1wlGTrMp5yc42JHHMowv
 eNVV5Ts32JjrZeksTNYMAI+ovgc/+bUvhh9NfyLDjx6k2zFFpkG+qhW8NHiLQLjf
 d39rSjprax1PqUj/rRQLDSyoJrc0ZGdDZxDPoq25ceG1OthZTrpfpZYEQGgsggw1
 EQjwLP49NgZchsFWkSTe8/EeeN10LhMSsK/bpWdJoT2ZLu67axqKhI2sKopURnK0
 Nx+ziYI7HSTF10HF4LdahgpDVrzDbXlzN3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83c5g5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 06:37:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2bdf6fe90a9so10506173eec.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 23:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773038252; x=1773643052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/A9Y0mA1g=;
 b=YILFw5McuibBKRvL2rIaZ2fps0UaaJblnJ8TBT6ZvH9Az/jM7j6n5aiVzA/gRQCd6V
 cITjENDPyLe1OsNVS92PB2B12W9426+aZxDcF4PaFES7+3d9O/DkWaEWmlGTYQIaLFGl
 yNRT7hSW7vJm/0X4IRKX2hNFT32nP2TBAlB9RVwwYcwF8rfGjQ7ReFysbjCWnwB1wqXK
 NNL875Accon+GhLoSo2dSmg800h/NpHfG8DNOeFYhK7P/ykY0YcOmBeSn42YCew2FWC3
 rLCXh6/U4QB84LwdzufBQvia9az61TaKv85K9O1GbeJRDed2apzMiekL6pmUPn4E8k55
 N8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773038252; x=1773643052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75/WaeLRTgLwiigcgIHrvpYwnchz94sWj9/A9Y0mA1g=;
 b=F8UCoW1FHLxVdfRryrNrb4/hwtuCu8db+76vlwNPLlSCCExnXrmyaLPHnsf+XntxWW
 n68UIHON29+kT3OGgrybPpxds0+OjUKwxT5Ba1HdXhqRH83LwW0VLX5txXWZbn1XAJS1
 whxyniti5O8GdqKFHg5ZbDr7ktpdXU97UDWICb4BP6rOeZvXdL31I2lIp0B9J3bPBJ7y
 mdtC3y7/wy7JLv0Zjmg7TVfOipizEvAkDMCE2x2080JvYY/3Zh1ge8LPBOGkZrvzXtKS
 iH18D1fgBZm5wVmca+IQ4dg1b2yJ8RCccfJ2BVJXsDt2zPTCdKAusABFv5vWt7trWeNq
 PPtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9i3lzIVgEwA1BgmV8i6NZhT+pln5tkpP6n9CxfPtgS/kUL4stWjd0o2M8kNFBMlOeRxL73jJvgz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh8dfSQsZSOuWbS+VX1KHDs38wsUNc2YA1ws2nJsE2MLN6Xdth
 pin9GD2xhNrzTCbv9WI3H8HGoZN1hR00Yj3GDi0Vi9yWvDyTwqczXXwXDyi+R+uBpMuYWi9n2U4
 sAZPaYE7CBbghBrIl6YWHVUllHkYb79twAmwXrh0VpZSLkELH3H0cfyHJsZ9/4tnhxoDjatY=
X-Gm-Gg: ATEYQzz+hvYFREF1pA1c6JtUvmqA1LJCj8HNTzo/ceKSls6g1Tsd/yaCRwsE+75tr/V
 rwyem1DYMCu6rV0nvbYoCtcd2Zy/Gjx97ZGHt7KpNua1iUzNzT6317+2P6JJpA80ImCltNtK5b1
 02yG9vCsR/z/NdM0h4w3BLcazGsCFMND1YJqOCqORZhzoPzF7LculaM3wHL8/ym0qcqbz7zBySW
 sGxoS5EV9bBDFnSsvsdp5bfGYFlolNi99th5cVqelqw6hH+va0KxBApNLk7ZzOv+FPVgeT3/JBe
 Ah4OS/2nLP7fgk/aP6pqO3NDZ9UzQbXlxlpeQeFt0ReaRop3+3ospJVYBZ160oq915ARRkXzJaf
 vyASMyDyhkWRstRUyr6rg9w9obUn5moY0ynEtJq4snxc8KkrQol5FVUyG8DRJ1RzYgYbkRT+i
X-Received: by 2002:a05:7022:628b:b0:128:d55b:a0d0 with SMTP id
 a92af1059eb24-128d55ba213mr1040237c88.31.1773038252132; 
 Sun, 08 Mar 2026 23:37:32 -0700 (PDT)
X-Received: by 2002:a05:7022:628b:b0:128:d55b:a0d0 with SMTP id
 a92af1059eb24-128d55ba213mr1040213c88.31.1773038251559; 
 Sun, 08 Mar 2026 23:37:31 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-128c3f5a102sm8488626c88.13.2026.03.08.23.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 23:37:31 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org,
 krzk@kernel.org, abelvesa@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2] drm/msm/dpu: fix mismatch between power and frequency
Date: Mon,  9 Mar 2026 14:37:20 +0800
Message-Id: <20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ae6aad cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=kp0xKC1fNrCP_-QnSFkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1OSBTYWx0ZWRfXw74B83eqeXvS
 jTTTeC92TKkuoqQDbBYn20BAj/tbnD9VQxPVd9ExJT2AHA3Rhr8lwb4yIGu6Ra+CQsOGDfrqzvJ
 CRwKFfVIpyZkyVMeBJfnQkfTTGCSm1Td5IBaO/9kPofoM/ZKLCDn+i7Bgqk5L/VgvXbC2Ia586Y
 jzAdiaLeBUID+SRYmpWsDgXQH2cHBprSmt3RcYbqeXTUY+rVzCWwqZ8+c2h5NFjW9F08ke5KR0R
 fFO8Ro//Hlb3ncQzc6nIe8Yqk4jStc6skXbWx3L/64/gGCvDPr0y3zMok6fokZmvb8IrglyebL4
 wYq/oS7lZVtWSRE2Tr/74RME5EOvsyACG6G1spZdEcwDmTkL1IoGysiMjTqR7a1XUe1krT9Lh4p
 HLVnXElle/GefXJ6FuhKKaB3mWQdWAPUhVVAGepNyrBjWxzrBEcF0qxP586ELoDAsnxgee+ajJR
 HCDOg7yGuPOg16j6QZw==
X-Proofpoint-ORIG-GUID: gLzJ_qfT9Eki7nlM3tqn-8lp2uybrvqf
X-Proofpoint-GUID: gLzJ_qfT9Eki7nlM3tqn-8lp2uybrvqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090059
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
X-Rspamd-Queue-Id: 7FE84234462
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:abelvesa@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
the MMCX rail to MIN_SVS while the core clock frequency remains at its
original (highest) rate. When runtime resume re-enables the clock, this
may result in a mismatch between the rail voltage and the clock rate.

For example, in the DPU bind path, the sequence could be:
  cpu0: dev_sync_state -> rpmhpd_sync_state
  cpu1:                                     dpu_kms_hw_init
timeline 0 ------------------------------------------------> t

After rpmhpd_sync_state, the voltage performance is no longer guaranteed
to stay at the highest level. During dpu_kms_hw_init, calling
dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
fall to MIN_SVS while the core clock is still at its maximum frequency.
When the power is re-enabled, only the clock is enabled, leading to a
situation where the MMCX rail is at MIN_SVS but the core clock is at its
highest rate. In this state, the rail cannot sustain the clock rate,
which may cause instability or system crash.

Remove the call to dev_pm_opp_set_rate(dev, 0) from dpu_runtime_suspend
to ensure the correct vote is restored when DPU resumes.

Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 449552513997..327881056dd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1463,8 +1463,6 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
 	for (i = 0; i < dpu_kms->num_paths; i++)
-- 
2.43.0

