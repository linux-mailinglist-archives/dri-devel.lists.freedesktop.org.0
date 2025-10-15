Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15090BDFB27
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB6210E33A;
	Wed, 15 Oct 2025 16:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ENybR6Bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5600410E33A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:39:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7FAEB602B8;
 Wed, 15 Oct 2025 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFC5C4CEF8;
 Wed, 15 Oct 2025 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760546347;
 bh=uY/ri/R/uptObQp5pFssQiLcxUk4JQh2NMKsHkdSeFg=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=ENybR6BmBQieuG19sBiCFY7ya2zl+CjQYCLBGehWPGTMdLDjTMUldKXsD2Wt9bQ7G
 gQzqWJuRSrzFQgEjQILVAoJ2aliqcx39W/cj/pwdre5P7YSc4H4XvZAP4TBfZVVKCY
 OjxM5WAm8r+nj2W0tXwYaYOlFQEqp2FqGeZqHrs18ekBhLGjTQ9y7agXqDX9MWbw35
 r7MfVXSY4+9vml8uzn8C/OLgU3ntLvZNbGwmA+4ECVlk0Dgjfb/HV+RXu0Wr2Kg1hK
 P6524sTIfQ/hNOyueaqPgNbuPcv7c3tfwiObltpOCMMXQmInVAuRJ63CgV38YVDpCr
 W9wohz3gf0vEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 18:39:01 +0200
Message-Id: <DDJ1LC1XM765.33V1SPVZAIKP5@kernel.org>
Subject: Re: [PATCH v3] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
Cc: <bbrezillon@kernel.org>, <himal.prasad.ghimiray@intel.com>,
 <matt.coster@imgtec.com>, <robin.clark@oss.qualcomm.com>,
 <matthew.brost@intel.com>, <aliceryhl@google.com>,
 <thomas.hellstrom@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <simona@ffwll.ch>,
 <skhan@linuxfoundation.org>, <khalid@kernel.org>,
 <david.hunter.linux@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
To: "Ankan Biswas" <spyjetfayed@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251015152543.24368-1-spyjetfayed@gmail.com>
In-Reply-To: <20251015152543.24368-1-spyjetfayed@gmail.com>
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

On Wed Oct 15, 2025 at 5:20 PM CEST, Ankan Biswas wrote:
> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
> instead of '@map', leading to this warning during htmldocs build:
>
> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described i=
n 'drm_gpuvm_map_req'
>
> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250821133539.03aa298e@canb.auug.org=
.au/
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied to drm-misc-fixes, thanks!
