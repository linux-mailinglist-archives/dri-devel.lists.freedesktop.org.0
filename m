Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAB4163193
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 21:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727ED6E3E1;
	Tue, 18 Feb 2020 20:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57B46E3E1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 20:02:00 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 667DD24680
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 20:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582056120;
 bh=UTF+/7gR0toqAfMaUNuS73nTnbeQrSIFpJkVpDxrIUw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NI+KJ8JEItAp3Hs6oQlzBBxqC1AFNWC17wMOXHwNqMgrb37jAd+T0FrfHQWInYpsl
 URLGodNsMRzlIK04g08LPR+CBgoE10MdM2r5JTxansSEzz7tTV+SPlB3g63zgvYOlD
 R9GBHGEyIs9CDL7/OkkjxKdrD4JYS+zRZFjPnV14=
Received: by mail-qk1-f180.google.com with SMTP id h4so20831084qkm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 12:02:00 -0800 (PST)
X-Gm-Message-State: APjAAAU8aGRCiNTAQ79RGREm6DNzaIEjU6H/G5l8+tPz9AdodOUNvIin
 GGxItT1xm3MSGpfyLE1lzig1OWpU/emJK3yaZw==
X-Google-Smtp-Source: APXvYqwvKooY9qd0acYCvQX0uTJGaNTiOoUq2dafvZrvGChzderZi1tWdARuLkD2HS4vQ5lHstUl1LPFhBPOkPcZv3g=
X-Received: by 2002:a05:620a:1237:: with SMTP id
 v23mr3954986qkj.223.1582056119512; 
 Tue, 18 Feb 2020 12:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-4-sam@ravnborg.org>
In-Reply-To: <20200216181513.28109-4-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Feb 2020 14:01:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLATnzZnUSugiu7JnUcDzT1WLNqUSEwJGmj1NkCORFsVg@mail.gmail.com>
Message-ID: <CAL_JsqLATnzZnUSugiu7JnUcDzT1WLNqUSEwJGmj1NkCORFsVg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: display: convert panel-dpi to DT
 schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> With panel-timing converted, now convert the single
> remaining .txt user in panel/ of panel-timing to DT schema.
>
> v2:
>   - Drop Thierry as maintainer, as this is not a general panel binding
>     and I have no acks.
>   - Drop requirement for a panel- specific binding - "panel-dpi" is enough
>   - Updated example
>
> v3:
>   - added yaml document terminator "..."
>   - always require a specific binding - panel-dpi (based on feedback from Rob)
>   - use "power-supply" for the supply property, and made it mandatory
>     "power-supply" is the standard property for panels
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  .../bindings/display/panel/panel-dpi.txt      | 50 -------------
>  .../bindings/display/panel/panel-dpi.yaml     | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
