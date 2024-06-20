Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0019111EC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 21:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE6C10E161;
	Thu, 20 Jun 2024 19:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="GTRU5+to";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373110E2B5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GtUiKMS+JogD7d3VokqpWsqamEr3QnRsE46YsJrX/0o=; b=GTRU5+to0kKy1NAX4h4nyUFaZ6
 jHdJh1WGaW6/adsVToEIo0B3tkHPVcSm1Dk+NLBYCa+QwOQqCEHobDiYS2pEgMbvbB7wJly6vlod+
 sHB79KMKRc9abEw6vVPCyQedSikAivG/UC00Pnvy/Hdr0/nTDai8TwiLOgRnLWvcMq58=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sKNEu-000bKe-I4; Thu, 20 Jun 2024 21:14:32 +0200
Date: Thu, 20 Jun 2024 21:14:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Omer Shpigelman <oshpigelman@habana.ai>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <9d459e01-6171-4a1a-855c-f56813ea9e0f@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <20240619082104.2dcdcd86@kernel.org>
 <5cb11774-a710-4edc-a55c-c529b0114ca4@habana.ai>
 <20240620065135.116d8edf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620065135.116d8edf@kernel.org>
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

On Thu, Jun 20, 2024 at 06:51:35AM -0700, Jakub Kicinski wrote:
> On Thu, 20 Jun 2024 08:43:34 +0000 Omer Shpigelman wrote:
> > > You support 400G, you really need to give the user the ability
> > > to access higher pages.  
> > 
> > Actually the 200G and 400G modes in the ethtool code should be removed
> > from this patch set. They are not relevant for Gaudi2. I'll fix it in the
> > next version.
> 
> How do your customers / users check SFP diagnostics?
 
And perform firmware upgrade of the SFPs?

https://lore.kernel.org/netdev/20240619121727.3643161-7-danieller@nvidia.com/T/

	Andrew

