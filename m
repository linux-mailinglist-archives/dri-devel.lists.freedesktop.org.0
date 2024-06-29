Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A120E91CF19
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 23:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09A510E0DD;
	Sat, 29 Jun 2024 21:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="d1/BenLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D65A10E0DD
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 21:01:08 +0000 (UTC)
X-Envelope-To: kirby.nankivell@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1719694866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EGXkI7vXLSu2IKu/iP17W57e+TDQ8N+uwrxnq3TxCJU=;
 b=d1/BenLKPRzjiJiyeEHxyM0gomWGKTbS9g+P7TGiymu9gL0Gp8hSY51/N/+Y8B3fopYQBf
 bfZ158ZDjsp2V4weY9yPgJNIEhD+iqoalvc5iUAkwo25AsTiKr5uywOLg+hZrjUEzmOSx1
 4AMp0hb3vb2aI3l44VcEQ2Hai8oF6bDRwC8wwvmbPPaMrgF6gpsOmwcTxAmGbOSbqmDY0f
 Vo1DdHh7QTRTCnRGZTYB9Q1zWmJc7TRi9jagkN+uVCSeGnM6kHCmy+AHiwaHPTTfFtto8e
 j4Wh8SY2RaXUmoeb5auYdNQkpHFy3Hadt6AO9tGvQs6Eg7D5OagzHnuudaa7XQ==
X-Envelope-To: jakobl.gm.g@gmail.com
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: andre.przywara@arm.com
X-Envelope-To: contact@paulk.fr
X-Envelope-To: mripard@kernel.org
X-Envelope-To: wens@csie.org
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: samuel@sholland.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Date: Sun, 30 Jun 2024 06:58:17 +1000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Kirby Nankivell <kirby.nankivell@gmail.com>
Cc: Jakob L <jakobl.gm.g@gmail.com>, linux-sunxi@lists.linux.dev,
 andre.przywara@arm.com, Paul Kocialkowski <contact@paulk.fr>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: T113 TCON Top tinting troubleshooting
Message-ID: <ZoB1ac1bEI8aH-Yp@titan>
References: <Zn8GVkpwXwhaUFno@titan>
 <CALP2yXcUrCdzyqQx7RQUup3QjfbH4VnMVCPFVXNmmd08GJkKMQ@mail.gmail.com>
 <CAMBcuYNG6n1_yc0-5MSFoh2xCfh3-tHG7VcQq5vY65RKSq39RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMBcuYNG6n1_yc0-5MSFoh2xCfh3-tHG7VcQq5vY65RKSq39RA@mail.gmail.com>
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

Hi,

On Sat, Jun 29, 2024 at 12:14:39PM +1000, Kirby Nankivell wrote:
> Tested this on a MangoPI-MQ-R with a RGB lcd and can confirm that this fix
> removes the green tint I experienced.
> 
> Disabling the mixer1 in DTS entirely also works.
> 
> I suspect on the basis that the Mixer/TCON-TOP topology is identical to the
> R40 but does not seem to experience this issue, that is a
> silicon errata specific to the T113/D1s as far as we currently know.
> 
> However, there is no functional reason from a drm perspective to require
> more than one mixer tied to one output via tcon-top - unless someone has a
> good argument here?
> 
> in my opinion:
> 1) implement this as a quirk on the t113 and fix mixer0 > rgb/dsi and
> mixer1 > tv0
> 2) make this a global default for the sun8i tcon top driver where only one
> mixer is initialised against an output (which would also impact the R40)

The only reason I caught this issue was because I implemented LCD output in
U-Boot and saw it looked a little better- I thought the tint was the backlight.
Had you not contacted me and had it not affected the person I'm doing
work for I would not have bothered looking in to this.
It's entirely possible that the other supported devices have this issue,
or that future ones will and nobody will notice.

Going with a preventative approach here by fixing it for all potential devices
and relying on the behaviour the sunxi code assumes rather than the datasheet
says seems like the best approach to me.

John.
