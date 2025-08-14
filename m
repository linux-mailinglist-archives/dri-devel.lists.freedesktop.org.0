Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016CB26FE2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 21:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579AE10E21B;
	Thu, 14 Aug 2025 19:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="azu2h/Sk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7897510E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 19:56:42 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b9edf504e6so689449f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 12:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755201401; x=1755806201; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E+rFK3Y16lc6qrisz2iW0SvAN0JWfOXhTcFJtP56TZ8=;
 b=azu2h/Skk1Uoje/RrgSHJSmCmeyUGEnuM/nvcbz2G6Cr1k29t6W/tYe7aQ/seMUKcq
 F9x+ggMOvBiF06d60KhnVwyTrEa+p1osuVpsWr3eVCk9trkf/rj4zQYVM10x0JRdCzsB
 Mjbpo1ITQUpA8fPNYzNOsGjpf6rhdOubI0cW47SQzA6A1kdFxmtnQdQsyaMUv02Tclag
 Hb0k8iDihhfOK643RCLTkg7UJPlVILoFdUFASZTmaE3IdUFmgxLLOw5LKzkgJR0TWbd/
 7gUGJMhxrqedYIC4c/BXyi+8OAL5tqLwtfYu9eLcUhpyc6FFfa8EZ2zzG+/uR9F+wu/1
 JiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755201401; x=1755806201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+rFK3Y16lc6qrisz2iW0SvAN0JWfOXhTcFJtP56TZ8=;
 b=AX9h0H3EqTNZYgau6TssNGvevDYGM+oD6JkoHSN3EAdwfCfhdNX0m0SLHIJAFlvK+t
 oW2FzouUiK+TPOSfqCh27jV+02PgUsa5IMA5ppU4ebWZA3vUKu5UCcboQvYEvaK5BqZT
 rhZYGQ/xeve+3psNcnWxeeURRbCbR0LyxUtgFpkMoH1Wh2QU4bT7vkF2rg0OYtaetQnU
 q9s8K/u+2jpG3bj3/ydE0tcUMX1VTJa36Z8vQCpvO5yrtq+U6iWyxlRkOJmsUy7SjzR/
 lxE2INWhGFYBxdA2FAVq4b8j20Ei9IefeHmEMBVcfZa4moEg3STUftlVpYRPgLgTQipG
 8dAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+Sjpzchomgojm1Gxu8agyoknx6qCVrcklw4Y+3m4BdTwMMCzVyPdgmw1aeX1CY5eQbD9V99t7F2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp38+Sd59PgQUthHCh6bvH+2culQmXLcoQG5esC4qIvFjLAHn1
 oeQv4L2nrjUfR8gQaT5olHvq1yZGWlQ8V2wrALJKurYhNSF5Xyto6f48UbNr7lMLB1nwblWIlQ/
 CNgiw02DMjDGm4FR12ZmO+av9CocvcllUAO13OpyrqA==
X-Gm-Gg: ASbGnct1KUx5wqfY34GZE89AsEqrO/bWyUrFl5Pytsm/APwTG7WrCU1AVt3FlWzXFq/
 71OXkECttRux0DVLS5fXn7tjkmPnSxDi9G1HVPepQyrCQ1XxCiCHxlurozsLg5/PWcFNHFHz/gH
 9936gL9ev9pwcB273lS/FWO64MgQZW1tLJFvDMMyeTomGTssMC8Hu11Uh88QGa+z9W6TwWgNdqb
 ctECd7mhw==
X-Google-Smtp-Source: AGHT+IEHYhs+plAEYsscD5Wz9WV0ctTxAwUekG1ZGW5n9xJP1t6RYA2SsxG2fFTDjUnHDR+BEqZV/VFaXcIIr6ZD36M=
X-Received: by 2002:a05:6000:2507:b0:3a5:39ee:2619 with SMTP id
 ffacd0b85a97d-3b9edf5bbafmr3886203f8f.47.1755201400932; Thu, 14 Aug 2025
 12:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
 <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
 <CACr-zFCq08Pu2=eLfe5=sYdGWEHmy7w+=Eo++9AjP96uCLCNcQ@mail.gmail.com>
 <536dd237-e668-4a88-ac2b-3bc88dca8a3e@linaro.org>
 <aJ325wUrBjydnc1m@linaro.org>
In-Reply-To: <aJ325wUrBjydnc1m@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 14 Aug 2025 20:56:30 +0100
X-Gm-Features: Ac12FXzfAjpaWSWVaNx050hBK800qnJzS4DQzavZiHUHsnQ10EkhLlcur9pIdMs
Message-ID: <CACr-zFDUAiT7Rd7joV13aZUGCuDrDETeALpESmbp9TYgMOqSww@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Johan Hovold <johan@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Stephan,

On Thu, 14 Aug 2025 at 15:47, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Thu, Aug 14, 2025 at 04:21:09PM +0200, Neil Armstrong wrote:
> > On 09/08/2025 00:28, Christopher Obbard wrote:
> > > On Mon, 4 Aug 2025 at 14:13, Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
> > > > > The eDP controller has an HPD GPIO. Describe it in the device tree
> > > > > for the generic T14s model, as the HPD GPIO is used in both the
> > > > > OLED and LCD models which inherit this device tree.
> > > >
> > > > > @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
> > > > >                        gpio-ranges = <&tlmm 0 0 239>;
> > > > >                        wakeup-parent = <&pdc>;
> > > > >
> > > > > +                     edp_hpd_active: edp-hpd-active-state {
> > > >
> > > > The node name and label needs an index as this SoC has two edp hpd pins
> > > > as I already pointed out.
> > >
> > > Sure. After looking at the schematics this should be called
> > > edp0_hpd_active. I will fix this in the next revision.
> > >
> > >
> > > > > +                             pins = "gpio119";
> > > > > +                             function = "edp0_hot";
> > > >
> > > > And you also need to configure the bias somewhere as you should not rely
> > > > on the firmware having configured things for you (as I also pointed out
> > > > before).
> > > >
> > > > On my T14s the internal pull-up has been disabled.
> > >
> > > I am still unsure of what else needs to be set here. Can you help me
> > > with the correct settings?
> >
> > Just add bias-disable;
> >
>
> I sent a patch fixing this for all the X1 devices upstream earlier [1],
> so you could also just send v7 with just the second patch of your
> series.

Sure. I will do so and base my next version on your patchset.


> The bias-disable is really somewhat device-specific (what if there is no
> pull down on the device side and someone disconnects the panel
> entirely?), so I put it into each board DT separately like Johan
> requested on v5. We have the same for the PCIe pinctrl.
>
> Thanks,
> Stephan
>
> [1]: https://lore.kernel.org/linux-arm-msm/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org/T/
