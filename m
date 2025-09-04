Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D8B4399F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C110E9AF;
	Thu,  4 Sep 2025 11:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="djUTHghf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D9810E9AF;
 Thu,  4 Sep 2025 11:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 11DAF40471;
 Thu,  4 Sep 2025 11:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D192C4CEF1;
 Thu,  4 Sep 2025 11:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756984189;
 bh=Pl/Kp/dhWz0ALytYZvDvqWTH7WBjJIXrEp8tIpxw7uM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=djUTHghf3oqzR/Ce68eVIUgFzhA6jz6CPfIf7PRxk1kk7/m0gJ81wJTg3tdpIKecb
 DsoU9rChwTvFGNNy+RYjDm5moxcQE/ObSqheEgoie1Kn09a1oZ0hRo0XZZ5VW9SeAw
 Zby6Bg0phR46hP+IAs46CTK4316pwDQY0sYJa0V8Nms7xvQ8qJo6mJwZjO+eEOiDjF
 kNYVk9fqpHRDvrYLB3up34RlXxP0Vt5oLuM2FfbHlrjU794IuR+otX9Bx/64dZcLPp
 qLtHMfP3biMqkrhLpRJaqgtq4JDWq6NC1B/ZDetC3gidTpYy4ybWMmPEJZaHNuF1c1
 Oyjf6Y2rQNwqg==
Message-ID: <08632fbd-1984-44ff-a6e1-bd9e39bbea97@kernel.org>
Date: Thu, 4 Sep 2025 13:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
To: Alice Ryhl <aliceryhl@google.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, acourbot@nvidia.com,
 daniel.almeida@collabora.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
References: <20250901202850.208116-1-dakr@kernel.org>
 <aLlsmNzp_KardLUt@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aLlsmNzp_KardLUt@google.com>
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

(Cc: Jani)

On 9/4/25 12:40 PM, Alice Ryhl wrote:
> On Mon, Sep 01, 2025 at 10:26:39PM +0200, Danilo Krummrich wrote:
>> +DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
>> +M:	Danilo Krummrich <dakr@kernel.org>
>> +M:	Alice Ryhl <aliceryhl@google.com>
>> +S:	Supported
>> +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
> 
> It looks like the right path is:
> https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-rust.html

Heh, seems like there's an explicit redirect for drm-misc:

https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

I think we should get the same redirect, so the links in MAINTAINERS are
consistent with each other.
