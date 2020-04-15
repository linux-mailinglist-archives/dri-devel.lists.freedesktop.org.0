Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD661AA8E4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D3E6E936;
	Wed, 15 Apr 2020 13:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24936E936
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:44:20 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id f12so1118304edn.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 06:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ue1uYbSCM3f3qpA8DP0y7k1ImrV8BLgfQdpHr8wCsNY=;
 b=t1tHUxzTiQgXENqpRPkhu4r7D53edZ0m+YyDfE4zZm77mBrAeD+AJk/qDcvaXqE7sj
 nAyIMVaWsW9+exn0uRkwmZYyYY2s/1D032EXWTzANychHZBBwmhrSGPXpqM77rUzDgDy
 EFUsCBcmM1V77AuJCMlTC6eu1s2KbqZ1OmdXh/9MmaHYF2/vvqCkqQvnwkzKyhQAh5K/
 TngNW9975u9CEFjfFLzT2UaRr+IFp4oEB9q2S5jy2djzxqtXYd9LpsmfG0Du+ArwxHAG
 XS0tJUsmXrraheqIzm1CGO0dFMuGuXgBtJPARHpM2ymp/nBgfUTsXMn0MZ3srnJ6iVLO
 2I5w==
X-Gm-Message-State: AGi0PuaOMTkDVzn6sI6awQfAIyyt+wvdaIJqb51QGHlousk9odKMORau
 NkFP57IG4NZe5ygN7L+XksM=
X-Google-Smtp-Source: APiQypKNYzTDTcjJXJkyJ1tW3CmeNRTTMuezBm45FxKlxDAUOBaCIldgd2OqLmdaCh5e2z6JTgFDtA==
X-Received: by 2002:a17:907:118b:: with SMTP id
 uz11mr4894575ejb.89.1586958259236; 
 Wed, 15 Apr 2020 06:44:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id bs8sm2626297ejb.92.2020.04.15.06.44.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Apr 2020 06:44:18 -0700 (PDT)
Date: Wed, 15 Apr 2020 15:44:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Message-ID: <20200415134415.GA21120@kozik-lap>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
 <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
 <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, Jonathan Bakker <xc-racer2@live.ca>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:50:31PM +0200, H. Nikolaus Schaller wrote:
> 
> > Am 15.04.2020 um 13:49 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
> > 
> > On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >> 
> >> From: Jonathan Bakker <xc-racer2@live.ca>
> >> 
> >> to add support for SGX540 GPU.
> > 
> > Do not continue the subject in commit msg like it is one sentence.
> > These are two separate sentences, so commit msg starts with capital
> > letter and it is sentence by itself.
> > 
> >> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >> ---
> >> arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
> >> 1 file changed, 15 insertions(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> >> index 2ad642f51fd9..e7fc709c0cca 100644
> >> --- a/arch/arm/boot/dts/s5pv210.dtsi
> >> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> >> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
> >>                        #interrupt-cells = <1>;
> >>                };
> >> 
> >> +               g3d: g3d@f3000000 {
> >> +                       compatible = "samsung,s5pv210-sgx540-120";
> >> +                       reg = <0xf3000000 0x10000>;
> >> +                       interrupt-parent = <&vic2>;
> >> +                       interrupts = <10>;
> >> +                       clock-names = "sclk";
> >> +                       clocks = <&clocks CLK_G3D>;
> > 
> > Not part of bindings, please remove or add to the bindings.
> 
> Well, the bindings should describe what is common for all SoC
> and they are quite different in what they need in addition.
> 
> Thererfore we have no "additionalProperties: false" in the
> bindings [PATCH v6 01/12].

If these properties are needed for Exynos-specific implementation, they
should be in the bindings. If they are not needed, they should not be
here.

Take a look at midgard bindings for example. This is a nice starting
point for these here.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
