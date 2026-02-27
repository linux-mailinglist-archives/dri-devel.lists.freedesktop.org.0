Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HvqKTWBoWkUtgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:34:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8931B69EB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A879010EB0E;
	Fri, 27 Feb 2026 11:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqgINwBG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahNtVzVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFCB10EB0C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:34:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61RACPK21600684
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vugU6Nub7U1CaNFRr7BPqL+35AbeCYSuFn/3PVLmBmE=; b=gqgINwBGAdAj4WI0
 JDl43c+3HeL8oE3cyj+aei6972f2e0vcKB+gnEKeCygLop0axx3/TDI5Xs0cFWbK
 Mhni9r0uTQNfXPPSzKP8EYBiNex/7+HKrLHPHZISqoZFqhKNpZCfhtw2DZ1LZhnl
 +cGyM+37gm8Mln/VnJpHI4+U8ewizlchmyJchMt8s0Odqvoh2okt0TU/NzmGaYZg
 YsZbY2iOELH/j8s2lKY7LC2+8Omvn9nUmP9M2Vayutxh1u4NZhIUR04m0CERzYYU
 6obevLvh6MxycgDidQTNM2iy4V2YkYb76oYrY5hF534+HZ6BnUKCST+uamddHFRp
 UgqwEg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99uctg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 11:34:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-899c3641fedso20629506d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772192048; x=1772796848;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vugU6Nub7U1CaNFRr7BPqL+35AbeCYSuFn/3PVLmBmE=;
 b=ahNtVzVDT78jNlxYnb4aECX1N9XZWxsVUrm7JQCgia3HsMwr6qIx2wtlgm38q8+QfY
 ad5RPxbSQ5N4r2HTKPEskdE7o8UwFrBYRXm8koNfqk99PyQ0BpO8ATX3pZamoTUf3/QL
 1wPvTAa0Qes7qtPLz2Wm00yI5hmKnN39eniizDjwUSbfDxVM9LxDeb6ttn1KNIGr9VXL
 dgwiqdEFhufBby1vPqCWeMzGU7AuE5eomzwjl9pwKBPRWMFbCzTkNwxflnqX3drkAXav
 pkxEwmOwmJ2c7uYqvFHLFWFE1Ok+9a6S6mUfbQ5JqWRzCNoW4kGUNE8lZ4M2rcaVYrdM
 q71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772192048; x=1772796848;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vugU6Nub7U1CaNFRr7BPqL+35AbeCYSuFn/3PVLmBmE=;
 b=ahR3ZP2uV6xVEqMCYJvP5AARN+UTfsrNamq84+FXDUFa0d8UxgCGfb9HU6MeymLApC
 AmotkAZwUfcVhU3bez4H8ddO5g/7B1Y1esnwTz2DYO9/6x9m9yKSrImt4V6a7c0WJRnT
 ldGfTvBUSaF2+7gS1cgV4R8wXKJ3NSX5IKX3gWjwnJEU/IO9C2/aLK6gTTZ66uy+5Vnn
 mBxETPDo9vekZop1+v2tb9NLUK1+l/j78E96HGNHvQSWWeSl1xO3bcBrplBv7SZ+22er
 sqaMs8/scppi08pBjdXjG1ZI5MnFHzNlRLHvnYjEaoKj/fW92ArvIrtMkKijcbmMzTfX
 99sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8i0gYy4CYqey2YfdMikn02kAxFYex7foYcmvtWdS1lvMh/tWlUwkoz/L/He2h4k8oguUh9guvtwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5tNf+vE1lCrP595PHPJ9r102t2r+ok+qt9+5Da/H04TUKQK1x
 +k0jUoT2yoCNSaQOJefvB7jDd0j/iTtEnwLMI4m0rCiaVNCXmx9oqGwGBk7/W9+H2Ob5U/EVg7/
 RcDN0ABEbt4q1bov5ofkpubo0ZV0qxunGHJ+IvQ8+C7538nvxkx0bKeWcs7v7kAyz8kaR06Y=
