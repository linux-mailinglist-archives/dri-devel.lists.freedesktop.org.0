Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118F0AE61A7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F4510E06A;
	Tue, 24 Jun 2025 09:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i8uoWyVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525CE10E06A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:59:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B8E72629C9;
 Tue, 24 Jun 2025 09:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AF4C4CEE3;
 Tue, 24 Jun 2025 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750759170;
 bh=MoJ+QP9/5aJbOLjqadSJaeAW9mb0bRnunrRe7iL1NN0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i8uoWyVvcHfMM4UzTPWyGckFIlAhuVGjUlgV0gnWvQbzvI7Rt2MpCT9Mh7rHGKmOM
 neU3WMSuWrN2QHkpdPF50485dusI2R1hg3QNujzM4zyt600eDNm1RDIMM2DwHJqMyj
 MrooUo7E+d/ZKuvQ1rePMgjtz3mqB2+2snwpGqjuywrmlez32C3kbc0i2qga+wkHMI
 QpsHUD4eLion3SE7z7ufIQkn4WdIhqA2t704TzU/TjfLKI2vDIOs61OhT/qxCAhlEC
 /6ohITBcQ/bibh+dC5spTxw55VgLmDueHhMu6/zb6wr9dLUN0at+rER3NF3d9impZo
 YCcjsGNVMlIyg==
Message-ID: <0ba4c988-194a-46f6-8e5d-b8fbc95a3eb8@kernel.org>
Date: Tue, 24 Jun 2025 11:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: nova-drm: Update ioctl handlers to drop
 Opaque usage
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 daniel.almeida@collabora.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250624093200.812812-1-beata.michalska@arm.com>
 <20250624093200.812812-3-beata.michalska@arm.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250624093200.812812-3-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 6/24/25 11:32 AM, Beata Michalska wrote:
> From: Danilo Krummrich <dakr@kernel.org>
> 
> Following the removal of `Opaque<T>` for ioctl arguments in the DRM
> framework, this patch updates the affected driver code to use typed
> references directly.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

It's very kind you want to attribute the shared diff with a separate patch, but
you have to include this change into patch 1 ("rust: drm: Drop the use of Opaque
for ioctl arguments"), otherwise it still breaks the build intermediately.

Please feel free to just include the change in your patch -- no need for any
attribution as far as I'm concerned. :)
