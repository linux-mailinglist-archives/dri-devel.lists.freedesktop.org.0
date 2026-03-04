Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJaKDJwsqGk2pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF31FFE9E
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFA410E9D1;
	Wed,  4 Mar 2026 12:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0IAgbg0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8PPOWpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118C910E9B8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 12:59:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6249swqC1213795
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 12:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Qzf5HxDIggFA/Gb2AY/ukH
 FIWaqqRzZw0bCzF+X9vzg=; b=b0IAgbg0voYqIE723owTsQGVZv+itVQ11Kjf/W
 nB+0D0IjczhgWhf31WiM5NuGdN0V5HBu6WLxgQIMZawjTmj9g5a512+eSMouSy3m
 jNTLL0FUh6mMyWahqvTyPaqwKZZp42ikOrsxHytqac6m/plzZzcRdwairR7iAWOL
 QCjFqZAtt75XKF+zlsrYHvz7tY8jUqMxdYKInqcqBWEtmfQrDK319wu5PfYbUOd6
 T5tEXiY1T8noIqiMMzyP65WjEpSeV7jrA5gO5sXmyoD6pPhJNN6ZJO3GsUpjKZFY
 InVx26NGU/x7rGIeCWEe8vcK+BhhEN6d86AogaJrRuclyBXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rgqg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:59:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb4817f3c8so3769477485a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 04:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772629141; x=1773233941;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qzf5HxDIggFA/Gb2AY/ukHFIWaqqRzZw0bCzF+X9vzg=;
 b=D8PPOWpR1UwPmPBYOB7QxpfTTCFOaPpwAYsHQ9j/MFKrxuzvYy8zN4Qi0WAr0aCFu5
 pLss8dimLK2//U1qgMOEoiEirIazrOUiC79xWtdBM3v53w3f5YphOp5JmZMLekbKVeWt
 9V6h07ULPsVIJYme04JwqPmMiisaOwvVZxfS22KzNwwvNGLXyl9+gekwFjIgEKAOI5cv
 mzgShcPFEbmaXEWm++yQDl2aOi3D2/oiAh3+zMC+ATAJ78uTo3KEreSjf+bUQYShABaN
 4Yla6BpQe8Z/3wdrRbvSc7YggZ9SvgO58JKS8s++KU7tQU8Q5jIx8tMr2dM48blJODUW
 i0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772629141; x=1773233941;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qzf5HxDIggFA/Gb2AY/ukHFIWaqqRzZw0bCzF+X9vzg=;
 b=LwBUKRhlKaN4iM/odn3CzaTBr38Je9RIx2IZAY15eN6fxFlZcTS5ZfPN6n0U3Kwl6x
 KTJnJ+INOI9fJbp3zyKTLoMC9a3nzwhkbGy4vtudAPnPdHRXrdhSQNjABmKdFY0hYa2M
 J9QyUw4XdiiEBr1zMAqy60j8VEYAd7UliqyaQUvNH5sEMtczh0SX43N78jXhjmU6khMa
 dGwSu7LipdvQthTVsSHHcjPf87b0LmSBD9sFfaNd3X+HxpxGNDwBPp53u2mIwlK1Bv9v
 IWKmMsK8L4QOJb/7DAJYgrOnzLuKWXa8JLK2GT6b8eG73/tkEDKOYcRAQbrqDztOMfVH
 /UiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3foWDvl4CXGuamrRwIQVIF9X2nY5Vste1JH4aUKChYuMUC3/iwGkqGwkO0w/c++VCWXPLF3CfpuM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1keUrA6+ehzRKgT0QHxtxfWQEeR4wf6mTH1worD5Nmn8UlXbo
 Rj4vK5ZCI3xHfarl9s7ET+2S0yiH8dIBgVIw1/wHAdpH9Kh6HSfmN//4F50pfPka43bnGsLnasV
 990cWSk8nImtVuP/nuaiwfcuNLx/NAOlPlNB8lco/orl3VuyE76j1K2GLbuTnrIAEC+/7lwnOV9
 X0a3w=
X-Gm-Gg: ATEYQzxn1IjzEmKVFU33ox2p2ev48olJa9OZftbqKk6q/cnDRJ2bmVGjlVXUTvswMK5
 6kLldHQqPezKwLfGVD1vC3rLuy2Hf1q/lMe+l5zMqF4wD1KALhLroGGS85QlR67S+ec5Y3wROEl
 /QBcFYCpfqP8d59U+/o7/+R2XJdeZElNzySC31fUo/z510xhWlzA9z3IC2eU/HGsXANZkJQQQti
 idn4ZJS95KRtd9ig0BnR1X6gznZbcnBfvYz4RE5e+lFRUpsOABCMSj91ynUc9UW5p4xvNGhqo8q
 q5nlapohzIwDZS9jyhmsOlpWDiebuAyGcPKgpPZnlPNK9y6AphzKLjw5Wa4tPM/sVo7/GZ0gi8o
 ayqEW+srd3npfjT69TYQ4Kf4o9dhtV0TEDx+x8ZktOEkk
