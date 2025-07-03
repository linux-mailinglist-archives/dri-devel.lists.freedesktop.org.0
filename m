Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F521AF8266
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 23:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7961B10E8DB;
	Thu,  3 Jul 2025 21:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ejdq2ZTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0566910E8DB;
 Thu,  3 Jul 2025 21:03:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8238144CC1;
 Thu,  3 Jul 2025 21:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AA4C4CEE3;
 Thu,  3 Jul 2025 21:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751576579;
 bh=7b7hqvr7EkwfaZqRMejuBUVtedc1L2nVgXoTo0R1Zzs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ejdq2ZTOFm5fL7nxl9fCsWQLRsYAt6UpXS4AUnX5W3AN3CK/NtF3aSnyov0qrlFvb
 HjG+91AOeJKLWszNYZW6MwxiIqHbayl0raNPV5mhm12DWtv2rERHr6v/rvJE40KN1t
 aWjfX0W31XD0bPSOPZuYtYOHKjLLEpRrHJvQCsui3r/HyU15+4vfdp2mdvenVIRymA
 yXtkpRv5BuODJw8/D3j+Bjlaly2/kfnSEiekJLEB11jpGtR6WgVkezMcHSkppTDa6p
 3TwbVR4NGxBre++XRhQlYACbf5Lmvt15ekENxB62a4Est2cHVwmt5G/JVZ9aFoyK5t
 hqdV7BkOJyw7A==
Message-ID: <a2b6a13c-4f64-43b2-8299-df9b785ba023@kernel.org>
Date: Thu, 3 Jul 2025 23:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] drm/panthor: support repeated mappings
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>
References: <20250703205308.19419-1-caterina.shablia@collabora.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250703205308.19419-1-caterina.shablia@collabora.com>
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

On 7/3/25 10:52 PM, Caterina Shablia wrote:
> This patch series adds OP_MAP_REPEAT flag, which lets the user map a BO
> region over an address range repeatedly with just one map operation.

Thanks for resending, will take a look soon!
