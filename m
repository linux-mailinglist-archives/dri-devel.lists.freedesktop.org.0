Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A149840CA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894F710E656;
	Tue, 24 Sep 2024 08:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rA/vjWKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B6410E642;
 Tue, 24 Sep 2024 08:43:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE3005C4973;
 Tue, 24 Sep 2024 08:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D5CC4CEC4;
 Tue, 24 Sep 2024 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727167386;
 bh=G03an4s/BBkbiR5sfEuBnlun4tbtlIlIOPYVWkYcMPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rA/vjWKDVg4XoXhqoSRyPjmQaRYSrI00ThmOhO6SGl2/h5PKG6/x3/P0wNZBNuzTd
 RPf93PE9q5moiD/R2ga0mGP8Xt2FsRdWYqXsbGQIW/pNpwCNcB0qE5yFBeZBOnKU4l
 ZwCDP8YzK2IsCMsQgKxZm6MO7/qRlC1UkxkHZ4rN4u3iSiwfVedq4WOuYc/P0pAu6I
 A6DrFV/ZIRYh0MdV8Qo3oLJyOQiPQSl+tE6sf6LtgfXybwvl4eL6wVVQpBEPfTI5/R
 D5V5SKA8lNmCEVKaJ8+6xOB2VeyzOGZtnjCznHcJBR/G/SfIKCgJqXmV/EYESqEZAB
 8pQhucrdjqyxA==
Date: Tue, 24 Sep 2024 10:43:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org, 
 abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_khsieh@quicinc.com, 
 konrad.dybcio@linaro.org, quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 4/5] dt-bindings: display: msm: dp-controller:
 document SA8775P compatible
Message-ID: <6v3wtdxcooi6qfolj5bfbgeru4uyawj6bsbfcnxu3lspuuhsi6@ysmb435njcul>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-5-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-5-quic_mukhopad@quicinc.com>
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

On Mon, Sep 23, 2024 at 05:01:49PM +0530, Soutrik Mukhopadhyay wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm SA8775P platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: No change

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

