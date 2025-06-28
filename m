Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60EAEC70E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 14:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6E110E193;
	Sat, 28 Jun 2025 12:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cta7eDaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83E110E037;
 Sat, 28 Jun 2025 12:19:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D5454358D;
 Sat, 28 Jun 2025 12:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13674C4CEEA;
 Sat, 28 Jun 2025 12:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751113186;
 bh=QhnZ7KS4dcO10Zf6dRimAYrqaLaH9hV/1OodxZ6Dess=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cta7eDaCVajo/VmSdGNFM/pCfNX/Dk1Y42mL+oXVgdXNLJtzfRA1lLbDbaMrmUY9B
 g1xuCPTWvARXXN2lPpD+SzQHGvHuoehp4iRySbidQhJPbg+oD8X6xJcLNxWywl2n26
 8q0ahpA27J+GlksGUam3PbikcXxgJ0hww1kpjRdE=
Date: Sat, 28 Jun 2025 14:19:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Message-ID: <2025062808-grant-award-ee22@gregkh>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625170015.33912-3-badal.nilawar@intel.com>
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

On Wed, Jun 25, 2025 at 10:30:07PM +0530, Badal Nilawar wrote:
> +/**
> + * struct late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct late_bind_component_ops {
> +	struct module *owner;

I don't think you ever set this field, so why is it here?

Or did I miss it somewhere?

thanks,

greg k-h
