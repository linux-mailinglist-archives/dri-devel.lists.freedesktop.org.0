Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E7ECCB97B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 12:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36BD10E3CB;
	Thu, 18 Dec 2025 11:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeSRamcO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CR845y4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F8E10E3CB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:23:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIB5S891334982
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XM3PjRRkgJDLVtvgBlf1yGGi/oXyJmhRngXHmv4Ni6M=; b=KeSRamcO8HYzb+Jd
 8DbYNGEtSh2mqQ2eIkctswsma5t61Lp7RqIvxNZPNCWCa9GWlyyIbx6LvXVB26RV
 x2GH4wxtBM+eu5MtYUy1N2FLrsQ5pYIM0sf0ZeRXFfAKE4N8CB+a07QIuMLY/JpW
 eWnOdXkjw0qubFHlLebkG73GKf7K5gfpAshYyGU5+9Ow2fE2DpnL9CZXgTejdPLI
 hw5i3MMvNGKL2ySdGFAlwk0l9+dDehUH9ToIyBZMiOYmivS2hapgNRp/XBGeGCWx
 qd4sVpFR+8lqBeqWvyhcLn9Q1S4fX3j6ngfIV12Udv445I+UJ6z5x0kwiVSEBme9
 iWXp+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec01r4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:23:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88057e35c5bso1382846d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 03:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766057034; x=1766661834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XM3PjRRkgJDLVtvgBlf1yGGi/oXyJmhRngXHmv4Ni6M=;
 b=CR845y4wXsmo2iyJou+pyxl9Jpik9oLSxv5Ad41B5WsxcTcJhpSXdlTRi5uEGZ0Qlb
 Z56Sof1Piqgn4SvLpm5spoyYZ1zQtbFXvRRVBCBqlo4GvW2ymrc0l/E26G2IHlab3SVO
 9iySzHwy9NvSobCWHgy/dS2d0u6jSN+tz3NssrtmoARECjsWVBli6QiUEorwvgmBGSRS
 BmsNvw3sxQHn24nlEvI8Kqi1XvKOPuAXu+0XW28WhellEoNEGTL6RSxJQGgWQFjXOU4T
 8XLJuXmkPINpisJLfCc7mWb+sO1F7IgziGECqYPmKI8RMBdVg2qnVnBbwZN+uLHuLNvh
 igfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766057034; x=1766661834;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XM3PjRRkgJDLVtvgBlf1yGGi/oXyJmhRngXHmv4Ni6M=;
 b=W/1vYr2KgV9R3N5Ckgmdntge1UfC2XJs0FaIXELkbyCyUim+ZxB20Ek7f8xtc9ZHwo
 72beDyjTSFILAqsJU11g/X4bt7Hc4l6aWtW5Jq7Tc6xa1bu19XtNEXK6dwK1ekbRAvA+
 c72XcCft/kyQJ8BJALUUoDJ0MbSfOIMcm5y+vbexianre0AopNiAzDpkKtMWnXj+eQpO
 lrmj7Z2Z8AqY0geEjeVQIJqpMT5QtufvlkjKkXSQxNbS4VyEfgEZ+CODQC0cWw5O4cY6
 o26fceJSetkKjYKHKCw90EovGKI7CuYYo3JWD79dj3kbL69bJwqoXwwvjf+d8bZ2PWAd
 v2Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPYAWI+m8Bcz7Q4HJR0iTVeM7cJlFMklurQGmR66IdOv6reIbUT4oMMCNj8LJxEc7cjv/gZNVCHaw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygjwN1VpVxOHms6QoXL1VfAQ0b0YyygDDi85xRZY2mh6VQk6yA
 z3YoEvK+BSR3YmfoGp5LSkWFbujoQEF9TjpK6spySPmagumcUz7PTd0+zVC4AxO2FgQw8GX7zud
 WwGsl0yTpKuDwjYmO+JPgtJ21NoYYSwelX+9gaEtW9J3ePgVedBhKa+R7Shn5vIKkVREteSo=
X-Gm-Gg: AY/fxX4y3xRWiDAE3vQKo5PotjJIHpq2WiTTVyCyI9SjmFL+trOVl41HROr5Az7cTGz
 9NjP8grXXGC3YXG8NGXGzCBNQbvxEtk/sPpJ3Xu//lvmy50XyFXWwqReuCMHMOddAszGO4H7lJI
 Clqtl2BIT88jVXYMaRzcl4u7eKIbuPA1lt91temgzc1az0P8TvKMD3cN7jF31SA7s8QLzECgkFq
 ShCziQv37jdMQ/5UJ3O+060LQcmAa9GSaMzWKxZwsY6QY5s1tO+FtuxXgptidbT6ioKCB6MvEPg
 pJrMfqGdgHjqG2NEfo4q5tOMOfJtSvmIl+3cOuglm6REbzuvn6DcbhKo7cRH9oVtW+GuMbIa5Qw
 VOalm+eSQ7n1UE/mZPqP/Xp3M0lxj5RPN8i9qLrOIRK9YiN2iiMaB/CXLDTOzmKJbZg==
