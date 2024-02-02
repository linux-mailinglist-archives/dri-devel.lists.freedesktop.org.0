Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61110847D31
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 00:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5172D10E8DC;
	Fri,  2 Feb 2024 23:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FI917iAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DAB10E8DA;
 Fri,  2 Feb 2024 23:38:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55ADD628EC;
 Fri,  2 Feb 2024 23:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0243C433C7;
 Fri,  2 Feb 2024 23:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1706917102;
 bh=rXo/OW1stb+8csjSL/0LuA9d1f97mBRvbbGxdzmEy4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FI917iAIoYf8EFBseOpbKYIysuDTe0nJMkYtqWDFLn6+dbU9d29vrkdIyQvgvPuJa
 YyStD2A1fBTr7xuzgLhkFqgKRocPQUaI6YKQ5Pijxy9Qcu/reM962yKehmAA9nsYQY
 AaUDM+AUo7UOCieR8S2Djjaz9Wb5ZhnIPX5Br0Gc=
Date: Fri, 2 Feb 2024 15:38:21 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Wei Liu <wei.liu@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/3] PCI: introduce can_remove()
Message-ID: <2024020211-crushable-tabasco-28d1@gregkh>
References: <20240202222603.141240-1-hamza.mahfooz@amd.com>
 <20240202222603.141240-2-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202222603.141240-2-hamza.mahfooz@amd.com>
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

On Fri, Feb 02, 2024 at 05:25:55PM -0500, Hamza Mahfooz wrote:
> Wire up the can_remove() callback, such that pci drivers can implement
> their own version of it.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---

Again, sorry, nope, not allowed.
