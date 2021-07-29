Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114913D9D8E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 08:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD7D6EC88;
	Thu, 29 Jul 2021 06:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 372 seconds by postgrey-1.36 at gabe;
 Thu, 29 Jul 2021 06:19:35 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB8A6EC88
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 06:19:35 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99FE33F2;
 Thu, 29 Jul 2021 08:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627539574;
 bh=0OeBgKosfg+8FwVNiwD4tBPEhozQ5dFm5HTESVBKp0Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EA2Y8H5WO8QAr1Qvn2akReryhly1GdqA/5b5pZ4wfd1EkaRQ6kqQLe46SCWfrLUox
 6cyhjnYlpjlVLQoFcUy937Vzr6em6Rwc+UmjnzyDmEjJdN7iNR2ZgyhQAPMBa850eZ
 7M1Dz6khBqwSKG3G/1fDUcXhc45boan6YyDfYUO4=
Subject: Re: [PATCH 0/7] drm: Extend COMPILE_TEST support to some ARM drivers
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <3b44d00b-62b5-8b68-c3f1-62d7c456b231@ideasonboard.com>
Date: Thu, 29 Jul 2021 09:19:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2021 18:37, Laurent Pinchart wrote:
> Hello,
> 
> This patch series stems from subsystem-wide changes I wanted to
> compile-test with an ARM64 cross-compiler. My laziness to fire a 32-bit
> ARM build probably resulted in more time being spent writing these
> patches, but hopefully they'll turn out to be useful for more people :-)
> 
> Patches 1/7 and 2/7 are fixes for compilation warnings on 64-bit
> platforms in the omapdrm and sti-drm drivers. They are a dependency for
> the Kconfig changes that follow to avoid introducing build warnings, but
> could also be merged before.
> 
> Patches 3/7 to 7/7 enable compilation of the imx-dcss, omapdrm, sti-drm,
> tegra-drm and tilcdc drivers on ARM64 with COMPILE_TEST. The patches are
> independent from each other, so they can be picked by their respective
> maintainers.
> 
> We could also extend test compilation to more architecture, but I didn't
> want to remove all dependencies on ARM or ARM64 at this point for fear
> or triggering build warnings that I wouldn't be able to catch locally.
> If there's a consensus that fully relaxing the platform requirement is
> better, I can submit a new version that does so and rely on the 0day bot
> to catch issues.

I would allow compilation for any architecture if COMPILE_TEST is 
enabled. I think git grep shows that is how COMPILE_TEST is usually used.

  Tomi
