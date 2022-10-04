Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526855F49DF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 21:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AE610E0E8;
	Tue,  4 Oct 2022 19:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3534F10E0CF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 19:50:38 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id nb11so31131476ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6hkmWBP+HYVSlw8fM7LP0M64hh7i+Xs/CK1D4zburWM=;
 b=ilOoyhBJEA4wl0QVI+l+UqlfFlsBSkdMPqXwzVz1VnOKK9lK6knIiZnGpUdC7Gy9wu
 X2xSQSh5kea2UknxQtmXGvNtrxf4VRvtwWqwjPWdzQ7cjj2P9pfsYyDVjdReXbgniAko
 Uu3EvwgCzMGizXLRmwEoKA3S7SKjld/vncJGjmLEaEmipGbd3laD1rlq7unwq14CRlLq
 WRs94wLv+yAyqJbVLD+LYrILGRk658Q2lUvUXO3om1qx1ykSzvf1NvaDDIx5QjJeTsjt
 6Rf3iRcDCZSlDnDxMcv8UJJNYjPLKdSzk+paD8rh8kk8KdWGTuGJVlX8D/M6d7u952Sg
 rUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6hkmWBP+HYVSlw8fM7LP0M64hh7i+Xs/CK1D4zburWM=;
 b=XAZNtp15qqmZYkfMGe7FpfJ60DOAwIRobSMlKcGOQeqB/5bq9nC3aWYDLjilimEgbU
 0AcBpZYhtX6yx/JQlrzmnbNfXuIYi7q+vE8jQkWJsWl/hsVyZekCVthvblipFFFixqoT
 a5P/qx1B+izfJh3fqtqu49SQyh+MeNs7/NmmdB3CqeLmjiGkk27NWaTw7ePeKFKciX1Z
 x2NZMsX1vK1EyivwKq7RMeWRDsGNEQBXxMlf1/+UyvUCabDs+L8i09hbbcpbyFFnsh9G
 mE0dL9SjwQjd3UKxQ5I5Kw1UEM5ZusEjPl+BMqocnInJtQTQwGMkFPvZpy0Z0wTj6qM/
 11Hg==
X-Gm-Message-State: ACrzQf1RoMEmDILlwfC3xWhivaMyQl1yCRzaZQ6MNhT5HTZMgeP3xBZw
 9TW03E0BOsqSQDUnh6CYmkW32l++WDKCmax0NrcHIg==
X-Google-Smtp-Source: AMsMyM6orKgk/Apmho+6PscggAHwdSeykF0rYq7e76qZXAmTSmmU9/rxFVFvFTC8FIaE1hdjNT+yuE6dM7tyBlnt8HM=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr20585891ejc.440.1664913036724; Tue, 04
 Oct 2022 12:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <YzN6A9Y20Ea1LdEz@google.com>
 <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
 <YzwtG8CT9sTCqQQk@maple.lan>
In-Reply-To: <YzwtG8CT9sTCqQQk@maple.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 21:50:25 +0200
Message-ID: <CACRpkdZ-DfZKgCOHaKn1UZ8vVwy1dEiFBBDNdxu6VNzrUdeEtA@mail.gmail.com>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 4, 2022 at 2:54 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:

> > We need to know if i.MX is shipping device trees stored in flash,
> > or if they bundle it with the kernel.
>
> This part is frequently found in add-on boards so it's not purely an
> i.MX-only question.

Oh

> IMHO for not-in-the-soc devices like this the presence of in-kernel DTs
> isn't enough to make a decision. What is needed is a degree of
> due-diligence to show that there are no obvious out-of-kernel users.

OK I think this is a good case to use a special quirk in this case.
I actually envisioned keeping piling them up, and that they would
not be innumerable.

Dmitry, could you fix this? Just patch away in gpiolib-of.c.

Yours,
Linus Walleij
