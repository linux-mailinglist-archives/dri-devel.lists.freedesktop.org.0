Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F53AF4D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498C26E334;
	Mon, 21 Jun 2021 18:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EEA6E334
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:20:43 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c04:8c00::912b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5DCBE1F42352;
 Mon, 21 Jun 2021 19:20:38 +0100 (BST)
Date: Mon, 21 Jun 2021 14:20:31 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/2] drm/panfrost: Queue jobs on the hardware
Message-ID: <YNDYb8Pdkd9Ha5ue@maud>
References: <20210621140226.1685529-1-boris.brezillon@collabora.com>
 <20210621140226.1685529-3-boris.brezillon@collabora.com>
 <79669b33-afc7-7eae-988a-f3141fffa2d4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79669b33-afc7-7eae-988a-f3141fffa2d4@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Also that feature was only introduced in t76x. So relying on that would
> sadly kill off support for t60x, t62x and t72x (albeit I'm not sure how
> 'supported' these are with Mesa anyway).

t60x and t62x are not supported, but t720 very much is (albeit GLES2
only, versus t760+ getting GLES3.1 and soon Vulkan)... t720 has
deqp-gles2 in CI and is ~close to passing everything... Please don't
break t720 :)
