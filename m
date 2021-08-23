Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6053F52A4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 23:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4B689BC2;
	Mon, 23 Aug 2021 21:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB6889BC2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 21:13:57 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 957661F42654;
 Mon, 23 Aug 2021 22:13:52 +0100 (BST)
Date: Mon, 23 Aug 2021 17:13:45 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panfrost: Clamp lock region to Bifrost minimum
Message-ID: <YSQPiQX8IOkJJSoY@maud>
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
 <20210820213117.13050-4-alyssa.rosenzweig@collabora.com>
 <818b1a15-ddf4-461b-1d6a-cea539deaf76@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <818b1a15-ddf4-461b-1d6a-cea539deaf76@arm.com>
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

> > When locking a region, we currently clamp to a PAGE_SIZE as the minimum
> > lock region. While this is valid for Midgard, it is invalid for Bifrost,
> 
> While the spec does seem to state it's invalid for Bifrost - kbase
> didn't bother with a lower clamp for a long time. I actually think this
> is in many ways more of a spec bug: i.e. implementation details of the
> round-up that the hardware does. But it's much safer following the spec
> ;) And it seems like kbase eventually caught up too.

Yeah, makes sense. Should I drop the Cc: stable in that case? If the
issue is purely theoretical.
