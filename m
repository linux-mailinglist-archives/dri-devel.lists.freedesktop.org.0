Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F7662974
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 16:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFD210E095;
	Mon,  9 Jan 2023 15:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10C110E095
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 15:11:38 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id AA7DD6007C21;
 Mon,  9 Jan 2023 15:11:36 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id i3y2-bR02HzZ; Mon,  9 Jan 2023 15:11:33 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id D22986007C12;
 Mon,  9 Jan 2023 15:11:33 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1673277093;
 bh=V7NH/2+Tt1DGOWJeFKRfxNiccQGT8X/XFRYVPg4mYrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=JZn0KZmAOwXDJ2c/+PaipKIqhHe5PoPJJA/dsZnI3CtT2BwaA2ot4nSXHPePsAtnK
 xRxtPK+Wtj0jS3UwSWUyjWvnTwNLaDviQg9PH8Un6HsCsG3kjaL+7XN/PeZR7i1psT
 7CO+GmJe8Ah20q9Y3a5B9XX0FgtWbcumO/zr3TGo=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id B31D1360072;
 Mon,  9 Jan 2023 15:11:32 +0000 (WET)
Date: Mon, 9 Jan 2023 15:09:34 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: thierry.reding@gmail.com, sam@ravnborg.org, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jonathanh@nvidia.com, arnd@arndb.de,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add JDI LPM102A188A display panel support
Message-ID: <20230109150934.6aho2e6dcu4stb7d@wslaptop>
References: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
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
Cc: diogo.ivo@tecnico.ulisboa.pt
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 04:37:43PM +0100, Diogo Ivo wrote:
> Hello,
> 
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
> 
> Patch 1 adds the DT bindings for the panel.
> 
> Patch 2 adds a register clear to the Tegra DSI driver, needed for the
> panel initialization commands to be properly sent.
> 
> Patch 3 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
> 
> Patch 4 adds the DT node for the Google Pixel C. 
> 
> The first version of this patch series can be found at:
> https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt/
> 
> Changes in v2:
>  - Patch 1: remove touchscreen reset gpio property
>  - Patch 2: clear register based on its value rather than a DT property
>  - Patch 3: tune backlight delay values
>  - Patch 4: add generic node names, remove underscores 
> 
Hello,

Gentle ping on this series.

Thank you,

Diogo
