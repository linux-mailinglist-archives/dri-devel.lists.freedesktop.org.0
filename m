Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D1CCC1E4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4306F10E8E8;
	Thu, 18 Dec 2025 13:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYvXeSl4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmB0TTVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E76110E812
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:54:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIB5QN21334905
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W95ZWbyv7ZebtdgUzuyg7nH2Tc3tRPvsWhfTYozeQfw=; b=UYvXeSl453Yk6zLA
 jOQcGjMzy/fA2El17C1UCC6hhj+fRd1tGT/MWGnn+JN6Ynj24yZ/pGgeMLP4x5e8
 IqZ7P5nYS3WDizMrsxZQFzs8/ZxGsSGZ9+MQaCYkiBfFu9eg7vbZoomuk+nI+ZHT
 pOo6KzDXbo3zqcqH2uwtE0ejXfnm9Wnf9STe6kA4Oy9dMwL1bidJVU7zbwoQP3oW
 mlO0mHkZedxB33Q/BVnf3EV/3z74nnSns0SXNWVgqhyByMxGiz4hvJgOGIqQwDm/
 75rWZju3j5z3L/3pjLO8AgwhuXLGWwp3GOXFFFTBWvk07o+61jsQJW1mayffC6Tg
 /Ugemg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec0g93-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:54:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee05927208so2183221cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766066058; x=1766670858;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W95ZWbyv7ZebtdgUzuyg7nH2Tc3tRPvsWhfTYozeQfw=;
 b=QmB0TTVLPkvtdYhPaFgnVjBHZZ1SUb4NMKM1mW/557/ICRxD6Mxb3ka6I3W8c7D2QH
 mVJ8uhBAxQLGcTLF6lGcjZWZjQqPFniPxahBuDooDN83unpkvbKaILFbGWMkU+FDXndO
 tZ58d7CB+n4t6rR/9FoPeR02jia/LGqQ0e8wLRJQfb6CJrM674OkgmMvMw76+S3yKJs2
 xBK208imSdSWqluHeQOfkUrSRbX0cnVNCq5nbQW2I8nX/6iLPkHxLg+aLakdEa+mfHcA
 D1L3NMPyMRUQJ+hZ5GVSTutxg9qp9Zcx16h3WtMBgcVi4TGGk21941rwpNrcSP4qvMZD
 ah0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766066058; x=1766670858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W95ZWbyv7ZebtdgUzuyg7nH2Tc3tRPvsWhfTYozeQfw=;
 b=NzzD4yr81KfZZNIYF0xnDOKaAHIaGnY4LxdzPQ6rsZJRo93oaUYrJzmd4880N6gPLk
 q6sDUgTs3cdJfty6gUtBE6f4iW4WpUKrwYDrovoCjtwKu6Jrr411uUA9UqeXCK0s2lWM
 NHQ748OyD581ayZI2dzMFfcXiBQytlVIoUgGb6GrK6s3yXphyiyGlamr5Jya2Tarfg5a
 QIkE4H+z8Y2Uq1LyxBQy0gUvcsA6ScQxqSifUgLCfRLZG9i56alHrfW6fJ/8FbU4OEqX
 gYUpMoTyFVHXd0m3Y0csv1+CVzFb0+g8a/YNS/ZgatC36UXZJNM/YpSK9iL/ABP369w3
 W78g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPmCq4q0mXSEVt/bmp0U9qcfpIFL/GQLm6kDaSKL0IFTkDuMdDFvNdX9vhmHGQAlwaQW19TheLrro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy48g6ut4ffZnrn8LGK0sqKDT+lcY6HwIhS233gESFw3H/UE5l
 633jB2O1sGkEHpb2B1UcvO3lLJ81n1rBwOXi80KCFNCUEd82pfM6YrQZZzb6zIZihXXpNUrvDDL
 l+t/ae3VnRLsOhrUNtKhaSRojbJs8ygZk2wW4yl7/TRXiss3j1T9sQIjh4EF3FyC5cuWkzM8=
X-Gm-Gg: AY/fxX5Wmy5sD6UPv2ggZmexk7u+tpYebSPBKIUjwnYE0yfW7M/HibhhWCmc/v5Mtr+
 xle+S5RTSAbJSH0I5IGF7NJvvGLK5z4oxJSiuyOKLQKNrjaM6+Zva/jX0Rs71rFEzW3R01PJXdN
 /EC6qHYmfoe/S5EeoZr9OLX5Gj4/4DCIj+7IItNc5p2TPO92lDc2+wNtehhU+k7jpVag17ttf2N
 OJxV/0ul5zQVoBxVRkm1B/C263fLG8Q5LI5kBNfqCo6JQYecmKZNUfvrQ5pd1cGutsyQCIjOGSq
 CVOnwxeAxySsFMPRAXHiHcwJt8ZCSe2/9R2NrRkYci8yEhIKKT67E7vL2otBxGju4BTmkkMFp9w
 funUGbHpd5voUbavEC6VSFr38skTqltDk36gKp7Ksb5dXslLQqqabpcRsjpG9+tmYfg==
