Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091D7B53069
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F59010EAAF;
	Thu, 11 Sep 2025 11:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aKH2rzut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59CD10EAAB;
 Thu, 11 Sep 2025 11:28:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D29E060230;
 Thu, 11 Sep 2025 11:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EF9C4CEF0;
 Thu, 11 Sep 2025 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757590126;
 bh=UY6Vyd9BH1p4KqI2qdWiaYaRdhw/Bn6OcYKq1clIIkc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aKH2rzut0onVytRDBVM9SWpa/xmSYc7S391EV6F55tCpDuxVRpAZ3b7RdUsglSGA1
 G0bGIa9oGL7sjOYmpOV8DdsE3tCB8S/FfKGgbYJhIPuP4XhQ/2fvGv2BLa/6vnLQvZ
 8sBdvacb4B6DwU7u7UXdafICLJVtTEatBtIKaVdpU/Rs6ivX464wp1qfXMtg5DImbq
 sN6b0YLQcMhgj9ykywlQ5LzLw9taxEVqV/0ar2TWjvjKa0gXE+Lm6nx+LXi5qGFZ+o
 YAPqlDGiV27tUWWW+osXlQgZ48Hfvg+7KFSP7G1+7fxAfzmKWdn7Ph9CoBN7Kx/laR
 jbdyzOW78GEqg==
Message-ID: <af4d3fa8-e4f6-41de-bd57-86896b8a2631@kernel.org>
Date: Thu, 11 Sep 2025 13:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/12] gpu: nova-core: process and prepare more
 firmwares to boot GSP
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
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

On 9/11/25 1:04 PM, Alexandre Courbot wrote:
> This series makes more progress on the GSP boot process for Ampere GPUs.

With the changes mentioned on the individual patches, the series is:

Acked-by: Danilo Krummrich <dakr@kernel.org>
