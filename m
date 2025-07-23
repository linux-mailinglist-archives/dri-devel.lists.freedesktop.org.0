Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E4AB0EFE6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 12:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4A210E7B3;
	Wed, 23 Jul 2025 10:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="juEiVFsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3594710E7B3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:32:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9UjLw012097
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yoxWGvrI/DM0finhf+96x7egX4yJi8CUjAClFYKbmTk=; b=juEiVFshXtr5alAh
 zEPAuqMhwz6Gx+8/Jp6UxcR7ECKkzgj0/RkRb+2vu9dVetupFS5goFH6k79/7h4K
 rOHHbOVQOU0g4w6NNzqzvOPB8hUqOXrAOo1vjpBGi+nr5//v85r687se7u59aCWn
 E5AP7tc98QrK/9Uem5hA0WIbbnsQergWSsAamRdQ8Y6rP1LaJ44oB00HQIgtgRcK
 JpWR3dIfBsrIMgNwMJmjJj1jjp54fQ3ZVjcN3A6Sh56hJp8aUwIek3apFEW4jeh3
 Tv9DE0YOyGeMFerDSUVeWqUEpFT9PwdGgxDzRO7hmWjK3K8gMp7NqIowiWDlwe0J
 AGUB5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na37gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 10:32:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e2ced79f97so85471685a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 03:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266761; x=1753871561;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yoxWGvrI/DM0finhf+96x7egX4yJi8CUjAClFYKbmTk=;
 b=gWGFCxHG08uk1vj/fDNo4U8fwfMcmowmdmV0ojlQ47tadApuPy4WeDlPt7BSEZAQgQ
 c0rlFNpGbOgzc0rAZWfi/Y7ku5lSKoG+RDqqxujwKmOMIoOGk+jtp05XWs1tNEkPEyMM
 M6w87ZzeKCeYU1Spd5LHKSX6Ti+gcqoVOWknmDbUTjdVwAPsNJcIMm+0JIgfUy9CRDbT
 a446+OQx0jCRbKbfFVX30Ec5QN7CKO/U2YB4dr0D5oNQD2yocTQOIqTrZFnpIIQ7gFJw
 ZtehpsiCBaPDvm1e3VJiwoNIBmOCzv3/dSs3WGJTmUK5oT8TQ0ogBg+XmCOuUJphM5oD
 lV8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF3Wr6G688ESGOQm4/7ai3C1T7xm5TLA70UXsdDqhUJUROb+ojsA2LFLvQqnropqUI7IxCu4fe9e8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfnewfNYb3gd1y7hoSIQWVtN3zENLvnpWV7U7sxFDrngHB/xhQ
 bVDfRDiS5sEXthTUUMpzU/ZuMK50IlamsJc7CO8RS6Sf9o3UelltCq0PtL8fZxpisr1AAxbCZt7
 Uk0AjBxuqoj/uWcJO1W/5tqNWAf2maRnqLM6r5vqK8iXqeYW7mKLvR/KNi/kZRxdJglXVt90=
X-Gm-Gg: ASbGnct6fx4SFa+DKo+41R2ddQ4Op1EHQa/yONLhJOxlTGFUN3VlLzBkcyMQr/K6uQf
 Dy/qllAKsqa5cCgwdKn+pJTi+QiTtWANlB9Cz5V65cQ78blHbzG50xHC3TMOv+VrF23NUCFlBWj
 cV5+VzSjIbPU/K8C7KMTAW8HXBbpV3jLCNxV9jhsJuLL/F/sJj376YYyYcNbzN8Zd0mpHzClrM7
 lCRS9etVWXcZ156DvxFDYn4kcAkdO9TipUkGjITAIuly2xnoN+txn3xHADCIvDxD3rWsK3AN5uY
 K7yiX0xnxbclK0qCefXk/W7NabfaCcnm0QF0VrT+UhyjlV9pzssaFma/04k6boFeeIt41t92CiE
 YEpsYVvnRQAyDI8plZQ==
X-Received: by 2002:a05:620a:4107:b0:7e3:715f:8757 with SMTP id
 af79cd13be357-7e62a0c1597mr117641085a.5.1753266761460; 
 Wed, 23 Jul 2025 03:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMGR1PY3KATLtDKkVwck4PFmLv2ujqFi2Asp89UsFHT9277js6Trob/xsUiROpYbvGow0BQA==
X-Received: by 2002:a05:620a:4107:b0:7e3:715f:8757 with SMTP id
 af79cd13be357-7e62a0c1597mr117639285a.5.1753266760933; 
 Wed, 23 Jul 2025 03:32:40 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af3758ec76asm57350966b.121.2025.07.23.03.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:32:40 -0700 (PDT)
Message-ID: <d50f9a01-ba8f-44ec-9206-fcef641333aa@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] drm/msm/a6xx: Make crashstate capture IFPC safe
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-15-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V2eVqX1ch8bryJKJgL2E3aVLYTlBhMh3
X-Proofpoint-ORIG-GUID: V2eVqX1ch8bryJKJgL2E3aVLYTlBhMh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfX7C1e5+pzQf6/
 FnQ8qJrU4LXC4L0d4rMpZYzvNubTL/7kj24sqv8YScgDLGWyPu+YVaMtk4AsP/ZD/EFEJqk21Pg
 Cc6GEXClznym8bX2UD6bU6Y/4Tn2e5TATlSHADwvz/4F4jbElRwSan+X15WSzZcdzQVLy75xsLK
 tALYYUiT+JGN+kVQ9ZG05QwwuMuOF/tA7cKtTioYkHMZFJvYSVJm6BGSK5PhURtVEMvsANsg4Fg
 5V2iGgjnRHOxpQZ04YxTZWlYtQ8r9CdOw3CkZ30gMU2zYx7CYdNPIofr+74UwKcLHcByWKovIlo
 7DLHE5E/19GiZiz+x9fKUFvx/sv+aoOrfeizM0sbc9/CoT8nZY7QW4z3bJpofSwBlR9cozRy02z
 aqUCXnROloogyO73fKycYdIlzVzNX/AEbCHEqPEHRBSN3FebpOn9fC5umg7+WtlmNo6y2Q1b
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=6880ba4f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rrcyIi5yJUK-87isN-sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=671
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Now with IFPC, GX domain can collapse as soon as GPU becomes IDLE. So
> add gx_is_on check before accessing any GX registers during crashstate
> capture and recovery.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * This is true only on an A6XX_GEN1 with GMU, has IFPC enabled and a super old SQE firmware
> +	 * without 'whereami' support
> +	 */

Firmware that old won't even be accepted by the driver, see the slightly
confusing logic in a6xx_ucode_check_version()

Konrad
