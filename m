Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGV3NP2+pmlDTQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:59:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889521ED359
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 11:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0089010E7A1;
	Tue,  3 Mar 2026 10:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0MPB9ik";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6RSe2SV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2429C10E796
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 10:59:05 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6239mnGN2733127
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Mar 2026 10:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=; b=Q0MPB9ikSElX2h/U
 WcFXzQkKr8VyFAKp/jvDA75uXu2sLZ4iWT0fIt0eX8XfgemnCPll9uswnFo8eTQ2
 wTqG4WIj8BzkTp/fEOeBsOZTJ+qsEF21L9y6gYgVN7GsHgCZzgIxi1rgMHu/ilHu
 61WcIlBTtHBuoXcO9yFJ898PpxWD4vPt6JWOZLxA50H42u4nhQN8LcpGfh3rlPmi
 /cCHgBtA9TqfmIA4fjvXBbrtsfj1ehBfdJLNYzsxXV0xohcNRn3fGEkbGUadQGrd
 2RmjV3lP/2xCXRTEAYHyOj53fDCOCwSfvggaDCNg2pLCR7h6KOdzE1RdTwdrjyOK
 80MGLA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe10j5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 10:59:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-899c35447f9so43958686d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772535544; x=1773140344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=;
 b=U6RSe2SVhpgaOJjrItcetVrqR1lOD42Bra2cu7wc5DiD79rB5BOcd5f9IyvWC63jjR
 oY3VP84s4kpiV55VRvW0P4hnN9oBuoKSpmjTGm1/BNfVwRogO3pAo29EnXTCuZnbqZ3i
 WV9IeeooNWaoHKrzaAabKu2xdC97rFFkB3XDJEW5GykaUGwDRpTn+8uH3znqpBtee/Xu
 1l61oRYyYnrPmdVPQbcsLkz6QiM3rys7QO+JfMTccB9kCpR5/oqkmfy6BiRJIj0YxjzV
 hoHg5f+fao9RnchKgt8jLOR9GsNbhWICPOkzeItLb7Vuurtc3kJ1j1O8mjvENsZOGrNA
 M/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772535544; x=1773140344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ky4H+RDAuV9lnhfu4+vFh1Tor51oZWRRpkphH7w+Ub8=;
 b=kEY3sTpZ7Zv2D/MniTkwp7efr+4jctxk3n+gdFr7lsMcELHoPdhVE5MotJC0N6iXec
 J0UTnW6xUzGO5hHx3i/JJckwLzQGpKRxw3WvinOVvGOI3veNjoANiMU5v6vFMm/ScrJX
 7mHAM7fUS/81vTgUZ1c9tLMRWjc1eEO7hPj8RjyP9qGY+9IUYBfo/ffh7Q6mw9pi7qh2
 IG7J+bApPsQEXvGppVd2bGc0tFVHsFJN3obouCX7ecoMlwlSkJeI38zZFrZCXqDwWo5D
 Tj+5BBxCi9SGj/1hfH8HEk2gUvdG4NLqk+XxF61YVtpkPEqJoJd5HR8ptTcKFcjEo4lk
 jU/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe10h75c0CqWIkM+FlK9OBl7Nz+oYTHXAiChRBzH3rQAGoFYuc95M6cml0ruxMKj0nCGs/aI3Wf1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyijdnpFIwre+HNZ1cRIve4z20grQRml/0E6kPqmKT5uaYKnTQ
 HKGFbtgts2R3d+VKf+vdyvGhDxJJqfXgRB3VQNFehdrNF6OialvoJC7IrSYDmcOJk0It6MnKYfC
 hDWGIUmI5XrcNKmN/qy3v2STM0LdhaKYd4p59mUtG8aQ5sBLFI1ea1pYgHKjZL8GQl8/x6e0=
X-Gm-Gg: ATEYQzyMtQI+P5lsA9PX0OiDBSN7FvFrfXDS4fZQHlNgW0OL2iXp6SVMIksjGFoj19M
 W89P7E9SuemNBLBRibsgatlDQcqB2b76rQm91ShQaFrJKnd1c3QQZZDJdCEQADV0Gzsjl6MiodT
 oZtp0lPCe67rEy2CARqtIWENNNqR5Bp++6YVTxny7R90UNmSpzbKRZTjOA45mxFIFIMWbs/aIvq
 8aImhuVgcRV/ND2n/bBHZtcpW0t/X3TJSqx1wzRmLKvqSj3QJRvqHMbhxwsnwF3NGU7TV6IkFT/
 lWGjDKSNG9avDIFg6HYIzDlByx/WjI1Z5Piv7DrydBxGqBLn8UBaB9m/8nbZ7+uedAMMQTNMajr
 jQfGQR9MenrNVbfh2IbMdd1Z9VUUHNratqHz2RzGbVE3at3qc+3bDG17DWSE0NaCOoXQ0/ClhU4
 C5ng0=
X-Received: by 2002:a05:6214:3490:b0:89a:842:32b7 with SMTP id
 6a1803df08f44-89a084234a3mr24645306d6.2.1772535543695; 
 Tue, 03 Mar 2026 02:59:03 -0800 (PST)
X-Received: by 2002:a05:6214:3490:b0:89a:842:32b7 with SMTP id
 6a1803df08f44-89a084234a3mr24645086d6.2.1772535543154; 
 Tue, 03 Mar 2026 02:59:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac546ddsm583723866b.20.2026.03.03.02.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 02:59:02 -0800 (PST)
Message-ID: <ebc0b989-369d-4535-9398-fda2fc09e5b6@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:59:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B-q5a3eZ2XZVB-QvfyL5n4suNRcy-iSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NCBTYWx0ZWRfXxPTbe77rU+Ru
 1T1jMAM8oOuCf7ucLoQjAUI5SpBv2EaMNpOb0W2vekrMNNe1Jy+L9I2QjDCFV8guTWlwS2OiylP
 c+EwQYtkHjGlAM+fNTXwq82YaGbd7psmy168IiYdQaaRubpQ3AZaTnq+1lZJm4miYZ9vbQvN0gI
 PwWONWLBZQ6JgDiWKk5lKIj8QE/xcRQ1LZjH7r90Vh05ZSib7b8vZlumWIogWMkIE3jUup3UeZ7
 6bRhXvCrUcA6WRcsEB1z5RVDCgedXRVbAly49m762loYx0RNXpZNPW8q81b21CFwVTPxZW0AEBF
 qRYdZriTb0nUv/ava4WXaiju6uyVbwMB7b8mS2YvryGUoycC2iTEs3DCfwJVm7T06lYNeFGrF+j
 eqEW6iQ/V6nNhRtpdLM3PEcqjYsMvbjbeniBPGc5p9FArg54ZwPZATE7+ccPNE5jNhtTFw3O5gN
 xgtlVbd8Fq7lOSe0glQ==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6bef8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OTa4uPH3y4hw8luG7FAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: B-q5a3eZ2XZVB-QvfyL5n4suNRcy-iSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030084
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
X-Rspamd-Queue-Id: 889521ED359
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 2/26/26 2:49 PM, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 7.1
> ---

No immediate issues on x13s + sddm + plasma-wayland

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