X-Received: by 2002:a05:620a:1a03:b0:8c7:fdc:e871 with SMTP id
 af79cd13be357-8cd5af0bb04mr210373985a.34.1772629141116; 
 Wed, 04 Mar 2026 04:59:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a03:b0:8c7:fdc:e871 with SMTP id
 af79cd13be357-8cd5af0bb04mr210368785a.34.1772629140582; 
 Wed, 04 Mar 2026 04:59:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 04:58:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Wed, 04 Mar 2026 13:58:42 +0100
Message-Id: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIIsqGkC/22NwQ6CMBBEf4Xs2SXdlhD15H8YDqUtsglQbJWIp
 P9uJfHmZZI3ybzZILrALsK52CC4hSP7KYM8FGB6Pd0css0MUshaKCHRhhEtx3nQK7qB3xprVXW
 WjDJ0UpB3c3Adv3bntcncc3z4sO4XC33bn039sS2EAo9UkSTbtrLtLj7G8v7Ug/HjWOaAJqX0A
 cJCyGW5AAAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBysXkvToTg/D23q142BpNcuFOhczPliT/xNmNM82Oc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyHaMigZu1RbUT/E3DkVmWTcl4+8W9KloYLz
 gk2xj8vfoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagshwAKCRDBN2bmhouD
 1/amD/9UfgadqxYGh7cuJY5NOd7nfZRC0SsGrkdO7bbJ0Gd3/4o3OqUTSkoarmVmUecG52FCt/a
 uvrLybsaqXWaBhYUAWLpbztZ5Ildie/qJIEHrsPQf3t5pZymj3K8L2TbE96NOI7JMUSFcN9eeOd
 bcTynYDAcd6Vr3zwIteXORA1SE5RFsqRkJtVV5nueDORiddpaqkyhM9shQKGMajslXewb9SZVzB
 xrVAETLdhou2QDvmovkAH9nDiNuBsYqMB5uMs//coQuto+fZ2N7qQD/VyaicehftAJl4uEX07Ys
 FWoh9eX1zx4AhOAqOVeOFc8JhnLrKsv+vehWpAUEG4n9ad+NN6+jd7fYpClgIHkV1fJgkR2PL3u
 3Eha3RPYu+EeqLh/njJcwfIt3xkzPV2+7FxSifALV31VbwNPJXHjZdCUne7QEWLEDEh2WvPDhp7
 VmVCegvsHh7NNdlGIxjmzUfzEZbfN1mqv3j1KqY+GAgeH22XIF28X7z3gbTIL6/rSPfkUqqfANc
 bKH02lW1ig+wxU14uWkTYY7R7rMlmAeVeBz52hBz++1K8/As0B7HFaUEwroMQAiKc5NR9wuT+TT
 tGgSR+UjUG0Nv2Rc9Sfsqc99WDngBl4iwYhN99F1PwyxqpYSnIje/W90ocuxtJAWdBwX6op3OmV
 eKWFtAypzd8A2rw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: PY6uIFyZ9ONCJjpS8Jw6ztZL3FngAI0r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX7R7aMQ6WvLe1
 APUuLqBUUd+pkARLWv02UzdvSNPsXSbVXbfDhsaDqHH4Amn4Zwbzq+Y1+CChlOxEbxEGVzIGVfG
 aAhMr+94CC2K5qQNf1vhgWI+y8z5FUMDuBc235YLAPjQq6RMIONor9je3cvQWxgS44vwWquL2Yn
 e4hjhHfDk9QR5YxCvSAJA/6asr1C3GKhu6owSVErqrZaHsOCKWU9n2yt5a8WRAenmOobXLus2Cl
 VURcOiuq7OwWgIWwyL53IyeREYPRm+Mk8ds2bY1xu2Xc5L7tuOtTTLGsoJs9TOBenA+Zv0ADRBs
 L8AMle8lrboOkyAoE4CJ5IZ35H8tUV4mdvLDpOJhTA1LW5XQUgadnPqVc6WkuO+4d8/N6xJrYqM
 GQYZRLNjtwYXiv8+cx8s3+g+LWbmFTkdUUUD6jIftpt/3KVp61ci+SuQ7NO9JIXFU4XbZr6G41W
 yh9VOy6Ajc7VzW1Yiuw==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a82c95 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ji9SQXcMXxRat5kPLT8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: PY6uIFyZ9ONCJjpS8Jw6ztZL3FngAI0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040103
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
X-Rspamd-Queue-Id: D5DF31FFE9E
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Changes in v2:
- Add Rb tags.
- Changes after review - changelog per individual patches
- Link to v1: https://patch.msgid.link/20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com

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
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 494 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  11 +
 11 files changed, 884 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260302-drm-display-eliza-634fd1c3c193

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

