Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3BF89DF84
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C241112C99;
	Tue,  9 Apr 2024 15:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IYW28Gtx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B744112D53
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:45:51 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6153d85053aso50108217b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712677550; x=1713282350; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=buNYP7p7u2SjN+B3Y9aoQObdwXquT6XXRaxxD1OD6hQ=;
 b=IYW28GtxpbMjCCaJOusmTAhkHL21oWbqUgxOIyUsvR16vCLblQqLisovVNGNWy7I2U
 K9dMocmR5o/3qKPHXvhLr/+4JqO9f2SXNriUisujk3miY+NSGa1WRT5hwxeAa/sgs1bx
 p9AFULXtZ3DB/YLuxLvH76jTq3l0VFqNHbUYmhGrIp0gCDxhoFE1qgUHRwlL/L30Ya41
 nO7OfFvCZpCW1/vCJlamxgVHHzOO1F+u8EX61eGc3+Ecry3q4kJWSsKCEpRpfbZiPNSb
 loCKKMikUyMazL0G8Vl2YEqRYhO4ijzvpNxbWPNC6yP4lW1wpLNdm2cnf3NUv1qUTIZD
 TFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712677550; x=1713282350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buNYP7p7u2SjN+B3Y9aoQObdwXquT6XXRaxxD1OD6hQ=;
 b=nYtkJFTg1dWPdjDqMJpHz525U2ZYHIHANFHiOT8C4HusB/kCIWBeaongUSLl7U4bql
 3+IhmeRbbMbbu60SPJlYH5ZBm704S+aHu62rrrxFD5wkk5O1+c5UYw/Ju267TLjKmRYN
 zU8dj8DBMX0SDVLiDicHagFGSU4QkifanszLFaCSowVID3xJOjIIW+QsYkCcx/HJuQ+k
 d91mJK0i2TozUwa0zT31wQn+gOScccyniRRHUvebghT+AcY/jZnZbbzym1mmqpqiXGE7
 ntAusXhGKxYvzxI//gFaRfEWo2Lo8UhXcL8K8hqq6ZbgOcuITyQOdmyx8zVvpirlc8Ef
 ZbQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzcVS6i3/ehjGrEEbf2gAOqG1EwEp0UM2r90tqCfin4tY46XizQhA11SMsq/1Eao4h5Z6UnZQ18EZ10ILcwygX/yPxULA5K8IydMcU+omD
X-Gm-Message-State: AOJu0YzMvhsZAti0Tm7DQZujrAjGU+ASgdPeimWM9o5txIApc9NfxZwb
 wu7ny9sImrVMlSQ8GIBNdy06NLrAWUTIHgG17+Y3jHndM8cEGOQjaptULYdViFQQ6ke3DnOGgK/
 uQjwHKuWW2WXm5PUwJREMmshksgGaExrT98Y66Q==
X-Google-Smtp-Source: AGHT+IFQASAOVayyeXCcdEPsB1W5n+ToWptOioZCwSqIVanbm2a6TPbaXGP3/tSGH/lVzMnrpwjM9UGuBvHRJ7f07U4=
X-Received: by 2002:a25:ce05:0:b0:dcc:1dc4:15e4 with SMTP id
 x5-20020a25ce05000000b00dcc1dc415e4mr122551ybe.47.1712677550216; Tue, 09 Apr
 2024 08:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-2-angelogioacchino.delregno@collabora.com>
 <oe75tx35rd27r2a24ofdxfaqwr53tylfp5fwz3nrwc2uz6nmrs@vwc2krbpy3fh>
 <8600acf8-7b51-456b-8a81-4233cfd6f121@collabora.com>
In-Reply-To: <8600acf8-7b51-456b-8a81-4233cfd6f121@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 18:45:39 +0300
Message-ID: <CAA8EJpo68f=9ZyNnVY=+q+drHu9xJMSGk1kNCBa=HM442Jth8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 wenst@chromium.org, kernel@collabora.com
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

On Tue, 9 Apr 2024 at 18:41, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/04/24 17:20, Dmitry Baryshkov ha scritto:
> > On Tue, Apr 09, 2024 at 02:02:09PM +0200, AngeloGioacchino Del Regno wrote:
> >> The display IPs in MediaTek SoCs support being interconnected with
> >> different instances of DDP IPs (for example, merge0 or merge1) and/or
> >> with different DDP IPs (for example, rdma can be connected with either
> >> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> >> ends with an actual display.
> >>
> >> The final display pipeline is effectively board specific, as it does
> >> depend on the display that is attached to it, and eventually on the
> >> sensors supported by the board (for example, Adaptive Ambient Light
> >> would need an Ambient Light Sensor, otherwise it's pointless!), other
> >> than the output type.
> >
> > With the color and gamma being in play, should the configuration be
> > board-driver or rather use-case driven with the driver being able to
> > reroute some of the blocks at runtime?
> >
>
> The driver can already set some blocks to "BYPASS MODE" at runtime, meaning
> that those will work as simple pass-through, performing *no* processing at
> all, so that's addressed from the very beginning.
>
> This doesn't mean that a specific pipeline must always support the "DISP_GAMMA"
> or the "DISP_CCOLOR" block(s) alone, or together, or in combination with another
> specific block.

I was thinking about slightly different case: do you have enough
colour blocks to drive all outputs or do you have to select them for
the particular output only?

(excuse me, I didn't check the platform details).

> For any other question, clarification, etc, I'm here :-)
>
> Cheers!
>
> >>
> >> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> >> to add flexibility to build custom hardware paths, hence enabling board
> >> specific configuration of the display pipeline and allowing to finally
> >> migrate away from using hardcoded paths.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
>


-- 
With best wishes
Dmitry
