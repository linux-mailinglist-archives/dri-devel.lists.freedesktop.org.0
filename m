Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643501632B4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 21:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AB66EA78;
	Tue, 18 Feb 2020 20:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50E16EA78
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 20:13:57 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88CF624655
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582056837;
 bh=Acc7PN7duriLeMEBn/i+Ipfei5C84iWC+Cce28eKV88=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Xa/HojNS7ER7D9LpiPBpcCfF6aZVcYWftXni4e5EASAVVXte1GKF3yeNl/bHrqUyS
 lCi4weB9ny/H2vgj+IhAebwSlPwCWWj2FOb+Pf5QtjEL6wDjBCaeDdKH4TzelELbBY
 rvY4Y4fbPtlnpFBnZxwCCkbsGp5LpMIZuh7dPF5w=
Received: by mail-qk1-f181.google.com with SMTP id a141so10957208qkg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 12:13:57 -0800 (PST)
X-Gm-Message-State: APjAAAVLSM+pndmZZ3tvlSB2jc2BJ+IPAbhB515CyRY1VsoPD7llZMju
 5P++9q9UupegNVVi0t62iURRn5UVVdwNM9nRjQ==
X-Google-Smtp-Source: APXvYqybczt9BgmXl0zwE3fcZYEM5u3dyflmTv2R+FtGMnj+y9Zn0gyqJ/tbhIImcIrVhl4UZqXSMboy7eCznWHRWIY=
X-Received: by 2002:a37:9d47:: with SMTP id g68mr15663876qke.119.1582056836665; 
 Tue, 18 Feb 2020 12:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20200216181513.28109-1-sam@ravnborg.org>
 <20200216181513.28109-5-sam@ravnborg.org>
In-Reply-To: <20200216181513.28109-5-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Feb 2020 14:13:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
Message-ID: <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to panel-dpi
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
> Add data-mapping property that can be used to specify
> the media format used for the connection betwwen the
> display controller (connector) and the panel.
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Missing blank line.

> ---
>  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 40079fc24a63..6a03d2449701 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -21,6 +21,16 @@ properties:
>        - {}
>        - const: panel-dpi
>
> +  data-mapping:
> +    enum:
> +      - rgb24
> +      - rgb565
> +      - bgr666
> +      - lvds666

Doesn't lvds666 come from i.MX IPU which as I remember has built-in
LVDS block? I'd think this format would be implicit when using the
LVDS block and panel. It doesn't seem this is actually used anywhere
either.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
