Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AF5995EF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 09:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3514210F12A;
	Fri, 19 Aug 2022 07:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9D10F11E;
 Fri, 19 Aug 2022 07:21:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28AEDB8256C;
 Fri, 19 Aug 2022 07:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89418C433C1;
 Fri, 19 Aug 2022 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660893662;
 bh=9WBsRlJAjbUsTLZM3OW0lHnzGsZmMjjXhXMUq6Yvo+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGV6OckhDesO+Hv4ssj0e57RH+8MwvMcLO07lMCNzSJE6c7Ul2gT2t1Y4IzfZZlf9
 06UmIH+e13qMEXkxRy5syg4QskphbhNL9WsSsm3JNl51qKoIoSdUkR1LCRss5Ih4D0
 HhahfX81It1nrWh//xwPeQwlbPS1IZ+0MolTlgfk=
Date: Fri, 19 Aug 2022 09:21:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 00/15] drm/i915: HuC loading for DG2
Message-ID: <Yv853PiPcf+gaIf0@kroah.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 04:02:28PM -0700, Daniele Ceraolo Spurio wrote:
> Note that this series includes several mei patches that add support for
> sending the HuC loading command via mei-gsc. These patches depend on the
> GSC support for DG2 [1], which has been included squashed in a single
> patch to make the series apply and allow CI to run. We plan to merge
> those patches through the drm tree because i915 is the sole user.

Doesn't look like you cc:ed me on any of the mei patches, which is odd,
and ensure I can't review them :(

And why are mei changes needed only for drm?

thanks,

greg k-h
