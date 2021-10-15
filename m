Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C226342FDD6
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CE16E415;
	Fri, 15 Oct 2021 22:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0265A6E415
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:08:01 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w19so43142197edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 15:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ev7DTwrp6MZ4T8F+BiqYB8hT2a7fhd3qu/orSoJYRRk=;
 b=NDGXVXGgETY6w1uHUkxl0aOQgqOaHpy6s2tvAueulF9tqhRGEMU1NjQYegLI3Jmbo3
 hMp16bm5CVYOdrpZ3ZqND4DwL/pVY3YuoPzlRl6zFe1Wda7MkRmH2m4B3RmVw22Yk8fP
 znu01dYMmUoPyb0ZB36/pdRAmsw+NNX7CbKye0vNLXiSLmALyEzHlqsfsPdlLN0444LI
 uofuLyjYZwg+g2tceQcGFhQ2BLhzZWW3ktU5XA7yMwiavU0c4s3yTNsZQIZapXVSiKvg
 AI+Rn/GlRx1vtP3/VGe43e0VPyE+06dcXnwiL1S4y9AUG8Qpn7UQ5/2HUECgBdAOz2as
 kYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ev7DTwrp6MZ4T8F+BiqYB8hT2a7fhd3qu/orSoJYRRk=;
 b=xzeBuHuZXEZ+IXaiApCAMjroiW8cafutaEed5VG4kkcCB9agzb4L2vXYUYqvbgVq83
 vxTP04h0/aEdNPKMVwB6yXWK3NlyGipywBpJGamAUCxQNuLqdSBNqd4n/yTkv1yGMTAl
 YJZOB8ESaFPUWs4cJFUHlmyd7uQHU7bibcXHt845EuoxOOYY3TDFmQweL6DHzJr523hK
 znH18AA2F0FEP5Lq/BbSwKK6+kogPx1K6Cx2/rtAADP7GAZ3K27SD3Rp10Z7s+6Ph2JE
 l+1MsNOI8SOrKld06v78EXT+fG0d0MJJWWZyL2ebo+nkMxOlcZnt0ww/qK++KOkO6+zt
 MWBw==
X-Gm-Message-State: AOAM531tOwpbDDDof1t9Z7CCNLmDst4jurswcfYsgIB6dhVHBMJUTPmL
 P2MUK0OotyN7doYGmznyXgERVrrJv0n5/v+d84Y=
X-Google-Smtp-Source: ABdhPJwuty6qNhbPHzOorY72ZZmKmtfUjljYFLAIkJ8cKHfYxsoqmg7A1X3fEyIG7As6fntwRInrBrRk7Ui5lNkexi4=
X-Received: by 2002:a17:906:49d5:: with SMTP id
 w21mr9997649ejv.30.1634335680467; 
 Fri, 15 Oct 2021 15:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-7-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:07:49 +0200
Message-ID: <CAFBinCAdgokOt6HSkX=FmYN064nV=XY51CqGs100R0YnNi511g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Drop the local connector and move all callback to bridge funcs in order
> to leverage the generic CVBS display connector.
>
> This will also permit adding custom cvbs connectors for ADC based HPD
> detection on some Amlogic SoC based boards.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
