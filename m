Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E986BDEC80
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970E810E7E5;
	Wed, 15 Oct 2025 13:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g/poIZWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF8010E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:39:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5099B601DD;
 Wed, 15 Oct 2025 13:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A5DC4CEF8;
 Wed, 15 Oct 2025 13:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760535565;
 bh=DLGr/JRSYdd2THyi/Qlx9WbQlHXgP2AW6QiwTenTm5Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=g/poIZWcz+5f2BNgIIaO4bBp1i8a7pAPu54UlecaztDH0Rr4ymt1Df9wflKJhH+RJ
 UqWWyUs3SmAfeUTs7oC8LNxmVhO1yvBjgRZTLNiDEDS4KNxAtfWb8GaAejcage9H40
 W9O+9CAIpNuphF9rHauSxsWrfcOPlGqBB29Rs3oG/e4KnFDzi84idG2/NkjX51l88r
 u2XjwC9K/H55FZmdgVs+d6r9l3cPp4Ad/5s9M468PhIYHSmSUDHbgvdpnUq5pnDi2p
 fDhl1h+S6Ntg+xT66kPsmxlN74XmsmxEJxXioO6QKTnhpgUYJRqknvTAKsl/TMEfYU
 MD5gBLZ4iDqNA==
Message-ID: <a45af9ee-73c4-4097-932d-de671435f5e0@kernel.org>
Date: Wed, 15 Oct 2025 15:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for
 drm_gpuvm_map_req.map
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: bbrezillon@kernel.org, himal.prasad.ghimiray@intel.com,
 matt.coster@imgtec.com, robin.clark@oss.qualcomm.com,
 matthew.brost@intel.com, aliceryhl@google.com,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, simona@ffwll.ch,
 skhan@linuxfoundation.org, khalid@kernel.org, david.hunter.linux@gmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251015113656.21447-1-spyjetfayed@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251015113656.21447-1-spyjetfayed@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/15/25 1:31 PM, Ankan Biswas wrote:
> The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
> instead of '@map', leading to this warning during htmldocs build:
> 
> WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'
> 
> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

Please add a Closes: tag, checkpatch.pl should warn about this.

Thanks,
Danilo
