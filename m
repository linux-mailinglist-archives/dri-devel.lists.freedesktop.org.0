Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CBF6F940F
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 23:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC6910E175;
	Sat,  6 May 2023 21:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C6B10E173;
 Sat,  6 May 2023 21:07:24 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 346L63IY016565; Sat, 6 May 2023 21:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=faynnSNWQYPoCmmV42zJL//bVLVclo7eWkVTypfuagk=;
 b=UNEAYDOP0PYsaVKS4a/GM23WSpLTy9Jav+U/HwdKmRzWty9/kevfTcMBoYa6oEhFlnF2
 Rx/ozcLW6OT0b9u9rTav4klCGX4pA9p1OuHhQuTS9JYlN0SIpOUWhF1Y+rEBid3zB2Rg
 MpLYHRifKwIO/jqZvViRTw3n7Ubo0ZKI/IlufXZX06HhqRuGrpSkQKPFLGm9dAp60KjY
 LdUSH+0Y9DiW+n20fZrk20zgF4VQ+O6Bn6Pmfy7PlzoO4yozbXiTwle4LvF+OOF0Y3XE
 jESUZuAjNqEhtXHMoVDAaSDTz3JIN7RZ1hnGq64rqG1vxyC0+FnTZ2N5Tuk8CyzzeSXh +w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qdg6hgvae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 May 2023 21:07:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 346L7F47031800
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 6 May 2023 21:07:15 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Sat, 6 May 2023 14:07:09 -0700
Date: Sun, 7 May 2023 02:37:06 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [Freedreno] [PATCH v6 06/15] drm/msm/a6xx: Introduce GMU wrapper
 support
Message-ID: <qmlhjgb63edbmwnttzddgoakpvqikex27uegay3j7jl5nqvonm@bvk7tq6nkrfr>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
 <20230223-topic-gmuwrapper-v6-6-2034115bb60c@linaro.org>
 <20230502074956.GA21869@akhilpo-linux.qualcomm.com>
 <d2374464-82e6-78c3-9c5e-f4e509c86d83@linaro.org>
 <20230503203236.GA1177@akhilpo-linux.qualcomm.com>
 <8fc74f8e-726b-501c-6800-0bd515d4181a@linaro.org>
 <64zeocdcctdlgqmrdz2x7diy7ihhn6rr6w5mpc4irpfmemob5i@2mky6fwvavxn>
 <693cd4be-9d31-a511-a523-d3e5eae501ae@linaro.org>
 <heta52legqspod3qz37shylfvwrfsqkcyrhcjqasr6xeacj5dj@kl625tkrfjcb>
 <nmdkhfvivlwse5jatioclbmx7ggzcbeph37vmlmuiseiixuraf@3s6r27bqrcr2>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <nmdkhfvivlwse5jatioclbmx7ggzcbeph37vmlmuiseiixuraf@3s6r27bqrcr2>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N70374PANbofJQlQ0r_A1y0ujcyt73SC
