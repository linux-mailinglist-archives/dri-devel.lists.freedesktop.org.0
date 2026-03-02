Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A15MZ+EpWkCDAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67F1D8BB7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E2510E4C3;
	Mon,  2 Mar 2026 12:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKfCmJX8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chuxVM7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2178210E4C3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:37:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62294nFo1291543
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sO1O0HnBKgXh8P/GdR5RZbvHGAU+mD3+U6BgHrGW0lI=; b=aKfCmJX8+azn10Dl
 GgGmRQHRtOwbvTRlrqeBpR4glc6Wg3z0c8XlucLgURJsMlt2bia+FS69Ty50ue4J
 9dXNMnu/99GZeLzPMwtsn04/yB68ZrDnAy+DaWxwZxiRD4sx3DXN+ZLmnbSIUJnt
 UZNGK3fvUYMgEQKpqTrQyscy73YFZLbd+royecFcJ6/MXFWxYYTvdHblbGvOefRY
 MK5N6Q/M9Zof7fNfIn8IwepXv6EI2a8mN/zcFNfOVqyLkjlAUOiHZK3qszH/XolO
 2zHyWSNrUhiKsH01TCYmH89vhVTgu5w9r4xq98OLg+xg8BVj+XLl+s0g3blHar9H
 qfQPNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku0pkr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:37:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cb50dfd542so414850685a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455066; x=1773059866;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sO1O0HnBKgXh8P/GdR5RZbvHGAU+mD3+U6BgHrGW0lI=;
 b=chuxVM7PCXg2NJWf7MncGvHB2bgGBwKjd+weEhmP9YTdsjOTAQjpq5PPnEaBi95Lvg
 nsBioDCNT+z+4Qx4/a/FYW+h8FGIJpIVxsk9Tacp1UsT5oAWvR78P+hNJCmXPj19vyoV
 RojQrb2jS5IQNS11hIMJOsy5HbhXarx2CwoLpR3D+5e2xURZHjr6qn3o0aVSUZOe5SkM
 AzMA2VopgSHICrIA6X8X2HhmYbxIo+1iuLKWhB0SK7ni3A5noabb66NPBRq4py9VCUBy
 7rsDNlsEXSTv8SOvb+gT8VBjnL//w9ve9vath5R6E6sxDOOrZT7JI4e8PfjBdtSGYaET
 px8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455066; x=1773059866;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sO1O0HnBKgXh8P/GdR5RZbvHGAU+mD3+U6BgHrGW0lI=;
 b=HJ1AzCNzKnzOcJGiMs00X+H1mo8Yq1stmhUrVXcE6nZlUfDbpB/+EcUB9llsxYYKMa
 pLcnj1qYANd2toBz7CKij6U8XhADrhY8UaIznFxFXQVxyHwK0TUkQqEMhJK/dYaa4Cb9
 s6YuOuhZ0I07zqTj26UAo8RCfkad1KaZKX9//WU0kaL1ybmMkMe0JEXguwcgLD8wHI6v
 CyM3Pf6cfJMR2p3eFTMglYShkO5xey22OJFMdkRhOtxXZlQdIh+264pRszOEyqn9ARo6
 tT1n0OHz3O3glQBVPzgLR9BWEaaU2v2sgZHQpt2ePg4b8Q+HK+tzLPEUxBIYONwS78Wi
 ANeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCVlzkJYiSqQdYIgnvu5ugXGut3WOW8zs8SG+RIYGDf+WmMqE8/HDqwXEBmYmOSEfFug35vFrOOhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG1I/lw/f14Og0Z9BXqIFv8/ld0ZGGmTVHmhuI3OGCLQ6NWSES
 l9WoztBu8H7WIywcz40oy90l6Ad47jVnQPBiapSa/tIUpNgVzrGDpQEU4BdJ71G3y5EiUmfW7gB
 dz4nEoDkiPyblsKiUpzRbgkumhrhl9oa3+fzbweQJhc5ZyFqR15/PH5WtyBsez/uX/DUbIwk=
X-Gm-Gg: ATEYQzwHUTNZe5taMqcB2veJRYIKQFrr3X6VL1cnu6qc6NTP818gL5pSAH8j7ReiuP9
 Nh3p/v2XOJd72j/JyWYwuW3DroXA77E6wYikXZ43hfOTPSkHNsxfrg4etsaR+n3BIpgYFnATymI
 tyFzL07C7yL3zS5vYAul9fXy9jGDSL8/6EwhMJcyOm7OMf/zK6dUFZ5W2Gaguph5E8NC664Zbv+
 1fU5H7YgjK7q2iUwYp65t7lW6LxRekidmDIeE0VoYLpONYKLO62FQh6ZQaJRUPiN3kVbAE84urh
 QlpySIupWsR3GyxrFB54UbqqXRokPutcikjJTmaCWGfTyw7IHUifYFpWeM4mwGKDBBMaytGGJMl
 +pvLCN/hD/ftwNAQoXU/GJyO1ovGm2BF3hLezt28mjmF5qpl6dyqvIu3vlLShOZPGFKZf2L3DGP
 zPkrg=
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8cbc8dd163emr1220870585a.3.1772455066384; 
 Mon, 02 Mar 2026 04:37:46 -0800 (PST)
