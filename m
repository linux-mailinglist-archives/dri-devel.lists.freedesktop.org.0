Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA187F1BEE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 19:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B710E102;
	Mon, 20 Nov 2023 18:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664A410E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 18:05:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so2605e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 10:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700503557; x=1701108357;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1oMCfMGwdX7/yasXUH/6qCLEAX+oZ5Ltl+iiFvw12M=;
 b=zqOg5QK6sjRdZ1ZGeKuwzn0o7gSmy7cPdRD6mAbqzhlN81hGxJxI3C930Tt69Nfhtp
 vXf3H9E9hTrOZVKUp5PQabztU/KRcVMghS6YK+gZxDwPsCyx8MxObN2v01OzD+NJkcig
 xqAmbTu8NwFkajJCWgLYIuRIEzDh0txxIgnQu0oUIjykyCM9tvaY1tdkhx9CJclOqbxN
 dq4paDSR1ULtBpPdoHsEKonxaZjOnHFZmss2ZCTflVLxZ06vB3aBXR54h+cSfOXxp1op
 zyPZ8Z5KpB77PtLwgWgrtzQNkYyM7BNjI2FXhI+ekA5jTannhbCioGNV1a8Ux5XH8chM
 PNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700503557; x=1701108357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1oMCfMGwdX7/yasXUH/6qCLEAX+oZ5Ltl+iiFvw12M=;
 b=pwuP2dKU+WIZcDeC8LRwnL0TGnFrB0gM8QIoJHLDeeRTovE3ZizK0tkx6yyNt5xF+Z
 J7jUSjWMjEuzqUtHqCthfTl9k7DZVd5xlvQz6N/ix8UHv88jMCD63YnPHXbbDF8CI4D8
 B78PmU0Q6RP0hHdanhUhA7JThMGeS1TVrScIS96QIjVajL5vD/WvdV9LZ5a+F68FEYDC
 EnpAoa8IixZ6iYkgeyCR16YRSg3H5trmR0+/YTb5jkgi0ds9cAbXJuT1ht4vm/W/NcbE
 y4gBenTYLqPf+m2dKiwLDjy+4BQBHam/JuYcMlOsNTBeagdvtk2Ox+nA6Bz1pbbHKjpE
 zWlA==
X-Gm-Message-State: AOJu0YxVHdI2iNz9MH700tesPAH4Scex/0scOMxYDKN9t4IM4EPpSIhH
 iPJSnAeLTObmumT2TLmF8ALczkQcdV69wG6IGHASMg==
X-Google-Smtp-Source: AGHT+IHWrtCrXcVOwKo199pcpai/48XCtrsULlO6pY+GdNy7QBAZjsD1Hi9YGbmweptlK5z8xbw9Dp3Z1R0tzlykCXs=
X-Received: by 2002:a05:600c:1c83:b0:3fe:eb42:7ec with SMTP id
 k3-20020a05600c1c8300b003feeb4207ecmr273004wms.1.1700503557295; Mon, 20 Nov
 2023 10:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20231120020109.3216343-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20231120020109.3216343-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 20 Nov 2023 10:05:44 -0800
Message-ID: <CAD=FV=WKMrnAqYNHpcKw4=X75Ts_cCkoXZKQ+b7G1pXstUCMRg@mail.gmail.com>
Subject: Re: [PATCH V3] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, zhouruihai@huaqin.com,
 devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Nov 19, 2023 at 6:01=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The refresh reported by modetest is 60.46Hz, and the actual measurement
> is 60.01Hz, which is outside the expected tolerance. Adjust hporch and
> pixel clock to fix it. After repair, modetest and actual measurement were
> all 60.01Hz.
>
> Modetest refresh =3D Pixel CLK/ htotal* vtotal, but measurement frame rat=
e
> is HS->LP cycle time(Vblanking). Measured frame rate is not only affecte
> by Htotal/Vtotal/pixel clock, also affected by Lane-num/PixelBit/LineTime
> /DSI CLK. Assume that the DSI controller could not make the mode that we
> requested(presumably it's PLL couldn't generate the exact pixel clock?).
> If you use a different DSI controller, you may need to readjust these
> parameters. Now this panel looks like it's only used by me on the MTK
> platform, so let's change this set of parameters.
>
> Fixes: 1bc2ef065f13 ("drm/panel: Support for Starry-himax83102-j02 TDDI M=
IPI-DSI panel")
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> Chage since V2:
>
> - Update commit message.
>
> V2: https://lore.kernel.org/all/20231117032500.2923624-1-yangcong5@huaqin=
.corp-partner.google.com
>
> Chage since V1:
>
> - Update commit message.
>
> V1: https://lore.kernel.org/all/20231110094553.2361842-1-yangcong5@huaqin=
.corp-partner.google.com
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

As per previous discussions, this seems OK to me. I'll give it one
more day for anyone to speak up and then plan to land it.

-Doug
