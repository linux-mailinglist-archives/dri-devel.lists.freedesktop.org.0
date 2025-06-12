Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29862AD7D4E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DFC10E19D;
	Thu, 12 Jun 2025 21:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaxjjFpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AEC10E19D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:20:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CHA6H4027198
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=; b=EaxjjFpJ7wS6WdqT
 Al1W1Dj40l1WVibjXSMhFBkQf7/kUWFEy7BYQ5Xh1aoIZxivt/1erMUK4pXf9IzK
 D6GvU6tPk97CzCjDbyjp4RBj9ZR2Q1Hvg6pEjCSoSHTOS3GpK1i0MNQqh6ss9Eg2
 SsavzA5JlzCtAdLE/i56RtkKXQdF9mkMe7qiHQCpIWSERGU97gZWoXfBPDeAs+Jw
 GtAZTZSGbvNuZJ46oglDZhV60SoySDp0yIswVG/qv1FuDvK6FXSbAiIjtNYMBxKL
 RYCYlTJN6LekxjS9R3Ha9R4GwWOjrVcR9JwvsLgw9wJq8Ykq2S9uhRG9dXyOKWIo
 0C2X8Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvhtnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:19:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31366819969so1208668a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749763199; x=1750367999;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=;
 b=siAVUlbZpGXENMFohK0ZE2O82sGAhs3S1v6xKmuoMyu6PQRXhAUM/KZ8C6n0YOn8tY
 VONeVWk0VrJ2wWcqNZfchiD3M7QD2ZHg6MnsZotKjNtawl59WAoEbiiLGGrK24pGlNZR
 CNOMe89HSRAKxuYonS2wfMSF9AuFsB/a2PT4l5nieHWTI47I87dd7juoa4AA/5DfAweU
 0tZg+xzd0hnE6OsgDUNrlrvAe2H+I9tpi/R9Eeg/E35lWfJnsdDdTCiQx9VgAv9mdCDh
 1eUkp7ehUWqNQh+QUoFAdfB3OF0fGNew4gkW9i/zAynl3NOnhj6vydCLBK5tIVVtJ5Vu
 55Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/JIOcvsm57wihZc/5Co5jNIk3iDJTxo8+IuR0wEBNVyZTSgNC4mOYNy2tpADCdlhxPGLqHQfE30k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVjiwZtQeFhwkz60XcMQ1QEZSOWZZB81FDDIXI1Fcyzfu+f6l5
 wpeh3fFYgiUrN7EjELoKI4b0+1izaYyeSkCGmQNamX7Gp5TjDMiAAB7VOWvy80Y00K1hTspMhCL
 PLJMWtp3xlDB5VkL2FDcv8cbIGwG+PWdaAVPHZl/6A8oP1sh1Qf44zEPmNKWh8H0JyoseTJg=
X-Gm-Gg: ASbGncsQb/Q/SwqPTpvgRmD4jXw4fSErFqWGQFe806nHYAgxJa6u9ENASZJBgRJ33LZ
 2k7OwdMW2qcZ/6Z+0XopxPm30jxRyK9D3AFUQfl3diA19ASdEI0H3jnFyvI5vi4E/cqZeR3u7BQ
 l8XSvH5uL6BZlm6IO4JF357KEdvqeBI2y/szPbX2FSCyAfVmrhgzGyndZtREJKc/sNzOAlm709h
 6mg7lWQbIwtZNw59LMoF9y5Pdr2YoiSdfAiFdunw0HIQwCjH7qnbwTWdnkTDTjnU4UyxCV+BLUl
 XtJfCJXL7l6dSI2q9kIz/8ezE0BnKMdk1apI/cYwww==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id
 98e67ed59e1d1-313d9d71383mr1065539a91.14.1749763198850; 
 Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcEB2oQFFgVMym1bB2VUhhziP7lQFCJfNjFpbKCnIdWSG44vwJc/VtPEHqnpJDg2SoasT6AQ==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id
 98e67ed59e1d1-313d9d71383mr1065512a91.14.1749763198422; 
 Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.17])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b5a882sm1990932a91.40.2025.06.12.14.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 14:19:57 -0700 (PDT)
Message-ID: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 02:49:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lDEnpX5ZyJ_lfgDDfEpCEAtCtdv7vM51
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684b447f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=8TKXt+tWyFtBY9WE4KDEmA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=uKUkM4gl_lyc4tR08vMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: lDEnpX5ZyJ_lfgDDfEpCEAtCtdv7vM51
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE2NCBTYWx0ZWRfXzKD/F/gskdDy
 j06WPesnqXcsEI81oLscdPceTcnl0dLgD9tTNeqjY+Ko/zzr0b4mlf35M8D+UG9Bg/oaZaCw12m
 Ny/YcWz5eaBP7gki3MKU1WACs+d32i4xvCkNk+/d8AHpQ+t07xmLyL5ZsJfT4kF2FEarNn7NRlg
 YwaJb9LB0yhIv2lLpIBgNJ8cDKuuFSq+3QCKum6cE8RO8fsMsxqOWqpH/q9TjyfOumZeIHj7LtT
 uo0/b4f0ZpFV2sgDbB6zGsExkqwN+OGfeCdZ/x1GmX1wSO8BOo6CF2ffxXn3H7acrVIEjzxbjVv
 QJg4pneAoJh4vv1hJeHf11/k2UXzrUtUKFOvZcWNV6A+cWWT0PovA7q35735af5LmyLiJIX7eiI
 x3pg/iWd6+IetbMK/dRC5gGZz0rFLE1Vy4z8I/M0N5QTqj6sS57CMP7bCWhPnWL0qWn+nUOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120164
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

On 6/12/2025 5:32 PM, Jens Glathe wrote:
> On 6/11/25 13:15, Akhil P Oommen wrote:
> 
>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>> version). X1-45 is a smaller version of X1-85 with lower core count and
>> smaller memories. From UMD perspective, this is similar to "FD735"
>> present in Mesa.
>>
> Hi Akhil,
> 
> when loading the driver (still without firmware files) I'm getting a
> speedbin warning:
> 
> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
> missing support for speed-bin: 233. Some OPPs may not be supported by
> hardware
> 
> I've seen that there is a table for speed bins, this one is not there.
> Tested on a Lenovo ThinkBook 16 G7 QOY.

Hi Jens,

Could you please try the below patch?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 2db748ce7df5..7748f92919b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
                        { 0,   0 },
                        { 294, 1 },
                        { 263, 2 },
-                       { 141, 3 },
+                       { 233, 3 },
+                       { 141, 4 },
                ),
        }
 };

With this, you should see 1107Mhz as the GPU Fmax.

-Akhil.

> 
> with best regards
> 
> Jens
> 

