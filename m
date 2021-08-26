Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A943F87D3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133146E836;
	Thu, 26 Aug 2021 12:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BFD6E836;
 Thu, 26 Aug 2021 12:43:28 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7201922173;
 Thu, 26 Aug 2021 14:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629981806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSWjg7oTauzs6qyI/TdnBZKk5aEHxZIo5MLqxy6CYF0=;
 b=rrMTNkLnhRa+waIzNGf3Obc91poG0QomCOgxK2bU14KJM1K4vto55BvWNK5n11pqT0Dj4Z
 u9j4Vr+xs2ZlT7WpJHVxKyCbTX7jvHRN+KUabFzjfhnoaoZu+pFF9lWTRJuegH2FeLcxST
 iIT2rrJzYPJbuL2Xq1/HqnqZSw8f4dU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Aug 2021 14:43:26 +0200
From: Michael Walle <michael@walle.cc>
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>, Marek Vasut
 <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/etnaviv: use a 32 bit mask as coherent DMA mask
In-Reply-To: <20210826121006.685257-4-michael@walle.cc>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-4-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <732be3deb2a29b9d9e274ee543fa3b89@walle.cc>
X-Sender: michael@walle.cc
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

Am 2021-08-26 14:10, schrieb Michael Walle:
> The STLB and the first command buffer (which is used to set up the 
> TLBs)
> has a 32 bit size restriction in hardware. There seems to be no way to
> specify addresses larger than 32 bit. Keep it simple and restict the
> addresses to the lower 4 GiB range for all coherent DMA memory
> allocations.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Suggested-by: Lucas Stach <l.stach@pengutronix.de>

is missing here. sorry, will add it in the next version.

-michael
