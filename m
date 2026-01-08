Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F21D01CBE
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4964310E6BF;
	Thu,  8 Jan 2026 09:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsYouXFJ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bE6TVitK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AD210E6BF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 09:21:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60846DHL2779665
 for <dri-devel@lists.freedesktop.org>; Thu, 8 Jan 2026 09:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RUASEvoKgRbhk1dUkVLvuBQGOMUb3++LPBZvsx88wnc=; b=GsYouXFJYnNMjuVs
 IW9p0883DTxHMonKCRgmL/qi+ODHEw59CvDzzE8ITwPDCXk8weNAmtaQm/YQdtdx
 CqP8NtLsqrrglui9Y1Xw7nR7T4pqHQ0U5aPZERxKnqH1MjjQW2crPSezbyHg0SUl
 NPoQD6xyKGzVzNf0MRMCxH1GCos+0cWXJTgzR62uJt6T+R4wXiANh1BlEvXxmBWM
 kcSTJhTHR55Lgp1DeuqsEKlT2qP+47zwrPzCQ70mb7r1rTgPQmjaJhU0fRSgq/SC
 CNZhfeWHmsUAr1C7DKuE0u7QItPhjIQcot8F2GNXY0z4cUG3pUQhq+h80yOKTmPt
 aZwpaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ugw32-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 09:21:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8bedacab1e0so100630785a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767864067; x=1768468867;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RUASEvoKgRbhk1dUkVLvuBQGOMUb3++LPBZvsx88wnc=;
 b=bE6TVitKngQeZCHecqLakChrt6HJmtB/cER0KdG7kluxDRwN8M4ISdoPuo0QEDhhoA
 6uONjorV3GF0qa01IlcokVqDon5ij1ZNLwrAVsBhrRAxtlMwDZkodeh0NMeRO66SBzY9
 ljVITQJbhsa7Pa0Dsxw7CPifjnArKEfOKFKkMG0TfPn+tAkK3GJFfVFi6XnP6QNSZLC8
 u8T5tIa+uBg0ktARPKJKlrIFqt8AiMyIQJ6LkZQRxf7Paviuu1DJdeW9ue6ahKwdYLOc
 0UxBYafnMy3XLUiOXw8du0PEjV2oR4Y9N1qbn2G3kdIUSUiEGuS6G3wZMuCWo4VEHh5I
 snjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767864067; x=1768468867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUASEvoKgRbhk1dUkVLvuBQGOMUb3++LPBZvsx88wnc=;
 b=IWtMr1u7Fgbwk6h/l/bpeywMGw0AcV2ceDEXmvCgz6k0QyPBqxi9yRDt+uFqCNm5ZC
 ftBpz7Fo7mDwU6Sxv0Fqc050z0pSP8f96ga31cYcu9CpPlyOWnCQIpuE68a3d+s88oOq
 YejS+UHcF89KsSJoGFNOqvvnniHz/YRBroQTfc48lDACns5OS6cTy7r8jL4GzEl0E1Oq
 lT+lX2XsEK8gBZIVIibhiCsqvBGgsYOckrtFEioXVQpoT7iHWjYnExKjH/jJjaNSqMQE
 bEr2i8SmXqG42HIZth4QuIe/uwld2GtDztUHEySTOQh8uo4REdQv8A80TA9eeQiCF4SC
 9M1w==
X-Gm-Message-State: AOJu0YyuAqi1Q6dgP2aD8bLazYyNjPu9Lc4IAeIT/J9Cw0yT8IjYAqxj
 zlCl34bP1k06d+k0B+4iXccGutSc8n8IQ4TLzM24f0CXsoF9j7cK8FTpxH2pu9KVSxMDNbugtVO
 YQGFj6rjiOHKebWH/jElWFRAnbrUbzptLNkH22Vfwr6e6puZcMlkaavmSLIpcu9P/3tKoaow=
