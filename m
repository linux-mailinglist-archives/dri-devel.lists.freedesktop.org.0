Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9146E47E46B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 15:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8138410E1CC;
	Thu, 23 Dec 2021 14:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D18610E1CC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 14:15:08 +0000 (UTC)
Received: from maud (unknown [IPv6:2601:18d:8700:1ffa:ccf1:c9dd:4b35:443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6871E1F44B55;
 Thu, 23 Dec 2021 14:15:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640268907;
 bh=Nb0/xWOvOsX5DZhMenc3NE4i6CaZMGp9bfHZHLuLCK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QfyLckwttzog8EOCGwZ1TsghYDvtxesWK7Ro9h1FYf+3g5uLTTrh4LGdqjul7YS5T
 xmyPmQFUE2S1XkScL9BBinglOlssOSZSJ/xjFX6PaNMnsClCxm/ZHqUZHi8U2N8hWm
 7v6lDFOwZ9XXDC8srwI6BDOdcOSq9M7llRbN22DEn8EZ8oiAOWyS+IajrWpFgaTfOz
 wmdOfhTu+PyEmaj0lQHQh6k1W72Dcv7LwyKz6V5VPl1PYJSMH2fkyl1x1XjTkF0dYx
 J2OMuXvAh/il5v+xfeacCvZ7mPrHQlKSag9ZxhxIvpzDscpWA2KkFnk1L2vFN9ml7L
 E3aXRq9qxrLqQ==
Date: Thu, 23 Dec 2021 09:14:58 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: asheplyakov@basealt.ru
Subject: Re: [PATCH 0/2] drm/panfrost: partial support of T628 GPUs
Message-ID: <YcSEYszL3bQWhbdb@maud>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223110616.2589851-1-asheplyakov@basealt.ru>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> With these patches panfrost is able to drive mali T628 (r1p0) GPU
> on some armv8 SoCs (in particular BE-M1000).
> r0 GPUs are still not supported [yet] (tested with Exynos 5422).

What's needed for r0?
