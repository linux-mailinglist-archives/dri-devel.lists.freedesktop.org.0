Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC6AADC4B4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 10:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B25C10E02B;
	Tue, 17 Jun 2025 08:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g/QB2ICS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722810E02B;
 Tue, 17 Jun 2025 08:27:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0331F629FC;
 Tue, 17 Jun 2025 08:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B566C4CEED;
 Tue, 17 Jun 2025 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750148837;
 bh=wFWNddruW+kvHK/NOURMNgfhmqAjINHuhoKUoDLtdD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/QB2ICSsqBe4u9VRM1R1/6wN38bWi3oSH/ONJztU5yH5nKrJkBMlmGqo25o9w41u
 xvwiZLIaAghu1czqfHoCtxoOSotW0Twmj8KjqJsvdCSxVrjZagZIIPmQW+YvkDYJWV
 MW/qAhf9m3t3KxDDljBMRJny7SxfxpPtMWZoCvRRwbG6EmMPShXsyclP30RcIQPSlD
 GtoO7tPTbX9eRIrJLvb1e6WfvLVr6TQVrBmqJxvSXaLyBpJIaVI7JMRNdAojw2/wrw
 FsiY9doFsvRjVN+LfmKq8l2o6ut5rtORUYeTYgW+x0QgZVBQH6+FqALahoL3SuwMzj
 GYYvoiH00GwgQ==
Date: Tue, 17 Jun 2025 10:27:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
Message-ID: <20250617-ambrosial-amphibian-oyster-ae7cae@kuoka>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
 <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
 <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
 <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
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

On Mon, Jun 16, 2025 at 10:18:24PM GMT, Akhil P Oommen wrote:
> On 6/12/2025 4:59 PM, Krzysztof Kozlowski wrote:
> > On 11/06/2025 14:24, Akhil P Oommen wrote:
> >>>>  
> >>>>  patternProperties:
> >>>> -  '^opp-[0-9]+$':
> >>>> +  '^opp(-?[0-9]+)*$':
> >>>
> >>> Not correct regex. You allow "opp", "opp1" and all other unusual
> >>> variants. Commit does not explain what problem you are solving, so I
> >>> have no clue what you want here, but for sure opp1 is wrong.
> >>
> >> Just to confirm, would this be fine for the requirement I mentioned above?
> >>
> >> "'^opp(-[0-9]+)*$'"
> > 
> > No, You did not solve half of the problems - still allows "opp" and
> > commit msg does not explain why "opp" is now correct. Describe the
> > actual problem and then write the regex solving it in specific way, not
> > causing other effects.
> 
> Gotcha. If we want to be super strict, the regex should be:
> ^opp(-[0-9]+){1,2}$
> 

Yes, looks good.

Best regards,
Krzysztof