X-Received: by 2002:a05:6214:2023:b0:882:63cf:3970 with SMTP id
 6a1803df08f44-88c9770bd12mr18182336d6.1.1766057033617; 
 Thu, 18 Dec 2025 03:23:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/tvDYCoy3mFqOPD7fGTgiVRBpPOULT1Lah31cAzxTWH9nDj15BUCPMDBDM0NtBT/HmoVqzg==
X-Received: by 2002:a05:6214:2023:b0:882:63cf:3970 with SMTP id
 6a1803df08f44-88c9770bd12mr18182046d6.1.1766057033159; 
 Thu, 18 Dec 2025 03:23:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585d1d61sm2335297a12.9.2025.12.18.03.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 03:23:52 -0800 (PST)
Message-ID: <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 12:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Sajna <sajattack@postmarketos.org>, barnabas.czeman@mainlining.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CvHBGZbid2d7pN_rexZG2mDAoP64DMpQ
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=6943e44a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=cLwkmEU5_4-cEt2YZAUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5MyBTYWx0ZWRfXxCJz9t6QnUsG
 3krGE3oekqd3MdDAVvcjEbCAuTwnOD/nSzC1S/k8zsdyJ2lLDWHIQzz9rqcddRkzkgoXcKqsPaS
 ZK3hr/g9pEQ2H6yEG6tbeGndfQfG2qLVefdSkcncjWuCoDJxfKjVKSw7ZspjdVTDYgRhKGtHy/H
 nWnFRQCEoCqHu34gCEqB52ehzZLQJcMW4R5RPImRmD15wP31UaGcZ0BoupikAb6Ta/3ii/+z2Je
 d6WLEvh310vIYNf5H5bvr75CdjLWhQaHsfhHSg1muE5qB42nkDSjlQxF2KFsNb1E/ASokXtKGzB
 geuxQtUCRnjM/fBtzw/vCC4x6WRJw5VtlWsW2H+1NwS1HTKc8FXAoqtzLgHCyCSvblWJJ2e8R2i
 HU3B67lnqq7Rnc7aqLdYooVAbTADFQ==
X-Proofpoint-GUID: CvHBGZbid2d7pN_rexZG2mDAoP64DMpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180093
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

On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
>> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
>>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
>>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
>>> mature enough, so it's no longer sensible to keep them enabled in the
>>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
>>> string. Drop support for the MDP5 3.x genration inside the MDP5
>>> driver and migrate those to the DPU driver only.
>>>
>>> Note: this will break if one uses the DT generated before v6.3 as they
>>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
>>> SDM660. However granted that we had two LTS releases inbetween I don't
>>> think it is an issue.
>>>
>>
>> I've retested DPU driver on our downstream release based on 6.18 (by
>> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
>> at my disposal, and I can confirm DPU driver working fine an all SDM660,
>> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
>> (Sony Xperia XA2):
> 
> Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
> your SDM636 / SDM660 using CMD or video panel?
> 
>>
>> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
>> dsi_ops [msm])
>> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
>> opp-supp-hw 0x4
>> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
>> a3xx_ops [msm])
>> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
>> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
>> on minor 1
>> ...
>> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>> error]enc33 intf1 ctl start interrupt wait failed
>> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>> commit done returned -22
>> ...
>> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>> error]enc33 intf1 ctl start interrupt wait failed
>> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>> commit done returned -22
>>
>> Which results in horrendous ~3-5 fps in shell.
>>
>> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
>> commit done returned -22" is repeated few times per second whenever
>> the display is turned on, and stops when it's turned off.
>>
>> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
> 
> It's interesting. Would you please capture the devcoredump for the
> platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
> and top_0.
> 
> Also, as a debugging check, would you mind patching
> dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
> dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
> any differences for CTL_START and similar registers, but it will take
> some time.
> 
>> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
>> tricks to work around GPU issues.
>>
>> P.S. I have not yet tested MSM8998, but I can try if required
> 
> As far as I remember, MDP5 on MSM8998 has never been wired (as in never
> committed to the DTSI). Angelo has enabled and Freebox people have
> tested DPU on MSM8998, but I think it was limited to video / HDMI
> usecases.

I think we poked at both, back in the day (tm) and DPU worked on msm8998-
sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
(due to a register field not existing on <845?)

https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022

FYI panel wiring:

https://github.com/SoMainline/linux/commit/88f276e81cea0f7496d3f92cd731f27615cfa703

+Marijn may know more

Konrad
