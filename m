Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FBA55A23B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B7910F17F;
	Fri, 24 Jun 2022 19:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AB110EFB3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=L2S/OFHbcpw+xHxvLQ3UDGLgLWA81oGSjbaZ5d/JL2U=;
 b=fvBVa5FjqbaMSj7d3h8GJOiDOhNQtm4pj8bR+uhSgg8QZqfe3rSLii+hqpViFb8Wus4lO3J8LD9Mm
 w6OCEg3FjqfmXAQ6UvK9Tjr+oi+thjPukK2AmXw2xy64W+2dKTi22sLe9qfxrah/7wzQ31KsAzx4bi
 0erWdOWDwo14D3gVtM0AHDXUyYjgghaIxUWWrC2ViPdXPvnenvFb6IA0aXp6s8ZvJV0VimUpZat/BS
 iWSbs3ML9zTFoj7oVIzbisasVRudqI08Rk1E72PvWyCNFnui4SzR59lBxd8iltZR+Q9MXwuoI1q+gz
 dcnifK0A2Ao7icap4xJCUP1OgXbCSuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=L2S/OFHbcpw+xHxvLQ3UDGLgLWA81oGSjbaZ5d/JL2U=;
 b=p7Y9a1/kth4MA2s6M+u2c/wO7tRfghbrrdz0IU4csAxiuwxiL0dhSTiY0AuyGHdg5Yn1O9o5f2fzb
 /0JccsXBA==
X-HalOne-Cookie: e3690c5f0d18ada9bc06b0d6752c537c11a0ed0e
X-HalOne-ID: b5385afe-f3f7-11ec-a6c4-d0431ea8a283
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id b5385afe-f3f7-11ec-a6c4-d0431ea8a283;
 Fri, 24 Jun 2022 19:56:16 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:56:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] drm/panel-edp: Add LQ140M1JW48 edp panel entry
Message-ID: <YrYW3wdX10js0ibD@ravnborg.org>
References: <20220608020614.4098292-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608020614.4098292-1-bjorn.andersson@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 07:06:14PM -0700, Bjorn Andersson wrote:
> Add panel identification entry for the Sharp LQ140M1JW48 eDP panel.
> 
> Due to lacking documentation, a delay similar to those for the
> LQ140M1JW46 numbers are picked for now.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Thanks, applied to drm-misc (drm-misc-next).

	Sam
