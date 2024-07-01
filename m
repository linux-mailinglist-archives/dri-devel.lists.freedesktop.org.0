Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8BB91DBAF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 11:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4B210E380;
	Mon,  1 Jul 2024 09:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="Eb/ei43Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC39310E37D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 09:45:37 +0000 (UTC)
X-Envelope-To: dri-devel@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1719827135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/av4W2tCOJXydcbMH9LNQjQOsvgQ+rwVghFqvABN/IM=;
 b=Eb/ei43ZybmEZBl9HYbboGX2gXc0SInXoqoGDB5uOxQSBB2KFFzNO8DjZL9+XWEnRsFI6K
 IM2ie7+ckDT2PVQoYqQCAas6MKUDaxG6qwqJk8cWBiWvEK7aVvzy+VoFtwnztNXrgXH8WZ
 tW6cj0/dl+O65jC6RUV5BuVHjNu3Hx4QKyNZQGnl5h561dBDGXxoMY7vN7yhfgsdOSssrY
 OCIWyNv2IBHZikravyo6xHFpJQW4V2WbeVBY0Vt1tNPoFV/qrrvJPShFctVam5J/Q7+CXC
 qhufNa3qPJVWT7atbpOvZG9S6s0Ugx6/uxsPGOr6TTh5totCFRCMmz7TN7sS/w==
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: didi.debian@cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 00/13] rockchip: Enable 4K@60Hz mode on RK3228, RK3328,
 RK3399 and RK356x
Date: Mon, 01 Jul 2024 11:45:21 +0200
Message-ID: <2110934.yheWrVD7BS@bagend>
Organization: Connecting Knowledge
In-Reply-To: <2528743.FZeJfPzi8P@bagend>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
 <2528743.FZeJfPzi8P@bagend>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9944500.OYHocSe4MS";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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

--nextPart9944500.OYHocSe4MS
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Mon, 01 Jul 2024 11:45:21 +0200
Message-ID: <2110934.yheWrVD7BS@bagend>
Organization: Connecting Knowledge
In-Reply-To: <2528743.FZeJfPzi8P@bagend>
MIME-Version: 1.0

Hi Jonas,

On Monday, 1 July 2024 11:07:50 CEST Diederik de Haas wrote:
> On Saturday, 15 June 2024 19:03:51 CEST Jonas Karlman wrote:
> > This prepares and enable use of HDMI2.0 modes, e.g. 4K@60Hz, on RK3228,
> > RK3328, RK3399 and RK356x.
> > ...
> > This series may not fully depend on but was only tested together with
> > the series "drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID
> > cleanup" at [1].
> > [1] https://patchwork.freedesktop.org/series/134727/
> 
> I only just now realized this part of your message and consequently
> I had NOT applied the referenced patch set.
> 
> > I have tested 4K modes on following devices:
> > - Asus TinkerBoard (RK3288)
> > - Pine64 Rock64 (RK3328)
> > - Radxa ROCK Pi 4 (RK3399)
> > - Radxa ROCK 3A (RK3568)
> 
> And I can confirm that this patch set enables 4K(@60Hz) resolution when
> connecting my Rock64 to my 4K TV with my self-build 6.10-rc5 kernel.
> It selected the 3840x2160@60Hz resolution, but ``swaymsg -t get_outputs``
> also reported a range of 4096x2160 resolutions.
> 
> In contrast, my 6.10-rc2 kernel which is quite similar, except for this
> patch set, does not mention any 4K resolution at all.
> 
> So AFAIC you can already include:
> Tested-by: Diederik de Haas <didi.debian@cknow.org>
> 
> Next up will be a test with my Quartz64 Model B (RK3566).

The Q64-B test results were a bit different from Rock64's, but this patch set 
enabled the 4K@60Hz resolution as well.

1. The console output was at 1080p, whereas it also switched to 4K on the 
Rock64. I actually prefer this behavior.
2. After starting sway, it did switch to a 4K resolution, but this time it 
selected 4096x2160@30Hz on an unpatched kernel (my 6.10-rc2 and Debian 6.9.7).
With my 6.10-rc5 kernel *with* this patch, it selected 3840x2160@60Hz
3. None of those 'other' issues I reported with Rock64 showed up on Q64-B :-D

IOW: Also for the Pine64 Quartz64 Model B, you can add:
Tested-by: Diederik de Haas <didi.debian@cknow.org>

Cheers,
  Diederik
--nextPart9944500.OYHocSe4MS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZoJ6sQAKCRDXblvOeH7b
bg7PAP43ud+WY6aEThMAVyAjvq6OsJBZCk51RNwaBBlKWvhBJwD+P6wkixnSYesh
pjAUG98IhpJvAuq83kFJLgPOoOxb5wI=
=xfwS
-----END PGP SIGNATURE-----

--nextPart9944500.OYHocSe4MS--