X-Proofpoint-ORIG-GUID: N70374PANbofJQlQ0r_A1y0ujcyt73SC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-06_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305060165
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 07, 2023 at 02:16:36AM +0530, Akhil P Oommen wrote:
> On Sat, May 06, 2023 at 08:16:21PM +0530, Akhil P Oommen wrote:
> > On Fri, May 05, 2023 at 12:35:18PM +0200, Konrad Dybcio wrote:
> > > 
> > > 
> > > On 5.05.2023 10:46, Akhil P Oommen wrote:
> > > > On Thu, May 04, 2023 at 08:34:07AM +0200, Konrad Dybcio wrote:
> > > >>
> > > >>
> > > >> On 3.05.2023 22:32, Akhil P Oommen wrote:
> > > >>> On Tue, May 02, 2023 at 11:40:26AM +0200, Konrad Dybcio wrote:
> > > >>>>
> > > >>>>
> > > >>>> On 2.05.2023 09:49, Akhil P Oommen wrote:
> > > >>>>> On Sat, Apr 01, 2023 at 01:54:43PM +0200, Konrad Dybcio wrote:
> > > >>>>>> Some (particularly SMD_RPM, a.k.a non-RPMh) SoCs implement A6XX GPUs
> > > >>>>>> but don't implement the associated GMUs. This is due to the fact that
> > > >>>>>> the GMU directly pokes at RPMh. Sadly, this means we have to take care
> > > >>>>>> of enabling & scaling power rails, clocks and bandwidth ourselves.
> > > >>>>>>
> > > >>>>>> Reuse existing Adreno-common code and modify the deeply-GMU-infused
> > > >>>>>> A6XX code to facilitate these GPUs. This involves if-ing out lots
> > > >>>>>> of GMU callbacks and introducing a new type of GMU - GMU wrapper (it's
> > > >>>>>> the actual name that Qualcomm uses in their downstream kernels).
> > > >>>>>>
> > > >>>>>> This is essentially a register region which is convenient to model
> > > >>>>>> as a device. We'll use it for managing the GDSCs. The register
> > > >>>>>> layout matches the actual GMU_CX/GX regions on the "real GMU" devices
> > > >>>>>> and lets us reuse quite a bit of gmu_read/write/rmw calls.
> > > >>>>> << I sent a reply to this patch earlier, but not sure where it went.
> > > >>>>> Still figuring out Mutt... >>
> > > >>>> Answered it here:
> > > >>>>
> > > >>>> https://lore.kernel.org/linux-arm-msm/4d3000c1-c3f9-0bfd-3eb3-23393f9a8f77@linaro.org/
> > > >>>
> > > >>> Thanks. Will check and respond there if needed.
> > > >>>
> > > >>>>
> > > >>>> I don't think I see any new comments in this "reply revision" (heh), so please
> > > >>>> check that one out.
> > > >>>>
> > > >>>>>
> > > >>>>> Only convenience I found is that we can reuse gmu register ops in a few
> > > >>>>> places (< 10 I think). If we just model this as another gpu memory
> > > >>>>> region, I think it will help to keep gmu vs gmu-wrapper/no-gmu
> > > >>>>> architecture code with clean separation. Also, it looks like we need to
> > > >>>>> keep a dummy gmu platform device in the devicetree with the current
> > > >>>>> approach. That doesn't sound right.
> > > >>>> That's correct, but.. if we switch away from that, VDD_GX/VDD_CX will
> > > >>>> need additional, gmuwrapper-configuration specific code anyway, as
> > > >>>> OPP & genpd will no longer make use of the default behavior which
> > > >>>> only gets triggered if there's a single power-domains=<> entry, afaicu.
> > > >>> Can you please tell me which specific *default behviour* do you mean here?
> > > >>> I am curious to know what I am overlooking here. We can always get a cxpd/gxpd device
> > > >>> and vote for the gdscs directly from the driver. Anything related to
> > > >>> OPP?
> > > >> I *believe* this is true:
> > > >>
> > > >> if (ARRAY_SIZE(power-domains) == 1) {
> > > >> 	of generic code will enable the power domain at .probe time
> > > > we need to handle the voting directly. I recently shared a patch to
> > > > vote cx gdsc from gpu driver. Maybe we can ignore this when gpu has
> > > > only cx rail due to this logic you quoted here.
> > > > 
> > > > I see that you have handled it mostly correctly from the gpu driver in the updated
> > > > a6xx_pm_suspend() callback. Just the power domain device ptrs should be moved to
> > > > gpu from gmu.
> > > > 
> > > >>
> > > >> 	opp APIs will default to scaling that domain with required-opps
> > > > 
> > > >> }
> > > >>
> > > >> and we do need to put GX/CX (with an MX parent to match) there, as the
> > > >> AP is responsible for voting in this configuration
> > > > 
> > > > We should vote to turn ON gx/cx headswitches through genpd from gpu driver. When you vote for
> > > > core clk frequency, *clock driver is supposed to scale* all the necessary
> > > > regulators. At least that is how downstream works. You can refer the downstream
> > > > gpucc clk driver of these SoCs. I am not sure how much of that can be easily converted to
> > > > upstream.
> > > > 
> > > > Also, how does having a gmu dt node help in this regard? Feel free to
> > > > elaborate, I am not very familiar with clk/regulator implementations.
> > > Okay so I think we have a bit of a confusion here.
> > > 
> > > Currently, with this patchset we manage things like this:
> > > 
> > > 1. GPU has a VDD_GX (or equivalent[1]) line passed in power-domains=<>, which
> > >    is then used with OPP APIs to ensure it's being scaled on freq change [2].
> > >    The VDD_lines coming from RPM(h) are described as power domains upstream
> > >    *unlike downstream*, which represents them as regulators with preset voltage
> > >    steps (and perhaps that's what had you confused). What's more is that GDSCs
> > >    are also modeled as genpds instead of regulators, hence they sort of "fight"
> > >    for the spot in power-domains=<> of a given node.
> > 
> > Thanks for clarifying. I didn't get this part "hence they sort of "fight" for the spot in power-domains".
> > What spot exactly did you mean here? The spot for PD to be used during scaling?
> > 
> > It seems like you are hinting that there is some sort of limitation in keeping all the
> > 3 power domains (cx gdsc, gx gdsc and cx rail) under the gpu node in dt. Please explain
> 
> Typo. I meant "(Cx gdsc, Gx gdsc and Gx/Cx rail)"
> 
> > why we can't keep all the 3 power domains under gpu node and call an API
> > (devm_pm_opp_attach_genpd() ??) to select the power domain which should be scaled?
> > 
> > > 
> > > 2. GMU wrapper gets CX_GDSC & GX_GDSC handles in power-domains=<> (just like
> > >    the real GMU in the current state of upstream [3]), which are then governed
> > >    through explicit genpd calls to turn them on/off when the GPU resume/suspend/
> > >    crash recovery functions are called.
> > > 
> > > 3. GPUs with GMU, like A630, don't get any power-domains=<> entries in DT,
> > >    instead relying on the GMU firmware to communicate necessary requests
> > >    to the VDD_xyz resources directly to RPMh, as part of the DVFS routines.
> > >    If GMU wasn't so smart, we would have to do the exact same VDD_xyz+OPP dance
> > >    there - that's precisely what's going on under the hood.
> > > 
> > > 4. Adreno SMMU gets a handle to CX_GDSC so that when OF probe funcs are called,
> > >    (and SMMUs probe way way before all things drm) the headswitch is de-asserted
> > >    and its registers and related clocks are accessible.
> > > 
> > > 
> > > All this makes me believe the way I generally architected things in
> > > this series is correct.
> > > 
> > > 
> > > [1] A610 (and I think A612) lack a VDD_GX line, so they power the GPU from
> > >     VDD_CX, but that's just an implementation detail which is handled by
> > >     simply passing the correct one in DTS, the code doesn't care.
> > > 
> > > [2] Hence my recent changes to use dev_pm_opp_set_rate() wherever possible,
> > >     this func reads requires-opps in OPP table entries and ensures to elevate
> > >     the GENPD's performance state before switching frequencies
> > > 
> > > [3] Please take a look at the "end product" here:
> > >     https://github.com/SoMainline/linux/commit/fb16757c3bf4c087ac597d70c7a98755d46bb323
> > >     you can open e.g. sdm845.dtsi for comparison with real GMU
> > 
> > This dt definition for a610 gpu clearly shows the issue I have here. Someone
> > looking at this gets a very wrong picture about the platform like there is actually nothing
> > resembling a gmu IP in a610. Is gmu or gmu-cx register region really present in this hw?
> > 
> > Just a side note about the dt file you shared:
> > 	1. At line: 1243, It shouldn't have gx gdsc, right?
ignore this one too. It can still have a gx gdsc.

> > 	2. At line: 1172, SM6115_VDDCX -> SM6115_VDDGX?
> Aah! ignore this. this gpu doesn't have Gx rail.
> 
> -Akhil
> > 
> > -Akhil
> > 
> > > 
> > > I hope this answers your concerns. If not, I'll be happy to elaborate.
> > > 
> > > Konrad
> > > > 
> > > > -Akhil.
> > > >>
> > > >> Konrad
> > > >>>
> > > >>> -Akhil
> > > >>>>
> > > >>>> If nothing else, this is a very convenient way to model a part of the
> > > >>>> GPU (as that's essentially what GMU_CX is, to my understanding) and
> > > >>>> the bindings people didn't shoot me in the head for proposing this, so
> > > >>>> I assume it'd be cool to pursue this..
> > > >>>>
> > > >>>> Konrad
> > > >>>>>>
> > > >>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > >>>>>> ---
> > > >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  72 +++++++-
> > > >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 255 +++++++++++++++++++++++++---
> > > >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
> > > >>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
> > > >>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   8 +-
> > > >>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |   6 +
> > > >>>>>>  6 files changed, 318 insertions(+), 38 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > >>>>>> index 87babbb2a19f..b1acdb027205 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > >>>>>> @@ -1469,6 +1469,7 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
> > > >>>>>>  
> > > >>>>>>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> > > >>>>>>  {
> > > >>>>>> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> > > >>>>>>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > > >>>>>>  	struct platform_device *pdev = to_platform_device(gmu->dev);
> > > >>>>>>  
> > > >>>>>> @@ -1494,10 +1495,12 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> > > >>>>>>  	gmu->mmio = NULL;
> > > >>>>>>  	gmu->rscc = NULL;
> > > >>>>>>  
> > > >>>>>> -	a6xx_gmu_memory_free(gmu);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> > > >>>>>> +		a6xx_gmu_memory_free(gmu);
> > > >>>>>>  
> > > >>>>>> -	free_irq(gmu->gmu_irq, gmu);
> > > >>>>>> -	free_irq(gmu->hfi_irq, gmu);
> > > >>>>>> +		free_irq(gmu->gmu_irq, gmu);
> > > >>>>>> +		free_irq(gmu->hfi_irq, gmu);
> > > >>>>>> +	}
> > > >>>>>>  
> > > >>>>>>  	/* Drop reference taken in of_find_device_by_node */
> > > >>>>>>  	put_device(gmu->dev);
> > > >>>>>> @@ -1516,6 +1519,69 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
> > > >>>>>>  	return 0;
> > > >>>>>>  }
> > > >>>>>>  
> > > >>>>>> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> > > >>>>>> +{
> > > >>>>>> +	struct platform_device *pdev = of_find_device_by_node(node);
> > > >>>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > > >>>>>> +	int ret;
> > > >>>>>> +
> > > >>>>>> +	if (!pdev)
> > > >>>>>> +		return -ENODEV;
> > > >>>>>> +
> > > >>>>>> +	gmu->dev = &pdev->dev;
> > > >>>>>> +
> > > >>>>>> +	of_dma_configure(gmu->dev, node, true);
> > > >>>>> why setup dma for a device that is not actually present?
> > > >>>>>> +
> > > >>>>>> +	pm_runtime_enable(gmu->dev);
> > > >>>>>> +
> > > >>>>>> +	/* Mark legacy for manual SPTPRAC control */
> > > >>>>>> +	gmu->legacy = true;
> > > >>>>>> +
> > > >>>>>> +	/* Map the GMU registers */
> > > >>>>>> +	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
> > > >>>>>> +	if (IS_ERR(gmu->mmio)) {
> > > >>>>>> +		ret = PTR_ERR(gmu->mmio);
> > > >>>>>> +		goto err_mmio;
> > > >>>>>> +	}
> > > >>>>>> +
> > > >>>>>> +	gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
> > > >>>>>> +	if (IS_ERR(gmu->cxpd)) {
> > > >>>>>> +		ret = PTR_ERR(gmu->cxpd);
> > > >>>>>> +		goto err_mmio;
> > > >>>>>> +	}
> > > >>>>>> +
> > > >>>>>> +	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
> > > >>>>>> +		ret = -ENODEV;
> > > >>>>>> +		goto detach_cxpd;
> > > >>>>>> +	}
> > > >>>>>> +
> > > >>>>>> +	init_completion(&gmu->pd_gate);
> > > >>>>>> +	complete_all(&gmu->pd_gate);
> > > >>>>>> +	gmu->pd_nb.notifier_call = cxpd_notifier_cb;
> > > >>>>>> +
> > > >>>>>> +	/* Get a link to the GX power domain to reset the GPU */
> > > >>>>>> +	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
> > > >>>>>> +	if (IS_ERR(gmu->gxpd)) {
> > > >>>>>> +		ret = PTR_ERR(gmu->gxpd);
> > > >>>>>> +		goto err_mmio;
> > > >>>>>> +	}
> > > >>>>>> +
> > > >>>>>> +	gmu->initialized = true;
> > > >>>>>> +
> > > >>>>>> +	return 0;
> > > >>>>>> +
> > > >>>>>> +detach_cxpd:
> > > >>>>>> +	dev_pm_domain_detach(gmu->cxpd, false);
> > > >>>>>> +
> > > >>>>>> +err_mmio:
> > > >>>>>> +	iounmap(gmu->mmio);
> > > >>>>>> +
> > > >>>>>> +	/* Drop reference taken in of_find_device_by_node */
> > > >>>>>> +	put_device(gmu->dev);
> > > >>>>>> +
> > > >>>>>> +	return ret;
> > > >>>>>> +}
> > > >>>>>> +
> > > >>>>>>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> > > >>>>>>  {
> > > >>>>>>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > >>>>>> index 931f9f3b3a85..8e0345ffab81 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > >>>>>> @@ -20,9 +20,11 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
> > > >>>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >>>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > > >>>>>>  
> > > >>>>>> -	/* Check that the GMU is idle */
> > > >>>>>> -	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> > > >>>>>> -		return false;
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> > > >>>>>> +		/* Check that the GMU is idle */
> > > >>>>>> +		if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> > > >>>>>> +			return false;
> > > >>>>>> +	}
> > > >>>>>>  
> > > >>>>>>  	/* Check tha the CX master is idle */
> > > >>>>>>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS) &
> > > >>>>>> @@ -612,13 +614,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
> > > >>>>>>  		return;
> > > >>>>>>  
> > > >>>>>>  	/* Disable SP clock before programming HWCG registers */
> > > >>>>>> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
> > > >>>>>>  
> > > >>>>>>  	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
> > > >>>>>>  		gpu_write(gpu, reg->offset, state ? reg->value : 0);
> > > >>>>>>  
> > > >>>>>>  	/* Enable SP clock */
> > > >>>>>> -	gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
> > > >>>>>>  
> > > >>>>>>  	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
> > > >>>>>>  }
> > > >>>>>> @@ -1018,10 +1022,13 @@ static int hw_init(struct msm_gpu *gpu)
> > > >>>>>>  {
> > > >>>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >>>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > > >>>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > > >>>>>>  	int ret;
> > > >>>>>>  
> > > >>>>>> -	/* Make sure the GMU keeps the GPU on while we set it up */
> > > >>>>>> -	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> > > >>>>>> +		/* Make sure the GMU keeps the GPU on while we set it up */
> > > >>>>>> +		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> > > >>>>>> +	}
> > > >>>>>>  
> > > >>>>>>  	/* Clear GBIF halt in case GX domain was not collapsed */
> > > >>>>>>  	if (a6xx_has_gbif(adreno_gpu))
> > > >>>>>> @@ -1144,6 +1151,17 @@ static int hw_init(struct msm_gpu *gpu)
> > > >>>>>>  			0x3f0243f0);
> > > >>>>>>  	}
> > > >>>>>>  
> > > >>>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> > > >>>>>> +		/* Do it here, as GMU wrapper only inits the GMU for memory reservation etc. */
> > > >>>>>> +
> > > >>>>>> +		/* Set up the CX GMU counter 0 to count busy ticks */
> > > >>>>>> +		gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GPU_CX_BUSY_MASK, 0xff000000);
> > > >>>>>> +
> > > >>>>>> +		/* Enable power counter 0 */
> > > >>>>>> +		gmu_rmw(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_0, 0xff, BIT(5));
> > > >>>>>> +		gmu_write(gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_ENABLE, 1);
> > > >>>>>> +	}
> > > >>>>>> +
> > > >>>>>>  	/* Protect registers from the CP */
> > > >>>>>>  	a6xx_set_cp_protect(gpu);
> > > >>>>>>  
> > > >>>>>> @@ -1233,6 +1251,8 @@ static int hw_init(struct msm_gpu *gpu)
> > > >>>>>>  	}
> > > >>>>>>  
> > > >>>>>>  out:
> > > >>>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		return ret;
> > > >>>>>>  	/*
> > > >>>>>>  	 * Tell the GMU that we are done touching the GPU and it can start power
> > > >>>>>>  	 * management
> > > >>>>>> @@ -1267,6 +1287,9 @@ static void a6xx_dump(struct msm_gpu *gpu)
> > > >>>>>>  	adreno_dump(gpu);
> > > >>>>>>  }
> > > >>>>>>  
> > > >>>>>> +#define GBIF_GX_HALT_MASK	BIT(0)
> > > >>>>>> +#define GBIF_CLIENT_HALT_MASK	BIT(0)
> > > >>>>>> +#define GBIF_ARB_HALT_MASK	BIT(1)
> > > >>>>>>  #define VBIF_RESET_ACK_TIMEOUT	100
> > > >>>>>>  #define VBIF_RESET_ACK_MASK	0x00f0
> > > >>>>>>  
> > > >>>>>> @@ -1299,7 +1322,8 @@ static void a6xx_recover(struct msm_gpu *gpu)
> > > >>>>>>  	 * Turn off keep alive that might have been enabled by the hang
> > > >>>>>>  	 * interrupt
> > > >>>>>>  	 */
> > > >>>>>> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> > > >>>>>
> > > >>>>> Maybe it is better to move this to a6xx_gmu_force_power_off.
> > > >>>>>
> > > >>>>>>  
> > > >>>>>>  	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
> > > >>>>>>  
> > > >>>>>> @@ -1329,6 +1353,32 @@ static void a6xx_recover(struct msm_gpu *gpu)
> > > >>>>>>  
> > > >>>>>>  	dev_pm_genpd_remove_notifier(gmu->cxpd);
> > > >>>>>>  
> > > >>>>>> +	/* Software-reset the GPU */
> > > >>>>>
> > > >>>>> This is not soft reset sequence. We are trying to quiescent gpu - ddr
> > > >>>>> traffic with this sequence.
> > > >>>>>
> > > >>>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> > > >>>>>> +		/* Halt the GX side of GBIF */
> > > >>>>>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
> > > >>>>>> +		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
> > > >>>>>> +			   GBIF_GX_HALT_MASK);
> > > >>>>>> +
> > > >>>>>> +		/* Halt new client requests on GBIF */
> > > >>>>>> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> > > >>>>>> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> > > >>>>>> +			   (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
> > > >>>>>> +
> > > >>>>>> +		/* Halt all AXI requests on GBIF */
> > > >>>>>> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> > > >>>>>> +		spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> > > >>>>>> +			   (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
> > > >>>>>> +
> > > >>>>>> +		/* Clear the halts */
> > > >>>>>> +		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > > >>>>>> +
> > > >>>>>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> > > >>>>>> +
> > > >>>>>> +		/* This *really* needs to go through before we do anything else! */
> > > >>>>>> +		mb();
> > > >>>>>> +	}
> > > >>>>>> +
> > > >>>>>
> > > >>>>> This sequence should be before we collapse cx gdsc. Also, please see if
> > > >>>>> we can create a subroutine to avoid code dup.
> > > >>>>>
> > > >>>>>>  	pm_runtime_use_autosuspend(&gpu->pdev->dev);
> > > >>>>>>  
> > > >>>>>>  	if (active_submits)
> > > >>>>>> @@ -1463,7 +1513,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
> > > >>>>>>  	 * Force the GPU to stay on until after we finish
> > > >>>>>>  	 * collecting information
> > > >>>>>>  	 */
> > > >>>>>> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> > > >>>>>>  
> > > >>>>>>  	DRM_DEV_ERROR(&gpu->pdev->dev,
> > > >>>>>>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
> > > >>>>>> @@ -1624,7 +1675,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
> > > >>>>>>  		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
> > > >>>>>>  }
> > > >>>>>>  
> > > >>>>>> -static int a6xx_pm_resume(struct msm_gpu *gpu)
> > > >>>>>> +static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
> > > >>>>>>  {
> > > >>>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >>>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > > >>>>>> @@ -1644,10 +1695,61 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
> > > >>>>>>  
> > > >>>>>>  	a6xx_llc_activate(a6xx_gpu);
> > > >>>>>>  
> > > >>>>>> -	return 0;
> > > >>>>>> +	return ret;
> > > >>>>>>  }
> > > >>>>>>  
> > > >>>>>> -static int a6xx_pm_suspend(struct msm_gpu *gpu)
> > > >>>>>> +static int a6xx_pm_resume(struct msm_gpu *gpu)
> > > >>>>>> +{
> > > >>>>>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >>>>>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > > >>>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > > >>>>>> +	unsigned long freq = 0;
> > > >>>>>> +	struct dev_pm_opp *opp;
> > > >>>>>> +	int ret;
> > > >>>>>> +
> > > >>>>>> +	gpu->needs_hw_init = true;
> > > >>>>>> +
> > > >>>>>> +	trace_msm_gpu_resume(0);
> > > >>>>>> +
> > > >>>>>> +	mutex_lock(&a6xx_gpu->gmu.lock);
> > > >>>>> I think we can ignore gmu lock as there is no real gmu device.
> > > >>>>>
> > > >>>>>> +
> > > >>>>>> +	pm_runtime_resume_and_get(gmu->dev);
> > > >>>>>> +	pm_runtime_resume_and_get(gmu->gxpd);
> > > >>>>>> +
> > > >>>>>> +	/* Set the core clock, having VDD scaling in mind */
> > > >>>>>> +	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, gpu->fast_rate);
> > > >>>>>> +	if (ret)
> > > >>>>>> +		goto err_core_clk;
> > > >>>>>> +
> > > >>>>>> +	ret = clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> > > >>>>>> +	if (ret)
> > > >>>>>> +		goto err_bulk_clk;
> > > >>>>>> +
> > > >>>>>> +	ret = clk_prepare_enable(gpu->ebi1_clk);
> > > >>>>>> +	if (ret)
> > > >>>>>> +		goto err_mem_clk;
> > > >>>>>> +
> > > >>>>>> +	/* If anything goes south, tear the GPU down piece by piece.. */
> > > >>>>>> +	if (ret) {
> > > >>>>>> +err_mem_clk:
> > > >>>>>> +		clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
> > > >>>>>> +err_bulk_clk:
> > > >>>>>> +		opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> > > >>>>>> +		dev_pm_opp_put(opp);
> > > >>>>>> +		dev_pm_opp_set_rate(&gpu->pdev->dev, 0);
> > > >>>>>> +err_core_clk:
> > > >>>>>> +		pm_runtime_put(gmu->gxpd);
> > > >>>>>> +		pm_runtime_put(gmu->dev);
> > > >>>>>> +	}
> > > >>>>>> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> > > >>>>>> +
> > > >>>>>> +	if (!ret)
> > > >>>>>> +		msm_devfreq_resume(gpu);
> > > >>>>>> +
> > > >>>>>> +	return ret;
> > > >>>>>> +}
> > > >>>>>> +
> > > >>>>>> +static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
> > > >>>>>>  {
> > > >>>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >>>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > > >>>>>> @@ -1674,11 +1776,62 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
> > > >>>>>>  	return 0;
> > > >>>>>>  }
> > > >>>>>>  
> > > >>>>>> +static int a6xx_pm_suspend(struct msm_gpu *gpu)
> > > >>>>>> +{
> > > >>>>>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >>>>>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > > >>>>>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > > >>>>>> +	unsigned long freq = 0;
> > > >>>>>> +	struct dev_pm_opp *opp;
> > > >>>>>> +	int i, ret;
> > > >>>>>> +
> > > >>>>>> +	trace_msm_gpu_suspend(0);
> > > >>>>>> +
> > > >>>>>> +	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> > > >>>>>> +	dev_pm_opp_put(opp);
> > > >>>>>> +
> > > >>>>>> +	msm_devfreq_suspend(gpu);
> > > >>>>>> +
> > > >>>>>> +	mutex_lock(&a6xx_gpu->gmu.lock);
> > > >>>>>> +
> > > >>>>>> +	clk_disable_unprepare(gpu->ebi1_clk);
> > > >>>>>> +
> > > >>>>>> +	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
> > > >>>>>> +
> > > >>>>>> +	/* Set frequency to the minimum supported level (no 27MHz on A6xx!) */
> > > >>>>>> +	ret = dev_pm_opp_set_rate(&gpu->pdev->dev, freq);
> > > >>>>>> +	if (ret)
> > > >>>>>> +		goto err;
> > > >>>>>> +
> > > >>>>>> +	pm_runtime_put_sync(gmu->gxpd);
> > > >>>>>> +	pm_runtime_put_sync(gmu->dev);
> > > >>>>>> +
> > > >>>>>> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> > > >>>>>> +
> > > >>>>>> +	if (a6xx_gpu->shadow_bo)
> > > >>>>>> +		for (i = 0; i < gpu->nr_rings; i++)
> > > >>>>>> +			a6xx_gpu->shadow[i] = 0;
> > > >>>>>> +
> > > >>>>>> +	gpu->suspend_count++;
> > > >>>>>> +
> > > >>>>>> +	return 0;
> > > >>>>>> +
> > > >>>>>> +err:
> > > >>>>>> +	mutex_unlock(&a6xx_gpu->gmu.lock);
> > > >>>>>> +
> > > >>>>>> +	return ret;
> > > >>>>>> +}
> > > >>>>>> +
> > > >>>>>>  static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
> > > >>>>>>  {
> > > >>>>>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > > >>>>>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > > >>>>>>  
> > > >>>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu)) {
> > > >>>>>> +		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
> > > >>>>>> +		return 0;
> > > >>>>>> +	}
> > > >>>>>> +
> > > >>>>> Instead of wrapper check here, we can just create a separate op. I don't
> > > >>>>> see any benefit in reusing the same function here.
> > > >>>>>
> > > >>>>>
> > > >>>>>>  	mutex_lock(&a6xx_gpu->gmu.lock);
> > > >>>>>>  
> > > >>>>>>  	/* Force the GPU power on so we can read this register */
> > > >>>>>> @@ -1716,7 +1869,8 @@ static void a6xx_destroy(struct msm_gpu *gpu)
> > > >>>>>>  		drm_gem_object_put(a6xx_gpu->shadow_bo);
> > > >> 6xx_pm_suspend >>>>  	}
> > > >>>>>>  
> > > >>>>>> -	a6xx_llc_slices_destroy(a6xx_gpu);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		a6xx_llc_slices_destroy(a6xx_gpu);
> > > >>>>>>  
> > > >>>>>>  	mutex_lock(&a6xx_gpu->gmu.lock);
> > > >>>>>>  	a6xx_gmu_remove(a6xx_gpu);
> > > >>>>>> @@ -1957,8 +2111,8 @@ static const struct adreno_gpu_funcs funcs = {
> > > >>>>>>  		.set_param = adreno_set_param,
> > > >>>>>>  		.hw_init = a6xx_hw_init,
> > > >>>>>>  		.ucode_load = a6xx_ucode_load,
> > > >>>>>> -		.pm_suspend = a6xx_pm_suspend,
> > > >>>>>> -		.pm_resume = a6xx_pm_resume,
> > > >>>>>> +		.pm_suspend = a6xx_gmu_pm_suspend,
> > > >>>>>> +		.pm_resume = a6xx_gmu_pm_resume,
> > > >>>>>>  		.recover = a6xx_recover,
> > > >>>>>>  		.submit = a6xx_submit,
> > > >>>>>>  		.active_ring = a6xx_active_ring,
> > > >>>>>> @@ -1982,6 +2136,35 @@ static const struct adreno_gpu_funcs funcs = {
> > > >>>>>>  	.get_timestamp = a6xx_get_timestamp,
> > > >>>>>>  };
> > > >>>>>>  
> > > >>>>>> +static const struct adreno_gpu_funcs funcs_gmuwrapper = {
> > > >>>>>> +	.base = {
> > > >>>>>> +		.get_param = adreno_get_param,
> > > >>>>>> +		.set_param = adreno_set_param,
> > > >>>>>> +		.hw_init = a6xx_hw_init,
> > > >>>>>> +		.ucode_load = a6xx_ucode_load,
> > > >>>>>> +		.pm_suspend = a6xx_pm_suspend,
> > > >>>>>> +		.pm_resume = a6xx_pm_resume,
> > > >>>>>> +		.recover = a6xx_recover,
> > > >>>>>> +		.submit = a6xx_submit,
> > > >>>>>> +		.active_ring = a6xx_active_ring,
> > > >>>>>> +		.irq = a6xx_irq,
> > > >>>>>> +		.destroy = a6xx_destroy,
> > > >>>>>> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> > > >>>>>> +		.show = a6xx_show,
> > > >>>>>> +#endif
> > > >>>>>> +		.gpu_busy = a6xx_gpu_busy,
> > > >>>>>> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> > > >>>>>> +		.gpu_state_get = a6xx_gpu_state_get,
> > > >>>>>> +		.gpu_state_put = a6xx_gpu_state_put,
> > > >>>>>> +#endif
> > > >>>>>> +		.create_address_space = a6xx_create_address_space,
> > > >>>>>> +		.create_private_address_space = a6xx_create_private_address_space,
> > > >>>>>> +		.get_rptr = a6xx_get_rptr,
> > > >>>>>> +		.progress = a6xx_progress,
> > > >>>>>> +	},
> > > >>>>>> +	.get_timestamp = a6xx_get_timestamp,
> > > >>>>>> +};
> > > >>>>>> +
> > > >>>>>>  struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > >>>>>>  {
> > > >>>>>>  	struct msm_drm_private *priv = dev->dev_private;
> > > >>>>>> @@ -2003,18 +2186,36 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > >>>>>>  
> > > >>>>>>  	adreno_gpu->registers = NULL;
> > > >>>>>>  
> > > >>>>>> +	/* Check if there is a GMU phandle and set it up */
> > > >>>>>> +	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> > > >>>>>> +	/* FIXME: How do we gracefully handle this? */
> > > >>>>>> +	BUG_ON(!node);
> > > >>>>> How will you handle this BUG() when there is no GMU (a610 gpu)?
> > > >>>>>
> > > >>>>>> +
> > > >>>>>> +	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
> > > >>>>>> +
> > > >>>>>>  	/*
> > > >>>>>>  	 * We need to know the platform type before calling into adreno_gpu_init
> > > >>>>>>  	 * so that the hw_apriv flag can be correctly set. Snoop into the info
> > > >>>>>>  	 * and grab the revision number
> > > >>>>>>  	 */
> > > >>>>>>  	info = adreno_info(config->rev);
> > > >>>>>> -
> > > >>>>>> -	if (info && (info->revn == 650 || info->revn == 660 ||
> > > >>>>>> -			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
> > > >>>>>> +	if (!info)
> > > >>>>>> +		return ERR_PTR(-EINVAL);
> > > >>>>>> +
> > > >>>>>> +	/* Assign these early so that we can use the is_aXYZ helpers */
> > > >>>>>> +	/* Numeric revision IDs (e.g. 630) */
> > > >>>>>> +	adreno_gpu->revn = info->revn;
> > > >>>>>> +	/* New-style ADRENO_REV()-only */
> > > >>>>>> +	adreno_gpu->rev = info->rev;
> > > >>>>>> +	/* Quirk data */
> > > >>>>>> +	adreno_gpu->info = info;
> > > >>>>>> +
> > > >>>>>> +	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
> > > >>>>>>  		adreno_gpu->base.hw_apriv = true;
> > > >>>>>>  
> > > >>>>>> -	a6xx_llc_slices_init(pdev, a6xx_gpu);
> > > >>>>>> +	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		a6xx_llc_slices_init(pdev, a6xx_gpu);
> > > >>>>>>  
> > > >>>>>>  	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
> > > >>>>>>  	if (ret) {
> > > >>>>>> @@ -2022,7 +2223,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > >>>>>>  		return ERR_PTR(ret);
> > > >>>>>>  	}
> > > >>>>>>  
> > > >>>>>> -	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> > > >>>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
> > > >>>>>> +	else
> > > >>>>>> +		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
> > > >>>>>>  	if (ret) {
> > > >>>>>>  		a6xx_destroy(&(a6xx_gpu->base.base));
> > > >>>>>>  		return ERR_PTR(ret);
> > > >>>>>> @@ -2035,13 +2239,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > >>>>>>  	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
> > > >>>>>>  		priv->gpu_clamp_to_idle = true;
> > > >>>>>>  
> > > >>>>>> -	/* Check if there is a GMU phandle and set it up */
> > > >>>>>> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> > > >>>>>> -
> > > >>>>>> -	/* FIXME: How do we gracefully handle this? */
> > > >>>>>> -	BUG_ON(!node);
> > > >>>>>> -
> > > >>>>>> -	ret = a6xx_gmu_init(a6xx_gpu, node);
> > > >>>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> > > >>>>>> +		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
> > > >>>>>> +	else
> > > >>>>>> +		ret = a6xx_gmu_init(a6xx_gpu, node);
> > > >>>>>>  	of_node_put(node);
> > > >>>>>>  	if (ret) {
> > > >>>>>>  		a6xx_destroy(&(a6xx_gpu->base.base));
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > >>>>>> index eea2e60ce3b7..51a7656072fa 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > >>>>>> @@ -76,6 +76,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
> > > >>>>>>  void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
> > > >>>>>>  
> > > >>>>>>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> > > >>>>>> +int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> > > >>>>>>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
> > > >>>>>>  
> > > >>>>>>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > >>>>>> index 30ecdff363e7..4e5d650578c6 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > >>>>>> @@ -1041,16 +1041,18 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
> > > >>>>>>  	/* Get the generic state from the adreno core */
> > > >>>>>>  	adreno_gpu_state_get(gpu, &a6xx_state->base);
> > > >>>>>>  
> > > >>>>>> -	a6xx_get_gmu_registers(gpu, a6xx_state);
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
> > > >>>>> nit: Kinda misleading function name to a layman. Should we invert the
> > > >>>>> function to "adreno_has_gmu"?
> > > >>>>>
> > > >>>>> -Akhil
> > > >>>>>> +		a6xx_get_gmu_registers(gpu, a6xx_state);
> > > >>>>>>  
> > > >>>>>> -	a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> > > >>>>>> -	a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> > > >>>>>> -	a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
> > > >>>>>> +		a6xx_state->gmu_log = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.log);
> > > >>>>>> +		a6xx_state->gmu_hfi = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.hfi);
> > > >>>>>> +		a6xx_state->gmu_debug = a6xx_snapshot_gmu_bo(a6xx_state, &a6xx_gpu->gmu.debug);
> > > >>>>>>  
> > > >>>>>> -	a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> > > >>>>>> +		a6xx_snapshot_gmu_hfi_history(gpu, a6xx_state);
> > > >>>>>> +	}
> > > >>>>>>  
> > > >>>>>>  	/* If GX isn't on the rest of the data isn't going to be accessible */
> > > >>>>>> -	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
> > > >>>>>> +	if (!adreno_has_gmu_wrapper(adreno_gpu) && !a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
> > > >>>>>>  		return &a6xx_state->base;
> > > >>>>>>  
> > > >>>>>>  	/* Get the banks of indexed registers */
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > >>>>>> index 6934cee07d42..5c5901d65950 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > >>>>>> @@ -528,6 +528,10 @@ int adreno_load_fw(struct adreno_gpu *adreno_gpu)
> > > >>>>>>  		if (!adreno_gpu->info->fw[i])
> > > >>>>>>  			continue;
> > > >>>>>>  
> > > >>>>>> +		/* Skip loading GMU firwmare with GMU Wrapper */
> > > >>>>>> +		if (adreno_has_gmu_wrapper(adreno_gpu) && i == ADRENO_FW_GMU)
> > > >>>>>> +			continue;
> > > >>>>>> +
> > > >>>>>>  		/* Skip if the firmware has already been loaded */
> > > >>>>>>  		if (adreno_gpu->fw[i])
> > > >>>>>>  			continue;
> > > >>>>>> @@ -1074,8 +1078,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> > > >>>>>>  	u32 speedbin;
> > > >>>>>>  	int ret;
> > > >>>>>>  
> > > >>>>>> -	/* Only handle the core clock when GMU is not in use */
> > > >>>>>> -	if (config->rev.core < 6) {
> > > >>>>>> +	/* Only handle the core clock when GMU is not in use (or is absent). */
> > > >>>>>> +	if (adreno_has_gmu_wrapper(adreno_gpu) || config->rev.core < 6) {
> > > >>>>>>  		/*
> > > >>>>>>  		 * This can only be done before devm_pm_opp_of_add_table(), or
> > > >>>>>>  		 * dev_pm_opp_set_config() will WARN_ON()
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > >>>>>> index f62612a5c70f..ee5352bc5329 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > >>>>>> @@ -115,6 +115,7 @@ struct adreno_gpu {
> > > >>>>>>  	 * code (a3xx_gpu.c) and stored in this common location.
> > > >>>>>>  	 */
> > > >>>>>>  	const unsigned int *reg_offsets;
> > > >>>>>> +	bool gmu_is_wrapper;
> > > >>>>>>  };
> > > >>>>>>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> > > >>>>>>  
> > > >>>>>> @@ -145,6 +146,11 @@ struct adreno_platform_config {
> > > >>>>>>  
> > > >>>>>>  bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
> > > >>>>>>  
> > > >>>>>> +static inline bool adreno_has_gmu_wrapper(struct adreno_gpu *gpu)
> > > >>>>>> +{
> > > >>>>>> +	return gpu->gmu_is_wrapper;
> > > >>>>>> +}
> > > >>>>>> +
> > > >>>>>>  static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
> > > >>>>>>  {
> > > >>>>>>  	return (gpu->revn < 300);
> > > >>>>>>
> > > >>>>>> -- 
> > > >>>>>> 2.40.0
> > > >>>>>>
