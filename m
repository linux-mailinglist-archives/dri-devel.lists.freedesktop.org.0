Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D097773392D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 21:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DCA10E67D;
	Fri, 16 Jun 2023 19:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950F10E67D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 19:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HwxyWSuTXy6YKTP9wFbW3JTj6rUcGs6kDsTOdr+O2BI=;
 b=XkoshdUJuNlr5BrCep0TjHn5GO0yBs/oy/4LKFbpbaLkLRqoUbablurFt1CsR9BdKJVT2m9p0I8nJ
 K0zsdkVS+8cSSbGADgHeUq5/dZPHmyB8W0J5wWQR4bzji9W2Bm1ineBlmIeKe/hNSEnXrXXEP0JGqn
 Sq3QM246CEEXt8vg0Pj0kurfGUxmtEC2B/2B3WZGJDYWj1V+Uw3elBxi/jnKt7nY6hBye0QCmv32jj
 03wuxAuZTiPUx+KUuQKpA5KquafaoNZT0uJft0jqld+cIAhvF3wvFo/xRTB1zOFdi4DCOUxtWrKzK1
 Tmzii/qk5D8rOmK9u6JZJvcU46FuLMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=HwxyWSuTXy6YKTP9wFbW3JTj6rUcGs6kDsTOdr+O2BI=;
 b=6UbuWnJII7thn1SNlGM7WsCWJMf76/keBr0sVXkUDFbsUFIj3/LTk9SRmVMdUucDpryP+EP7FklKz
 f1Ub2qhBg==
X-HalOne-ID: 9f0f4ec2-0c78-11ee-9ce5-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 9f0f4ec2-0c78-11ee-9ce5-99461c6a3fe8;
 Fri, 16 Jun 2023 19:04:31 +0000 (UTC)
Date: Fri, 16 Jun 2023 21:04:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 5/5] drm/bridge: tc358762: Handle HS/VS polarity
Message-ID: <20230616190430.GJ1697490@ravnborg.org>
References: <20230615201902.566182-1-marex@denx.de>
 <20230615201902.566182-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615201902.566182-5-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:19:02PM +0200, Marek Vasut wrote:
> Add support for handling the HS/VS sync signals polarity in the bridge
> driver, otherwise e.g. DSIM bridge feeds the TC358762 inverted polarity
> sync signals and the image is shifted to the left, up, and wobbly.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
