Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351F6C323B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 14:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EF410E0A8;
	Tue, 21 Mar 2023 13:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5328B10E0A8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 13:04:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A394CB8166D;
 Tue, 21 Mar 2023 13:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97EBC433D2;
 Tue, 21 Mar 2023 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1679403844;
 bh=xicp2ZjjG9HCcZnawLl5zQfwI83fOJr2ed2aPLSBhZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JuiqRn6w4PRHQKQ5pjoX6CoJ8CFfKfmpMyYdTRm4AYO0CyysHONkkcKwdxfxWZ66A
 jsMi9DDjkEdIP/LY1JVUdpex0V8/fRa5rBw/aenfzm7rgUwmjoMzy44MHC8V5kvm3v
 XBCL/hRExaZYD2VFi2Lo/04IjV2kjQkg2nGD2ja0=
Date: Tue, 21 Mar 2023 14:04:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: stable-rc/linux-5.10.y bisection: baseline.login on
 hp-x360-14-G1-sona
Message-ID: <ZBmrQZYg8FJCekK8@kroah.com>
References: <6419a07b.630a0220.8bbc0.07b1@mx.google.com>
 <7f0ccd45-ab53-4155-b647-d082221d65b3@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f0ccd45-ab53-4155-b647-d082221d65b3@sirena.org.uk>
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
Cc: kernelci-results@groups.io, bot@kernelci.org,
 Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 12:58:22PM +0000, Mark Brown wrote:
> On Tue, Mar 21, 2023 at 05:18:03AM -0700, KernelCI bot wrote:
> 
> The KernelCI bisection bot found a boot bisection on one of the HP
> ChromeBooks in v5.10.175 triggered by b5005605013d ("drm/i915: Don't use
> BAR mappings for ring buffers with LLC").  The system appears to die
> very early in boot with no output.

Should be fixed in the 5.10-rc that is out for review right now.

thanks,

greg k-h
