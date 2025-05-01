Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF727AA65C3
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 23:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519F910E10D;
	Thu,  1 May 2025 21:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6vyi+7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7A710E10D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 21:45:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541D2Ipi013981
 for <dri-devel@lists.freedesktop.org>; Thu, 1 May 2025 21:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZWvEe+y9fZ95LVZsDUiRwMr7
 gR6HVKRq8+OepTYfaZw=; b=K6vyi+7mToNIxjqq+Ofgd06E3o9S/X8ARJPRxMz6
 Unhkwgq3QdDdgB7/LoNv13RljEQ2wjstmw4D4y3PKkA7L+u6j2+3OBdSH0eklOdb
 trR54Z6tA+VB0OfEqSFs+thq2Yi/aStvjKUNbNSdbEJbaPV7bChyArEVh30sUFDx
 vr5NUHdJoS+pOtJbUDH9x/GWeF3PzTsOrp6tjU/Yh1ZR2BugoAqMJLO4qzW8WNR/
 spOs4ksP/c4jHEHpbSp+QCDAwjcKIS+x4n2rqgzYGJBU5vL6fM4nWtgbDF8cJUtk
 41i2MzIdzp/q9BCiI+Fv+N7hsX7bay5REUyT6LwjaAr+vA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1xjf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 21:45:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e2872e57so245151485a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746135927; x=1746740727;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWvEe+y9fZ95LVZsDUiRwMr7gR6HVKRq8+OepTYfaZw=;
 b=cArApkyEsTZGUjnhmKa53dx+usfnsg6AEairL1Lbp+Yf6dr/kh2x13oKY+G4UEilPZ
 QDAYcR6t4IOCrUFMTwrrhQqUS6htA24foN3scggF4MTmH06eT/9MPqciuCB++JbK6gks
 vcSypLhN4Tzs6PYKRqLWUKS233aG+6DqQP5eCeDGtZzGpeTpypdZyPu9vn+vj7k/nECq
 HzsgB72owjzbF0//ULMQFgWDzDTnhY8LxbJbyD6a8TCy4Wk97GurbKRmm7osXE55rW77
 OJsB4HGl+aTpSFaj8i7d27TEVm40dMgmocFAhZ1oZoNXtIBLDmJyr9GcjIlCwdalcpt+
 g+/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmasSyFKIo3OblOAfv9dxob/Cn2ayDJz/HYkJRTZctu+T8Np+dos2SgqzYmjeTe0rheXQ3sKrNCUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPmHGi68TNRuFoCj7RXOC8Ynyj7ewJJitVksTJEWYm1oEeL4aO
 EHuWJDT5659Ges3ucfJwvWV21lVKDaffcU+IcxOQJ8LTCUH6/Hh9U1uiUlap1M1NtcnpiF+W15D
 hT92pYCmt/u57OoZD4DrzDRyoGQW3jFdUhyhszf19SDDJj3nastld6UBigZbe0mmgfME=
X-Gm-Gg: ASbGncvI+wivfN9pRlTWOJvbM+T3EvmdBwIE5uSAL0gSPj1rKev4h/+P+ASTK8DcaSj
 8kQAdNVm3/iQDE2XDL6l3lh9g1AooDU4AeWP+0S9WuuwcY1DGSSzm/3e0YhY+eYeYIBwDAkBwQx
 tDov2YHfjFyHylTIC/YkDwo3sRdkTzFkQrUuj8Bcdvw5qAqIx6Ga4OK4zgqdZSEo1Vw/ckjWFHz
 YlvcadjBZOi7hZoK38n1OgKSxpSc8hTXUELFkl5wip3EX0IRuEUPHL6XtfZJPXFJSciGkje4GqW
 O8NAP/kG4QJvcGb2kdpn44nKNQJEpC1qMVzGwENMvpoxhfaTcAnZOupKeAKWjTdefbhqPzlmUK8
 =
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id
 af79cd13be357-7cad5b8e24dmr91835185a.37.1746135927299; 
 Thu, 01 May 2025 14:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+2T3LiQpLagEU33hPpPGBOSneQuetQ2NiGG7X9LR4oyqvviiI/t4vmBzHx93FvWEjq2NtFA==
X-Received: by 2002:a05:620a:4304:b0:7c5:9a6c:b7d3 with SMTP id
 af79cd13be357-7cad5b8e24dmr91832185a.37.1746135926940; 
 Thu, 01 May 2025 14:45:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3202930c92esm1997371fa.54.2025.05.01.14.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 14:45:25 -0700 (PDT)
Date: Fri, 2 May 2025 00:45:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 02/11] dt-bindings: display: msm: sm8350-mdss: Describe
 the CPU-CFG icc path
Message-ID: <spvg6kmgzkmkknttwrzjonn3pshj3vvoqn2ffv7euucnkysbtc@vmiqfocytvar>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-2-0c84aceb0ef9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6813eb78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EuULMs42TwgxzVLzQZQA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE2NCBTYWx0ZWRfX+7V3K+Ysk+n4
 c6ykm6r3YnNrI8yWYm0mhX4BSb927o+qAAUT1zNIGX4zD8/I3xqRlw33kqOqFCvwx6/5FzoEXGB
 uETDYW7/0PGH2Vr19CNng2bosN/kK9tjDtHu7NjbL+mjTo3FgK4DzwEDOP2Gi+7S+Bjn4bToqVs
 mWOV1BxEyo0MtvrclVtppBNhOtcnKI9XwoZakYc641SfWB39NQ+6rqqK7+OJ4w8PgHIYRK+qUwj
 r92zPAary63vs9042CttYv6RnBxPNN7OHxYdM/GszWZokI2NaYR37zavu79vsjrBQ7Pa3tNLB9g
 Csjj8O5sOIA8qmr2WirdRIaB6Th8eL2JoOCpBKsTwWbgiuscTWKWG8ZADxoBt4DJFcG+4dYd8vC
 68ffsHafHszc6ZexlDs6qmzDeDjAixltXunBqqKqEH8HuxxrGdCJV1U/2EOKlUP4c5hzmE4F
X-Proofpoint-GUID: xS5Ygu6D-SKLgtubDeEGi_6TO8kXUj4x
X-Proofpoint-ORIG-GUID: xS5Ygu6D-SKLgtubDeEGi_6TO8kXUj4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=704
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010164
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

On Thu, Mar 06, 2025 at 07:11:14PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There's a separate path that allows register access from CPUSS.
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
