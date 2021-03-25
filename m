Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69002348A2D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 08:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDE46EB20;
	Thu, 25 Mar 2021 07:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C071D6EB20
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 07:29:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B80A861554;
 Thu, 25 Mar 2021 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616657341;
 bh=Mr+BDr76BpJXyUusio9MRTC9Cg69ld5vy7wOR2RmRsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7atfcBnwjv20i25mhZKHFRB7JQGurVZ2sjsGo6k4fQUQFbzNzhnNsaj9Z1lbDVtl
 KBNgs1u48j0yPUjp0yTIYN5GUaZ4LnzLQ7rYSW4kN7b1/3lTMtM9ZCa0gZhvMJUJ2g
 y4NSX1F1mGZDbp+PGqwHP0uNQOCkL6WMgCfltuf8HSPqdg3UMK+vI746ZGSJ/XD3mn
 wdBc02PZFjSlH2zPRLroJeyOOCgIuFTGJtB0P7u6JlMYi8L6rCZ8qvL2SmLJUOmCpL
 hdVPO6vvMq6CZsbAsLTd+aAOvCI4KXcEhql7m+Pf9/AY9w8golgBD2YY0cuZRY0Uok
 lFYF/6rLBY4dA==
Date: Thu, 25 Mar 2021 12:58:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v4 2/5] phy: Add LVDS configuration options
Message-ID: <YFw7udw4G9WrWlAd@vkoul-mobl.Dlink>
References: <1615175541-29009-1-git-send-email-victor.liu@nxp.com>
 <1615175541-29009-3-git-send-email-victor.liu@nxp.com>
 <YFHYeZ/ZVqNiG/yo@vkoul-mobl.Dlink>
 <6c52ebc6a027cbe309ed2c8848f2ae8cfa6e15f4.camel@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c52ebc6a027cbe309ed2c8848f2ae8cfa6e15f4.camel@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-imx@nxp.com,
 robert.chiras@nxp.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18-03-21, 10:22, Liu Ying wrote:

> > Can we have these in kernel-doc style please, similar to style in linux/phy/phy.h
> 
> I take this way of in-line member documentation comment for the below 3
> reasons:
> 
> 1) Members of struct phy_configure_opts_mipi_dphy and
> struct phy_configure_opts_dp use the same way of comment.
> The structures are defined in linux/phy/phy-mipi-dphy.h and
> linux/phy/phy-dp.h respectively.
> Aligning to them makes a bit sense, IMHO.
> 
> 2) In-line member documentation comments[1] are mentioned in kernel-doc 
> guide. It says 'The structure members may also be documented in-line
> within the definition.'.
> 
> 3) Even the 'configure' and 'validate' members of struct phy_ops use
> the same way of comment.  struct phy_ops is defined in linux/phy/phy.h.
> 
> [1] 
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#in-line-member-documentation-comments

It 'may be' but I would like all headers of a subsystem to display one
style. As I said linux/phy/phy.h use a style which we should use
everywhere.

Thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
