Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E167252E8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 06:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCD110E02F;
	Wed,  7 Jun 2023 04:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC78010E41F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 04:35:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C27F63A6F;
 Wed,  7 Jun 2023 04:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7DEC433EF;
 Wed,  7 Jun 2023 04:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686112544;
 bh=P18xwHSQkIlN8lIUXoCRzo1fXi4iUk52n4ZPjP2Ek0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YP/ToqnJo2qSg2iIeGUY9YSgzegUrbZCLLs+xLllqyMHFQ2+ouHNIfJb5b6113fWf
 wrVKYV/FnfZ7U9pDQcFmWwstM4QF4Iuijuqz0wtpFMgbV+dlo4NcH7Cn5IQVddLIW5
 aok2jR/Wm5+Kn+4YlBxaooxrvZgtgEwnSSDGTlmDEbAJ56FIq8uxNwwVEa8rDumn0Q
 9Dvy8n1jr/IBoU6ng8X99B4rWb1oLokOLpTGNChIQqsvFtTX93LfG3DuUuag8zYFs2
 TQyaTYmblC1wqFTTFV5pVkH2itK5O0YrMxgzBrzGdsayWkgVA2qbIS36bL+ZY39viO
 Ja7pwVrEWGYZw==
Date: Tue, 6 Jun 2023 21:35:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v6 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230606213542.3913d3b8@kernel.org>
In-Reply-To: <fd0f87b9-a822-c83a-4880-9ed1ac34794e@broadcom.com>
References: <1685657551-38291-1-git-send-email-justin.chen@broadcom.com>
 <1685657551-38291-4-git-send-email-justin.chen@broadcom.com>
 <20230602235859.79042ff0@kernel.org>
 <956dc20f-386c-f4fe-b827-1a749ee8af02@broadcom.com>
 <20230606171605.3c20ae79@kernel.org>
 <8601be87-4bcb-8e6b-5124-1c63150c7c40@broadcom.com>
 <20230606185453.582d3831@kernel.org>
 <024a6733-f552-c538-2b59-26058c750d66@broadcom.com>
 <20230606204500.04083bd8@kernel.org>
 <fd0f87b9-a822-c83a-4880-9ed1ac34794e@broadcom.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 6 Jun 2023 21:22:45 -0700 Justin Chen wrote:
> >> Through filters that can be programmed by the Host cpu or co-processor.  
> > 
> > How are the filter programmed by the host (in terms of user API)?  
> 
> You are stumbling upon my next objective here. This patch set does not 
> support this because it wasn't clear how to do it. The plan was to get 
> the base driver merged first then introduce a way to specify an offload 
> channel.

Alright.

> If you must know, I introduced a rxnfc flow_spec ring cookie to specify 
> an offload filter. Not sure if this is the right way to do it or not, 
> but figured this would be a future discussion.

We clean leave it for later indeed, but in case you're wondering -
that's unlikely to fly. My preference will be to expose the accelerator
port as a switch port, with a netdev and forward using TC flower etc.
With the netdev in place you'll have a place to report stats and all the
necessary diagnostics, which otherwise get crammed into random places.
I believe Florian asked about this in the past, I hope I'm being
consistent with my answer here :P
