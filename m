Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D34321A4496
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA786EC9D;
	Fri, 10 Apr 2020 09:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966396E24D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 17:04:18 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g23so11226442otq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Od78lHji1R4oB8jriLMbIKkOcPwKQulsrlxEP1qy9W0=;
 b=ld/lxIkPFnngYXWsZtBos4iPMq3YReDzj9vr6Y2y1uLRBDVfqNe8fzPOXluun082US
 Hxb4IPYDGi5rgQM6E0o8+3OmknwQev9q9dXAbzr3dx1bmyo/Iy67zKZNZqbPKdmH0193
 pPIt2j0qCfzzstZPB193EDP7Wu5/pcYRnjLSl/80E9mFgnR2LtaOiJ7f4eTFh6AtoU/I
 tGAnrepAQlwfBuOEF5BoUumqxTk/dwEWKIdI6HOCiBAvtRmy9HvWRrRfcmk9c57wyJFJ
 ksePFFTnWAXd2f/oLGpXReHF1MkJmE3nbpQ5IMlc+gwKxZs6hYl9A9bguiMW06EysMVd
 wm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Od78lHji1R4oB8jriLMbIKkOcPwKQulsrlxEP1qy9W0=;
 b=fShPxMOODHz9cA1kdDmCfj8xKxMXzEZEA95XL2o8ptRK/QjpZVq1UkLEeuNBs2heuC
 P6o8h4JaBP4Tdg3j7+1zZ7FfqJ2JNL613pse0rje0V35dl8u1HnF8KsmfRytXoAnzLSe
 KOzgMDAqY3KdT+5OWWOxCDOxMSkTq4KblV3i4P5vPRJ6DU8q/JpfKLdm9jljD4erCJ+g
 hI1t0yE3Cmmaf26XJ+x1ytJYNIGIJOdB6iNnDeCu/eaz2dUymkVA/TUSBdKW7QyHRZcp
 arOPN6OibmZrrrd6hg5EPRbBmVKSuzIvXbFo3DIjvXDizaA4+L7DP5Z/4m9ZQ53m+5tW
 vnxQ==
X-Gm-Message-State: AGi0Puai2DbColXvExm/R2SbBH7TBlM8Hrepf4L7WejCvI7PxxpPsGNB
 Uy/wqQ4rSWyOxp+5/tShEum83C5NiJAaTn45+FA=
X-Google-Smtp-Source: APiQypKzkt4m+gvrFrc8rZL36U4I6nKnZ9/zIgz5AmVm9KYpHKUbUzzAP7SBNtxJcv6sSwSsOixAmtnH10+Kaerq2pE=
X-Received: by 2002:a9d:895:: with SMTP id 21mr687256otf.365.1586451857851;
 Thu, 09 Apr 2020 10:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-2-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-2-sam@ravnborg.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Apr 2020 18:03:51 +0100
Message-ID: <CA+V-a8vHNNOSYH00zdJ2GextiMi_y_ZnzgP4Bqzv99aewkvd5w@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] dt-bindings: display: allow port and ports in
 panel-lvds
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Wed, Apr 8, 2020 at 10:37 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Both port and ports names may be used.
> port - for a single port
> ports - if there is more than one port in sub-nodes
>
> Fixes the following warning:
> advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
>
> advantech,idk-2121wr.yaml needs several ports, so uses a ports node.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
--Prabhakar

> ---
>  Documentation/devicetree/bindings/display/panel/lvds.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index d0083301acbe..f9132d50821c 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -102,6 +102,12 @@ required:
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> +
> +if:
> +  required:
> +    - port
> +else:
> +  required:
> +    - ports
>
>  ...
> --
> 2.20.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
