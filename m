Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC0908FD9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B8A10EDC7;
	Fri, 14 Jun 2024 16:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZVZBLqZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB4C10EDC7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:16:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B8A46CE2B5E;
 Fri, 14 Jun 2024 16:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DB7C2BD10;
 Fri, 14 Jun 2024 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718381793;
 bh=/m7C93ViXaAcLQc3o+A+6QGlNBUZog2Ouu/otDLJpY0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ZVZBLqZClfkIHgS8AkvPIHqYBNvvyMf/gLvvcJ5x4o8UxaYEcqSrWfDYBIHB/bBya
 Asq/5Eb8NC2ChNEAD+kLM8nik6v7vSqzOzwAGL9FP9GPOJ0szbUaZIOIGpVXE3v+4I
 dl90wllAI3KXnSuJyPmBFmwod39i9ZkpVGbgudUZf349hC6qXq6qaD3rgKfGf54jl3
 +vluvgUcTBIBcdGdtr0A6H+cLz5Df2uaqodaxQEIwb0daroDnJOSsPGDwsB+QcqAgK
 6/gYCH8dUd0zJj3eUcTYX536exO0d40YvNL6BqRDSPn2XNGh9r6C9z1HFIIaINWrxB
 SfDQ3jFml8hxw==
Date: Fri, 14 Jun 2024 11:16:32 -0500
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
Subject: Re: [PATCH v9 00/13] Make PCI's devres API more consistent
Message-ID: <20240614161632.GA1116318@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <442e5119dc4d2630b34d8cf9228c84b9cfee1717.camel@redhat.com>
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

On Fri, Jun 14, 2024 at 01:38:41PM +0200, Philipp Stanner wrote:
> On Thu, 2024-06-13 at 16:57 -0500, Bjorn Helgaas wrote:

> > This is on pci/devres with some commit log rework and the following
> > diffs.  I think the bar short/int thing is the only actual code
> > change.  Happy to squash in any other updates or things I botched.
> 
> I looked through your tree and only found the following nit:
> 
> In commit "PCI: Remove struct pci_devres.enabled status bit" you
> changed the line
> 
> "The PCI devres implementation has a separate boolean to track whether
> a"
> 
> to:
> 
> "The pci_devres struct has a separate boolean to track whether a device
> is"
> 
> In past reviews that has been criticized and I was told to always call
> it "struct pci_devres", not the other way around. That's also how it's
> put in the following paragraph.

Amended to that, thanks.
