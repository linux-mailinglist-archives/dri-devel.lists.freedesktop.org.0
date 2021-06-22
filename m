Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681923AFD28
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 08:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9C56E3DA;
	Tue, 22 Jun 2021 06:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2035F6E3DA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 06:42:19 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A2B0B1F426F8;
 Tue, 22 Jun 2021 07:42:17 +0100 (BST)
Date: Tue, 22 Jun 2021 08:42:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH v2 2/2] drm/panfrost: Queue jobs on the hardware
Message-ID: <20210622084214.575b9f43@collabora.com>
In-Reply-To: <YNDYb8Pdkd9Ha5ue@maud>
References: <20210621140226.1685529-1-boris.brezillon@collabora.com>
 <20210621140226.1685529-3-boris.brezillon@collabora.com>
 <79669b33-afc7-7eae-988a-f3141fffa2d4@arm.com>
 <YNDYb8Pdkd9Ha5ue@maud>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 14:20:31 -0400
Alyssa Rosenzweig <alyssa@collabora.com> wrote:

> > Also that feature was only introduced in t76x. So relying on that would
> > sadly kill off support for t60x, t62x and t72x (albeit I'm not sure how
> > 'supported' these are with Mesa anyway).  
> 
> t60x and t62x are not supported, but t720 very much is (albeit GLES2
> only, versus t760+ getting GLES3.1 and soon Vulkan)... t720 has
> deqp-gles2 in CI and is ~close to passing everything... Please don't
> break t720 :)

Okay, I think I'll just disable this feature on t72x then.
