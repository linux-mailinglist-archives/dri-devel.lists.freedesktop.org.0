Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD3F562CBC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8331120FA;
	Fri,  1 Jul 2022 07:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Thu, 30 Jun 2022 20:24:26 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07611139E3;
 Thu, 30 Jun 2022 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1656620309;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=jTBh8tpUX4wS523jclqgriqIEwT1It3h9ZxxUKd4K3w=;
 b=Ubkd7PR1Ml9pFUB48ByHTQBPaguLqxqeSK12bVHkWL2V9we8Jt5qg2tlBtN3Qj+iA5
 uj0IBBU6CIvZ3wLV3XTF7IbLPmzLCkC1HtBRggADtkVPxkEEXnIiDjXCfav8Nbgc2bVj
 UsWplxEZeXbc8sQHefmniQzlrBeO9pbO8VP6jyBMK5C28sQCZabngGbKNS28WCyXaYBk
 2dm3Utv2GjXq/22ZVHzx5RLnYjna6G6P+6BfS4DRjWQg0jud45UHneKV56zsVQtLjxkW
 9Nt/lkjjXTTF1jl4MZ5oX7ok1LUttsTZQnQpG2di36RkyvNobO/Fl5ZJfp8ovbcAnRCO
 VMhg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrK8+86Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.46.1 AUTH)
 with ESMTPSA id yfdd30y5UKIS4u1
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 30 Jun 2022 22:18:28 +0200 (CEST)
Date: Thu, 30 Jun 2022 22:18:13 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Freedreno] [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains
 constraint
Message-ID: <Yr4E+AsXRBZuYCpx@gerhold.net>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
 <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
 <054043a5-3643-aa5b-4204-8cacb7b3ae9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <054043a5-3643-aa5b-4204-8cacb7b3ae9a@linaro.org>
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, dmitry.baryshkov@linaro.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 08:49:03PM +0100, Bryan O'Donoghue wrote:
> On 30/06/2022 20:01, Krzysztof Kozlowski wrote:
> > On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> > > The existing msm8916.dtsi does not depend on nor require power-domains.
> > > Drop from the list of required.
> > 
> > That's not good reason. The bindings are about hardware so the question
> > is whether being a part of power domain or toggling power domain on/off
> > is considered required for the DSI.
> 
> AFAIK no but, I will check this again and if it is definitely not required,
> I'll churn the commit log to describe it better.
> 

The power domain in the DSI node is used together with the OPP table to
vote for performance states depending on the clock frequency of the byte
clock. In the downstream kernel this is part of the clock driver.
In mainline this needs to be done in the consumer driver.

The MSM8916 port was never really optimized for power usage. With
incomplete interconnect support etc the power domains tend to be at
maximum state most of the time, so it does not cause any issues if you
forget to vote for performance states in some places.

In general, the situation on MSM8916/MSM8939 is not really any different
from newer SoCs. The downstream MSM8916 gcc driver contains:

static struct rcg_clk byte0_clk_src = {
	/* ... */
	.c = {
		/* ... */
		VDD_DIG_FMAX_MAP2(LOW, 94400000, NOMINAL, 188500000),
	},
};

which should be ideally translated into an OPP table with
power-domains = <&rpmpd MSM8916_VDDCX>; similar to newer SoCs.

(I'm not saying that "power-domains" should be required, just that it
 could be added for MSM8916/MSM8939 if someone wants to properly
 power-optimize them...)

Thanks,
Stephan
