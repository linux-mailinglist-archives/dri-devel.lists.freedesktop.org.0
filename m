Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71465AD5EE9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 21:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E1B10E728;
	Wed, 11 Jun 2025 19:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3F310E6F5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 19:18:33 +0000 (UTC)
Date: Wed, 11 Jun 2025 15:18:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1749669509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T7fxo3q5zRvtn6y/SCuAsnMPegqoz8YNRTrlcg1kSc4=;
 b=xS7/njEYBTGVj+XQys0OeTRvJbIslTpkzVwP5HZTRxG1dr9FteQ84d09ko5aQzmIR54n3Y
 MDvwR8nbAe9EpQ2Y5LgaPu+AapAchfueR9BwT4929UCSiDxhlQ0uwhPe6BM8MkJiVSxmPo
 YsA2PcSqfz+t/FDhUKhJw1mZhUZyRtwGgYp4jGJNZjlg2s1VLv+AWwMIXCuHeMHOl2JiNh
 uXtrZjyfrtju1PPzYae1byKtiCTDgdcHpL/bfKBwGKPZkn+B3DQULbRoMZZ/ihcz9RswGG
 vldfxoVbp5bew0aIPK5Hh22JLynv3hCGDwG819zvrVH+4losBF+2EAvgtbJKGg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Rob Herring <robh@kernel.org>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
Message-ID: <aEnWgbSb77M9zdy3@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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

> > +              - apple,agx-g13s
> > +              - apple,agx-g13c
> > +              - apple,agx-g13d
> > +          - const: apple,agx-g13x
> 
> I'm assuming the 'x' is a wildcard. The preferred thing to do make one
> of the 3 actual devices the fallback. Typically, the oldest one is
> used.

Yeah, it's something of a family. G13X is an apple codename for these
three chips.

We can do `apple,agx-g13d, apple,agx-g13s` as the compatible list and
omit the g13x compatible. I'm not sure if that's actually better since
we'd continue to use the G13X naming in the driver itself but it's a
minor point either way.
