Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95C55B451
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 00:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333D610F9CA;
	Sun, 26 Jun 2022 22:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021A10F9CA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 22:33:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z19so10580955edb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8k/W+Y55YNpW+5hRXZc8dzAY2Bfqx0VzAHHDvBJbEQ=;
 b=EvzVxegXdnLpT4J/m79ocqLBhfICA3aOveENKgLoHTw2PewgZmqHZnOIyXjjdpgpoD
 q4pRwTMX+1sNXWX9YY6+gdMpG+wMluN9CmJs2UQBpccf5/+lqtwf4FmVS1sUGysODiOD
 fCQdOtjUlBKnqoFGWf5tpVOFFCcA0No1aMFAmlSwUVM7eRt7qBY/SYMlrgUyZW2EJ2Ju
 afSQFxf7TJTlNqRsecYmQrm+75SGqFT1EmvywuDZe2H1c4cvO72OE+ehHcltGNl8lckk
 IPq9J+wKuY2NoOD5IcoNljty1ZOyC1d80Hk+gsVvRhdesNfr8YYN10wioSgrZ0wZpYHR
 ll6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8k/W+Y55YNpW+5hRXZc8dzAY2Bfqx0VzAHHDvBJbEQ=;
 b=vjBX2X8rNjXuY8lWB10Nydn9OT9/pHUNA2zvEO6GiH1Q/5x33PADat4XYJbcBfd5KR
 C5zYjcrASx9PTJvpWDVdsvbJGCZ9fHAbAvmL132EjxJefEHkI7urrPCNO/7uPwzJiaZI
 LTNHPIXA4GoXpZdG0CFb80MgWf582PKeN672FBujw7E0t+fCh+iQKgViWbeVU20uyEwu
 2mUTooxFhVgGQLhGWuUsEFIHkDf9Bisi+rqbcuQqewbiME35i3bstpfyeLW9Awdjsdsf
 G5Vgqk14Z/YFAuy5FZKrdfmh4CIzYfB8mpe8TL+yMXcdD6xRrXhHJ7pJIHhK4UIzmay/
 Suhw==
X-Gm-Message-State: AJIora9riN0TFdLO8ImZSJJeNoaGT4EahdZPWiXs3Dz4AXpk/wajdVL6
 WVqy0R/RLyFnGxqAXqAQjwHGtMoRE/47oZ7f9pI=
X-Google-Smtp-Source: AGRyM1tllWJ+xUlV0MtVwcue9xV0he/QRwjFk8QXLH+yTZ9inE1uvC3fO2UW4H0Avwx7eoYrlZg6ZCtCqYNHHS9gr5Y=
X-Received: by 2002:aa7:c542:0:b0:435:75e:8a7b with SMTP id
 s2-20020aa7c542000000b00435075e8a7bmr13122141edr.108.1656282780812; Sun, 26
 Jun 2022 15:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
 <20220617072723.1742668-7-narmstrong@baylibre.com>
In-Reply-To: <20220617072723.1742668-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jun 2022 00:32:50 +0200
Message-ID: <CAFBinCB=RJeaqVi+d6gGAsQTWAU68iFF6T9bXAQVYUWKxgiYaw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Fri, Jun 17, 2022 at 9:27 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> +/* [31:16] RW intr_stat/clr. Default 0.
> + *             For each bit, read as this interrupt level status,
> + *             write 1 to clear.
Do you know if an interrupt line from GIC is routed to the MIPI-DSI
transceiver? If so, we should make it mandatory in patch #1 of this
series (dt-bindings patch), even though it's not in use by the driver
at the moment.