X-Gm-Gg: ATEYQzyMygwFc6JXCcScnw9UaGbfdjYtFrDsoRLpG54gnHwS/w7imMHzJIc+oMJR2+l
 GTrQsB3GsseoqrOgdHQ4oMyxudsPsuMgsnonyAi3+d+uHhV9ZhgNRS/Kx+rLFcF7bWTyc9QZy7+
 dTausrkZasxxPhr2oknnkbp0j1uCXCAQlcloOVJp0QxsUH2S2MLzUUdmv0DaykRq5/XM9rtDQb8
 sA7XH8CNtLku2CInk6u9t7tvirUNPVQBjs7onkYxfEsuPYJpwAvbORs8n920/doE625/2SGzfha
 QdMWTRAWLLxg2ZuDuJTr0yi+8+8KCzgze2e054RSikBWQfwdTU2bxyxSFdKGwIGignnn511Lqwt
 VinbLlQrFpS/6amOj9GiAtIp8gEj2zSrTIAjeHcAUyi0cpNq/H+RGyVHiK/WocYuO+mOZTMaOKi
 i6HaA=
X-Received: by 2002:a05:6214:3483:b0:894:9d67:7329 with SMTP id
 6a1803df08f44-899d1d86089mr24083086d6.2.1772192048454; 
 Fri, 27 Feb 2026 03:34:08 -0800 (PST)
X-Received: by 2002:a05:6214:3483:b0:894:9d67:7329 with SMTP id
 6a1803df08f44-899d1d86089mr24082566d6.2.1772192047613; 
 Fri, 27 Feb 2026 03:34:07 -0800 (PST)
Received: from [192.168.119.151] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935ae666d6sm140619966b.37.2026.02.27.03.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 03:34:06 -0800 (PST)
Message-ID: <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: yuanjiey <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a18131 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Og81VDND5z1jpqFtuisA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: k4kA7XpVYtNLrj1EfeTCtXdNUG-PYR8C
X-Proofpoint-ORIG-GUID: k4kA7XpVYtNLrj1EfeTCtXdNUG-PYR8C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEwMiBTYWx0ZWRfX7x0huW4WBNZA
 ZUOVazjWsZ9PV9me7CtZK8YLOIMU2Xli0NIjW+3w9hrr9D29aU64nVVKftzTU1CgYifknTQICRE
 rOEwGS9tFyz4zbbXt1dFd911184ObzHIVrbYjF95sfW8JpGyY0WpbV5CawhopGJTLi5T72Vzolp
 34ygXaiXh5LRBoriqFh9T3uaIdZPTqZQcSdUf5tpnS7+GCyOHTEKCNcmCttfUxDzh4TvgnrwQoZ
 VufTULluXbtbk8cu0j82wjylO6tYdo93QCt7JpJnPeGqBpLsgQF+n3MpjKd7M83t9CcJ0lRP+pY
 HdGXvNwejdpYVZ5yL0/qOV2XzdfWqq62rtxR7VEAjvHZ4DdN4QxPp3Xo8GrGBn1EVlD2yfordCJ
 RDpg0NyVBfkK+pn7iwE3VfnQrMRD0TqznlhoUiGRfEvy4BAVacpZXFtH0wrODw5G4L/Nxab21tL
 nf6zVmE1i4iej27sytQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270102
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzysztof.kozlowski@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 5A8931B69EB
X-Rspamd-Action: no action

On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>> On 1/12/26 9:25 AM, yuanjiey wrote:
>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

[...]

> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
> dpu_runtime_suspend, then we should be able to also skip setting OPP
> corner in dpu_runtime_resume(), because the previously set corner should
> be viable until drm/msm driver commits new state / new modes.

That matches my understanding.

> The only important issue is to set the corner before starting up the
> DPU, where we already have code to set MDP_CLK to the max frequency.
> 
> Which means, we only need to drop the dev_pm_set_rate call from the
> dpu_runtime_suspend().

I concur.