X-Received: by 2002:a05:620a:1712:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8cbc8dd163emr1220868185a.3.1772455065984; 
 Mon, 02 Mar 2026 04:37:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66003d5ca55sm1989820a12.28.2026.03.02.04.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:37:45 -0800 (PST)
Message-ID: <00ed5c99-d844-4fcf-b4f9-e883938f46fe@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <385d044c-29ef-44c2-9faa-0c306af44772@oss.qualcomm.com>
 <odvdqfomdfiyl34ftovpc4pfyrdhnol76qbufa32axpmsvvizb@c3oclvxz72am>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <odvdqfomdfiyl34ftovpc4pfyrdhnol76qbufa32axpmsvvizb@c3oclvxz72am>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a5849a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=M2fHq20qpG9OoBxEoUIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: e6seGVWXFUs8KUvbnT40VKNGASitOYUd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX9KakiNJh8RV8
 o33qqiVl9VovUZvOE+uTZrBuSuleSXSRoJnrFJbARq7LnZ+dxypzTooC89XFsViK5IYuHwKZJQ5
 4XOLi1W5Y1bDSiNAWI0iv1xnFpQD57SvoVsvUoydH6sfPNThpSouilN8MzeQ0b/mON5sQ2tKIcT
 D5o7giLZXDcC+zli1LfFWLGoM4LTmrU1PapO6+uyyNj3vKRZsOE511/WI3l1LlKFC4BrsH/LgOa
 Ud+TdCDBexM4o2euwFYhNya8yJFMzwqOH8kLiJw16SJeSN35f//5FP2npmcdnlrXTvxrqk7aEeV
 1eicvNlUo6Ep4WhqDcD22UtwADLPSWQ5kCSTRzlZGQkjWNZ7IcaaRXTIknDxIca7E4+RG8PpKyg
 ZSfh/Vo/GVl/0d81Y2NEMM2F7IB/Mj2x0H8+4aZgQEbT53/vZ9x/wwW0LanXh2UEad6gREZx8+e
 Kl1U3a8d4OjOLGQzh3w==
X-Proofpoint-ORIG-GUID: e6seGVWXFUs8KUvbnT40VKNGASitOYUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 6A67F1D8BB7
X-Rspamd-Action: no action

On 3/2/26 1:33 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 12:58:42PM +0100, Konrad Dybcio wrote:
>> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
>>> Once Konrad asked, what is the use for VBIF_NRT. Answering to his
>>> question revealed that it's not actually used by the DPU driver.
>>>
>>> There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
>>> VBIF_NRT being used only for the offscreen rotator, a separate block
>>> performing writeback operation with the optional 90 degree rotation.
>>> This block will require a separate isntance of the DPU driver, and it is
>>> not supported at this point.
>>
>> (in case someone interested is reading this - patches welcome!)
>>
>>> The only exception to that rule is MSM8996, where VBIF_NRT has also been
>>> used for outputting all writeback data. The DPU driver don't support WB
>>> on that platform and most likely will not in the close feature.
>>
>> Unfortunately, it seems that way. Fortunately, it seems like it's indeed
>> isolated to MSM8996.
>>
>> This patchset is tearing out a lot of abstraction (which would only be
>> useful for that SoC though) - if someone decides to work on it, do you
>> think this should be effectively reverted, or should the NRT VBIF be
>> instantiated in some other, more locallized way?
> 
> I think it should be added as a separate vbif_nrt, added and handled
> without touching the main catalog. The main difference point, xin_id, is
> still in place, it will be easy to add dpu_kms->vbif_nrt as a
> first-class object (instead of forcing the complexity of
> vbif[VBIF_MAX]). In such a case I'd prefer if calling code passes VBIF
> directly to dpu_vbif_set_*() functions instead of passing the index (or
> it might be easier to have a separate wrapper around those functions).
> 
> My opinion is that if something isn't applicable to 99% of cases, those
> 99% should not care about the remaining 1% usecase.

Sure, that makes sense. I wanted to make sure your opinion is put in
writing for the aforementioned "someone comes around to hack on this" case

Konrad
