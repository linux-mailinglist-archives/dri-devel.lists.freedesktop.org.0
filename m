Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEk4K3uGpWkeDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:45:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0051D8F79
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090510E4D6;
	Mon,  2 Mar 2026 12:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="npojqhIX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyfGN9u5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7747610E4D5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:45:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622Cf0gO2504592
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=; b=npojqhIXjW6mWJvu
 CqyzrLQqfqS88fB99Z/tY2OnTHN6P7TdWWVMvCBDtfOpBQAN7GdkhRtkevdjjBXQ
 hgJYxA8jkGbTgZ+XX1+0MMfAV3i7RlTWe5mfCfWKZSvNLegZq+O2PJ/Tf2jOzV3w
 Q7JhoS7KpG+LAW+gBpw7zdFj+7hd8gwAboVpc9+NXAAlip16T1VrA1DP3Kwe+f4A
 6NgWB1rbmj2ofzccIVkGGEjFgmxDMg7CXd/WDQNZBZD0ln547Rh+PoNxuhCwpRSh
 /+7mprppIbYoUNGGbcAe/Sx0C2YT7+TQJ9a4EemLCQCVby6ZzHWsxB+PsLeJEfo5
 jdC6Yg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hes8yr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:45:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-895375da74bso43435006d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455543; x=1773060343;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=;
 b=hyfGN9u5Rg81L5MWxYcbxVcj5jeb5HPcxeZv5VMers08p98Kf66KaIhB+7Cfc5CwaH
 JqnwrR9Yhkx8z8WUoPso6/ZA7OFetsglhJ5eRWZN3O39UY30HAgTgsGHaunh3IkTyNSS
 4RgtTorf22wJj0w+0lP5uw3yPA3BB2bydFIfRON61zHMDLdDF4nl9ehqNmjZo2M5/3dq
 PCEywDywGIXcjMaQ2xHAMNaHTUCJTl7MlSQDGjQObeAsuSRECZObK/5IBiixaEEAux8v
 G8MtCieH+1jRhy8wacLCfXo+pLu/KCMZwiuzNBUjRXM2xKHCewWuh6+vCZ7lvAsNtR1t
 jLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455543; x=1773060343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sxr2BeEaFdYlVQi5HtJAMZPys8+ikBmZeMmfYQkWA1E=;
 b=UfsHezWpJKx6mLOY2XEIygX2t1tnjG4j9k66k4JdljfJYt7Vg8kd+cwdTfXjdn3yuB
 88qIp+20zZaDWwmuEqh948vlBjlKHUzv3CSTT1kuimzThm8/oNmR/Lh8iu0yOZgEFM5L
 g8yebgdqzHnPFamuFLEmM/T4NOW2J6T0R8iSZoYIbYI438G4AZt91q/j2jLbBmabTsGX
 6/Jx2qKl+ZfQkN+kqrVZGLWhAglvH/3XixE1OqABgGG6WfiGuASUbtp4IlCqaxEy1iHY
 RsPUhjS2gUn3oh/MjKtOC9s49BRsyCLCsO7gPy4uRi2pJ+/Dp59xzeDjbXHk5JnL5XBH
 xJrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/J7TqikNy8JqF6xgrX2zhufESlaWHExJELM5XwMWIwRlqPNby9NMjeZJ+81D+d7UCY4A/KT6c6bU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuZtl6l7g5EnVIXsUGRXwetTCEMaZF1vEpPfp06NK4XkUrH5Oj
 9m+2eTvSWFIgmk/eB3X1xBMS8rCL9wWQzyhuw6AyF/u15VckinzWGBgdCGIGdDpoCAzy+7OnotR
 lCUauVvIvlXyH/0RzDOzC5/Gyywx9sAvBJuEowCc1ysOGhnhu2oHRqqO9zuelA+h38lxYY6Xt63
 wc48s=
