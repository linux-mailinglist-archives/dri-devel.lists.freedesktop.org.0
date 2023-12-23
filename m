Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CDD81D3A9
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 12:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD1010E013;
	Sat, 23 Dec 2023 11:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mecka.net (mecka.net [159.69.159.214])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A6E010E013
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mecka.net; s=2016.11;
 t=1703329289; bh=ex4+oWyKh7OTgVh1dHGylYv3zVuujQIpgzSgPmA8rfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NztlpVQN2fpI8YW67tmpz6vcufmN/GzaPIF2pkDoMhIUzWsfBxC20hKV5vY79Sg+A
 wNaDBAyLtT0psl4Ko3SMyoZFSup0sI3f1X06A+SC/mckPbIV0rXwg/AQw/X6PQMOjh
 dthFnRk8ICjm0b+CSv3lWJBifXoyOCurhpyHKlkIk3jJyYUDTYnOD6rsb0Vog4RbyL
 8m7MUFnLoTYhxAcW7CVAJTkdhY1m/DhdzEgE0rlZRWZU3L/DCNF8oQHsCiAFRjSf1s
 6mXh0ParwarIfgUQDv2k15Zmd7PoL2qC2tx3eil11gbTBCZYIXyehbHSMKqwwL4kdb
 wpdW9WucK8wcg==
Received: from mecka.net (unknown [185.147.11.134])
 by mecka.net (Postfix) with ESMTPSA id D9896371740;
 Sat, 23 Dec 2023 12:01:28 +0100 (CET)
Date: Sat, 23 Dec 2023 12:01:27 +0100
From: Manuel Traut <manut@mecka.net>
To: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 0/6] arm64: rockchip: Pine64 pinetab2 support
Message-ID: <ZYa-Bw61x-BPaGsi@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
 <2631715.l0DajZZ3Y3@bagend>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2631715.l0DajZZ3Y3@bagend>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Segfault <awarnecke002@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mark Yao <markyao0591@gmail.com>, Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 05:51:41PM +0100, Diederik de Haas wrote:
> On Friday, 22 December 2023 12:05:40 CET Manuel Traut wrote:
> > [3]
> > https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/
> > mobian-6.6/debian/patches/display/0018-drm-panel-add-BOE-TH101MB31IG002-28A-
> > driver.patch?ref_type=heads 
> > [4]
> > https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/
> > mobian-6.6/debian/patches/device-tree/0134-arch-arm64-add-Pine64-PineTab2-de
> > vice-trees.patch?ref_type=heads
> 
> FWIW I believe the actual sources are from
> https://github.com/TuxThePenguin0/linux/commits/device/pine64-pinetab2_stable

Thanks for pointing this out, there are also some other relevant changes.
I will take care on this and Krzysztofs review and post a v2 later.

Thanks
Manuel
