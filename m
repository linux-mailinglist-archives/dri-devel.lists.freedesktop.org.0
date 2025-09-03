Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB21B419DD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 11:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536E510E127;
	Wed,  3 Sep 2025 09:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsczgInH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ADE10E127
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 09:25:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832R9E4012670
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 09:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V8xcTnmvm8vaCs5GzeHhTc9j2HG7qNwDmT3oTLQQlSE=; b=VsczgInHphxWEvck
 od5TCtrl9ghVLbLTHWdb0twQmaBhz6ybE47LtAXoOdfY9++I8DJYxKsiud5Xn55O
 vfkjfXP7jf/+n9Q6rxnluj9I9cPujwDFDSC0Pr171/rktCL7xfvGMvZpEUv/qEyo
 6Lh6EcvbFpcbMqwoCfAJRc8kPR22oA2yUuu9MYDEwZ8f90Py1i3848QbbqgrXSF/
 QjcPKVSflYpDj++vKFOvi467eEmg2eoISAXepz9skJQrqWPgB4+pLHDTLqQecBuL
 fYY4Ha8IpO7bvph/u9CawZB0Z9dbRZaG0m97e6Y77SVYnikut8A7jZ3m9sORz9FJ
 ISXUSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk92tab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 09:25:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b32eddd8a6so7236931cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 02:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891554; x=1757496354;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V8xcTnmvm8vaCs5GzeHhTc9j2HG7qNwDmT3oTLQQlSE=;
 b=xHNR0+Yo9A7KOYFuo4kU80oG8prktoKncS+zlkluo4DocAEOdVFkpp2b/0QyhT37u8
 qEUIyb9wArw3gvLlj4N0FuhtnDcdEJV6dyb347sBbzBR+Y8lSW3tbxDOqViurvBS1W60
 8UCKjAVJq0W4vOF8s6UkMNiqaBTdg8Qc3u8jtc59BHw57koHTJxu98VhT5tVpoyM7nfI
 ceHill9KLGVXm2dP4Jf/kbtEfhViBmM0acGc773E9rWIVN+KBmTLoqCvvJyDWZMyBf0d
 fTV0kmqBfw0RaxGg3Hf6INpfAeejiSGAxNb0kKqQDSTVVd7PCtZUsBtYchdqDvBryVYV
 SxLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUjboxauyjSLYHcXwOGfe21nM3MxKJ4k12S5fv4Oq8o4+lfbG3a1/80p8pn/BgMmgi4JLVYAbjeYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSR+h5+vDY37cBvOamuU+dzpOQxXxI5EN0GaIE0BE9rSZEmhTf
 NdIKSJeHNJKLZLlF9TxC+VQvu3UJZDfrPJMR7QqfSIDr6VZUOUU/Z3xSbSvzbHOG587vXeEACb/
 h0Tmet5XoL+EuhyQ0BYKOpzsh2KgRycAbI1073bh3qBiObta37qcxN/f9UcFbodwXJviNQOE=
X-Gm-Gg: ASbGncu5JYXSYsYac1YoZMjDmKOeFt7kfi3Wl/szeiaGi2cwtWGS/wHBC3DI2tKFwn1
 xlz7H8/Uu8/zAp6KTO8wKWtiMQsjX7TcnVja5/Er/lrHMyynF72JVieIJ4zh/xIJ0ujolhFuEF0
 WkafaUyxS+/s6uoy4bJ222e3fQsDR9NDZYwaI/dX3UNRSaDlXty2z7Koizqtc7NbYrkN7t0qtAC
 PITKfa0lh8FQ3liXkhqTVLhxHYqvVyLcEhAhQL0Wv8hBbmd1rNDu4DbKB2fXRROTVAhuZRcwGTF
 tLw9rxsmMxNDs5WmaOtP8SbIPHxOxCV5crwdpRM39QI5qklcbu4NX1mfDtTXf4jebyuU6Q0AcL5
 YVcXgwJP6t4ttbCQyxGPpGg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id
 d75a77b69052e-4b313dfd74dmr139717841cf.1.1756891553756; 
 Wed, 03 Sep 2025 02:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtzVlVNKODIar3OKV1Dpdt4jlT/5/HUDsUa/mjebH6AoF7OB+QsQV0PuV0R4ZhtiSsPcI5mg==
X-Received: by 2002:a05:622a:15d4:b0:4b2:d8e5:b6e3 with SMTP id
 d75a77b69052e-4b313dfd74dmr139717631cf.1.1756891553148; 
 Wed, 03 Sep 2025 02:25:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046af12536sm102654566b.100.2025.09.03.02.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 02:25:52 -0700 (PDT)
Message-ID: <b7a1b89b-54dd-4d02-afcd-0144df5a6d57@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
 <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
 <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zmaphb3douzah5m447naluu7cjrwieb36uznjb7uamblxduira@xhtklqmy22tu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _c3nNLx1POGxlH1KG4ha3V4AjvEve3Hk
X-Proofpoint-ORIG-GUID: _c3nNLx1POGxlH1KG4ha3V4AjvEve3Hk
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b809a3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=q_ebNChVWJ_O0X_IP0EA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX4VdKRN0md/YS
 8o4XbFIVFj/RStDT4jaD+bcGOi0HEh/Qk5u6dvkPZz6YautXyNmM1oF/N9n219gQwFN6Z2Ku0/y
 1vrHFfvhkpAPYQRjZ4lLVfEZx4EKj5X/D/4s3NB0VR1b+EPfblWIEUwr3fqeuy6Bu/0A2/gceA1
 dABqTljncgKoR6eYfi3zrA4elMkBMien+T8jJNEk7SWJLuG0uP6l+vf/rsVcz1yfHdpfa6c5eqr
 A0rtli0AuGZEwirCi7P+AoTZByWiMANgiZGxQTrk58w5yxzHTop72276HQ5T+yC1Mnt6tiwsw2k
 WLKs+JMcnFkuc+STWekUtyu9lHG8wQBm87e2gep4ZRRcSM9crMxxa+OiU4AWqhJ5hu3bMBG7jmB
 SWJBXgH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042
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

On 9/2/25 3:02 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 02:30:48PM +0200, Konrad Dybcio wrote:
>> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>>> During bringup of a new GPU support, it is convenient to have knob to
>>> quickly disable GPU, but keep the display support. This helps to
>>> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
>>> modparam to support this.
>>
>> I'm not entirely opposed, but slapping a // in front of the compatible
>> in the dt works just as well
> 
> Which requires rebuilding and reprovisioning

Fair

Konrad
