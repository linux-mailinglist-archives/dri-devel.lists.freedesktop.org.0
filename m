Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002ABAEC785
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 16:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8979A10E115;
	Sat, 28 Jun 2025 14:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1+cmURx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021E10E115
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 14:02:29 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SBVG8K016475
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 14:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=; b=f1+cmURxwE7I3hZo
 XnCzpKbvRVGZOaw/EjpkGt11sm1MaA0EmbfPcbg704HmTDv3wIXLOEvsrdZYk8Ei
 ixrkP2Gp0Fdbj75GTOjYTWuViSDGtDncv9iphEwBkgmBJHuK4GynMBHuG/6FAgYQ
 LCDVuxuOKKewe73j6xCDEV5SvatZgecZHf6h63IEHKzqvaf0qHtvWX8tQuPgzXGw
 eMkaEkFO1QfS+PGGlINbngjnNkvtOKg9jPc0CmOOYq0/0Sjg8uXu8737S0kfbe5a
 Jji04dJGjc3mPqxLt/BPAUMLdAe0AdaQRWIasTWQoyIeBKpoGuNqa5gxsPhfZDpl
 gAPDiA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9rspm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 14:02:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d09a3b806aso61615085a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751119347; x=1751724147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=;
 b=Z3RuUzBt5lZ+DTxYRbayUmoAIG4V9r+aN3elys1htqmQpAS8YAPEMk7ro9OAFeduyy
 E3uZBz8S1MHW08CMD8q5Ivgfkk1pBnGzAZWESc+VdLMHKLbesJ+R84gN+ZYRF28rEoso
 PZw335e2lEFXIZmOxesQ4ezTelpvPucJYEc5z46vSqpdhhrz67uAtkkjWvUaOxcl6DaH
 SLsiNyJgk1OJCd6wMowTkrkqGY4AyftiTpl4kKoUkpxtMo075GCidTF0vMIQbyOCpsdP
 Ltui1p07ZCwsTWQ+Q1BI6QTxwGwbml8kJRdfdC7u2tpER1t9FsbjNbP7BuHgpx/Ij9JJ
 l1uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBPC/6LJ4HeGnT1yZ4Ym677jzQ0lFLNkfbijt+5FKY84nVIumPzVS0/eap3OiqhdtunsuQdln97yc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFIkiTQg9zzoSxYp6t8sskUe1q5Do1ns9A9BRefnjecr5oI9G2
 UmEOf635Q5BTIeEqorxzjyzci+KinoQaa7MP183Re1tFGdaLERuH4sk35j6+g0FjKsOIj6U2kf3
 q46GZjFZKqD1FcpemkisjrJU2Y4c8/GwrKnGylPsCvsdaXYSm6vWI+u9cMjCuWpCcpjoXJJM=
X-Gm-Gg: ASbGnctbLXNBQfK5IalKeayTOxIS711b021kNToQEqQg0xg/MxEl/qN86zRLc9YIrMS
 G8J4v1PvNDvfszRQOfIl/Qywq7hv0LfUvSZjzjr7gcg8KAV47Ay5e5j0M1NshLrBXg4k319ZzRA
 QgcPe+6aGZJElByt53x8YsHa4IOQ24jrlnQ85zbX8ilHYuCh9gz+YA7j09muG8lEMINeEw4U8a1
 wTEENi+/62a456WpkW6o5dSthP31KYe9fkqsrHficPD3HsbTe9MkLMgP0m1kf9iYYmOU6lGC1zJ
 u5Ck6WFXKK+L0a/EZlhr6EabOb7Q1FqoZnsMGQbPR8F1+0a53g45Sw7+yc+J0wesEFid1IaQnFW
 6I30=
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id
 af79cd13be357-7d44c26c479mr159330685a.9.1751119347127; 
 Sat, 28 Jun 2025 07:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7wuqAnLzb6/uFSg6oL9C//BE7uB/PxoedUfxOubcNg8iAM3IahQGLP9T9ZqdE0mT6FVoRNA==
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id
 af79cd13be357-7d44c26c479mr159328085a.9.1751119346578; 
 Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca0fdasm319419366b.147.2025.06.28.07.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Message-ID: <7b7c970f-f94c-4b38-9693-65f969b992b5@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs in
 clocks conditions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDExNyBTYWx0ZWRfX/MfdZhysg/H7
 Grzu/H0pCP+d74a5+zqGdb4/B4S/XgIctamKwj0capkhgVIPBlP46hA/Mmr6fdGTX650XB6VYsp
 RpxTtW69usqaS9ZX9nnJ8XgkYoGEg+3qw0jNdkc+8nwZgJFY7miMIMkdbDfjIvQnDEqBKp2y0pb
 HhMYc3BkGIxeS6NerZeRjhYBmhu6lDQ1A3MLxajms42xJWTHMV3JRLuVzTgzTo7SWTGNB3kgM8Y
 FZR9fQhRA0zsptkG6YQk16fyxVTEFHx+virbR3fT1YfDOqiQX2WHU6RB64uvE8ls3qhi8Gjndh1
 i09Yjy//0xmTG6lFRqnLIWL5oCJ7lhP4XcXX4CWKgOEooEtfw326jyUheUxacsGxF7yH8dCqH5K
 mev9XcFExy0Oo2491zv9nSx2i5+cIP7cj6tINjK6NPSwJtZ5t/ndzbbbcfXVuKn6FxQ9X0VS
X-Proofpoint-GUID: lg2HuAHi3fyEdItJwOE17gg6hq3I6sNK
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=685ff5f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=fA9TbEmd_Wx33vs1QK8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lg2HuAHi3fyEdItJwOE17gg6hq3I6sNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=820 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280117
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

On 6/28/25 5:02 AM, Dmitry Baryshkov wrote:
> Handle two cases for Adreno 7xx:
> - Adreno 702 follows A610 and A619 example and has clocks in the GPU
>   node.
> - Newer 7xx GPUs use a different pattern for the compatibles and did not
>   match currently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
