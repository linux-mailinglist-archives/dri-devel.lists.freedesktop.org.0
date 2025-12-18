Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E99CCC46C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 15:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908F10E9FE;
	Thu, 18 Dec 2025 14:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey+09OW+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJRCAR/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495B610E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:26:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI95iRN237285
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+eNZeX22Bag+AhcIrdbMJYmk
 Oq1LYSfEEsUGr4TTpxk=; b=ey+09OW+AfCwhAHgoeJActuICH9YbylXehaAWFjN
 UVvW/dWY8zzGe2ieg+79kTCPR+1Su3K30lxentwc3LsKlorXY4nfK+SevAlhh4g1
 zxhrN+Vj8NqHO5YzuRNJOhoVfAqleuzyiTRC4ySSMNWZKCPD42PG3a61taQO2QHN
 8kSnIyy9CksNNXmGJhq4bndBcN4PBNjRpv63f37awbBUjWDZL4VvSnCyvhcM4O8p
 X4PF7GAAIWGNFno9rolV0eOx1UGMfjQiLAJEIznB2/taQbSRqZdoTvJi6QNR384d
 7Ezvm0ezxcUlSCvodSonMMeIIE2PZ9k9pnTFW8lCJNXvXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3jpdf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:26:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6ff3de05so17549041cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766067991; x=1766672791;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+eNZeX22Bag+AhcIrdbMJYmkOq1LYSfEEsUGr4TTpxk=;
 b=DJRCAR/jKqtFBPx2+PmcYDZ06ry+2rwMVVh0IYPFePWFuXkGF9x5TMg8Ce9x+LXW9w
 8o0i21Ck7EnU7ok+AmPWdCYhpyESCu6hWPtvRsS+/MDX5V+Oo2E4ZQ6hnAghvr/9Lxgv
 4QZcIw0KcZl2B33c7Kuj72GTJA7peAkFUIx3t1jw40vJcI4jGa5RfKlIxNteoycEBYR4
 6IQDJsYSB01G7AIPWc8z9GbEXjBaJ7KYSKzRf9MPXNNb6euCRhWU3nM+yir/SK7OvmKT
 kQp8wbhW2Uake+JyEEXWb/AeiqLgNhmUq0JKLKkSXa/tOioiu9e+3kJlk/z11KCC5OTK
 fEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766067991; x=1766672791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+eNZeX22Bag+AhcIrdbMJYmkOq1LYSfEEsUGr4TTpxk=;
 b=O6vHP7op1QAVI7dNZYuZs1/pfyO2ckWTseo+aPbW92/N/oVDhW2U4EUiOCF4j4RzQn
 KlYC1IOEey85W3fiIAPBYLU+H4bRy+MEV4lioUWVBkPfmaFiHtlniTHTv02xJiawrUwJ
 V2E2HP8HxBay2WwxmBy8ycgSiTCVxhniiypVUTfmzCriRN2SFW9Di9cx7erPfCilzuQH
 /k4fZ4+IEhKodgFN6zN0kjN/2dzGV1cRqgRb7FJWMDIczTyqvlOVPIPHD5MqGWzclD6c
 2euv1bEbkc4trSB22Pr44uPfmCGE9D5e+jO1EJMAfePlbZiCZ94hv6V9VZTMxfuSMzeC
 8OJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjPTdeo2E4OG/EEJrPlxHCOMSdL7dDv6yBgBqd6KKd13U1OOB9YHlCo1TN2qEvQWSooDGlA06RxQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv87PqvfEiicl5xM4qZtfjbSWdckkRLKJjSzZJvEMMiyQX7JwH
 Ns/nJzGoyX55mG149QE5zhKrGnIWgiSnRycMc4DEw7ETfB7Q0Clyuw1/aMdhXSLXZ1ZZMjqIVyq
 PWyvuJQiibQQa9+HffuIuk2X1nmzjwAK6OBfUxxtKJmsZmnjUwFcQJSIUksrQc7CoUrl+BVY=
X-Gm-Gg: AY/fxX4Eg1fDAiY8iEl3pnXIlgU9PJmY2tY7ln/cnadxmencd+4ZZtamrcrhWR37NWB
 VQ+8PKd+UI57+Mgxl6epDC+ZFmv93ZC/rs26dC5cdniLVteCaIiLvqRwq1sBliTCy770oAoUZ8k
 UwBJfSyFksobP9BgrH0rmJZtmi20xU6BoNWz8029oWDNobUt7cqyIygIz4WTUZsg0gxHM7dHcJm
 LAO07aq9fxZX4Dx0vfIsO94uiwoN2HzheF8sPKiG3WxcPT7DKELF/3NxapSh3ruhI9f+sdfmWCV
 nY7xMbJPBNTeJwkviANDvxxVva3IFjWi3XNwHp/448xYk79P2ZtvU73dsphOVvKribKCaAvifkl
 KvZAoOlnErPAQhob56yhfS4BMkgygeryryTW0ZyhZXjNf/jrz6ooJnfkfiss/w0Qk4Ln0vknbPa
 Pxaei/Wx3lwT5wGKR2jJ+DlbM=
X-Received: by 2002:a05:622a:5513:b0:4f3:59c1:768c with SMTP id
 d75a77b69052e-4f359c17765mr71607121cf.60.1766067991533; 
 Thu, 18 Dec 2025 06:26:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX4Hrk9ZHUtg7fsmd9iQkwVpcpFhlhg3A3GpY51zv7nVekKtu/jcASONAOmixUYCFr9RhjYA==
