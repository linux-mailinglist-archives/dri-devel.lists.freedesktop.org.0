Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC0AD9E02
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 17:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235AE10E09B;
	Sat, 14 Jun 2025 15:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1ul7Tvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4864E10E09B
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 15:15:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EEx2Xt020269
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 15:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=; b=Q1
 ul7Tvvci9pwDP6eqpn0ZWDcQi81QcBBQjKEnCFPg42/fjAQC01+JsgFmESWvMVTH
 OQyzUQFc72gTAmdMvF18jlqocvbFA7YpHHajMeDOqcRjsw+Un0wJlIU4WyVfYFak
 pjM5wqnMzrWp1hPdO7ruHtz+bCnJ/ic/2fd0um7+Yn3ZBmQY8VLmaRwKBsFUx9Uk
 cyIOq3gYuXCreiqThbw86zsqmehfEq0uPuSVfYqlDa9dnH/urjoJRnXydKAoNW7F
 1eHfEgcd1Mkw59nDfB9c3hkggDSFb427VZbi+NMRXKzq/f9K8G8s19vsZBNkBPrT
 l4HykaVbpkw+Nl94d2MQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791en8ptf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 15:15:51 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-401c6b8b66fso2920118b6e.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 08:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749914150; x=1750518950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d8pysWykzzp5ZSa8D/f7idklhSx+zwqym/FK5UgUh5U=;
 b=KPB3cCp1w6PDmAxIFqogLh/n20PGk5kkAp+/mol/NnEaJ0ytfp8EXC9n7Bg8phUXML
 SHck74ws2YF0TXMcWJ8oW5AwGb8KOnNDT9kdoBRhmwr8c3LfwLyynkkDpWBycpsBytAK
 HhYXh779ncNVekF8iP3es4U76mq45uuWWfLWBTzRwnCK5gnJlpVLT78X8+wncUe8+/G1
 LLhMqqh9VnK1ZLPDV8VW+I+eabTtpephPZ67Ys6U/iKyZPsv6nz5RiRSoc+Zu2mYE/7W
 pweea9xesi+E4t0u0h+X+T4x9dHnhmQd8s56ORuX35FsjyXAAldAaFulJKR+FTwJlVip
 otLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE7BBl5sBpuPxhE86sNsqaUX/vVwplMisl8FZ00a2tLLLjmeYqrqZSDly9Fcc0KnFUKpFk7fbrLzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymCfP/Kw1vJ5yDkkZeFdCD04qdvENT+56eBjDV79bd+XpXD+O/
 XDO0o0WBSVuGMd/IvwKHBa/oy8RFuHQgDjEYex0+w02lml0cgD5O9efWgRBBL93W4njWrQyl7k9
 ErqzkrW3eIIoM+P6GpsBYwdIVOoRJsGNJWz3XURQmzKbH8mOgqFWJ9Ud+fVH35dd195IRBeUpFV
 lnh/k4WMg3HNTPVfV+DJgaC8udfvsmMn8aBSxnmZcNB5Qqvw==
X-Gm-Gg: ASbGncvu2E/yyogGyvFjvsIsfIH1DwLJtmfzdZ4nC3x+yJgbiALntu8EEolY5SP/YgO
 bi6QE+MtUCw+7sxciE1wLZHewk/Uqw6vjZs+zuMIRlHHppRFB9KGbz2t1VebOwWyAD/P106ygvy
 Pcq+I1ql6ZO7cYW12a+Hz/cbXXSRuN6FJnIms=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id
 5614622812f47-40a7c13a8b6mr2349829b6e.8.1749914150438; 
 Sat, 14 Jun 2025 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMbwblJsD/pMG2FwsGL3eZLj5yHznrNfIA7Pmr/sCExEn3egU7d2pTqU9/DLMoErYH02zZS3uNIJzPax6X90w=
X-Received: by 2002:a05:6808:690b:b0:401:cae9:4dc3 with SMTP id
 5614622812f47-40a7c13a8b6mr2349807b6e.8.1749914150052; Sat, 14 Jun 2025
 08:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
 <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
In-Reply-To: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 08:15:39 -0700
X-Gm-Features: AX0GCFtPk9tPdVg_KDSrMIfi7f7qfSkV0Cof0fPtpyMc67NsnsiF1f7jX-9Eurs
Message-ID: <CACSVV03_GEuFWHPDB3gGm+Mq9uR8QJ1HabKcKVxnQjagf65v=w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Wsp8hyCj_Bun7T9rN0K_Goq8Hm4QWfuc
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=684d9227 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=uiBUSSwroAowxIVJ74EA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Wsp8hyCj_Bun7T9rN0K_Goq8Hm4QWfuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEyOCBTYWx0ZWRfX4ZJ5H03XarEL
 RUcF8nbQokaHHYhP3a+GH7ddZdJ+aGiBASVdtVoVcJ2ciR+Zm4cP3iUlmN/7DHpZk5L1LaY6KfF
 5YxSdIgsBq46dWrZXWR0pEFMYi4sIPOrR1K1jJx0KFaSB7gJaHhF94nS29gJ2hha5qePSOJtf99
 /Qfpi4fI/du0umBhYbPJMRRbOXSNiOwqc7Ob+GPzTy1ka8BFFWYMtdnFIY7yL+2/hhJuBWbFNvo
 34NsBR8sOWGqXD0ETB9Y2+7B/lnYuSGWgFtubiuSiZ8+0epQ20+G8NlfPVOVtcmPLVt9CM9uGQx
 vynJQ1Zb1kV3oriqNqatoOirfJP8JUqaI7ebYzgWaxYzA78lETvZdikWkuSwjvrW4r7pJk1ax/K
 /uqKYmiHpry2aHo5bMn5hCBDeF4vb7sXfQ1hVdsPiIBBwND2BoqiNidpHu1NQ5etqRXdQT6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=778 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140128
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 13, 2025 at 12:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/13/25 4:57 PM, Alexey Klimov wrote:
> > On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> >> We want to WARN_ON() if info is NULL.
> >>
> >> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before =
bind")
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> >
> > Apart from tag problem it is usually a good idea to add relevant people=
 in
> > c/c. Especially when you fix the reported bug.
>
> with Alexey's concerns addressed:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Oops, forgot the reported-by.. but replying with the tag on list is
enough, it will be picked up when I apply the patch

BR,
-R