X-Gm-Gg: ATEYQzycHEy/C3hsgSWUdSqiYflH/0Xzm7DIUGK/BrnZzDZBObj2bX52wPDSjUDVTy/
 5q9APPMnb2a/27PdiTYfurN1yCJRry8x9W5/Oqe90NptX3uFbFuS6KC7CKBwUEE8g6nmm1YdNy3
 +SIETaiHwqVWdo5m+ybNTKxQql96iLrG4iO29LnhPzEC8/YYh72rQfSdmkGRupY65kQzyyxEHPi
 +fMGT7Sta/R4y0SBvHbYk7qLRcjETLb7A37mgnmAAdJTG1OVMsUNYXaubshcaApKlZmZwq428fU
 OoXomWqOGEZrytrE5jB4oLzkDw+Ktezyyp+wKA09BZue1g8EcXE4bW6172mp7QrZpF1l3ca9Myl
 YJea/o9SMmdoTfgGM5Xz7lZf+SjyDR8UfjJ6U1Ri8VmTbK5s58MSQDeOe8Qv6PyQ6uq6RZvYnP1
 VqCxY=
X-Received: by 2002:a05:6214:5c82:b0:896:f9ed:bea1 with SMTP id
 6a1803df08f44-899d1ec1c30mr121608026d6.7.1772455542895; 
 Mon, 02 Mar 2026 04:45:42 -0800 (PST)
X-Received: by 2002:a05:6214:5c82:b0:896:f9ed:bea1 with SMTP id
 6a1803df08f44-899d1ec1c30mr121607756d6.7.1772455542465; 
 Mon, 02 Mar 2026 04:45:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935a597d02sm468049066b.0.2026.03.02.04.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:45:41 -0800 (PST)
Message-ID: <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:45:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a58677 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TmkEJ0c5ACjQ8L-i1cIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5HQ4HvlfxlDsXeSa3guEA__cJz3Uqqrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNyBTYWx0ZWRfXz2EGgt5H6gpI
 0BsDYOEfIS80r9I1EM1qx0cNDiAPYVwVCmmkfzjniUEaXQznHuc1wg4XNP05EKE14MfW/dWyZuI
 SE0I9tmxXQ3hQtV2nlZnMwuWNssp9IEJQbvtZ7yBWOtIhJ72lt9IG3fOUQ+Q+JHhI2Q/FP1FCt7
 YCFl7VZ1KIVTM0bZpZyyCSzQG0PdE4wWtrYGETMZu/j9XDxHdKbQTaZM8mkhWCk549ijH7s16vP
 y7+QHYwPUQerIIxFiP3QHivpb+jjj3dvWAu78ym/Gq31w0N3XX53c4M7KbqheZ+X3gMnhrFkrCt
 /dsjz8/tp62nPfv9rUaku2AiU48obHC69xHSx9GsqH0ySaNb66mlfO8UgUXCtelRSFNzdLCT79I
 JKvPAn2k9MChcgFPncBCrl+FhIW3rKGO6JJgz4bO6BjBO7gfhvDEOLhZhTDKMlDowodK5hYGAvR
 pVrVE/hirxDTUWzUaOA==
X-Proofpoint-ORIG-GUID: 5HQ4HvlfxlDsXeSa3guEA__cJz3Uqqrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020107
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5C0051D8F79
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> question revealed that it's not actually used by the DPU driver.
> 
> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> VBIF_NRT being used only for the offscreen rotator, a separate block
> performing writeback operation with the optional 90 degree rotation.
> This block will require a separate isntance of the DPU driver, and it is
> not supported at this point.
> 
> The only exception to that rule is MSM8996, where VBIF_NRT has also been
> used for outputting all writeback data. The DPU driver don't support WB
> on that platform and most likely will not in the close feature.
> 
> The missing features don't match the extra complexity required to
> support two VBIF interfaces, so drop the second one and all the options
> to support it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

This leaves a trailing 'bool is_rt' in struct dpu_vbif_set_qos_params.

I'm not sure whether/if we're going to use that specific set of functions
with rotator support, but we should probably retain (and at some point
recheck) the dpu_vbif_cfg->qos_nrt_tbl data that the catalog houses

Konrad
