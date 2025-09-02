Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F7B3FCA6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2C210E1CE;
	Tue,  2 Sep 2025 10:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ApSYHyaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED69410E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 10:36:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0CBB86020B;
 Tue,  2 Sep 2025 10:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EAFC4CEF7;
 Tue,  2 Sep 2025 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756809396;
 bh=aLYwCVcjgK+Ykfa6a4sTh95sU5K4KlPUrOioPHSSVUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ApSYHyafSOLKGR+yfxcc3judZLx8wLkmz1h8TPBOIn+XAUVpmx4fvPPUV3WL5HUm1
 koGpuRdxldC1LV2PHrjvCDA2NwXeS6VUub6Wm0z1Xi6MRu6y9kOUfc1Ebw40hTEbTC
 Uu3yjxRBmLzLckSAGeouhw/1Yu10CsqvRKHJjE9DoVy5upVniAN63ei77ETj5ZIT0s
 40ntXS197fYo7dKrmypM/m76LLsCs2GBjouNaZlNNdKm44ORHeeYSlCjHEgHg/0Y3a
 2vIJXF0WUyv787A2iTqiB+X0ibiwzXAi0lozNAVIAgDFc++kWLm8kqGLKDCagYgHpG
 XTPuPvWwwvG5A==
Date: Tue, 2 Sep 2025 11:36:32 +0100
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Flavio Suligoi <f.suligoi@asem.it>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: mp3309c: Initialize backlight properties
 without memset
Message-ID: <20250902103632.GH2163762@google.com>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <14514a1b0d3df6438aa10bb74f1c4fc2367d9987.1751361465.git.u.kleine-koenig@baylibre.com>
 <aKLvaP55PIVhyFSc@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKLvaP55PIVhyFSc@aspen.lan>
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

On Mon, 18 Aug 2025, Daniel Thompson wrote:

> On Tue, Jul 01, 2025 at 11:22:37AM +0200, Uwe Kleine-König wrote:
> > Assigning values to a struct using a compound literal (since C99) also
> > guarantees that all unspecified struct members are empty-initialized, so
> > it properly replaces the memset to zero.
> >
> > The code looks a bit nicer and more idiomatic (though that might be
> > subjective?). The resulting binary is a bit smaller. On ARCH=arm with
> > an allnoconfig + minimal changes to enable the mp3309c driver the
> > difference is 12 bytes.
> >
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

Looks like you cannot send tags from non-related email accounts:

NOTE: some trailers ignored due to from/email mismatches:
    ! Trailer: Reviewed-by: "Daniel Thompson (RISCstar)" <danielt@kernel.org>
     Msg From: Daniel Thompson <daniel@riscstar.com>

I'll add the tags manually this time.

-- 
Lee Jones [李琼斯]
