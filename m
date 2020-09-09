Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B65262E01
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 13:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0A66EE44;
	Wed,  9 Sep 2020 11:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F156EE44
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:41:37 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b12so1393075lfp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9QFqZ8T4Z8Uwssi88QoBtFjRyO2k2yhi/Ck4LHpw7Qk=;
 b=bndKyFALCwNbpGG6biL5LEJoMyzVE3/sE7fOKzM0bdlDG5LYKrVzIyaoIPdR2j3xo9
 ++yPbukmQM8z67YpiR6rloFUdCvnbCIQIwtrfXT11Y3f8mIL6IxU4Ws1RsASWnWA1VXr
 Jk4QHqNo+AhOG+O7PZKZxH/j0N9bJZKi7cSrxQvpusImfogn4uS06eckyz/qrYsyCO1t
 Isn93zwFT14OXhtBmKB6DgUDDY8TndPFTtlvWtMdxc40O0hECK8K5IDySLim670nVZDx
 QhGxOUNiRKJRcPSHjXp2Ggt2pgO9wX7XRbPen0Din2y0bZ5+oALUJdnSVu7jg6Plf+RZ
 KGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QFqZ8T4Z8Uwssi88QoBtFjRyO2k2yhi/Ck4LHpw7Qk=;
 b=kONOK+fG8JhXSPQAOjyi1HaV+DBGh1ddyhTSgUUgVwteR/1NpUXZiHnwQg5XNFHZUS
 XExr3bqORKCp7Mfb9gydqJw95SuxhjE3YBseyBaDob0q/IDPMRjPAgbmDrNa3YXu9DQ3
 H7igs7QVUmd5O7ppqvOdDF5QeO0mB/4D+1dtgGzspIbPDBF1PR8zcvMuiKcDfEqcojpT
 G0hYLve0eofhVPDJJhs6H5PcHujgLmfW+qyzwNnuUcAw9/fzNwhJqBpi2sT/RSivrSv/
 97KUZ/G2IU8aZ5HV9UzUchROZ6h+ge0ynUhmjsgh/u9Q5uZLzQlNZCe0HaBNG+QV+/ll
 LNyw==
X-Gm-Message-State: AOAM533zZb/9L2kdp9RnGlnixsQL1nRB6SdXotnkjotZKtPhQ5AMTUCq
 DqXGsw61PPABIfVNl3Jkfxd8vH+goX1NBNaLoGmBaw==
X-Google-Smtp-Source: ABdhPJx1689AN6ZBjH9cFKkBhgvwX3Sn72kLkZELmRxndnnmRkhFO6EY5qp4HI+dRiZKRBpPZpNKfjqIAxtiWfATgOw=
X-Received: by 2002:ac2:5541:: with SMTP id l1mr1734063lfk.89.1599651696103;
 Wed, 09 Sep 2020 04:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200822163250.63664-1-paul@crapouillou.net>
 <20200822163250.63664-2-paul@crapouillou.net>
In-Reply-To: <20200822163250.63664-2-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Sep 2020 13:41:24 +0200
Message-ID: <CACRpkdZmiar+2RrMb8=2UdyH83_8KQD0VvX2oWcBezmCdVwzzQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: display: Document NewVision NV3052C
 DT node
To: Paul Cercueil <paul@crapouillou.net>
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
 <devicetree@vger.kernel.org>, od@zcrc.me,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 22, 2020 at 6:33 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Add documentation for the Device Tree node for LCD panels based on the
> NewVision NV3052C controller.
>
> v2: - Support backlight property
>     - Add *-supply properties for the 5 different power supplies.
>       Either they must all be present, or 'power-supply' must be
>       present.
>     - Reword description to avoid confusion about 'driver'
>     - Use 4-space indent in example
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;

This has the right polarity but the code in patch 6
seems to use a device tree that does not?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
