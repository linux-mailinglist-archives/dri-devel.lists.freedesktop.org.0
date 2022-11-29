Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8CA63CA88
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 22:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0582610E259;
	Tue, 29 Nov 2022 21:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436B910E259
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 21:37:06 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id vp12so35702950ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 13:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWF9gOd/OY/hKO0R1X+AR0OfRDJ2mDFKtPhWMv/Y0Hg=;
 b=C3cqCKNZvB+oxs2Z7PiDFvl3m4uH+qKJOwduAl71kmF3MfYto97m5S60Fz47UIGVVE
 kTnLFuPBp8XqzvmLdO2DhSNSd+/QRot4t0KXV7WJ9AAzeTkf/suAR3qs6xkayDF5L3T2
 b8ycGwfFGvOZxsfqaidTxUR3UbGtV59MiZFj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWF9gOd/OY/hKO0R1X+AR0OfRDJ2mDFKtPhWMv/Y0Hg=;
 b=ZaX/bpoaf1uJi7N4NxCKtTs7LoQt9jL3ALDiVAEPzBu6T2sVOWftcVvGvAerRIa3Bc
 1hH1RmyIth3RWDig4/ZJPuWp4KnBIJg6IDCilCKl8tqXXGl9QzV3kUeHjyPHxofQJzLQ
 lziphFm1dtoIFoaO4byZAvYdeJ5kswEIM/f3itkjwsNXZtLi8tpGZiKyd/1PO/rhNem8
 Gos1JeT0YHHrfevLYRO1Gxp/zu8rkTNQKN0WQJzYzOVZFfqrPbM7v03tSiaNgYMYcuJ5
 h+9eskjSCbk7AcPnv0/yY0nF6YlrkwMbs0YBQalI3gt8/fBSBiZ0a2z8wpcvp/cyEW9e
 esAw==
X-Gm-Message-State: ANoB5pkEj/P13IQ/a5sKq4+B48UmsDPXdfubxdvzqbMVOyMwIIBJ76hf
 9hGHLa/RrjjAtX8JRnUrg2jKY5pd67mynVGl
X-Google-Smtp-Source: AA0mqf44zg9iCJ7lbr2IpAPYphFzjz771NadljgE+o7BMGhhUICXRAsKgTgPNBhBlG5NtG2koKcg4Q==
X-Received: by 2002:a17:906:4e46:b0:7ae:129b:2d3a with SMTP id
 g6-20020a1709064e4600b007ae129b2d3amr49727530ejw.552.1669757824476; 
 Tue, 29 Nov 2022 13:37:04 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 j14-20020aa7de8e000000b004616b006871sm6677944edv.82.2022.11.29.13.37.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 13:37:03 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id w15so10984662wrl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 13:37:02 -0800 (PST)
X-Received: by 2002:adf:fd89:0:b0:242:1f81:7034 with SMTP id
 d9-20020adffd89000000b002421f817034mr4218482wrr.617.1669757822248; Tue, 29
 Nov 2022 13:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-37-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-37-uwe@kleine-koenig.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Nov 2022 13:36:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VFuDRpkGPazE+xqwAj=0J8GO4EDU_fu+W72E+HQchLsQ@mail.gmail.com>
Message-ID: <CAD=FV=VFuDRpkGPazE+xqwAj=0J8GO4EDU_fu+W72E+HQchLsQ@mail.gmail.com>
Subject: Re: [PATCH 036/606] drm/bridge: ti-sn65dsi86: Convert to i2c's
 .probe_new()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, linux-i2c@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 kernel@pengutronix.de, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 18, 2022 at 2:46 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so i=
t
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

As per request in the cover letter (and no countermands in the replies
to the cover), I'm landing this myself. Pushed to
drm-misc/drm-misc-next with my review and Laurent's.

de86815b3730 drm/bridge: ti-sn65dsi86: Convert to i2c's .probe_new()
