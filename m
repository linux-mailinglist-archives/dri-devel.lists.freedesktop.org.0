Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2D30CBF8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 20:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2618A898E1;
	Tue,  2 Feb 2021 19:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518B4898E1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 19:42:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b2so29742596lfq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 11:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lEw/o9w5jfpQIMTYNMYstSkHlcinQzvDnsF23OD+n8Y=;
 b=Z/iRP03DVWUEtXmYCZmEvp1+10h3BP+LgWHA+mJsojoVPsYs9lvOwyIBn6yIgsurAg
 uQH7aWzyAYDXejo7vCezelC+PrmhZa2X27wjY2uyEr1KP7Fs/WC6eLNhPadzAvzjq9+q
 bQmFQFB0vhMN6E/V46PH3yUkuhhHBscAPwg8Z70rJkRdFspypNGp/F5GqsKUO3tjDHsu
 O+x4BOVmHm4CW1mRdZcAbr4xmZqmeTrOn6pKmfbe6D8x/oGwTtSSGtySSu18npi148yi
 FSTCG1FmJpWZkFDbfRlB1ZnYz5PqTtVCgsIjDCM7a/R7OKqisBAtFwbkgzz5o0S0Y2gg
 Kwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lEw/o9w5jfpQIMTYNMYstSkHlcinQzvDnsF23OD+n8Y=;
 b=uWu9NBCpRuvE3sFHZzBAcfJ40RXSqIZNfO25hINIO4ynY1s8F+elBT28SalCWDpiVM
 WBcQUzY/f52vpfm/AKUF210tPzHYvEl3HvLFqNaYTQdD7mCwQSnNH3vP6EIc/ON28jvR
 HHHA/dP29LqUdvub5RzxSjm66YUHnhtACdBHzeqQcFUZU+NeHh+1ZywKit35vEBWOZxV
 90iiu4OZAl1pEkUhg5MRkayLoyPsCm703mmKICbBJoZHmIt5/y1uzfhUPZgiof0pIZku
 H1yWAL5baqhHMQpBEijI7M8lb8K/Wi4ydo3RgqWeRV6+QdZlAIPvfUistu3n1odOnTTM
 mYXg==
X-Gm-Message-State: AOAM533hojXfHSrqbsbGA30EIRhJ+L+EOrkyJdHZckRQdi9vRz9HTv+/
 M7U73yNpy6/ijIBaTHTqOhG0FnIVZQFe1ale+9r+zw==
X-Google-Smtp-Source: ABdhPJzqbBPOEK0n3FkG7UZyeOvG94jaEukm5wBeF3DHYTpEg29ORtfCOGeWtBuGN3dpIQIpExHK4ReJOgkBIStJyqw=
X-Received: by 2002:a19:fc06:: with SMTP id a6mr12183695lfi.529.1612294917425; 
 Tue, 02 Feb 2021 11:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20210130181014.161457-1-marex@denx.de>
In-Reply-To: <20210130181014.161457-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Feb 2021 20:41:46 +0100
Message-ID: <CACRpkdYYufzSo4+PkTuN0vD0PBK8-sKx20x2GgNOkw+QAbYKsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 bindings
To: Marek Vasut <marex@denx.de>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 30, 2021 at 7:10 PM Marek Vasut <marex@denx.de> wrote:

> Add DT binding document for TI SN65DSI83 DSI to LVDS bridge.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org

This looks correct to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
