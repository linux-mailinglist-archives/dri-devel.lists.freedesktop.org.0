Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3491DB34
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 11:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A76010E370;
	Mon,  1 Jul 2024 09:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="oOVgyjTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 387 seconds by postgrey-1.36 at gabe;
 Mon, 01 Jul 2024 09:14:33 UTC
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE2310E370
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 09:14:33 +0000 (UTC)
X-Envelope-To: dri-devel@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1719824884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IWkD76VR7famEn8Nbe0wkLmIlzygXCHVCmau7jj4g+s=;
 b=oOVgyjTY4hXNXt3d48GL4BdGmMVTjrOg1/GHXbiO+wXTF7dgcS74XcXdgs4UR2eVSOuqkL
 lZt4E3IYv3zIA26m2e2B91XNpj1vL3X1jrpl/a9aHmTBpoikf8SpVeaxxajabkclUgNctv
 y9u/UjqaYWXR0PiEwxR3D5uDmEaWJQJ2diOoqRorX4H1SWReuNX76tYjfgVOWqeJnZAsWm
 azJkxZF7N6JWaKOiyP8rqmlVVo/VYD4Z3/1h9amxpkX7y+O0b6HYtb1Nz6+2q9UZHOCdHr
 SpfvAHF2DPWL//afSG+P6vnbQN0p1B3PW7saz2/QNfcCb6CYv2429OgHT5answ==
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: jonas@kwiboo.se
X-Envelope-To: didi.debian@cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jonas Karlman <jonas@kwiboo.se>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 00/13] rockchip: Enable 4K@60Hz mode on RK3228, RK3328,
 RK3399 and RK356x
Date: Mon, 01 Jul 2024 11:07:50 +0200
Message-ID: <2528743.FZeJfPzi8P@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6101972.8Rv6zO9TrO";
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

--nextPart6101972.8Rv6zO9TrO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Date: Mon, 01 Jul 2024 11:07:50 +0200
Message-ID: <2528743.FZeJfPzi8P@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
MIME-Version: 1.0

Hi Jonas,

On Saturday, 15 June 2024 19:03:51 CEST Jonas Karlman wrote:
> This prepares and enable use of HDMI2.0 modes, e.g. 4K@60Hz, on RK3228,
> RK3328, RK3399 and RK356x.
> ...
> This series may not fully depend on but was only tested together with
> the series "drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID
> cleanup" at [1].
> [1] https://patchwork.freedesktop.org/series/134727/

I only just now realized this part of your message and consequently
I had NOT applied the referenced patch set.

> I have tested 4K modes on following devices:
> - Asus TinkerBoard (RK3288)
> - Pine64 Rock64 (RK3328)
> - Radxa ROCK Pi 4 (RK3399)
> - Radxa ROCK 3A (RK3568)

And I can confirm that this patch set enables 4K(@60Hz) resolution when
connecting my Rock64 to my 4K TV with my self-build 6.10-rc5 kernel.
It selected the 3840x2160@60Hz resolution, but ``swaymsg -t get_outputs``
also reported a range of 4096x2160 resolutions.

In contrast, my 6.10-rc2 kernel which is quite similar, except for this
patch set, does not mention any 4K resolution at all.

So AFAIC you can already include:
Tested-by: Diederik de Haas <didi.debian@cknow.org>

Next up will be a test with my Quartz64 Model B (RK3566).

Not caused by this patch set, but I did encounter several 'interesting'
issues while testing it. As most do involve display/hdmi, I'll mention
them to have it at least publicly documented.

Summary of those:
1) With Debian's 6.8.12-1 kernel I got a stack trace and (initially) no
output at all. After some time (due to no signal) my TV turned itself
off (standby) and when I turned it on, I did see a console...
First line of stack trace:
WARNING: CPU: 0 PID: 432 at drivers/media/cec/core/cec-adap.c:1085 cec_received_msg_ts+0x52c/0xbb8 [cec]

2) The 6.9.7 Debian kernel I then installed did not have the stack
trace and did show a console, but in 1080p. But I have a 'vague'
recollection that the stack trace issue only happens sometimes.

3) All the kernels I tested had the following errors:

rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack on domain 'hevc', val=0x88220
gpio-syscon ff100000.syscon:gpio: can't read the data register offset!
hdmi-audio-codec hdmi-audio-codec.9.auto: Only one simultaneous stream supported!
hdmi-audio-codec hdmi-audio-codec.9.auto: ASoC: error at snd_soc_dai_startup on i2s-hifi: -22

4) And they also had the following warnings:

rockchip-spi ff190000.spi: Runtime PM usage count underflow!
dwc2 ff580000.usb: supply vusb_d not found, using dummy regulator
dwhdmi-rockchip ff3c0000.hdmi: supply avdd-0v9 not found, using dummy regulator
dwhdmi-rockchip ff3c0000.hdmi: supply avdd-1v8 not found, using dummy regulator
hdmi-audio-codec hdmi-audio-codec.9.auto: Only one simultaneous stream supported!
hdmi-audio-codec hdmi-audio-codec.9.auto: ASoC: error at snd_soc_dai_startup on i2s-hifi: -22

Those 'dummy regulator' messages got repeated numerous of times, 36 in total.
The hdmi-audio-codec only appeared after logging in, so likely 'triggered'
by the start of pipewire.

Cheers,
  Diederik

PS: and now Q64-B is really up, will report that separately
--nextPart6101972.8Rv6zO9TrO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZoJx5gAKCRDXblvOeH7b
bkliAPQLar1+3rYv8f7tdO2HFwuvGYEydoJbxV2lyIWeArMCAP9L9r5vAsl9k9fH
qizWhtOGi2kgAjnCmKgjh1LZrH1VAQ==
=CEwJ
-----END PGP SIGNATURE-----

--nextPart6101972.8Rv6zO9TrO--



