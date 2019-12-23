Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6953412938D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 10:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5125D89804;
	Mon, 23 Dec 2019 09:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838089804
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 09:14:53 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id p2so6110178qvo.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 01:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gu/ztFiRQ3wq9XQZk4WFXx+978qv3TNkjDk+Rg1DcEQ=;
 b=JChcZAmP16y+mbW1Asq7N8aJZsXBv8p86qgVulBr2n85kEF6ZYqrML12yiQ0Jliii0
 Knr104cQRfUO4BGBfzSyzaSqSTy7iNiXrG2Pax060fVdsPFaMX5BYTNmR6Bk3WqDIm35
 0/RGy6FmY5hwcu3+ywUuX0yVkdqKLZKYFXpqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gu/ztFiRQ3wq9XQZk4WFXx+978qv3TNkjDk+Rg1DcEQ=;
 b=BUhHOzdSpB1Z/KEPwPkI36Lb9Ne22/c10aF8Al7Sj5wSIzaFuEp/QI37fr2/TpE/iR
 RUjhFdget4pdM5fBT165I16ymzgdIOBdJ/WsM1BKePWzOcmRJiec4Cq/g8Ahqglf+WPA
 qKHAx5+TnHJOWLpv0bj5wTqiZiiZUsBQ/ya5b6+T6Kmed67E1coosazNLDfZOqNcGyt5
 fEkUwhHETzEaBXGTryhH/2RRaHTuKGGZhdx6w8uzKn60ZFSXBRLqD6JA6Y6vbOtLaYlM
 E9+0jldqj7GWPAjVsCeXnPAHSJX5KONXLbEs6asTb5f/4BdUnhpRuCNMHDNVwaAeK5Lw
 3RhA==
X-Gm-Message-State: APjAAAWHoCv38TZEnKASQy+FSsX57aADuF1mTcfqOwqOuMLLRNccB9t8
 +pMwFtIu3qdAIAMR5lVwo/rZ4VcVeUY0U93OWpvzLw==
X-Google-Smtp-Source: APXvYqxSGh8tEsYM4HGrQMAIpi4RkLM4nlV0RIDeW/C6zkKppoWb1uEylH2teSbPYDtcvEwo1nKoLSIXM3xw4c24zSA=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr23692671qvp.187.1577092492136; 
 Mon, 23 Dec 2019 01:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
 <20191220081738.1895-3-enric.balletbo@collabora.com>
 <CANMq1KBHsc8oqcjWnjLPCpRToyOm16X6EcQqmqPjZf=D7wA2-Q@mail.gmail.com>
 <05db638b-02a6-0e3a-43ed-44a0a1458d87@collabora.com>
In-Reply-To: <05db638b-02a6-0e3a-43ed-44a0a1458d87@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 23 Dec 2019 17:14:41 +0800
Message-ID: <CANMq1KA4mp648p1LicOzAyra6tdgN2qdDY=N0XyDYhgt6BP26w@mail.gmail.com>
Subject: Re: [PATCH v22 2/2] drm/bridge: Add I2C based driver for ps8640 bridge
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Ulrich Hecht <uli@fpond.eu>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 23, 2019 at 3:10 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Nicolas,
>
> Many thanks for you review. Just preparing a new version with your comments
> addressed.
>
> On 20/12/19 9:44, Nicolas Boichat wrote:
> > On Fri, Dec 20, 2019 at 4:17 PM Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> >>
> >> From: Jitao Shi <jitao.shi@mediatek.com>
> >>
> >> This patch adds drm_bridge driver for parade DSI to eDP bridge chip.
> >>
> >> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> >> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> >> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> [uli: followed API changes, removed FW update feature]
> >> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
> >> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >> ---
> [snip]
> >> +       ret = i2c_smbus_write_byte_data(client, PAGE2_MCS_EN,
> >> +                                       status & ~MCS_EN);
> >> +       if (ret < 0) {
> >> +               DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
> >> +               goto err_regulators_disable;
> >> +       }
> >> +
> >> +       ret = ps8640_bridge_unmute(ps_bridge);
> >> +       if (ret)
> >> +               DRM_ERROR("failed to enable unmutevideo: %d\n", ret);
> >
> > failed to unmute? Or failed to enable?
> >
>
> failed to unmute sound more clear to me.

I may be wrong, but I have the feeling that the functions
"mute/unmute" video/display, actually... And that the function naming
is strange...

You could just try to remove the calls, as there is no audio on the
board you have (elm), so if video still works, maybe this is actually
audio ,-)

Thanks,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
