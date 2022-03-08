Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CF4D164C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4DA10E240;
	Tue,  8 Mar 2022 11:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599D410E240
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:31:13 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b24so1401879edu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 03:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zagytqRanMqmGZPaeZYMEhXfaOgjty5ndKR4qYehJqg=;
 b=Jq82/CxYirJBuGuzNePcQu1UMKXNY25JLT1l1ke+oJN/zLSj/FOppoJPENL2MAfIRu
 s1E2/pOfTRUVkqNWvjm67jtEzW35jGuM/8l8qzKbpkQECw3jdZNUIL7T8QYJGQUMlVuD
 ab6yomX723E3XEgtUqrjFyx+SGPGdRPK1arQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zagytqRanMqmGZPaeZYMEhXfaOgjty5ndKR4qYehJqg=;
 b=rIOIFaLkLYqnNhA8QhPU8+uI0p/5/N+IX2YnAXB42KyiEXQgLwN0TwRyoZO58LOORq
 CBkPZbPpc3xwIdFSpJpIAwtlBxzIlg5fwXWEF0wImP+A/GrvGxo1Ao9T4NOq/WICFPiS
 xCLuTIv7eE8Nw1ivkpIFQvSjiYzntfGeic6URuPuEZ/R5zod870NqbB4UObFD1Meq6ov
 C2T05oOSXujLPNMGBhXzK+s0t2GVEZ7UDis0aZlhts59wpTJWtGdzmqfmuadS1Wid3QE
 aoo89Apc0MlP2ZeRi4XlJKEE+5aSXw7mwU7YjIHbFf/6ogosimEhWEkTHEjAmM+1+Fed
 DpPg==
X-Gm-Message-State: AOAM531uYZXNx19xZiDrPh8NVQg9NvareBhLSaEPIqTIkEt03TlbN4XR
 zsQ9yTfAXvGzW1Edgxi+EqjrKTPkbazRGzHebSOdfQ==
X-Google-Smtp-Source: ABdhPJxdDz8gEfcI9ebtRv8bH5oH/qYk7ojEEaPFHDFMMzuPbrutVm4ZhylyTOEujsY/zbd3Ky9zCzsYQMte2sBKUsk=
X-Received: by 2002:a05:6402:278e:b0:416:5064:b39b with SMTP id
 b14-20020a056402278e00b004165064b39bmr7820528ede.157.1646739071790; Tue, 08
 Mar 2022 03:31:11 -0800 (PST)
MIME-Version: 1.0
References: <20220228182904.22982-1-jose.exposito89@gmail.com>
 <164673846305.2436174.1857157702611077242.b4-ty@cerno.tech>
In-Reply-To: <164673846305.2436174.1857157702611077242.b4-ty@cerno.tech>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 8 Mar 2022 17:01:00 +0530
Message-ID: <CAMty3ZAC1vj8Kc2tKP4wL5O15W7FA-OWf030JcTKRs9feDLejw@mail.gmail.com>
Subject: Re: (subset) [PATCH] drm/bridge: parade-ps8622: switch to
 devm_drm_of_get_bridge
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 jernej.skrabec@gmail.com, andrzej.hajda@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, Mar 8, 2022 at 4:51 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, 28 Feb 2022 19:29:04 +0100, Jos=C3=A9 Exp=C3=B3sito wrote:
> > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > favor of "devm_drm_of_get_bridge".
> >
> > Switch to the new function and reduce boilerplate.
> >
> >
>
> Applied to drm/drm-misc (drm-misc-next).

Not sure whether it was intentionally or accidentally applied? the
same patch has sent before this date and has sent the v3 a few hours
ago.

https://patchwork.kernel.org/project/dri-devel/patch/20211210174819.2250178=
-3-jagan@amarulasolutions.com/

Thanks,
Jagan.
