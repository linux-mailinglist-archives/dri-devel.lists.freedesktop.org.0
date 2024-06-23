Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F23913E2B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D962B10E0F4;
	Sun, 23 Jun 2024 20:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UQrA+qtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60ED210E0F4;
 Sun, 23 Jun 2024 20:40:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 77232CE0285;
 Sun, 23 Jun 2024 20:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0691C2BD10;
 Sun, 23 Jun 2024 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719175209;
 bh=tj/EudJXsZOT2efyTYXHY7WkzBrobh+sIFmq3i/Im6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQrA+qtIMxBAAwsnaggl+2jcNGdXPRXCavxFeYtsXEacUxTi3DSNWD0oBx3Li/YXY
 cCAj3YMIWrKdFFVDqFhdVAajXNjD/I/UkJS7E1IKb8mLcapqVVVnYqquWy/m030a6i
 PnhiGRlCje4E8pbha5SP7EMj/G7bajr0oIp1J9KsdVN71APP3yIIPpsQKzTvFCAJdw
 DCcLINRKXkwxcI7C4WcbGaUsOsI8DsX0i13uq+f7AkqxR9y35sqsi6Q15CPESFGsMJ
 d/nGJi+LyZK9SGdSxvfxEAiAsfudO5u9yLedLFlatIGTuHyIEfJfHjfmh1ExxLCe1p
 bnXK+9cVg3Qew==
Date: Sun, 23 Jun 2024 15:40:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <mmqji5hcfa6eegx2kdjkcy4hsoybtp25bgjsn2ol6dcdw2cgs5@fw3i3ufjkj3z>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <a458a3a7-2b6d-4032-949c-b2c021d339e8@kernel.org>
 <20240623122856.kqf4x6mft74hzk7y@hu-akhilpo-hyd.qualcomm.com>
 <7d69e98d-a870-4200-8f22-2a16fcf02794@kernel.org>
 <20240623151630.bskqwqhp25mu3yuf@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623151630.bskqwqhp25mu3yuf@hu-akhilpo-hyd.qualcomm.com>
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

On Sun, Jun 23, 2024 at 08:46:30PM GMT, Akhil P Oommen wrote:
> On Sun, Jun 23, 2024 at 02:53:17PM +0200, Krzysztof Kozlowski wrote:
> > On 23/06/2024 14:28, Akhil P Oommen wrote:
> > > On Sun, Jun 23, 2024 at 01:17:16PM +0200, Krzysztof Kozlowski wrote:
> > >> On 23/06/2024 13:06, Akhil P Oommen wrote:
> > >>> Add the necessary dt nodes for gpu support in X1E80100.
> > >>>
> > >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > >>> ---
> > >>> +		gmu: gmu@3d6a000 {
> > >>> +			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
> > >>> +			reg = <0x0 0x03d50000 0x0 0x10000>,
> > >>> +			      <0x0 0x03d6a000 0x0 0x35000>,
> > >>> +			      <0x0 0x0b280000 0x0 0x10000>;
> > >>> +			reg-names =  "rscc", "gmu", "gmu_pdc";
> > >>
> > >> Really, please start testing your patches. Your internal instructions
> > >> tells you to do that, so please follow it carefully. Don't use the
> > >> community as the tool, because you do not want to run checks and
> > >> investigate results.
> > > 
> > > This was obviously tested before (and retested now) and everything works. I am
> > > confused about what you meant. Could you please elaborate a bit? The device
> > > and the compilation/test setup is new for me, so I am wondering if I
> > > made any silly mistake!
> > 
> > Eh, your DTS is not correct, but this could not be pointed out by tests,
> > because the binding does not work. :(
> 
> I reordered both "reg" and "reg-names" arrays based on the address.

The @3d6a000 should match the first reg entry.

> Not sure if
> that is what we are talking about here. Gpu driver uses platform_get_resource_byname()
> to query mmio resources.
> 
> I will retest dt-bindings and dts checks after picking the patches you
> just posted and report back. Is the schema supposed to enforce strict
> order?

In your second hunk in patch 1, you are defining the order of reg,
reg-names, clocks, and clock-names. This creates an ABI between DTB and
implementation where ordering is significant - regardless of Linux using
platform_get_resource_byname().

Regards,
Bjorn

> 
> -Akhil.
> > 
> > I'll fix up the binding and then please test on top of my patch (see
> > your internal guideline about necessary tests before sending any binding
> > or DTS patch).
> > 
> > Best regards,
> > Krzysztof
> > 
