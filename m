Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FED549993
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228EF10F3C0;
	Mon, 13 Jun 2022 17:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403A210F3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lHjgrdlCsJlZNExw2i+5p/H7UmbCDOq2p/NEOrPWfhI=;
 b=LpfJ3oPYuuqg6i3ho0XikhkAPNOBaQbZr82eZv0bUP4ve0Z4PFc69HjP4A1M56gmZKZ2eeqWeEmaK
 /bUI2rk7ZHbhQLN3iywV3rXmHhTZmEd1p2FLPwDnC7hvKoXzu9/hs2Zxr+nrvWNjhCw34+f4LZh6pZ
 RCZs2OIgx//zHcR4YywpNgW/VFVFDy3TU6TxoiGBxMJb2k/wI0CT68I90+bLDAH02G0QrW943PVKpd
 AsUU63h3+s0KtUXIcN+1Au7F8a79oACmCtcr/1pCrG9iPqlQmT2DjilP0pjq9DvnxVpd8eUlSAiHTT
 hgQfucYdZ9sfLrjuWUEjgqP/jBu8daA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lHjgrdlCsJlZNExw2i+5p/H7UmbCDOq2p/NEOrPWfhI=;
 b=ldsO6NEhLw+vp3UB1ZOzR2Yob+FMPpcyEw0+v01Wvw2DdWcTcV26CW6XMjhQ+5z+CJAUaadOaYIWC
 Icw4EPWAg==
X-HalOne-Cookie: 392d8748579318f935a12eb6f32b987bbdd36c36
X-HalOne-ID: 0764a83b-eb3c-11ec-a913-d0431ea8a290
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0764a83b-eb3c-11ec-a913-d0431ea8a290;
 Mon, 13 Jun 2022 17:12:40 +0000 (UTC)
Date: Mon, 13 Jun 2022 19:12:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: Add Arm virtual platforms display
Message-ID: <YqdwBoMldyuh+vjg@ravnborg.org>
References: <20220613145709.3729053-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613145709.3729053-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Andre Przywara <andre.przywara@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob, thanks!
On Mon, Jun 13, 2022 at 08:57:09AM -0600, Rob Herring wrote:
> 'arm,rtsm-display' is a panel for Arm, Ltd. virtual platforms (e.g. FVP).
> The binding has been in use for a long time, but was never documented.
> 
> Some users and an example have a 'panel-dpi' compatible, but that's not
> needed without a 'panel-timing' node which none of the users have since
> commit 928faf5e3e8d ("arm64: dts: fvp: Remove panel timings"). The
> example does have a 'panel-timing' node, but it should not for the
> same reasons the node was removed in the dts files. So update the
> example in arm,pl11x.yaml to match the schema.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
