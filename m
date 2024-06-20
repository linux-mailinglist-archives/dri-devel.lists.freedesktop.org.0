Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4601F9106B9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 15:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0103010EA0A;
	Thu, 20 Jun 2024 13:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kCq4pkoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969C710EA0A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 13:51:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE3D562184;
 Thu, 20 Jun 2024 13:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D39EC2BD10;
 Thu, 20 Jun 2024 13:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718891496;
 bh=NoN0yBxHD8GgnNnA8qv/Z0+nJZMr5eqvtKZvmOt/ABI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kCq4pkoJZO69wd4/U392ee7h74fLDIx6Ix0wMuYmhNF3a9+w6iKiYwEVm8xZkP1CN
 R2rgkhL4KFMGTEaqe51/iokDg91nv2rWZZGVRVPPeAf0SU9AJCLyHW+Kucasqp+UZt
 dLMdpFWewiPgWYEsp71JXGk7fP6uNIMyD4zvDLIM4JW6AVUMir2T3Or8fJmsKpiIl/
 tHWk/k/wXILWTvP0WXK/gVawf2nbBO2GTgs+foEU09q7yzgs7diw+yu0PjC5Emk02Z
 MpTPeYLryy6izNy/qtERVsw7pZYGosTEc4oRrtI6zEXYXmaVIgE4MUTT4E3weTpl4K
 Ql+voDn8Q0UMg==
Date: Thu, 20 Jun 2024 06:51:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Andrew Lunn <andrew@lunn.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <20240620065135.116d8edf@kernel.org>
In-Reply-To: <5cb11774-a710-4edc-a55c-c529b0114ca4@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <20240619082104.2dcdcd86@kernel.org>
 <5cb11774-a710-4edc-a55c-c529b0114ca4@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jun 2024 08:43:34 +0000 Omer Shpigelman wrote:
> > You support 400G, you really need to give the user the ability
> > to access higher pages.  
> 
> Actually the 200G and 400G modes in the ethtool code should be removed
> from this patch set. They are not relevant for Gaudi2. I'll fix it in the
> next version.

How do your customers / users check SFP diagnostics?
