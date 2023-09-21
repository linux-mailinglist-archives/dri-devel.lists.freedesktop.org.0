Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80677A9501
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015F510E120;
	Thu, 21 Sep 2023 14:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4110E035
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:01:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8ADBACE2212;
 Thu, 21 Sep 2023 14:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338FDC4E74A;
 Thu, 21 Sep 2023 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695304861;
 bh=fBOyl4wnZj0qgJkc8bc1nWtNS7FruFf11iwwBxp/N8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWV8ExU3oehstOxt6ss9ARdQ3g9ez+u6+VQS3HyjR5ECimrVni6bFZFstl0+/V0kw
 JpxRzExfIzPRzxjCdzv/dwZYuunuD7rRqne/9aQzuFb8xTgHxkdcU/Mpk++SgAM+WA
 ZDwqmGnB18k7KpGmtHgxu3t6Tx+DKqea37FrFud5B801Zq3BwF2aKzk8gcGfa5teC+
 hTwNlEJ+7HGWYQW4gdIsLidhqUypVI02ioF/spHiNPhbReMhpxAsOaOHYUTtgTDztn
 U6H9xDeXUUcCOYMwfzxb7Gb6HQRSiajHQ5awBJZH+bjOiP4068zL0P30B9/Pn2e/+H
 JEj6Y1JM6q45A==
Date: Thu, 21 Sep 2023 16:00:58 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 2/7] phy: Add HDMI configuration options
Message-ID: <ZQxMmtbqDTqgECnE@matsya>
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
 <20230808083243.3113192-3-Sandor.yu@nxp.com>
 <c485b64e-3c83-4616-b8d8-76c2c7d56b0e@linaro.org>
 <ZOS+IQgFZYxN503B@matsya>
 <CAA8EJpokkjw_Q36YMh4p6NR+r4JGgM7_b+_QXtbmcPr6GzA=ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpokkjw_Q36YMh4p6NR+r4JGgM7_b+_QXtbmcPr6GzA=ug@mail.gmail.com>
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
Cc: andrzej.hajda@intel.com, sam@ravnborg.org, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 Sandor Yu <Sandor.yu@nxp.com>, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-08-23, 20:22, Dmitry Baryshkov wrote:
> On 22/08/2023 16:54, Vinod Koul wrote:
> > On 17-08-23, 13:05, Dmitry Baryshkov wrote:
> >> On 08/08/2023 11:32, Sandor Yu wrote:
> >>> Allow HDMI PHYs to be configured through the generic
> >>> functions through a custom structure added to the generic union.
> >>>
> >>> The parameters added here are based on HDMI PHY
> >>> implementation practices.  The current set of parameters
> >>> should cover the potential users.
> >>>
> >>> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> >>> ---
> >>>    include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
> >>>    include/linux/phy/phy.h      |  7 ++++++-
> >>>    2 files changed, 30 insertions(+), 1 deletion(-)
> >>>    create mode 100644 include/linux/phy/phy-hdmi.h
> >>
> >> I think this looks good now, thank you!
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Should this go thru drm or phy...?
> 
> I'd say, PHY, together with the other PHY patches. If you can merge
> them into an immutable branch, then it can also be merged into
> drm-misc (?) to provide the dependency between drm and phy parts.

phy/topic/hdmi should be pushed out in a bit for that

-- 
~Vinod