>> For MDSS, we're currently generally describing the MDSS_AHB clock, the
>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an OPP
> 
> No. As far as I remember, MDP_CLK is necessary to access MDSS registers
> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
> platforms")), I don't remember if accessing HW_REV without MDP_CLK
> resulted in a zero reads or in a crash. At the same time it needs to be
> enabled to any rate, which means that for most of the operations
> msm_mdss.c can rely on DPU keeping the clock up and running.
> 
>> table.. The GCC clock is sourced from (and scaled by) the NoC, but the
>> MDSS_AHB one seems to have 3 actually configurable performance points
>> that neither we nor seemingly the downstream driver seem to really care
>> about (i.e. both just treat it as on/off). If we need to scale it, we
>> should add an OPP table, if we don't, we should at least add required-opps.
> 
> I think, dispcc already has a minimal vote on the MMCX, which fulfill
> these needs.

I have slightly mixed feelings, but I suppose that as we accepted Commit
e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain"),
we can generally agree that it makes sense that calling genpd->on() actually
turns on the power indeed

What I'm worried about is if the clock is pre-configured to run at a high
frequency from the bootloader (prepare_enable only sets the EN bit in the RCG,
and doesn't impact the state of M/N/D at a glance), we may get a brownout

This rings the "downstream really did it better with putting clock dvfs states
into the clk driver" bell, but I suppose the way to fight this would be to
simply set_rate(fmax) there too..

I attempted an experiment with pulling out the plug. MMCX enabled with the
AHB clock off results in a read-as-zero. I tried really hard to disable the
mdp clock, but it seems like the "shared_ops" reflect some sort of "you
*really* can't just disable it" type behavior (verified with debugcc)


There's a possible race condition if we don't do it:

------- bootloader --------
configure display, mdp_clk=turbo
------- linux -------------
load rpmhpd     |
load venus      |
set mmcx=lowsvs | mdp_clk is @ turbo
                | brownout
                | 
                | <mdss would only probe here>

*but* that should be made impossible because of .sync_state().

This may impact hacky setups like simplefb, but as the name implies,
that's hacky.

Relying on .sync_state() however will not cover the case if the mdss
module is removed and re-inserted later, possibly with mmcx disabled
entirely but the clock not parked at a sufficiently low rate.


TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
plug the MDP opp table into it and set_rate(fmax) during mdss init

>> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
>> targets supported by these may not even have OPP tables and are generally
>> not super high priority for spending time on.. that can, I'd kick down the
>> road unless someone really wants to step up
> 
> I'd really not bother with those two drivers, unless we start seing
> crashes. For MDP4 platforms we don't implement power domains at all, no
> interconnects, etc., which means that the system will never go to a
> lower power state.

Right. Might be that 2030-something arrives and armv7 is gone before someone
randomly decides to work on that!

> MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998 /
> SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
> has both MDP and DSI tables (my favourite MSM8996 has none). Probably we
> should start there by adding missing bits adding corresponding
> dev_pm_set_rate() calls as required (as demostrated by the DPU driver).

A bit off-topic, but:

drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
1101:   { .revision = 0, .config = { .hw = &msm8x74v1_config } },
1102:   { .revision = 1, .config = { .hw = &msm8x26_config } },
1103:   { .revision = 2, .config = { .hw = &msm8x74v2_config } },
1104:   { .revision = 3, .config = { .hw = &apq8084_config } },
1105:   { .revision = 6, .config = { .hw = &msm8x16_config } },
1106:   { .revision = 8, .config = { .hw = &msm8x36_config } },
1107:   { .revision = 9, .config = { .hw = &msm8x94_config } },
1108:   { .revision = 7, .config = { .hw = &msm8x96_config } },
1109:   { .revision = 11, .config = { .hw = &msm8x76_config } },
1110:   { .revision = 14, .config = { .hw = &msm8937_config } },
1111:   { .revision = 15, .config = { .hw = &msm8917_config } },
1112:   { .revision = 16, .config = { .hw = &msm8x53_config } },

96 is in DPU. any other candidates that should be moved over?

> A note to myself to also add OPP tables support to the HDMI driver.

Eliza!

Konrad