X-Received: by 2002:a05:622a:5513:b0:4f3:59c1:768c with SMTP id
 d75a77b69052e-4f359c17765mr71606621cf.60.1766067991009; 
 Thu, 18 Dec 2025 06:26:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a132cb37dsm1124446e87.5.2025.12.18.06.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 06:26:30 -0800 (PST)
Date: Thu, 18 Dec 2025 16:26:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Sajna <sajattack@postmarketos.org>, barnabas.czeman@mainlining.org
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
Message-ID: <3zwhkm3ncv6iujfcbehiqjspabakabqeargafr7csjnbbnjt5r@qwgjqghigwxs>
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
 <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
 <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
 <92f0e801-032f-4c8a-8bb4-ecb3af48af0a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92f0e801-032f-4c8a-8bb4-ecb3af48af0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMCBTYWx0ZWRfX6zjvvj2ChaK8
 QVvwNLdP4P7A3Kw46ooHhI26kUczU9H/raF8263EWLOamEnD6wGlTiZJAuwLbKrRnMOXYXYgQ1u
 rZrXaIHEnYtx9jqZhgxvLiIVcgmsu2pbBkGWdiOVTUgRlpiLqUgu5dX83Wqm8kGzzHYdThGBzu3
 +Rf6cZ3grTJ6jTQu6I5mxQ8CjrOc2SpV762U059Qp9TglQCmBEKcEPU5yvqgQR7ilRFVIqOFvla
 eQyVsYOwAsPhSGAZ+3zBQVS8X1q6t+Ywoi4uK1knHebSL9W/O1g68LkL0x4/f+D1apR8xAij4VC
 oc0DPwlj+BM5sN3EEKcNzIUWS/DpxBo4RDvruYpeyrHs+HOwPmnags3K5C+DV41p19b0ZzlNb7z
 N9x4QgDI2X5U5cVmv2kLT8cPBYbD5g==
X-Proofpoint-GUID: YseSGW1ppUvt3cKJUrd1Og9CgVBaSBCI
X-Proofpoint-ORIG-GUID: YseSGW1ppUvt3cKJUrd1Og9CgVBaSBCI
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=69440f18 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=mPYuMWSBsh0mtMeFgAUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180120
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

On Thu, Dec 18, 2025 at 02:54:15PM +0100, Konrad Dybcio wrote:
> On 12/18/25 2:49 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 18, 2025 at 12:23:49PM +0100, Konrad Dybcio wrote:
> >> On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
> >>>> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> >>>>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> >>>>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> >>>>> mature enough, so it's no longer sensible to keep them enabled in the
> >>>>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> >>>>> string. Drop support for the MDP5 3.x genration inside the MDP5
> >>>>> driver and migrate those to the DPU driver only.
> >>>>>
> >>>>> Note: this will break if one uses the DT generated before v6.3 as they
> >>>>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> >>>>> SDM660. However granted that we had two LTS releases inbetween I don't
> >>>>> think it is an issue.
> >>>>>
> >>>>
> >>>> I've retested DPU driver on our downstream release based on 6.18 (by
> >>>> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
> >>>> at my disposal, and I can confirm DPU driver working fine an all SDM660,
> >>>> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
> >>>> (Sony Xperia XA2):
> >>>
> >>> Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
> >>> your SDM636 / SDM660 using CMD or video panel?
> >>>
> >>>>
> >>>> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
> >>>> dsi_ops [msm])
> >>>> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
> >>>> opp-supp-hw 0x4
> >>>> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
> >>>> a3xx_ops [msm])
> >>>> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
> >>>> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
> >>>> on minor 1
> >>>> ...
> >>>> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >>>> error]enc33 intf1 ctl start interrupt wait failed
> >>>> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >>>> commit done returned -22
> >>>> ...
> >>>> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
> >>>> error]enc33 intf1 ctl start interrupt wait failed
> >>>> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
> >>>> commit done returned -22
> >>>>
> >>>> Which results in horrendous ~3-5 fps in shell.
> >>>>
> >>>> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
> >>>> commit done returned -22" is repeated few times per second whenever
> >>>> the display is turned on, and stops when it's turned off.
> >>>>
> >>>> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
> >>>
> >>> It's interesting. Would you please capture the devcoredump for the
> >>> platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
> >>> and top_0.
> >>>
> >>> Also, as a debugging check, would you mind patching
> >>> dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
> >>> dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
> >>> any differences for CTL_START and similar registers, but it will take
> >>> some time.
> >>>
> >>>> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
> >>>> tricks to work around GPU issues.
> >>>>
> >>>> P.S. I have not yet tested MSM8998, but I can try if required
> >>>
> >>> As far as I remember, MDP5 on MSM8998 has never been wired (as in never
> >>> committed to the DTSI). Angelo has enabled and Freebox people have
> >>> tested DPU on MSM8998, but I think it was limited to video / HDMI
> >>> usecases.
> >>
> >> I think we poked at both, back in the day (tm) and DPU worked on msm8998-
> >> sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
> >> (due to a register field not existing on <845?)
> >>
> >> https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022
> > 
> > Ok, so my guess was correct and CTL_START is not present there. Checking
> > the regmaps, there is no intr_start too. Let me cook the patchset.
> 
> FWIW it's not something I came up with.. But I can't fully recall the
> original finder. Maybe it was one of the MSM8996/MSM8998/SDM845-mainline
> contributors? It was difficult to find, so I'd like to credit the author
> but I'm afraid I can't find it..

For now I credited Alexey for his email earlier in this thread.

-- 
With best wishes
Dmitry
