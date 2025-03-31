Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B418EA76F51
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3510E49A;
	Mon, 31 Mar 2025 20:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="gXVfDhV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335EB10E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743453045; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MSLaKXxjKKtON9fuDG4zOsSKcnNFNMLGsBM6kco91FZVNCF5lGm2icBtJly6AmJhGrKhCTjgeEqnxhG5waGIQWbyKN+4pzsoKprd0uyzz6z3EoseE7x6YGC256XuLQDJxg7tmrr1XoQ2yCmiUV/HjYvw9QXpLE00dnJL4G76lnU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743453045;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9XcWWOjwTWx+dFyKcS/Axtzqwu1aqI3lz+g6+tOHQQc=; 
 b=jGpKKAJbYyFAL/iAA4hTHo2pGHLOwjrfgzQ6Z46OuvuMjYP4aSQOsAuy5ts12VUrG21SvK/NTSkD34ZYpFJUshBvPn77xz+P2x/I3rWonNSLg7xhZp2eiDlOdbyL1+CW/75ZuJ2NPCl+URI7ccnFhxKwAaOmE0BJT4RIid5KYb0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743453045; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=9XcWWOjwTWx+dFyKcS/Axtzqwu1aqI3lz+g6+tOHQQc=;
 b=gXVfDhV9eQ12VNtE6AYu4yUqt8nB7Yz+Exsfo5OlQ4wDwkiVkFuzeEb4tpb6cM/w
 5VzV+h/6HJmKPGq6M3/t1eP2CsnWNutxoN5VRu7xmAGXvbAaj2cJN8et5Q+Lz7Aiucy
 dMoVKOMHgf10oH+zto4TAfbrCBo983FhxBp/omx4=
Received: by mx.zohomail.com with SMTPS id 1743453043292322.9326378894983;
 Mon, 31 Mar 2025 13:30:43 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
 id EBBC4180D0E; Mon, 31 Mar 2025 22:30:36 +0200 (CEST)
Date: Mon, 31 Mar 2025 22:30:36 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandre ARNOUD <aarnoud@me.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: Enable HDMI1 on rock-5b
Message-ID: <jmb6f6beax3rmyutbkyl2hthlzzaguh2qlfdeibrbjdu44y6ea@rbuf6yjoo4v4>
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <20241211-rk3588-hdmi1-v2-4-02cdca22ff68@collabora.com>
 <6d168284-01c7-4da4-8fc9-1b12e38b554f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d168284-01c7-4da4-8fc9-1b12e38b554f@sirena.org.uk>
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 31, 2025 at 08:01:34PM +0100, Mark Brown wrote:
> On Wed, Dec 11, 2024 at 01:06:17AM +0200, Cristian Ciocaltea wrote:
> > Add the necessary DT changes to enable the second HDMI output port on
> > Radxa ROCK 5B.
> > 
> > While at it, switch the position of &vop_mmu and @vop to maintain the
> > alphabetical order.
> 
> We're seeing failures in the Arm lab the IGT tests on this board in
> Linus' tree which bisect to 77cea7ca1368 which is this patch.
> core_getversion fails:
>
>[...]
>
> The board is running fine in -next so hopefully there's a fix already
> there which will make it's way to Linus' tree during the merge window.
> We're also seeing something broken with the HDMI audio devices, but I
> didn't look into that.

I guess the root cause for the problem is, that the pull request for
the PHY subsystem [0] has not yet been merged. It contains [1]
("phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine phy-id"),
a fix for properly handling the second RK3588 HDMI PHY instance.

[0] https://lore.kernel.org/all/Z+pFou7KOQZJ1iy4@vaman/
[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=next&id=f08d1c08563846f9be79a4859e912c8795d690fd

Greetings,

-- Sebastian
