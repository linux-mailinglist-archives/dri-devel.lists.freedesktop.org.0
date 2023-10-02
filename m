Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19717B5587
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 16:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AC510E2AF;
	Mon,  2 Oct 2023 14:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC24410E2AF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 14:58:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 05EB460C34;
 Mon,  2 Oct 2023 14:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC684C433CA;
 Mon,  2 Oct 2023 14:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696258735;
 bh=eboChl+wyX3j1fqZPar8FomWTc2qJC6kNeK3QytY7ko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=huPw0zZOgabsI1929FJTXu1twF5xzgl87G3EhWItDUQeeYos1u33+woRmyrj9/sXg
 Xsj14wChj5zY9ewsoTJvTt7NS+zbbI+aJdc6zTvK/2lQXgnIQ4yVFRpRihLIkLzSoi
 Wi3dcXOE2eF9rECZEI3lqmjXltB2vRre4K+mUjjVFvGShKBHCJ1MWPB5ok3r5/+ez0
 j7dmgYlnvDfos324eCFVf0l/pASUaw4zULNWJNb0A/k1GY4QZFKbfRKGkxDpMk2tw/
 m9JIkjNK0VZQC23PLbv+s5Pub+TpK8FKd8v7EIN/+slWJr9yp18pulbtS4pMdZdrfa
 huc2vE0ZGC3zw==
Received: (nullmailer pid 1705392 invoked by uid 1000);
 Mon, 02 Oct 2023 14:58:53 -0000
Date: Mon, 2 Oct 2023 09:58:53 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: fsl,imx6-hdmi: Change to
 'unevaluatedProperties: false'
Message-ID: <169625873009.1705276.15847466950147815447.robh@kernel.org>
References: <20230930130102.798822-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930130102.798822-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 30 Sep 2023 10:01:02 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> fsl,imx6-hdmi.yaml makes a reference to synopsys,dw-hdmi.yaml.
> 
> The 'interrupts'and 'reg' properties are described in synopsys,dw-hdmi.yaml,
> so use 'unevaluatedProperties: false' so that these two properties can
> be accepted.
> 
> This fixes the following schema warnings:
> 
> hdmi@120000: 'interrupts', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

