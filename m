Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CASID7dpmnRXwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DBF1EFDEA
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 14:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC6D10E7F4;
	Tue,  3 Mar 2026 13:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe07HqQN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHnSrkxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817B010E7C8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 13:08:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239n6wt582390
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 13:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=g4Kutmg5lRIANp4+yyxijt
 cO0qKcnRuRjkj0Wl0IrvI=; b=pe07HqQNa2UciCKY6LghMPMSdwbYSjmFbdnEz5
 ill21V6mOVAbhi8ZlmYPEgZd1FX5Bpa3SQLh9OjQsCxjeEdG3xwRAd5rgzIegGK6
 ID3YJLh4wa5fuc/JK9ItWSozAyFUzS6obtnEComx1KvqHHEo/XwRpmk7dW7Qmz46
 +6jySpyqu9TXvlxOPdXyeUNL1ItuhkFtnCcML4IM+2HxJIEHDrfF0dirXxt0gKna
 9hkWczeypoNHMGvDmb6g4fy+Yai461w9356CRI0eW49uVJwTYrZT0KLQrk6pHPJl
 UjZ53WlXLXAXjS7W4xwIx9KPGaFWQLhtVCyF8MzCNBqsU3TA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6ub0q7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 13:08:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70ab7f67fso6272810185a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 05:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772543288; x=1773148088;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g4Kutmg5lRIANp4+yyxijtcO0qKcnRuRjkj0Wl0IrvI=;
 b=LHnSrkxUTQ99pxT3B7Evcy0zzln4Y86+QsZSB2HQVTHvXiR/bsJDgR65wpEIsqoXnA
 1T6BC0r02GRYWmJrx6V5G7pnUaR79XfqFZ40Kv5Wi9BJnytogebDZovNBhldy8O4gcfr
 /0+12jKAvZ6/uj6G67ckOAWx9Cqrvl8maA/3rl1wXbl/Fm8nunxHFDM4Nq5o8vwwmOre
 hOHzn/VHQyLrNoiI89B6CKxqSh8iB9KHXhJCrAnSdA1Du3Coa8H3AVbblKTjsIcfqh3Y
 BEI0GIIvQxx3cTkWdpiKdXUhpG7S2tPJkOqIJFjk/ppZCQuDzvxv7xr+jZW/gLoSb68m
 u4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772543288; x=1773148088;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4Kutmg5lRIANp4+yyxijtcO0qKcnRuRjkj0Wl0IrvI=;
 b=Y3o3t2EzHKcjVOA0YDajanSB2FfBW1dH5QyPm7wvXBLYc1vwnsQ9NXDUbuiCO8wl4T
 E8ES63BjS8Lyz/CBxJFaKwPhNlUsF0EKHv/VEkFBZj1I77C73BpCjAFbn9+bdp3atM5e
 aVAPO9tTY/N5axCvOelEBGHtw4WqsX+NXPAUzzJsQFsY1FuLormOJ0Xx8rR/aRDniiCV
 a9PwNR/bgne5eMpynZnwd/RyD8kz+nWmuY3WW9oQ4fHvJnTzQMy3HicDXjVgdZp58z+P
 ApNPq0PsxB8AGAau0AuTuD8jJATql9x6vk57r1uzCgrFjsv+hPdFltj23Tm3fAV8tSMC
 sFxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh4Hcwww8KeB8VuwCDMuVAyaSOGx+FK9Tx6UxADbR8aNpirAFcLk97B956krwcos4Xj1JYAo+7ZM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkJFuM0V7uV9Yl47s9wl1RohEmLd1hcI/zR0/63I1gtESFKEBg
 9d83J9PlX9yIm0XiTj1M+2ko0dvZjdlKFLy8AWRr/qixhFJZh56gLzzhd9HUQAQyRBp2GNyOhaX
 h/+BKv/lUPVh8SuPjIuKfzoKkjuSPhGSsm175ceWYXRnDPAVYt1K6+hRJqC2obELmc8MG3Q8=
X-Gm-Gg: ATEYQzzan5W821geErw7FZ8zwbaQf27E32jXq74PGjM49FJzzPo3uBL+/vElLidsVv+
 1z8b3KXT1OsfzxVW6okykjTKhuFMFK7OeB4ZqDPaBOgXRlbeGS7a8vVf7SPgkgJN18EanTChAE7
 S5x85UtExfQW1Wi8+0rwJMmwPmz9MqCtN/BUxHvmYCWrQJ5mf8DlU2n1gjxq9TMKwu7XSLmpzIm
 uyvI+frq/HDDe2M3ZHTzrrnwDSl+lWAK3LNH/DsUaxel4hxIsMKKOUH2U/YD8UqD1ukECmXm1mL
 fSAdtawRq37TuMQVRJ0cHEQgM4yrZb7dryTmjUxmi9Bv4XPf8AM59f3BKXE2dMVQdClyyCKGELW
 lLAwFSySTjzY35QHuZljLB8iOO+XnPM8u0SCxj8+C0eaU
