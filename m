Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA4945142
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 19:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C1810E046;
	Thu,  1 Aug 2024 17:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LKIGiMer";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC0710E046
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 17:04:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BFE7F628B2;
 Thu,  1 Aug 2024 17:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42318C32786;
 Thu,  1 Aug 2024 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722531848;
 bh=ctBYTvcSoyXQzBR+EgWwQU7XaNzi5QtXFTkUFSCB0Ms=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LKIGiMerh5HpOdwwADCsnTv2T1lWQHFG1qAosPxRGNY55J5YKzJO4b3ARVmKyGdsU
 ZmOz5qabrtR4f9MBw7fPpHxIzUqCG9AhGl9KKVjUY4Jhnys6zSePj2kAELHIwxBeiP
 uv5yk21451aYP5C9d70Bu0X6mdvfgdQON7qZHj2i29NtRvs6YHJIq/HK1c/UEwwpdF
 1FKrZT6zpkTQZsrWiiu6y8SB4XlDhwuXYt7Udk6XJQWX+Itcufmfjzmeve5CP1XR1k
 AvR6lrhh/arQ0rRcMaeFGxnY/x4VbYZQ5QS3HCYlpGCHOyYCx5jMO9NPcmSFibqktx
 nTHjlmMvZxnhg==
Date: Thu, 1 Aug 2024 12:04:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/2] Use pcim_request_region() in vboxvideo
Message-ID: <20240801170405.GA107618@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729093625.17561-2-pstanner@redhat.com>
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

On Mon, Jul 29, 2024 at 11:36:24AM +0200, Philipp Stanner wrote:
> Hi everyone,
> 
> Now that we've got the simplified PCI devres API available we can slowly
> start using it in drivers and step by step phase the more problematic
> API out.
> 
> vboxvideo currently does not have a region request, so it is a suitable
> first user.
> 
> P.
> 
> Philipp Stanner (2):
>   PCI: Make pcim_request_region() a public function
>   drm/vboxvideo: Add PCI region request
> 
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++++
>  drivers/pci/devres.c                  | 1 +
>  drivers/pci/pci.h                     | 2 --
>  include/linux/pci.h                   | 1 +
>  4 files changed, 6 insertions(+), 2 deletions(-)

Applied with Hans' ack to pci/devres for v6.12, thanks!