X-Gm-Gg: AY/fxX6YqO5B6PE4Wja5u0A7tIyLWe6Yc9ibxKW8c3DQpiRcUNoswHKCTOJd4cya/YA
 KbwJl+GiWY8A7vTTcUCkkEPEIv0hEWE6CG40mkqbDWWVXRwkkhD7llQf2GXdIiUe4Z1TCimDgSN
 F998wryV0oB2Yb1/DOgaEKBZ5MhWdDg5FfyIipvA+xrShaI3kC4C6+C3CX7u6xQM5q0LC7aaNJ/
 v0uv9fObKKcypWVBfzhPGgVyOEZ4mAJhEvvzhDwMbFC/y3ZJpakND1Wv0LmXnlb0DA6qM7IvR6G
 P4JRrWUB/flpezQ0ek8+iQFpPsI7ct2UVPODQ5JP6llOIsj6ZrdPku7q+LpA5EfFyPbRGRI0cup
 ksHMIhojz6khT6tj9dlyHWCpMTcurB07Wp5mSjnd/5CGHDAK4Gt0mVi/XTFGQSmEoECA=
X-Received: by 2002:a05:620a:4892:b0:7e6:9e2b:6140 with SMTP id
 af79cd13be357-8c38943b7femr567260385a.8.1767864067015; 
 Thu, 08 Jan 2026 01:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSH8xh0nRYmxacJIRP7jsT1v/IUGFzqMnGgVqOwnhbwUDo4bcraE4vEjb3nwQSNnL88CCsDA==
X-Received: by 2002:a05:620a:4892:b0:7e6:9e2b:6140 with SMTP id
 af79cd13be357-8c38943b7femr567256285a.8.1767864066468; 
 Thu, 08 Jan 2026 01:21:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a5118d3sm763110966b.47.2026.01.08.01.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:21:05 -0800 (PST)
Message-ID: <ce7c86c0-6feb-48b1-9fd8-7ce3bb825428@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX7yzPqYwqTTQV
 APaFN8dFYyhvribI+G3T1qkxjqip0240mhRGM4dfIgPjlegSmwpjsd7JJLKqWKi5YkOpmfFo/Wm
 Ykh1E7D3bLgmyFtmWFiaZQgP7l/eQ6RJuEobwG28m1JeDZX3er/PN/+2woWDTWsFrqxcD/LP9MY
 N05f94DVVcSO/lWYuq07/2BwnEi9riW7xlxHbXgO0rTc9GRTz3fBTasqVNPWRCE+Quw2B+eScNJ
 ilfm2MpoTRB21HgFm8D8UcnQ+lTdJt6lIg2kmPdyxBNUBl+/WdrnDpkpLIXMI3wTW3Moub3EwJ0
 uBCk0zdPgoL3n6GxdzITcxsFeuQsp4F15hNBTJAXMmvs7ehE6W7cwu1i6fmt98+iykcNHIQ7lzA
 Aj56cvDKWogPmv4SD3+10TgLBEiCwqR6JFq+w6D5B8NCXGr10LoHezQJcbI1qEjbiNJivtyD71n
 n5FszlzvVKGXc9kZCog==
X-Proofpoint-GUID: UZJmyGMH4c3BRh8M2EJVbk64Y5K22YQg
X-Proofpoint-ORIG-GUID: UZJmyGMH4c3BRh8M2EJVbk64Y5K22YQg
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f7704 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tn3pFvwZU5TYnyux6WMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062
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

On 1/8/26 9:54 AM, Konrad Dybcio wrote:
> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>> Document ovp values supported by wled found in PMI8994.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I reviewed a version of this that said PMI8950, which is very much
> not the same..
> 
> Let me try and get some more docs to confirm or deny what you're
> saying..

PMI8994 indeed uses the same values as PMI8950, so let's keep my
review tag (but please be more careful about that when making
major changes between revisions in the future)

Konrad
