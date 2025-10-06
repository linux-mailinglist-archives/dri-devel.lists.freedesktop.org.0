Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF1BBBF303
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B33C10E464;
	Mon,  6 Oct 2025 20:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HSZF/EXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F118210E058;
 Mon,  6 Oct 2025 20:29:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A01184362A;
 Mon,  6 Oct 2025 20:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F4DC4CEF5;
 Mon,  6 Oct 2025 20:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759782587;
 bh=y/7OMzRn5Emn0tuB5k5g03xdsBv55C6TulHJkQ+VKnc=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=HSZF/EXwPAWIcHSQ1nHZRon6QmHQEqH/Pf+/Sx2vBDBwHUcDIzDlfS+mp/ds83k4Z
 Bx7fnV+g96ZKAJH3GYD06SeCQucOx2jWGieNhrAftARr0ldoSWPPDDNZziJDjeVfXS
 gAA68TW89gVWVz1SJBNlHlZm4MlHiCEVaYZJpdY4FC30UCYVDIy2aKh4gHrWO6WqTc
 stPAlxvehTg8kdv6SAfDWCB7BIqbZG9q3uo7lBK1idVQi8MV4qGTcDc6vSyEewcsXw
 PZzE70Li4zIVDa0YzSSBT04RHp0gaVh5xXAZtAgmSGq0nNqlIg6YkJMRdzoetVPzfz
 VO/z275MhrKag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 22:29:43 +0200
Message-Id: <DDBIV2C6FH2L.3NH6D76Q26GYD@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Mary
 Guillemard" <mary@mary.zone>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>, "Lyude Paul" <lyude@redhat.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>
To: "Mohamed Ahmed" <mohamedahmedegypt2001@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1
 to report new features
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
 <20251006191329.277485-6-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20251006191329.277485-6-mohamedahmedegypt2001@gmail.com>
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

On Mon Oct 6, 2025 at 9:13 PM CEST, Mohamed Ahmed wrote:
> This is so that NVK can enable compression for kernels that support it an=
d
> avoid cases where an older kernel would MMU fault when a newer mesa would
> try to use compression.

A slightly more detailed version of this would be great to see in a cover
letter. :)
