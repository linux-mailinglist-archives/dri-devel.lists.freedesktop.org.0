Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625177CF218
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A65C10E499;
	Thu, 19 Oct 2023 08:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA0D10E499
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:11:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 77232B82491;
 Thu, 19 Oct 2023 08:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52961C433C7;
 Thu, 19 Oct 2023 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697703087;
 bh=/AQ30Ywjd2dmLHisUfQKE5YeApuVr3bs37ZknilJ9wE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=On7fRHdPyznxzxA5fETIzzeHx+I7IOIsQA2Vdy6cl0ihUKzObyeYslC2k9SLdFuhO
 zG9Jef3BG1OXXCFoZZOdnjZI0LpCTuVHPoF09akcxI/EFeDq0oh8I/gAi9MM+0MLU0
 YRFoKbWLioYI9EOGl+rheRewEX90qD4H0rwdVE2kV1B8WhJWCUYHKFt2AHXFxKKjGH
 vD3jbMmaTe3cFI6WwJZrYEyogE0wEkhZ3/DJeh/sZpepFyARLFu0MhOdCydgGqypWl
 cVBExEGVhVBFddEkIxh7a9WAq6lCV9qTptqCVcyPjdoZ1JOAoRMhFCBbT70fpgsaV2
 oHUm7qJkajrMA==
Date: Thu, 19 Oct 2023 10:11:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: BUG: KASAN: slab-use-after-free in drm_connector_cleanup
Message-ID: <p5lvorprghpplw2gxxiajfea6xcjecevjkku7xg6phdg2l7jez@3cexjfyqqpg6>
References: <CA+G9fYvJA2HGqzR9LGgq63v0SKaUejHAE6f7+z9cwWN-ourJ_g@mail.gmail.com>
 <1ccaf470-4bc1-4a1f-81b0-2757a4a53bd7@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ccaf470-4bc1-4a1f-81b0-2757a4a53bd7@kadam.mountain>
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, lkft-triage@lists.linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 04:13:53PM +0300, Dan Carpenter wrote:
> If I had to guess, I'd say it's an issue in the vc4_mock driver.  It's
> crashing somewhere in Subtest: drm_vc4_test_pv_muxing.

Thanks for the report. I'm currently at XDC but I'll have a look as soon as I get back.

Maxime
