Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A471470A55D
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 06:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D1310E11F;
	Sat, 20 May 2023 04:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7C510E11F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 04:43:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCBDD647AC;
 Sat, 20 May 2023 04:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A82DC4339B;
 Sat, 20 May 2023 04:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684557821;
 bh=CuJImiBEkrvn52lFAsm6teL+b+fae0HBhV4TGWYEMGo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W8idQ1hFxdhzAUvtQ25+4eyUGAar4c5HkLwAPlgXRpiRunbTmJZW7V9EP3L/kqggo
 UOMtrJYqEUuPAjTcrFLPga61H7IwCcrPku9+K/DSYsiisJQuJhZfYq6tNBNVz8kuBt
 JhUO4OhsFWgfLfDIFuRaE9hRmKcBVcZHWVN0laCs396rM4Uk2QX5X30KLULarAQ/t2
 +Vu0Ve5LJAmn0EW94QrROCCSTzEwjrOCtNv9C8P/5aOXLWqZDqPPIh9jRhoeYArbM2
 8bjiaPiRxtmCnx7c33oQU5AylRu1sK3JnTuDYVa6WTVg0fbsjJFffdh/R1SVdO3uuX
 Hf5O3CxbQSugA==
Date: Fri, 19 May 2023 21:43:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v3 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230519214339.12b5bbb3@kernel.org>
In-Reply-To: <1684531184-14009-4-git-send-email-justin.chen@broadcom.com>
References: <1684531184-14009-1-git-send-email-justin.chen@broadcom.com>
 <1684531184-14009-4-git-send-email-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hkallweit1@gmail.com, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org, opendmb@gmail.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 May 2023 14:19:41 -0700 Justin Chen wrote:
> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> introduced with 72165. This controller features two distinct Ethernet
> ports that can be independently operated.
> 
> This patch supports:
> 
> - Wake-on-LAN using magic packets
> - basic ethtool operations (link, counters, message level)
> - MAC destination address filtering (promiscuous, ALL_MULTI, etc.)

There are some sparse warnings where (try building with C=1).
Please also remove the inline keyword from all functions in source
files, unless you actually checked that the compiler does the wrong
thing.
-- 
pw-bot: cr
