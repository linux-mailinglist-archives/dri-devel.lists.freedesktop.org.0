Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD52225664
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 06:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7171689C6C;
	Mon, 20 Jul 2020 04:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850389C6C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 04:03:07 +0000 (UTC)
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20D362080D;
 Mon, 20 Jul 2020 04:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595217786;
 bh=NJmzmO+e2SXB3AlXa47J4NMhA0n2fipNMDlfEtAPcLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VJiV1YhZ5U8Uf2VprqR6kEQcTYOGk8tJBMk3y95O+M8rA1VuDLTNgjgDkJZ1HHaf0
 PNbTjtUSbqf7Ygldm9RIRQCzU+x8lL3hQ/PSS9bp7UwHWwrIFezfgvgZ/V9JT+qzXu
 NRt9CaTtOS0K5fakedvIx4z1J5/2yDnnolPAyQF0=
Date: Mon, 20 Jul 2020 09:33:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 3/4] drm/bridge: Introduce LT9611 DSI to HDMI bridge
Message-ID: <20200720040300.GB12965@vkoul-mobl>
References: <20200708103559.132300-1-vkoul@kernel.org>
 <20200708103559.132300-4-vkoul@kernel.org>
 <20200719171806.GA55541@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719171806.GA55541@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 19-07-20, 19:18, Sam Ravnborg wrote:
> Hi Vinod.
> 
> Three trivial points below.
> The rest looks good.
> 
> With these fixed you can add:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, I will send an update with nits fixed

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
