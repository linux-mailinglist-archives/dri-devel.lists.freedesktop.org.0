Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366B6C8639
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257A810EC76;
	Fri, 24 Mar 2023 19:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3119D10EC6E;
 Fri, 24 Mar 2023 19:54:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD8A462C7D;
 Fri, 24 Mar 2023 19:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E957AC433EF;
 Fri, 24 Mar 2023 19:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679687645;
 bh=+l1Tmr6waa7ZpwQpJUq3NH4jxVo6IGOnRiecZJHvp9Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWzQ90dJJ4XktycTJ1Js2unTbW1g9b6OhlV89FkuxIvs73yLlwFwCBXsq0ZbiAbsS
 hUGqmmaUfZjTMduY+dubRO2akcckszFzZ77LePRCyX8svr/Yu/TBLQVqkhX/p7Zz6l
 4VKjzBoRyqiIKX4T6+snATZWYkFz5oPE1VjOIdc9sWzNOuON6ENM2LCxgLP2LqoLod
 b9zE00ZSaLIexQRBvRUopfoLuNKqojucT/zxFtZ5KGnK5Lu2O2GJa5Crql1ame8LY0
 W8x04UfKdANOorVNd4dBKjxyAUZ5W7Fs6n5B/pTnPz+vb2J293qsRWtgfic6oZCJl4
 4aBEwyo44z2UA==
Date: Fri, 24 Mar 2023 12:57:13 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8450: remove invalid
 properties in cluster-sleep nodes
Message-ID: <20230324195713.5blwpv7xjijlrtt5@ripper>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-2-0ca1bea1a843@linaro.org>
 <20230324174518.2arvdglqqixmxqcp@ripper>
 <fdd51d3d-a1fd-c3a9-c578-59a11c5213de@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdd51d3d-a1fd-c3a9-c578-59a11c5213de@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 08:27:12PM +0100, Krzysztof Kozlowski wrote:
> On 24/03/2023 18:45, Bjorn Andersson wrote:
> > On Fri, Mar 24, 2023 at 10:28:47AM +0100, Neil Armstrong wrote:
> >> Fixes the following DT bindings check error:
> > 
> > Is that because idle-state-name and local-timer-stop should not be
> > defined for domain-idle-states or are you just clearing out the
> > dtbs_check warning?
> > 
> > According to cpu-capacity.txt local-timer-stop seems to have been a
> > property relevant for clusters in the past, was this a mistake in the
> > binding or did something change when this was moved to
> > domain-idle-states?
> 
> I cannot find anything about local-timer-stop in cpu-capacity.txt. Where
> do you see it?
> 

Ohh, you're right it's only mentioned in the example.

But idle-states.yaml documents the property for both cpus and clusters,
and it's used throughout the examples.

Our cluster states are defined in domanin-idle-states instead of
idle-state, does this imply that the flag is no longer applicable
per cluster in this mode of operation?

Regards,
Bjorn
