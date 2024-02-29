Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50D86D531
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 21:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F3F10E610;
	Thu, 29 Feb 2024 20:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rfpV3OEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB4010E610
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 20:57:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46E7B60F25;
 Thu, 29 Feb 2024 20:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47D0C433F1;
 Thu, 29 Feb 2024 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709240236;
 bh=KH2/toeuHIyQl/xKOAzMTzUVCjsQKDQqj30epruguyo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=rfpV3OEIy5UmT/zXcKsgZUDdNpd4JcDBgfsqyrjtKbe9tdSQdUW0WU4WTZP9+fl3e
 BT1SMH2YuV8HMmae+FrurpAip3SL/EIAHlUkIesw1tyviWgRMKAf78wWHTGwneTriS
 QTU/yIhckof7mFMSbl8bI06hHmSqW0vfwEfCTwShpBheBGOMyeKSqGPUzm6Srq1568
 LtNygqGGfABX3mVXzfe49ix6fO4wxiiAUy5lEmXoRz/GUc1vkVjk5cS2DbWIp3Ju44
 ObFuBC4QZYoJ8O3nJV5Upr/kUKc++VmS5GVRZC33BP+dLFIiP95n0UZayhLKmweKHt
 C7VT8bj71o+2w==
Date: Thu, 29 Feb 2024 14:57:15 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 00/10] Make PCI's devres API more consistent
Message-ID: <20240229205715.GA362688@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2057fd477ad404c9adf603eac1ad933c04ecf293.camel@redhat.com>
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

On Thu, Feb 29, 2024 at 09:31:20AM +0100, Philipp Stanner wrote:
> @Bjorn:
> Hey Bjorn, are we good with this series? Any more wishes or
> suggestions?

Sorry, haven't had a chance to go through it yet.  

FWIW, I just tried to apply these on top of pci/devres, but it failed
here:

  Applying: PCI: Add new set of devres functions
  Applying: PCI: Deprecate iomap-table functions
  Applying: PCI: Warn users about complicated devres nature
  Applying: PCI: Make devres region requests consistent
  Applying: PCI: Move dev-enabled status bit to struct pci_dev
  error: patch failed: drivers/pci/pci.h:811
  error: drivers/pci/pci.h: patch does not apply
  Patch failed at 0005 PCI: Move dev-enabled status bit to struct pci_dev

Haven't investigated, so maybe it's some trivial easily fixed thing.

Bjorn
