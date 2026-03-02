Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDQkDzeFpWl+DAYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:40:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA81D8D13
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F1A10E4C8;
	Mon,  2 Mar 2026 12:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gmn8gQjv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+LJCTjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF810E4C8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 12:40:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622B4MnG3561536
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 12:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=; b=Gmn8gQjvPV7RgiQQ
 l/W6sb5vm9S22KpwW4+rKScxxNtlZG/MFZaPrW2RY0nowZ66MrMJWEWEU6C5IsOp
 0aXYT6MazeeXf1ueOYX3WZQJ1kQu++d5LnO7AzXOziK7EiP/7BLNkpQN2Rww4jyk
 BTm+tPeoWVMTf++FmgkRbc38D2Lu26SzLuEAQDOecnSTbA9MKcWtMkARl969w5m9
 iCLw8MUPUGdu8FY5hXvZA9be8b3kz8KZVaGwOSudHBlTyUtzJ56GFYYpSAfiy5dV
 2KOxN2L/oxu+DRC17u5zne4ePj+ZG/yZHhwnTM4biIORjISCaZKN5e3RPgctam8J
 5mhw5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv8926-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 12:40:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb485c686cso389632285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455218; x=1773060018;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=;
 b=g+LJCTjcizYynGd8axRzbJoCC5PBCU4taUk65G4W4HNhz6LcClTJ9yywWcPbDxWCDj
 InNeBfW+NaciNh419TRbP25GW3M2z6SFejwzdLwkffgLyf4Z8qLcrbuSz10n3ZFONUrM
 3rxyUeZbPj/sxEPCKNitKDllxdAFtD4BKNZymqZImIR+XDTWlS76IGW0VeH/yPkoB6dJ
 1NTBamV7LiqgXgwVbThubpQfdFw3jUkrpn8PABybwBUxCf6j5M018zXHmmDrxQOIDrzm
 WqS36vT0P+QJJ4H0jUk3YWWpwgIL4W9g5HPJE9tZcsZvzA+yoic2JG/iueNwXpwddv13
 DEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455218; x=1773060018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dag3nNDunEg9So5Os8FDwl9iPASFDaDEp7Yv9nrSbY8=;
 b=Df0qrWsGpllCEr7Jk4e/DRgcIIBVjITCy5qLH5q2MZ0oV91IS1jGnEsoHOfFaMB/fV
 wp0DZVPFcFek2m517UyztytKSr9fp4830Ye2A2KctnNeenn6JZ75Q4nQX4SyZl0WKJDv
 6PjcUKOatfpEh6PaM+v/c4GD3Cs7kinaBcDM7gHptKyYJO0b80gygZmTfwsxBsw2RnRb
 EYZbAm4P09T2FHEqb8hXSnNmbQ4ioRdqP71OM5X3DpuiYbo8foIXVw0+nz5MM4OdeE5s
 s1PTcOAE9F5L70PkMhnS5qsOkXRphOyxUa7gwEHbnjxYQ1VWfuzN3RJUG5DBArEN9ffb
 0/Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzimkDfRSzEx314Ma20lScFF8umCq85J8wDPJIedXnyKzqkoPhOZX8JS1Iod4j7Nnm2+unjgUrgAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYNpW52ppNciaH+vt/PNrISIUvSQBvaskSsNW+T/u9AKyTcyrc
 O9QwKqDlAhQ6vffXvdFw16j8IleS1gRDR3TyGHqE0NVcmrXIq1uRg7P4yeLIG3GxgbS9g1b27cW
 E8JKsMyHOCR+80gLey6llA9EujI3DikeDSuzpceBhKXfd5wrK8ZTE+WShGDnG0LDqggr2i+M=
X-Gm-Gg: ATEYQzzeGeNpAUGx0WlDE13qUiiZ2YXSksuFeCz2IZeGsulJRrZg7c26qv6sEpYSLgj
 WDA1flbXwTSeWermwlRiwVv06oh4rNNMIak6nTP/ivlx22eciTOiUPuyDdGFV4v6mF+Yev7/QCr
 B2OmKf79tR4JRqeqthtFYKl9623iTYBKbsDP0rYMx0eYfxiEYExTgrNDbAAnTGLuJpCzGxBgbEi
 eIWtNIthZ6KbnBxFX+j2L5yLoLglhW1JOGSQjNM5Km27ryT7PfWLjlyu/gJ7ZeqVdfqYwWZgUXz
 mGVIzCGGFmNaVyUgeXbRfegK6GPaAgFXRx5jFRvSVNeqwMtHM8h/qYa0CsMDbqTyO4a5uhTB2LE
 OQeK5saTfE6DPIU3jOGBXpCRakVH19et3yC1x4sVr3uOrGKA9NLrhZ74hw74kltdUTMjb666cCK
 Od0JA=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id
 af79cd13be357-8cbc8f467c1mr1192647085a.10.1772455217963; 
 Mon, 02 Mar 2026 04:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id
 af79cd13be357-8cbc8f467c1mr1192644785a.10.1772455217516; 
 Mon, 02 Mar 2026 04:40:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ac51431sm467420666b.17.2026.03.02.04.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:40:16 -0800 (PST)
Message-ID: <8a2d1157-4761-42bb-a95e-77a851d1f13e@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/msm/dpu: replace VBIF-related array with bare
 pointers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-3-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DDXw9zd6bHFA5SpqAAU40E7_Ms2O2NpA
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a58532 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5LKdAdAFkQmhlfp1ZXYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DDXw9zd6bHFA5SpqAAU40E7_Ms2O2NpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfXwcSpWIaSYF0/
 UpMIfkeipHEjh5EqP7qG6moDtksNDdSzg7GZVcDtQusU3uppjaFL4I/xT0xw5iMnhzvvQD42nwt
 8i4e643uYH12HHJpFXTFUMnHJl6dTKONgpWZ8vhenF7CtlOS4BwDWwhfwJ9XlNbUgmSkfvr7pLD
 U+Gogytsp6LgPIWnPVi36f6cIus9TfJihSgNhCIjZMn0CkVrofjve4PRerbIvp6k9Nm63wTJwMQ
 GmXAmMWpBC0w6dDM/KiymC3ZEsHQ1qAxhfY0f+/QMi19MbLieF0ticftuRpE4iwt/4Uk5gXdsxn
 kyluw2vh4nIFf9VuQGPjiBefvFvUKlD3c5JbO/1JH2rnQLv5fPLXGlit3c1jBFykYCXayslyT9j
 XpWlEl84Eff2O0yjbEto1cW2g/Fi1ZVBwXV6xP0jU6s+RMn/PTcLHopvUpgGBZw617js2nMSfB8
 RRYzFDvnbVfiDilRJiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B6DA81D8D13
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> As we no longer have multiple VBIF instances, it doesn't make sense to
> keep VBIF data as arrays. Drop the extra wrapping and keep only a single
> instance of each of the structures.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
