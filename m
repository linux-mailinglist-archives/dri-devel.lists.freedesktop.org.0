Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48114B578C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C794210E1C9;
	Mon, 14 Feb 2022 16:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3B310E1C9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:59:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 927161F43B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644857941;
 bh=KOMYlczqCUUgeBE8RWdUWTc/oyxfXhKnikuX3b7RqAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UVtWRZ/sTdMhiK7PS2PDQY0rB3/ut2g+vYHXlH1+9NBSa+UX4/aLTyKNXOPHGzuU8
 ZPIoWfF8e+/jbAwlzpsY5BTNN1TuRGOA65WTk+4VWFAkJqgH6bdpXR0OomI3s/A6w2
 xipKsTpK+Dqu7s5t2hUSnfnA4ZIWe0HQ4BXGCcLcNEwX9kJVq97LiWSGoi1k96/gro
 64Hhc/Fr+mPs449TaK1aM16xiaEYYgZoVo+FdNFeMpQAhO6ZzDTNuJu0oygwcIGSSy
 mYaBzFyC8K8kd6/I0YE6/al7hFtRUZx3UIilsXMjnWtjqVsSlyqI6VWHdSw/+LsLRq
 m7JTaf0SndAtg==
Date: Mon, 14 Feb 2022 11:58:53 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/9] dt-bindings: Add arm,mali-valhall compatible
Message-ID: <YgqKTQ0xLA1CbQW/@maud>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-2-alyssa.rosenzweig@collabora.com>
 <5ca70986-d6a5-7c3e-b876-40e970805775@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca70986-d6a5-7c3e-b876-40e970805775@arm.com>
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
Cc: tomeu.vizoso@collabora.com, devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 63a08f3f321d..48aeabd2ed68 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -23,6 +23,7 @@ properties:
> >            - rockchip,px30-mali
> >            - rockchip,rk3568-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > +      - const: arm,mali-valhall # Mali Valhall GPU model/revision is fully discoverable
> 
> It might be worth spelling out here that this is *pre-CSF* Valhall. I'm
> pretty sure we're going to need different bindings for CSF GPUs.

Yes, agreed, will make a note for v2.
