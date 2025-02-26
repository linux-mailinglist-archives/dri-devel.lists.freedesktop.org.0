Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E6A45878
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 09:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC3C10E889;
	Wed, 26 Feb 2025 08:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e6D7+/Dx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B2810E88A;
 Wed, 26 Feb 2025 08:35:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 934D261283;
 Wed, 26 Feb 2025 08:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E311DC4CED6;
 Wed, 26 Feb 2025 08:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740558949;
 bh=4MYgiidHr8/ZdNMzTcx3mGJcSD5JeuiEYpQrrTIb/VU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e6D7+/Dxefnk9azDCjH0/byQKuZKBZHYYtB5BHFqReTtU0kXViV2zcE46dhYhAtDS
 4CiFxxI+hJ0Zcf7jyvIFFhbIJ/i8I6zUW/tsu/BxBoBl2k2HqiGnhsDCCyVpi7jDPw
 psnAuvj25AnRukudfQRiKjVjIEwUgOyRqg/LbD8nLXefoAhjyTdvG4hjuWLxT8UFTz
 kaels7K95zsKmkegdGaLJD7SJYuYMYkoCJXYXUOs9BqO6z1gNAMt6BT7pMKWBPqTNx
 WwPUP7UOKwIqyHEZHeP/u8+mNm7Oeq5Hoba/Destcgns8dTA9zKUsIHYayB5cjB0ki
 +7d/qGNgO/kxg==
Date: Wed, 26 Feb 2025 09:35:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to
 DP bridge nodes
Message-ID: <20250226-futuristic-messy-rook-e9f85c@krzk-bin>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-8-quic_amakhija@quicinc.com>
 <ecdc2230-1ce1-4d70-a352-180f6cd29e61@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ecdc2230-1ce1-4d70-a352-180f6cd29e61@kernel.org>
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

On Tue, Feb 25, 2025 at 02:31:05PM +0100, Krzysztof Kozlowski wrote:
> On 25/02/2025 13:18, Ayushi Makhija wrote:
> > +		pinctrl-0 = <&dsi0_int_pin>,
> > +				<&dsi0_cbl_det_pin>,
> > +				<&dsi1_int_pin>,
> > +				<&dsi1_cbl_det_pin>;
> > +		pinctrl-names = "default";
> > +
> > +		dsi0_int_pin: gpio2_cfg {
> 
> 
> No underscores, see DTS coding style.

And as Rob's bot pointed out: insufficient testing. :(

Please be 100% sure everything is tested before you post new version.
You shouldn't use reviewers for the job of tools, that's quite waste of
our time.

Best regards,
Krzysztof

