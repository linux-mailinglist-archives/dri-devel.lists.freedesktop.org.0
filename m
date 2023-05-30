Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD049715DD7
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 13:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FB310E009;
	Tue, 30 May 2023 11:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708C310E009;
 Tue, 30 May 2023 11:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1629162492;
 Tue, 30 May 2023 11:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600D2C433D2;
 Tue, 30 May 2023 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685447504;
 bh=xESFwl5QwhWz0sLdJog+b2g9gJdUwyp3X7cgVTPoMMM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O2HMN00+m7zC6kUKyTIzlLPR34cgt/2yNYGUOQ3mDJZSfaC02TWWzRZK2Q+j+Bn0w
 vgzTmkh7fVBOAJYZfJXt8LXxBSq3PzBPpA+ZcjYgpQysNuizUQnOcJW7Ma8gwlkesR
 N+2hwJ0MMWOOKnXLg+iA0U56C3s/+lE+9368r9xQW9mVPx/R7sQC7Bmz3R2VEpvr2I
 wxiZeecTi9EP9W6fl61nNb11b9iNpsif8X99oYXglRWXMaXIMG7YueruxiQx+EvK3g
 T3qPCoGBlwdrNnbaOijTtkTHKxQ9jGFd3Z2glhJdIWyTM0VxL6gARHhHC9dI3nzJar
 /t/EUpHwr7F6g==
Message-ID: <47613e2d-5cae-0cd5-241b-5245b74b6ad3@kernel.org>
Date: Tue, 30 May 2023 13:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/3] dt-bindings: display: hdmi-connector: add hdmi-pwr
 supply
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
 <20230519184023.3943362-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230519184023.3943362-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 20:40, Dmitry Baryshkov wrote:
> Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
> pin of the HDMI connector (together with some simple glue logic possibly
> attached to the connector).
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

Best regards,
Krzysztof

