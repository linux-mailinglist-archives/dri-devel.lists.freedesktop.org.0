Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E48D2410
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 21:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79E710E224;
	Tue, 28 May 2024 19:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AmoNzAPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D4D10E224;
 Tue, 28 May 2024 19:09:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABE186232C;
 Tue, 28 May 2024 19:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94BEC3277B;
 Tue, 28 May 2024 19:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716923369;
 bh=TXpIOoXYGmt2pBtqg047ViZFwCKWKQ4ykKIKvnN77vU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AmoNzAPG5OwWLUnUTGJZOanCQpM32jwGBiGV4Kj4DqPwhtvLBjX7A3wqKxlxsCTWE
 4YlTKJUUMXV5uh6+0WPRfwCkH273a1cf0bd5KJpsqdkMUyjI6Vgtfz1tnOzv9bb0IH
 pMIQ8j+lj9q4gKVtxV33VbBEs7s44f0JV+UutHCBHJeOxjqLgUm1R9HpH/wGhKV05q
 Tr3TqW24CFEenXZNnu4wZ5SQQw1yk33QrWKJC/VFE/kzwHVqEjPvoMDBH3Bh/1I71B
 V7tsnBW37DNfRz4Y/6LLe430oK/3rEAzLFnvf7ROuluDFMibMDvOjr8B9MyGzvce2H
 RwlYJMYFmJ7FQ==
Date: Tue, 28 May 2024 12:09:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 6dc544b66971c7f9909ff038b62149105272d26a
Message-ID: <20240528120928.633cca9d@kernel.org>
In-Reply-To: <202405290242.YsJ4ENkU-lkp@intel.com>
References: <202405290242.YsJ4ENkU-lkp@intel.com>
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

On Wed, 29 May 2024 02:19:47 +0800 kernel test robot wrote:
> |   `-- net-ipv6-route.c-rt6_fill_node()-error:we-previously-assumed-dst-could-be-null-(see-line-)

Is there a way for us to mark this as false positive?
