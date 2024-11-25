Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B79D89C6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 16:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EE610E0EF;
	Mon, 25 Nov 2024 15:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.b="UBjsckh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DFC10E0EF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 15:55:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id BF2F541A48;
 Mon, 25 Nov 2024 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1732550109; bh=Nbi7jGHMHqCOiVJdgNk+yM5Aex5D7yPTPOFZz9QtO4Y=;
 h=Date:From:To:CC:Subject:In-Reply-To:References;
 b=UBjsckh9mezNpgAv1OBbxdguxzVBpMiV456rgWaUT13XQgWO+iA7HihREOcrTh7Cf
 9MMScOaAT2AXHeLQdaF+BpipbD6nkUaH7cwmcjECCORCcJBQ+d/g/9+1irOEhFY5Fv
 gpvDptEQ4r4BhTuWaHZRyt/V9sa/cSnUhu16TzQsLPcpTa3LwOkxb0O5jy6TdZ56q/
 vukcqHwux/0UYuDXEuRQr/ckvDjB1yI0mwVygvHum2kOYQJvsQdaNhMi5E+VPUej/t
 6NBI0BP2Nb/Ipwd//qkRFHAv0YZic4IykczXrOODGeKKJHxJFlfd4Gj9FoqNddkXU9
 Tap+AiIiLaxKg==
Date: Mon, 25 Nov 2024 16:55:04 +0100
From: Hector Martin <marcan@marcan.st>
To: Maxime Ripard <mripard@kernel.org>
CC: Sasha Finkelstein <fnkl.kernel@gmail.com>, neil.armstrong@linaro.org,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
User-Agent: K-9 Mail for Android
In-Reply-To: <20241125-gabby-furry-rooster-cf28a9@houat>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
 <20241125-gabby-furry-rooster-cf28a9@houat>
Message-ID: <891D03B0-1A2C-4C38-85F2-F8CBBAC1A5CC@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On November 25, 2024 4:28:00 PM GMT+01:00, Maxime Ripard <mripard@kernel=2E=
org> wrote:
>On Mon, Nov 25, 2024 at 11:24:25PM +0900, Hector Martin wrote:
>>=20
>>=20
>> On 2024/11/25 20:24, Sasha Finkelstein wrote:
>> > On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil=2Earmstrong@linaro=
=2Eorg> wrote:
>> >>
>> >> So this controller only supports a single mode ???????
>> >>
>> > Most likely=2E On all devices it is connected to a single built-in di=
splay=2E
>>=20
>> More specifically, the controller obviously supports multiple modes but
>> it is pre-initialized by the bootloader for the single hardwired
>> display's only mode=2E So as far as the driver is concerned, there is a
>> single possible mode, and there's no point in trying to be more generic
>> if there is no hardware that would use that=2E
>
>It's not only about being generic, it's also about fitting nicely in the
>usual abstractions=2E You could also always register a single panel, with
>a single timing set, and the driver would never see anything else=2E And
>still fall within the usual pattern=2E
>
>> In general, it is not possible/practical to be generic for reverse
>> engineered hardware with no specs documenting how to drive it
>> generically=2E You just can't know how to implement the options that ar=
e
>> never used in practice=2E I spent a lot of time on exceptions to this
>> rule for the GPIO and SPI controllers, and that's not going to happen
>> for more complex hardware like MIPI DSI=2E
>
>How is GPIO or SPI even remotely related to that discussion? We are
>different maintainers, with different concerns, and different things to
>care about=2E
>
>Also, "My way or the highway" is never a great discussion opener=2E

This was not an attempt to push back on the review feedback at all=2E I wa=
s just trying to add context about *why* the controller will never be used =
with nor support more than a single mode, not argue about how that should b=
e implemented=2E Sorry if it came across as otherwise=2E

GPIO and SPI are relevant not because of anything related to the kernel, b=
ut because I was able to reverse engineer the generic features of those con=
trollers quite comprehensively by literally probing a GPIO routed to an ext=
ernal USB-C port with a custom test bench and an oscilloscope (for GPIO) an=
d by using the GPIO registers along with a bespoke bare-metal test platform=
 as a "software" logic analyzer to inspect the signals generated as I twidd=
led register bits (for SPI)=2E I'd love to have all hardware comprehensivel=
y documented like that (I did GPIO and SPI because I wanted to, not because=
 any maintainer asked for it), but as you might imagine, this kind of deep =
hardware RE doesn't scale and isn't practical for anything more complex, an=
d I was just trying to convey that fact=2E

(Sending from mobile, apologies for the likely dodgy line wrap)


-- Hector