X-Received: by 2002:a05:620a:2947:b0:8cb:4d64:e993 with SMTP id
 af79cd13be357-8cbc8dee816mr2008931585a.26.1772543287663; 
 Tue, 03 Mar 2026 05:08:07 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8cb:4d64:e993 with SMTP id
 af79cd13be357-8cbc8dee816mr2008926785a.26.1772543287151; 
 Tue, 03 Mar 2026 05:08:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 05:08:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Tue, 03 Mar 2026 14:07:50 +0100
Message-Id: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbdpmkC/x3MTQqAIBBA4avIrBvwJ4K6SrQQnWqgTBSiku6et
 PwW7xXIlJgyDKJAopMzH6FCNQLcasNCyL4atNSdNFKjTzt6znGzN9LGj8XOtLNXzjjVG6hdTDT
 z9T/H6X0/h6HS9mMAAAA=
X-Change-ID: 20260302-drm-display-eliza-634fd1c3c193
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P0K3emV+On7DoMLPrHK64H4lAgpvQAJ3yzHS2N5UrHQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0ofAEfP+L1dNySRo+06D2fL14cpcc+HF1HZ
 Iq0dJpSQZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdKAAKCRDBN2bmhouD
 18ujEACNIKsAtfofeHyTp1tCc1koMc+t8CwDIQTfCHrORdq6AJ9xs6ec9xWTlp7VB+ubXXWsHDF
 g/nJrLwcVfKpMu0KQrpMZPGHh6zzczwwydnLX93ES0tYn/0OgSxpadqmdsz8jXl+MwNAmEN64oM
 Er3L0a7RTSjy8GeiUOfOMVloB2M1e9sl6AY2mEkLLtjKsRXHzem19Y16gZ7a/nOb0ZNmM/og5Y6
 32kJT34pXKLSTj116HCBAqfOnO4c26nq9uevmiBjq+ZLEduQS7roZFaNpZxcIi168SZbN7b5i9z
 iifhMWlOI2TDMeHJfLLZywUttqh2UtkitXlg894ZAlfOzYRHSr5wf9lWrGjMh6/b4j0R/azBPIm
 v6KhDroIAXwnV4+LvGyZbD1HPC21aZFz+SNHK0SgeG8Bm1q2RkpxefYoYnJ4MDt/lYoz+jYxwlw
 NYrUuXvTE50XT4J6nYaVbBqZVYDONMiDVM+4tlFQ3TByCGe+wbSWC3ByW5wHJ2QudPsrkamWwBR
 icifpQOZ1xEs3se132RFcIVpbe3RON9kHvdbVCIOkhXu78lW3lFUQ+WUlakRTi9veWizXmjD7wZ
 mV3yb4gF4GCXwCM3mMYPzk94gZgq1EiSSFz3fANls5g+FzVtjXSnO+mfXGVOusnhoKnKS3SxfBO
 7GK+4berNVPUaZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX984T1qArTxKR
 XE/+E/42mFOpFFMEXsqBu8+lUiphm2sxYoUii/05b9O/Uvqmy2BE+nNh95zm/ZOV3n7j2eon0M0
 xLivSLl2i4EN5KiwfWaKnIMKll9WGV2uo1sk7tjev5waStXQlAClXGVj/OSG24nlTx84rXn4GWW
 7+FOp1qWFEAqTEPb4N8QACHOsP4BJrFGwWFehk5KnRPtUAqItalzEQkorksUEu935hBcdtpEuzZ
 z/Id9eOC2s1ub0G+yjPM3+Qc9Eo7s6XkAJReumEj9Vn012cjh7v8xrV+fyNB0QJskjnpFRVxGb6
 lAagIBvWXuZY+bmdZnePkOB+64cMSv8ZLHprxGJ6A3vIDlX6dytKmRX7gG1vxd6Aq4cpkk+zv+/
 PRig3IuapWRwwT9g9mFrtNzvtHMcJcNYDBQLu9OAnqifheoGToa8pprLy9WcHZOwzgG3+UrTLXM
 JzAlJxIEfgRH3HxGTUw==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a6dd38 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Ji9SQXcMXxRat5kPLT8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IJy8XHs_xeEiQ4HUbzXWoeb7ur3oT7a0
X-Proofpoint-GUID: IJy8XHs_xeEiQ4HUbzXWoeb7ur3oT7a0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
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
X-Rspamd-Queue-Id: D9DBF1EFDEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

The MDSS on Eliza SoC is evolution of one in SM8750, with several blocks
removed and added HDMI.

This posting brings working and tested DSI panel, while DP on USB was
not yet tested and HDMI was not prepared.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      dt-bindings: display/msm: dp-controller: Add Eliza SoC
      dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      soc: qcom: ubwc: Add configuration Eliza SoC
      drm/msm/dpu: Add support for Eliza SoC
      drm/msm/mdss: Add support for Eliza SoC

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   4 +
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 496 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 11 files changed, 876 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260302-drm-display-eliza-634fd1c3c193

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

