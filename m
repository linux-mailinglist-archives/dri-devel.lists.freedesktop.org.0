Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0A1A37D6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 18:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ECD6EC07;
	Thu,  9 Apr 2020 16:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449FD6EC07
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:11:22 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 083B0218AC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586448682;
 bh=dY4y3+4XbjvyakdB/uUdMrfzN4g/tqUzd0PNclNSbKY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y6Kkz4YffGxvN/26LWVTywp6KjT9Bo0OWatb6LvFCbHM5RTBHAhNv1dUsPr/8Ihqs
 j5P/0ncVLiCgI6SGumdrR+scvugGw58Y0uXtyHaQ+fpsSj+5FVBPrE39jVh6URWWmN
 /0VgOzgKjsf3HYM+csRMdIkODW12sdmHj1MfDENk=
Received: by mail-qk1-f180.google.com with SMTP id m67so4458471qke.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 09:11:21 -0700 (PDT)
X-Gm-Message-State: AGi0PuYSVORfWO9nkU5YmgffzEPFB6tPNHfsn7oK8QqkciYRk4GM6e55
 RC7NlPJbjcU74hl2/vxgALULCc0JMFVTJpRXTw==
X-Google-Smtp-Source: APiQypLHsZq1dcUUjmhrUwi046XKEZhwxT7wbBhFjz2qi6S6YZ3km9QRZscpkxJrdVKvm7zomaEcxWOLtAO8qAUOKpA=
X-Received: by 2002:a37:c43:: with SMTP id 64mr539234qkm.119.1586448681197;
 Thu, 09 Apr 2020 09:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-2-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-2-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Apr 2020 10:11:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
Message-ID: <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] dt-bindings: display: allow port and ports in
 panel-lvds
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 1:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
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

Humm, I guess 'then' is not required. That's a bit weird IMO.

I usually do a 'oneOf' for these cases.

Either way, please apply this to drm-misc-fixes (or
drm-misc-next-fixes depending on the state of the tree). Or I can take
it. I'd like to get all the warnings cleared up by rc2.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
