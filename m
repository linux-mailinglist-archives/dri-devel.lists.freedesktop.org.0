Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58396FC480
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 13:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D2610E383;
	Tue,  9 May 2023 11:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8086F10E383
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 11:05:00 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
 by mail.gandi.net (Postfix) with ESMTPSA id 9750EFF806;
 Tue,  9 May 2023 11:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
 t=1683630298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cDT0BtDNWazrZ4uv2nOgwA/L/iBlds6MCiBQoDX01O8=;
 b=nSHUVWeB/sHhhhKvC0ANQeATJy/AYsdWCoxH6/rR0iq/mzZY5b0etDsw0+/CMFVtiUQ3Ov
 xjmj4eLNviD5ppjGWTJjtUBeXTmJ8RT6p2h+pCQAqVdM71f1CHBzdM8yVsjMwxGreTxhiu
 2dgJaAq3XqNjRd4sQN/cH18YXNgfZUYSvf4u8fa4EC/96ssNFlZYM3/nD383t2AOlbMn1w
 zI3KMUaYMg9ZlR1SYVeHQHEpi6eBaFEjPToakJ28UeUKS0mzkXXMtn5XD/2v4gNQQrNDTE
 TDBj073uecqHyipjvbp3JZPPVwAQ1wetsx+Taa0ZlgNQEzMS+hweEMFlQiGVNQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 13:04:50 +0200
Message-Id: <CSHP4M31IC80.2WGQC75I3PX71@void.crly.cz>
Subject: Re: [PATCH v4 0/4] drm: sun4i: set proper TCON0 DCLK rate in DSI mode
From: "Roman Beranek" <me@crly.cz>
To: "Frank Oltmanns" <frank@oltmanns.dev>
X-Mailer: aerc 0.15.1
References: <20230505052110.67514-1-me@crly.cz> <87jzxjp5tp.fsf@oltmanns.dev>
In-Reply-To: <87jzxjp5tp.fsf@oltmanns.dev>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel
 Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-clk@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Ondrej Jirman <megi@xff.cz>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Frank,

On Mon May 8, 2023 at 10:47 AM CEST, Frank Oltmanns wrote:
> I tested this on my pinephone on drm-next, using additional patches for
> the pinephone's panel. [1] [2] [3]

Thank you for testing this and all the previous version of this
patchset. I appreciate your help.

> I played back a 60 fps video (10 seconds) and recorded the panel's
> output with a 240 fps camera. I noticed only 2 dropped frames, that I
> account to the imperfect data rate of 107.8MHz instead of 108 MHz due to
> pll-video0's rate being 294MHz instead of the 297 MHz for reasons I
> described in the thread on your v2 of this patch [4]).

Yes. That's what should happen, right? Or do you report this as a
defect?

Roman
