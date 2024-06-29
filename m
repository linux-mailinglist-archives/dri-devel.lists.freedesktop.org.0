Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FA91CA79
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 04:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660BD10E1D7;
	Sat, 29 Jun 2024 02:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="y9FWHy3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D17310E1D7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 02:12:51 +0000 (UTC)
X-Envelope-To: jakobl.gm.g@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1719627169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a25bTE27wqTKuFvWrxZNULOpqakyZCl/Q4oa56L0f8o=;
 b=y9FWHy3DWAhkBtX0eh+qqKjdoBwh/Tbuj1OdX/bIUREBXQqQZzz3a+674KhiQMiUfb9I8P
 4BOcdCdEDzwuyeSRovbpBsXuQYZhoOSOL5Dp/AK5YzAVKL49xd06vHUAJsOTECpAf6gez1
 LeZNx++YOfINQGAQ4M9G+gvk1eN9mTT81LvyhIeQ4UUo3HQ6H9d2muxkqLlO+DdVXpCKIC
 YRERKTF9EVvsionjXKvdkQFcmzmL7ThR1S1H91bW4hC5msOaS/v1+DCg22dglSmeNfOv5Z
 wQZMMTVMi6miEimfJW27+OIWWPbnioJsWeX3a4aUC92bor6nN60p//Rhr+YXfQ==
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: andre.przywara@arm.com
X-Envelope-To: kirby.nankivell@gmail.com
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
Date: Sat, 29 Jun 2024 12:12:30 +1000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Jakob L <jakobl.gm.g@gmail.com>
Cc: linux-sunxi@lists.linux.dev, andre.przywara@arm.com,
 "K. James" <kirby.nankivell@gmail.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: T113 TCON Top tinting troubleshooting
Message-ID: <Zn9tjooo9f-oe_3h@titan>
References: <Zn8GVkpwXwhaUFno@titan>
 <CALP2yXcUrCdzyqQx7RQUup3QjfbH4VnMVCPFVXNmmd08GJkKMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALP2yXcUrCdzyqQx7RQUup3QjfbH4VnMVCPFVXNmmd08GJkKMQ@mail.gmail.com>
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

On Sat, Jun 29, 2024 at 01:49:53AM +0200, Jakob L wrote:
> Hi John,
> 
> good find! This seems to fix it on my DSI implementation. Every of the
> recent boots resulted in a pink tint (usually it was green for me, or blue)
> Booted 10 times - no tint.
> 
> So this patch is good, but probably has to be implemented as a quirk?
> 
> Jakob

Hi Jakob,

I'm not sure if this needs to be a quirk: There's not really a reason to
set both DEs to the same output. My thinking right now is to error in
this situation.

However I think we have to somehow track which DEs have been set so we
can pretend they start unset. For example:

DE0: (Unset, LCD0) DE1: (Unset, TVE0)

Setting DE0 to LCD0 should work, then setting DE1 to LCD0 should fail.
Setting DE0 to LCD0 should work, then setting DE0 to TVE0 should work.
Setting DE0 to TVE0 should work, then setting DE1 to TVE0 should fail.

The mechanism here for setting a DE I think would go like this:

1. Check the opposite DE's value
2. If it is duplicate and set, error
3. If it is duplicate and unset, change the opposite DE's value
4. Set the DE
5. Mark it as set

Step three requires finding an unused DE value, this could be done by
inverting the bits of the new DE. Alternatively we could do what
Allwinner does and start with both DEs at different values and the move
instead the current DE value to the opposite DE to avoid conflicts.

'Set' here may make more sense as 'used'.

I'm good at mentally over-engineering things, so if you can think of a
better solution please tell me.

John.
