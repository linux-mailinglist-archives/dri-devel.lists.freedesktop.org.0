Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811CC14F174
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 18:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5499B6FBB4;
	Fri, 31 Jan 2020 17:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3776FBB4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 17:41:14 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFC0A214D8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580492474;
 bh=Vc4SiOJHxWuzUZxXFKK57A91sKVKRu2n+XwrsjrC9cY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l5D6OfKKUgkBuUel5VMLzQsE61+ur26x2amPU4jozcTqHtvSg614PueqSBBoPmro6
 c42mgQCWp54qTYHARHr2sg9yvPNxKzBIo57B3CJlqmtn2kHGsRZo1BGRZsGKHLPuba
 X2N/FYY8tKGHYjsG/TXkTzwMpbRJVtyssk1gcU7c=
Received: by mail-qv1-f45.google.com with SMTP id p2so3611303qvo.10
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 09:41:14 -0800 (PST)
X-Gm-Message-State: APjAAAXlmV+IUbO8GX2UFPhwBZKMkwliYxFsv9W7qs4HcilbgP890xDM
 RLmv2nNyZQI2toG7uEatGqdIdVoUV3B69+CpyQ==
X-Google-Smtp-Source: APXvYqymOXuPQlCKGanKbWjWi5whel3UBjEZf1RL275OqNT9/9EQXyLkDL8EqglFNzzDWhiObUdqxzRS8fg/R1CrqIo=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr11119378qvn.79.1580492473869; 
 Fri, 31 Jan 2020 09:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20200125203454.7450-1-sam@ravnborg.org>
 <20200125203454.7450-2-sam@ravnborg.org>
In-Reply-To: <20200125203454.7450-2-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Jan 2020 11:41:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKcbZ2y0kqSsxc4CV27S-Wk+D0RYuVYr_MbQ6_Xex4K9A@mail.gmail.com>
Message-ID: <CAL_JsqKcbZ2y0kqSsxc4CV27S-Wk+D0RYuVYr_MbQ6_Xex4K9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: add panel-timing.yaml
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

On Sat, Jan 25, 2020 at 2:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Add meta-schema variant of panel-timing and
> reference it from panel-common.yaml.
>
> Part of this came form other files with other
> licenses - original commits:
>
> cc3f414cf2e4 ("video: add of helper for display timings/videomode")
> 86f46565dff3 ("dt-bindings: display: display-timing: Add property to configure sync drive edge")
> 9cad9c95d7e8 ("Documentation: DocBook DRM framework documentation")
>
> The original authors acked the license change to:
> (GPL-2.0-only OR BSD-2-Clause)
>
> v2:
>   - Got OK from original authors for re-license
>     Huge thanks for the quick replies!
>   - Typo fixes (Oleksandr)
>   - Drop -array variant when not needed (Maxime)
>   - Replace oneOf:... with enum (Maxime)
>   - Drop type from clock-frequency (Rob)
>   - Drop "|" when not needed (Rob)
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/panel/panel-common.yaml  |   7 +-
>  .../bindings/display/panel/panel-timing.yaml  | 227 ++++++++++++++++++
>  2 files changed, 230 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-timing.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
