Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C114D7E1EC1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271C210E2BF;
	Mon,  6 Nov 2023 10:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A790A10E2BF;
 Mon,  6 Nov 2023 10:45:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F2B9460D32;
 Mon,  6 Nov 2023 10:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC71C433C7;
 Mon,  6 Nov 2023 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699267547;
 bh=/wVVpOOv/U3fVqTr94zq0CXmrcPgaVMrKFrTJPGQZTg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=W9myryjKWAUS3NPcPjGFGnd5RaCFS3E6NdM7dEEU5/lDSH7Ap7fCW9NZhQokRObQE
 TC2JLrHWKvi05hrtb/ebVR0dWDnCwDUxw5VNacZyrwaw87C40eAnm2jVREh8zcwIFj
 YFV0ugPa2usGU2uYWhDrpRk4aAK8GdteA0iCPB5dJ1OLMxNSXkkuvhU0z/C0TXUcZm
 CFGpEfAqDBerY+vUrqlGeX2hsNs/XQ7sOUjVpLsmuVX0BWHOdKoGdpUHu/rnNR3WB2
 AlSgc74FIwStd6gcFtZ6ho7wVVDXOEeD2hmDNFvP0tTsFNTYGG9drpFvGO7fElLwsW
 N5QSpSdZuJ5mg==
From: Maxime Ripard <mripard@kernel.org>
To: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
 <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
Subject: Re: (subset) [Intel-gfx] [PATCH 1/7] drm: Do not round to
 megabytes for greater than 1MiB sizes in fdinfo stats
Message-Id: <169926754510.509936.5351323311906298586.b4-ty@kernel.org>
Date: Mon, 06 Nov 2023 11:45:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Sep 2023 14:38:37 +0100, Tvrtko Ursulin wrote:
> It is better not to lose precision and not revert to 1 MiB size
> granularity for every size greater than 1 MiB.
> 
> Sizes in KiB should not be so troublesome to read (and in fact machine
> parsing is I expect the norm here), they align with other api like
> /proc/meminfo, and they allow writing tests for the interface without
> having to embed drm.ko implementation knowledge into them. (Like knowing
> that minimum buffer size one can use for successful verification has to be
> 1MiB aligned, and on top account for any pre-existing memory utilisation
> outside of driver's control.)
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

