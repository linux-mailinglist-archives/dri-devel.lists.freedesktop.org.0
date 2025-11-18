Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91CC6A225
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B6110E4DB;
	Tue, 18 Nov 2025 14:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRCAtrqO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGMIkebz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D024110E4DA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:55:17 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI9rKae2664727
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=; b=gRCAtrqOkGyFJVFG
 qpIRzeLY8JUHH5NdixCCo/n1EI6JSzE3uCZH4mkHTjyYJjH1nE31I6Et0OwfiQRy
 5e9geAJKajuiNr7WBX7trXIXYyPdOMfoWF9G+dv5cG/qty2nQ2s0IKoftzAi4B7+
 VWmQ80GLnlY9zLi89hahg4ZWYX0+vxRzHLKxItlvw05MR5Cgx5McznHcrfZqOcW/
 gelw7q1NiaOeaONY76DbjuSxOp1bcn43oRUpE/ITjww3Chnk7bkCnEtNmuDFgF3s
 5dT9sSD3TNAXqS78qh8EtiB4c8gjfoJ02GVtdQxFfpn8BaahVBEhsUmwxXHoSYnm
 wjCLLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk8sg4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:55:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2fd6ec16aso37549585a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763477716; x=1764082516;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=;
 b=PGMIkebzM4pP7okpU22ySB+rISMUQTLmX19n5iSBZra6Bnf/5pEmRiKyw0fg4ipXpp
 6IujHa4cOosOihnl9t+hh9UIHBxBJYOKHOpkwudtsLi6/sEp0nY7yjXIMwXk1mratSQ0
 3sYGGczuJEggPyRrn0ijiJ0ZS5ijJ4w7QRZhWoXSBnL7NZrKCBgDtTXCxvlO7KCImqdy
 xIbwViq3kgmzdsoPtWdh+fHBnQ22VnatWvx2URjMu1WpzfH35Lsz1CavwqBqULYcIYYw
 llHdoeOksSjWPSbqHenIzHV6mQzp3w9qafFfQvhkTNtBE1d7EdL0rSjguYly3hAmPueb
 pQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477716; x=1764082516;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9R4KR8Z3hVb3srR6L/xvgE81rkJYUH5zBjgpe0vgwZ4=;
 b=QcfPv4IPPcGRU5p27NbBQdSOEJO5PutHnLSrmBuekLchyDyBG49a10FQsUg6r5z/qx
 msVf6a/kSzDD8mXyWPEvT+HIVrOlZh55QeYtHP8MdJCrq/pIjBplLLndjW2oOUfh7lEp
 dBWDdbihnEojGWyPrN3Z9kO8rPF4j0D8KhVgwUUOq3TH0caBO21Sc+h82wHvWUbwutQa
 2L2lPpquZdxgsIo9dBrNHugqA6d7RYDQPe6de/EFhVSbcu2tzTFMy3adOhJ48FCjHxCn
 hcPOSmaBwgDARk9k+XxKVqQZm09JGSWQIrwYyrikUn5kXGRxAPEdh/cdD7BzQ5IgUOh1
 jEeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA2++wZzwMyjzPiye5dQxOLpifYW9FDBlfEbhOl2p3BridVDfwFT8Ya3hwFq5qgsPJjjInldhbih0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6Gf5ngYYYyOxYA4a9uSEsey9xTMPvlDDHiw/LziELADDKRBXo
 Fft/k4A4wZtE/T0Fqz1FQOyPinpmQOGr9i6Gng7yvWgB5K39W6A+JZEQwijeXkhV+aiHMbDqnkt
 WqbWDk1DqqCxtNPiYhnt1yqIjGn17/WfaZNSL4RWhwUsAZT8MCD0QMDTrWih7/SPzqUpSeNI=
X-Gm-Gg: ASbGncu/6RGWWjiqEfXmJBj6+iNuSxVIquEKXhmnQShpK/DJybtcjD1odHUOwCEFrrc
 1w32ESRtd9DFBveMRzByzpo+SOGe6eGRl7Nhk3fAldyvGlgOl//8TrGs3xZmF2hoM41sCJnGK+h
 cc1U13chy16myNeWjOoTh0QszTny7bkVOmlm062JlW4XPvDLMcUm4NYmK0j57u00mfw8f4vy65I
 SN0LgU57aJEzKZo5OlUdf63K5W3grvqw9qj/SfKiJn1eyoLShw474BRKZsuC7Ypq0qX0ZkhTrQ+
 GRhCdtpcQqyz7LxSpwLGoiCNHQhuEfRThDNcM0ipF5DjxKcPT6LHeXZ2yNZ0fm4Xiu0shS1l0Xf
 DrYUnq5xuTcMX9x1DuBc5Dhqms/Q7Iw3YK3EoSTFfxd3WTu3M7jSBCCrqAUvbY7AAx2c=
X-Received: by 2002:ac8:5f11:0:b0:4ed:616f:3cee with SMTP id
 d75a77b69052e-4ee3140ea44mr28434841cf.4.1763477716290; 
 Tue, 18 Nov 2025 06:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJVZA6dX0gt3L92EL+HUhYgz0yXNr/pNVcybeYXxplcGFGlRqKl+WXB2GoO8y/NFEAU/p1iA==
X-Received: by 2002:ac8:5f11:0:b0:4ed:616f:3cee with SMTP id
 d75a77b69052e-4ee3140ea44mr28434481cf.4.1763477715833; 
 Tue, 18 Nov 2025 06:55:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed90c0sm1385620166b.65.2025.11.18.06.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 06:55:15 -0800 (PST)
Message-ID: <5b0b771b-c2eb-4379-b55e-25df10449688@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 15:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] drm/msm/dpu: simplify bg_alpha selection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
 <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gslX8rGZgrBHMrY2W-MGgb4BUruTJjXf
X-Proofpoint-GUID: gslX8rGZgrBHMrY2W-MGgb4BUruTJjXf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX3KZzpWwKW7cF
 /xsYUjqMuHVM21vnnmeGZnc+nATuUmOSwcSVuCKNmcSEfNDRLfafFrxWRTLi2JaM+/mMuE99O1u
 fMnwxBrT+QdhAhMYvJU+a7gMFEYYKJ3GPCmKYU5m8ZP8g2l6NjWaMiB4NsAZP4h/RLnAB+/+GJR
 0m50q3I7x7vZusa4f6i8iNBNn3UantQEbsLoGTKdCFyHcscz5g4qscG01YIWik0+/w92RgwfKP/
 oc9b9XSepvi25M9Qili3fNnAEhQiZMYcm/4oTfgReuWJ65RvO4eIiK0TvAttNRQDootGYHmJX6j
 GOYrnxpeJY8YL56Rk/kYjup1pkyFX1oleIXY823JT4TH4EoLAIiuViH9e9MOoCmUyUikiNDe4QQ
 r8uXjj94vKpVCS4sV/udyrKTuTpiJA==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c88d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J_72SDv3VFfFxBOWP40A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119
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

On 11/18/25 3:51 PM, Dmitry Baryshkov wrote:
> In order to be more obvious in fg_alpha / bg_alpha handling during the
> blending programming drop the default setting for background alpha value
> and set it explicitly in all cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
