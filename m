Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5756CA61
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 17:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA8611A396;
	Sat,  9 Jul 2022 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66D011A396
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FzH8rKkSbgAXY9nzXTLkiIAPQCzzU1iM0OaeCzmJCW4=;
 b=aqRT0PHti9xKnhMp7xaGOcY/1CV0GMFJtEOHu8NyGXYuboRmKxybL3Akg/CqrRgsjRMGhoaB6K8Q2
 d0+piBrYozqt53Ju5nZodFUBtTQbouw0iFITe4s9KobRp779eGFNZ3zmbcQBU8qjqG9ufJpwgusgBK
 oy0JihB9nuZe+9HPDMWBnSguKt7tJIeDp1WMquSltWCEkaH6Pz+O6jabbxEFNGuDkjAtjXaFjsI784
 tYXj5oS4eFfT1ytGGPPdZR6fIB9qS/HQjaPXlD2rpr8tmn0zWQuMmfauQ6NiYllmr9DeqUHIbWhkD1
 ++5qpOLPry8Za+FZ8rSbAf0vvMXVSgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=FzH8rKkSbgAXY9nzXTLkiIAPQCzzU1iM0OaeCzmJCW4=;
 b=6zxTRHfdUBZhbTwMApm3AJCmQQ8ia7OcHtvqF9vJsM9LO7WYgM/Drmw/f1llF3M4JnpUDJbe2u5qQ
 MSxuzQ0Dg==
X-HalOne-Cookie: f6d7a1cd742d99a7ae348af68639d761b45a5234
X-HalOne-ID: 49930e33-ff9d-11ec-be7e-d0431ea8bb03
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 49930e33-ff9d-11ec-be7e-d0431ea8bb03;
 Sat, 09 Jul 2022 15:39:15 +0000 (UTC)
Date: Sat, 9 Jul 2022 17:39:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 1/4] drm/lcdif: Clean up headers
Message-ID: <YsmhIfNk2YjbROWl@ravnborg.org>
References: <20220709144826.9278-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220709144826.9278-1-marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liu Ying <victor.liu@oss.nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 robert.foss@linaro.org, Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Sat, Jul 09, 2022 at 04:48:23PM +0200, Marek Vasut wrote:
> Drop unneeded headers, sort rest alphabetically, no functional change.
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reported-by: Liu Ying <victor.liu@oss.nxp.com>
> Tested-by: Martyn Welch <martyn.welch@collabora.com>
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

Not a big deal but you missed my a-b on all 4 patches.
See https://lore.kernel.org/dri-devel/Ysk9md60rDHNP+lv@ravnborg.org/

	Sam