X-Received: by 2002:a05:622a:341:b0:4ec:f9c2:c1ec with SMTP id
 d75a77b69052e-4f361152409mr20232951cf.9.1766066057854; 
 Thu, 18 Dec 2025 05:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBlqC2m/dbjcpakq5xyRubRns6wW9qQ+MVm+nu5mEbtTBjt6LW/ckyVfsGNqX0AxDXLnM9sA==
X-Received: by 2002:a05:622a:341:b0:4ec:f9c2:c1ec with SMTP id
 d75a77b69052e-4f361152409mr20232751cf.9.1766066057380; 
 Thu, 18 Dec 2025 05:54:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8022f93e99sm237087366b.2.2025.12.18.05.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 05:54:16 -0800 (PST)
Message-ID: <92f0e801-032f-4c8a-8bb4-ecb3af48af0a@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Sajna <sajattack@postmarketos.org>, barnabas.czeman@mainlining.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
 <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
 <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1DNDrl3x6zmKAVbEuZ10K2NJu7Z91gYj
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=6944078a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=sMkN4vr61ZO4f_miHF8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExNSBTYWx0ZWRfX+g4Y32Iu4pCj
 f8BIwvwVH9oC0Zrdy4Y6s6V0pziZ0C0Jd175EzF5AApncP0qvf09ucJQXTUTGRvOCuykQAG1Ln9
 oFee49Uc3sCiwuXlxqE49/+3JM1Mt2wPCn9GOHC0y7BFuvbUjZ1sMT3lHXijjCmrbC9flDnPYvv
 mMlNVUh529SY+Ryof6FsxfZbHtXTVoWMugtCglFMZ4ws+878Et7DG2NPIntaBulP7w9Tk5livaT
 3QWABeYSPLVwOK86KoqGQsP29JP9/79c9rAcl78ROdmcQahkrz7LQvqhMbDHQMD8+KkekhqTCs4
 ZFE9wVO41kl2O6rIn11spIXu1fKTg8YeapxtlMCOlir4mwy+bgdEWH1kpZAnO4G4aiZanS9tcyN
 gpGDJtde+El1TFSFKgJzy/iEMSQUiA==
X-Proofpoint-GUID: 1DNDrl3x6zmKAVbEuZ10K2NJu7Z91gYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180115
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

On 12/18/25 2:49 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 18, 2025 at 12:23:49PM +0100, Konrad Dybcio wrote:
>> On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
>>> On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
>>>> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
>>>>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
>>>>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
>>>>> mature enough, so it's no longer sensible to keep them enabled in the
>>>>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
>>>>> string. Drop support for the MDP5 3.x genration inside the MDP5
>>>>> driver and migrate those to the DPU driver only.
>>>>>
>>>>> Note: this will break if one uses the DT generated before v6.3 as they
>>>>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
>>>>> SDM660. However granted that we had two LTS releases inbetween I don't
>>>>> think it is an issue.
>>>>>
>>>>
>>>> I've retested DPU driver on our downstream release based on 6.18 (by
>>>> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
>>>> at my disposal, and I can confirm DPU driver working fine an all SDM660,
>>>> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
>>>> (Sony Xperia XA2):
>>>
>>> Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
>>> your SDM636 / SDM660 using CMD or video panel?
>>>
>>>>
>>>> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
>>>> dsi_ops [msm])
>>>> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
>>>> opp-supp-hw 0x4
>>>> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
>>>> a3xx_ops [msm])
>>>> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
>>>> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
>>>> on minor 1
>>>> ...
>>>> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>>>> error]enc33 intf1 ctl start interrupt wait failed
>>>> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>>>> commit done returned -22
>>>> ...
>>>> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>>>> error]enc33 intf1 ctl start interrupt wait failed
>>>> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>>>> commit done returned -22
>>>>
>>>> Which results in horrendous ~3-5 fps in shell.
>>>>
>>>> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
>>>> commit done returned -22" is repeated few times per second whenever
>>>> the display is turned on, and stops when it's turned off.
>>>>
>>>> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
>>>
>>> It's interesting. Would you please capture the devcoredump for the
>>> platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
>>> and top_0.
>>>
>>> Also, as a debugging check, would you mind patching
>>> dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
>>> dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
>>> any differences for CTL_START and similar registers, but it will take
>>> some time.
>>>
>>>> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
>>>> tricks to work around GPU issues.
>>>>
>>>> P.S. I have not yet tested MSM8998, but I can try if required
>>>
>>> As far as I remember, MDP5 on MSM8998 has never been wired (as in never
>>> committed to the DTSI). Angelo has enabled and Freebox people have
>>> tested DPU on MSM8998, but I think it was limited to video / HDMI
>>> usecases.
>>
>> I think we poked at both, back in the day (tm) and DPU worked on msm8998-
>> sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
>> (due to a register field not existing on <845?)
>>
>> https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022
> 
> Ok, so my guess was correct and CTL_START is not present there. Checking
> the regmaps, there is no intr_start too. Let me cook the patchset.

FWIW it's not something I came up with.. But I can't fully recall the
original finder. Maybe it was one of the MSM8996/MSM8998/SDM845-mainline
contributors? It was difficult to find, so I'd like to credit the author
but I'm afraid I can't find it..

Konrad
