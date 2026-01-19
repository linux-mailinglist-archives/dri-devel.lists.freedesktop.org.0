Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7959D3A3DD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 10:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EC510E3A0;
	Mon, 19 Jan 2026 09:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiGq8ksg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gvh0Np7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3A510E2A4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:57:33 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60J91DT61150083
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=; b=NiGq8ksg12v0mUEK
 ics7v1gD3TA/XcNAUhvKiKrUIpmqFswKYJD50rJi0pPaD6fXnmsyx5JxnR4BuMY6
 Fc1kQ7i5FnJYIoE4oZERN7FX2ioNELNAfgNxycbN3Hxg0CnPQYb7SYrR+KCsN43+
 ALXQihdhm624CZkt5pbxLv+QCb8NQnN9uZ5Yu56I/p5Ci5jVrgiw02PieO+aPNN+
 xyJiaARtTw0NUvwURQ1rynPgB8VeKkCl5x/g9pv9mIAZoan6MZWxnJUnq4d+IN4/
 se5jTbHUf565mODZsg0wurJVCVXzL+TuwF2ocZOZYvYREhPDrBTnSJKSxa3ZSJj9
 +mvwSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e4yeg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 09:57:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c533f07450so99056585a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768816652; x=1769421452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=;
 b=Gvh0Np7h7AK6f1eHnP1pLtuwxwnpOQGSIZV5bf3Hl/Qf8/iLuTQ80X+J+vrJDeFSuL
 88yYdVee6ZJnClNwo8rQGbKyMS7v8Ddd5G7/zF6sxoDPrf9p5I3ps02VallYENb1JTi9
 tEzew69UzClRNOXKnPqTZNFCEPNAx+z7QCU+ofOW7tMa7HeVxeVxr3MqjpoFqmfLucd4
 kwdaXpbW1zjW6dRyOzzF/btt3K4wJkcknk3aFDcDwUa3roaQlIuzGePQHg/0Vby0A78r
 5EPvgAmGw2cRZ/ws4A9sYbfkIBB34acNx/Sw8wqMbnRTPLOPsVpVAY2oqRcteIq488tZ
 fXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768816652; x=1769421452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQiCGCw23+ncTBD+A26faX4r598idfb2NSI47mYg6cc=;
 b=JyHFbFcLIs9ng3MomhZkSL/bkPmiibYDICUxnLIQqylJPFh4Y/y4eQmFDfDe83AOnF
 J4UY2LFNN+BqS07Sg2fEVtwD4kX79p2pwCn4qPZKfkhRp1b2EkoLeKzCiWXQfvUyQhCa
 yQ13HKON3Vm9jQWW7PnZXGlEeWkCaiiqqmW0EG9wtL3WqFfqsLNsHTtdg07IWTPc4Ike
 aMtmyO57bddvagDeir/U3fVHBXrdGe35yWgrh12pKI3oVQNfBRfpoEdEoPmmzmIBpIVB
 5OE2iBtVpHHgBj9RlqTue9xV40NEFAcJPq96tXMMZF65ahBUKsgIukLDajEdRSzlrhcU
 tuIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFUjmWCMHbC0aBay9kC1FNaseppD1z1mGwhge/g8hUv0D0Fdmg6Mr+A+mf/KSzeVYrFdsQZICylQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoZk7SAHerGiMtTPFDx8q7kmgHU5NgH7LJhpUvOMJaGe0oNjJ2
 1ndLiqBVGeA7RphCIszq5hM8io9j9YRR0F+UcDUZaUHUIhs/XnwUKwnFBc3Nj70UDVBeMWNa7gM
 A7/PhGyiCkOZhHZqA0ctwmOQzbGEK2WjX4yClVUS64T0O5zqftKkyT0KK9dpUuShgN020q6Q=
X-Gm-Gg: AY/fxX509nH4nO5Dy/POeBdmKpMZvWx73AOv7gjCgbyJygm3uqQ/k2r4T23IvmHv2T0
 +SCRfYN4ZEMcpyipJFH0c0CpBYTowmrlVjxPdhup+Q25tSE96lSPzxNO26N2ZDe7fiabim3YK89
 2b/N7W5PNPT+ED9m93XgCA9YPNtT0dTqU1uB1pfRyfJ3Rap0eMzThen/zU4PsrumFeWtJ2DoGM8
 /wig8OZNATzIjvG9lTYyBXjW8mjuObtmrpjw502HdwUMRML0PnKOfXKvWYafDmCOKCBBy8fO/9Z
 xHW1E62G6UpPt3Xd/LtY2AvLAplJkSUfbGMetEsdGwR2TdK3MkEWoJRYm8mPIfKq15uIAG0TgY3
 BH+YW5sF/dOwQhGnFnEjahzU8UxhnzpGCwqhbpC3nCuQJqatAuh8FOilh7XdtiW8cDjI=
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id
 af79cd13be357-8c6a678d49cmr1121538985a.7.1768816651718; 
 Mon, 19 Jan 2026 01:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8b2:5af3:7fce with SMTP id
 af79cd13be357-8c6a678d49cmr1121537085a.7.1768816651168; 
 Mon, 19 Jan 2026 01:57:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959c9763sm1003138566b.35.2026.01.19.01.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 01:57:30 -0800 (PST)
Message-ID: <051f401a-a3e0-4d09-8a21-e6e323aecece@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e000c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FnLLt5dnLMIZ3HHg8ZoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4MSBTYWx0ZWRfX58BkDhCMdIJJ
 7OLXAR5N351W48cXH0P1mceTQgPpQ1P+E6PhBtnKJ6A18RMkPHXU3PZFAv+Ky+tY2TCd5Mr0mc5
 IqFSaJ52MfXquo5LUY/t70Rr4WcgY5Fm+qAvhRFJV5JeIjsygsWw/c8OdJx7Ev1M2MtbF4IYOj8
 OhDJ3/Nmd5xKPi0Db36p1Q4IJQ3mmCrmmA32Jly59yfKX8qKyb8AsVB8xNbiSj/yTn+8cpb7Ew2
 TWAoNiJlDpbh9r1xfkYzK0eNpOF/PM1GwNOEBEHDUzSiyqxe6iJWBP1/NrxAHNPFsGIwZB3XFxe
 F4iX9nMTRHxW4fCjv4fW2fAn7qH/iE3V7L1sLudUVrei0+spGlY9Un/pJI9uFwarNT8Ec+YHkxa
 jhGiFLE8LD6bRGculAP+zXkhM2P2EX0hfYLsiY2Fl5vAcPqFSXETi42xXAEiHUfTcMR/G4q3DSN
 Vcp27zByYi33Nw9oJvA==
X-Proofpoint-GUID: MN5c4q_Vz82qszoVoztAnKaFItShTDvK
X-Proofpoint-ORIG-GUID: MN5c4q_Vz82qszoVoztAnKaFItShTDvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190081
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

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> As in the previous generations, on UBWC 5.x and 6.x devices the Highest
> Bank Bit value should be programmed into the hardware with the offset of
> -13.  Correct the value written into the register to prevent
> unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

