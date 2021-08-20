Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E02C3F2FF8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBAD6EAAD;
	Fri, 20 Aug 2021 15:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3276EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:45:42 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id f6so5271193iox.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jG0is8q04G4No7iVp51Nm6RxWzS7meHDr4YzqKJBfEA=;
 b=PP6k/9RYzXUlkTfc50ROUtr1LKoy6RXBaDB9f62RibGA1DzZF20C2XZ2mZIf7mCfAm
 xT/qF4WUj4IqB8L0bMhyPJhW5OhrsBJ6eonZdSsSGrph3rhqceLsMbk3vcO8h23y+Ynn
 u6ROpxxAZMhxS9oOvVYqogoDNACM804//hYk9GU42B/rxiBtEGR9HKnGmRy/uTts/n5R
 +KjoD2d+2zBR1JDeB6cNi4B4/NzmSWbF1axyE2+vhqv79bfV27QvMEvJyb/aqz97Xbaz
 Ri6ibP3UM6w0CjmFDQx7W2zCBph4Fm9jG3PanvqYRboXy0Q3IlsvL26rTFRmR1iIbp9w
 en6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jG0is8q04G4No7iVp51Nm6RxWzS7meHDr4YzqKJBfEA=;
 b=m/6WrXa8KJoVBdPe2uMX6GnybYU9CsRpWL1IP2VdmC8JVwfahLuDtl3HZIWZ3LcqXi
 br8G/X136sPdIE6B4CHs6MKc3EZOzTWCwjSP7fpa3XoxNrxT3UYkK9k3s76K28/AKpGO
 MkTxjyzT5HHjWUe1kd5Uc6REBAKx280Das9xJUJ5hCEPe2Jhe25eZh/3XfUSw/oXtgpi
 47iwjilZ2tpRnBs3KtSQ2ImHNuUU2baQrj4VPn14vlZzoUuCTN3kR4fKiOS/63vXIXkx
 kQRfhYkQUsbS3gqJIHsJ1uL0SANa3kpNELNgT7FHeiWKXoBUZnw+LIHUaOv8HAuV0e2t
 lOBQ==
X-Gm-Message-State: AOAM531CfyRzhAnFo7S74zKL2lsvJpS2b8YW6DRTr9ykQXFdWg0tVMFs
 pY1RX3YbFpZOOr85z4oBLJMEnnZAbu075f0NLgvg8A==
X-Google-Smtp-Source: ABdhPJwxXuqszLUo7soyfPQwdUNIXwfFEuhZ0Hjek6KxH//hCiC6j/0C6kYQLTZqqcs5czNxRg1wQF4UiIHClVgRnvQ=
X-Received: by 2002:a02:cb45:: with SMTP id k5mr17979205jap.112.1629474341466; 
 Fri, 20 Aug 2021 08:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-3-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20210820070113.45191-3-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 20 Aug 2021 08:45:29 -0700
Message-ID: <CAD=FV=UAD1dM9EqGDr1zLDUmrLMPxmAp7-da+ifqXvDcRbpqdQ@mail.gmail.com>
Subject: Re: [v2 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support
 enabling a 3.3V rail
To: yangcong <yangcong5@huaqin.corp-partner.google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Aug 2021 15:47:16 +0000
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

Hi,

On Fri, Aug 20, 2021 at 12:01 AM yangcong
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The auo,b101uan08.3 panel (already supported by this driver) has
> a 3.3V rail that needs to be turned on. For previous users of
> this panel this voltage was directly output by pmic. On a new
> user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
> to turn the 3.3V rail on.
>
> Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
> ---
>  .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml    | 3 +++
>  1 file changed, 3 insertions(+)


However you're sending your patches is really confusing my email
client. I think part of the problem is that you sent "v2" as
"In-Reply-To" your "v1". You shouldn't do that. You also seem to be
sending duplicates. :(

Might I suggest using "patman" to simplify things for you?

https://source.denx.de/u-boot/u-boot/blob/master/tools/patman/README

> diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> index 38bc1d1b511e..a7091ae0f791 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
> @@ -36,6 +36,9 @@ properties:
>    pp1800-supply:
>      description: core voltage supply
>
> +  pp3300-supply:
> +    description: core voltage supply

This would probably be slightly better if it said "3.3 V supply"
instead of "core voltage supply", but it doesn't matter a ton to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
