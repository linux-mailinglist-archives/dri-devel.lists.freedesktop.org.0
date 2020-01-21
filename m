Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AFD14363E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 05:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9F06E0F9;
	Tue, 21 Jan 2020 04:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75836E0F9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 04:37:26 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id n8so838466qvg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tE6t4zYqaVXPST4AhwIQ9GsXTC/ddB8hjT5O44X4X2A=;
 b=Y437XdOv0Hto2lq+dzGstZ/dDsYcyHpK4I+DVf73M1v48j1EjilwkEp0HlSg8Iu9gL
 0tTOS38rUYrM9yCpro7VwAwprgAfaJvNt0icSyt0cimanM+SnEp2Xre2R1C/rtGm8iVZ
 lRVWu7xtrpg+9KP77O5tLZX+QnE1zQQIxeaZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tE6t4zYqaVXPST4AhwIQ9GsXTC/ddB8hjT5O44X4X2A=;
 b=lY7o7aYDxuB0C8TkoUaSZNBjOaQlgoIfx4KZC9e3gh1aZvqA25fnfxBgj/yTNPMIuS
 b9NHQRqxTj+Wdx5N872FODpd0c/QKhNu+DXJpWKp84juLM8iGzbR+fKVCzCxBU4dNrEo
 EBRs/1zTamxI4LgTbDw/zikkqQBAW752R+ZFk/eHlZTtl2Dp1bTT9+QzsbEW5/VKlU+X
 EvbCytw4Grh7uoTrN2xlWxX7hiHbxE267V5AqAFWCwg8uulrUWiAeRquOE3fc08MKkAn
 MtJeIlYoI4CfPQRV4doK/dA189sZ8tx8SF49D8n2T+gJqKcwZcezOSbAQp347UP301Ph
 iziw==
X-Gm-Message-State: APjAAAW0MbPnk8p0K0YwxrLGWp5iHfri4x2KpoO5PhBTPYX9GqPaEtdV
 6RdCsBgSgqku2KiCp0IJAkMSFxDwjZ7MkQyra35x3A==
X-Google-Smtp-Source: APXvYqzdl4VdxIrAynyQuScJnrpT9ZczyRYljUJVkw1OCPfHpQClTp+aKVQtQGPPLLXXuyebvlkJ/h7fxsuCkIoPT4Y=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr3120793qvn.6.1579581445521;
 Mon, 20 Jan 2020 20:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-5-drinkcat@chromium.org>
 <20200114151643.GW3897@sirena.org.uk>
In-Reply-To: <20200114151643.GW3897@sirena.org.uk>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 21 Jan 2020 11:37:14 +0700
Message-ID: <CANMq1KC_-g45wdGgGiBmEyVXAJMkKwsJBJXGBHOMJk_=NyfpYw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drm/panfrost: Add support for multiple regulators
To: Mark Brown <broonie@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 10:16 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jan 14, 2020 at 03:15:59PM +0800, Nicolas Boichat wrote:
>
> >  - I couldn't find a way to detect the number of regulators in the
> >    device tree, if we wanted to refuse to probe the device if there
> >    are too many regulators, which might be required for safety, see
> >    the thread on v2 [1].
>
> You'd need to enumerate all the properties of the device and look
> for things matching *-supply.

I see ,-) I was hoping for something slightly cleaner, or maybe an
existing function in the core.

Steven: How strongly do you feel about this? If so I can add that
check in the next revision.

Also, just a heads-up, I'm out for the next 2 weeks, I'll send v4 after that.

>
> Reviewed-by: Mark Brown <broonie@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
