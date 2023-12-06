Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590818074E8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 17:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C0E10E758;
	Wed,  6 Dec 2023 16:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F58F10E758
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 16:28:35 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 33A036602173;
 Wed,  6 Dec 2023 16:28:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701880114;
 bh=brmR5KTHw/GyuNuC/iQc8vsc6bHfUeG/yj+g2nj+iGg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VmCMYYkKbEFhRCcy97CNggaDTCyT9xsGGIeKCWRzVwbDSU/AhXt3NGpJEVOO1n+4f
 ZwAsrGsIwkn84G3i/u09ckYCIU9VKFN/J1e+rDzsLKmXJZS7wCdcBoPBp5HYuPHDza
 aGzYL5DBf8USBhIacBRb6GCaP8WdpS+aLoqRif1WczV8ECGlQp1CL5yJn/Dfnl23Nz
 4Fj7t31fBH9+Ft3TcLQOC3t9KTm4vC0TJftfrLOomFbB6AMMHTS6BgDNS8Sjaq/I+I
 3Og4a2Ss+wEA93SmPKVgDj/K/RfNNiK6gbIwNAJGEW22B4egVYc8iqe2/GGJJliaxZ
 gKpCw0qZUPAdw==
Date: Wed, 6 Dec 2023 17:28:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20231206172830.05a4752e@collabora.com>
In-Reply-To: <43a75119-b15d-4570-b272-1fe702784632@arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231205094847.221ab103@collabora.com>
 <43a75119-b15d-4570-b272-1fe702784632@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "Marty E . Plummer" <hanetzer@startmail.com>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Nicolas Boichat <drinkcat@chromium.org>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 kernel@collabora.com, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,

On Wed, 6 Dec 2023 15:47:29 +0000
Steven Price <steven.price@arm.com> wrote:

> On 05/12/2023 08:48, Boris Brezillon wrote:
> > Hi Steve,
> > 
> > I forgot to mention that I intentionally dropped your R-b, because
> > there was a gazillion of changes all over the place, and I thought it
> > deserved a fresh review.  
> 
> No problem, I'll re-review the patches. Thanks for getting the v3 out to
> review.
> 
> <snip>
> 
> >> [3]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3
> >> [4]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3+rk3588
> 
> AFAICT neither of these trees match (exactly) with what you've posted.
> Not a big deal - I'll review the patches on the list, but it's a little
> confusing having a 'v3' branch which doesn't match the actual v3 posted
> ;) I also note you have similarly named branches in
> https://gitlab.freedesktop.org/bbrezillon/linux which are more
> up-to-date but also not 'v3'.

Oops, definitely forgot to push to the panfrost tree.

I also messed things up with the VM_GET_STATE ioctl addition, which I
intended to be part of this v3, but somehow forgot to regenerate the
patches.

v3 branches should now match this series, and I also pushed preliminary
v4 branches containing !fixup commits in case you want to have a quick
look (nothing fundamentally different there).

Regards,

Boris
