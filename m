Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707F4B7A7A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 23:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF35410E5A0;
	Tue, 15 Feb 2022 22:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAA010E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 22:32:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 775CD1F44DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644964352;
 bh=qG9SVvMjlyz4qoL+19w6ELJjlO669Za8jz7+TJy+kt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxjgBS55i5eKGUrYZHuVMmSeaaOnUvH++tqFW41kGog7o9dHnReY/PYeP4zwiQER2
 QZHvYJOyvg4YyYuwcnJtJVifWEXS/u0fqrikPt2lnTMuyW2FGlJeel4ZP3Pg/AIngS
 7Drpx+Y1yfOAmScLs747gxCDTqvH5D60TytlpM6nvh5zIFw9wKCKrjsDxGS6CRmQyV
 hXV6iiUZmJA+1wl2xRCAfhX/qxjr6gdjv+c0mzTKw70JrRdfltKbWe0uDG6TJlIq0C
 ShWJqqnYkAxDc2SMM+cbhnMXZpGHnXu/9W6XE51SkG0SzQrZYEBNA96h69IoRdjoGk
 285SVnwOf75sQ==
Date: Tue, 15 Feb 2022 17:32:24 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/panfrost: Dynamically allocate pm_domains
Message-ID: <Ygwp+LDliCnbkMZQ@maud>
References: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
 <CAL_JsqKdb0_N252hR=iv3Lpi6T9+iCRBwzBQhS7UQGFNhM5k=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKdb0_N252hR=iv3Lpi6T9+iCRBwzBQhS7UQGFNhM5k=A@mail.gmail.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I'd do the oneliner changing it to 5 and be done with it. That being
> said, we have plenty of examples of doing this both ways, so whatever
> makes people happy.

Excellent, that's the patch I wrote originally :-)

Dropping this patch, unless Angelo (or someone else) strongly objects.
