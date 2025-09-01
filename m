Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C534B3E04D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A5A10E41A;
	Mon,  1 Sep 2025 10:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e3zyxOqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D5210E419;
 Mon,  1 Sep 2025 10:37:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6811C601DD;
 Mon,  1 Sep 2025 10:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6184EC4CEF8;
 Mon,  1 Sep 2025 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756723061;
 bh=WFGY4iWVgdB0iqOWCIEY4oE+1wGv78wpSjqVqokCbuo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e3zyxOqOGo97AMIfSE8iO5OAdozg7aZA4I7FsayqEiBT0GpqjXY+pkT0Oq+U63i13
 TJVxYN33NSTyQKhljy+IPaWL1Cy46Flti9bLUHGFcirWTc9GJLlUbukVyO50Zy+3WX
 8ZbBU+zRH6ZPqEr0GrPzWeWdMOOmiowrOocStGLHG4Dn4FYrcrqGU5IXOcNsCylZLg
 JHnPZWOv3ZPyt9Q4yQzhy0NQhkxCE6zjPaWLduDE10rWC9HSPDN7sRZ2OSn+Hif1ow
 F3P2/4yLIKJ1GebTU4wbwmludSNN6nJs0gJVcifdqlk4xTth+izx4wlw53JgX2Pzaf
 WAG+NffUzySNw==
Message-ID: <fc15c557-623b-40b5-8254-53888c847da6@kernel.org>
Date: Mon, 1 Sep 2025 12:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpu: nova-core: vbios: simplify device use
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
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

On 8/8/25 4:46 AM, Alexandre Courbot wrote:
> This small cleanup series simplifies the use of `Device` in vbios
> methods.
> 
> The device is used for logging purposes only; thus we don't need a
> pci::Device, neither do we need it to be bound. This latter property
> allows us to store an `ARef` to it into structures that require logging
> instead of having all their methods take an extra `dev` argument.
> Removing this argument streamlines the code a bit.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
