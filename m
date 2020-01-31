Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4214F172
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 18:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236C66FBB3;
	Fri, 31 Jan 2020 17:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9C6FBB3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 17:41:11 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAB9124682
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580492471;
 bh=j9L7YS1IMIUGvccZ1rHyQK+UVEwcZiYe0s6TbTpWVhY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gx7l5bnlji7EjZCMKzo5sJTAnC0ZbVzJDWJ05Hj8lgPMhgeKFWWq9mRKriCS4n8Qr
 oevClOc1Olg5m73sbKsISlWUbu+/sGeDeQlnPH9X2rbDwE27SXltHsxNUxJo50r5n2
 Cv+B/OgjoSsnx0l8vVo6+lGlxeXFHluvx2KtPRV0=
Received: by mail-qk1-f177.google.com with SMTP id 21so7369972qky.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 09:41:10 -0800 (PST)
X-Gm-Message-State: APjAAAWaoKHWjJ4tg0MERued4yEVbYQKDC0uaEV5tSBfo42hiRdbpskz
 A0V2TAJNEtYYauhdkH2OUj8pRpx+910WXkfW0Q==
X-Google-Smtp-Source: APXvYqzcPXwNiM+WNCqBCrr2x5w5fdp61dkW1RPVkzEgStdAcfM6ZkFVm5E4Ii+5LeuvmrEOYFBEWfJnzrVzsu+chtk=
X-Received: by 2002:a05:620a:9c7:: with SMTP id
 y7mr11820586qky.393.1580492470023; 
 Fri, 31 Jan 2020 09:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20200125203454.7450-1-sam@ravnborg.org>
 <20200125203454.7450-3-sam@ravnborg.org>
In-Reply-To: <20200125203454.7450-3-sam@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Jan 2020 11:40:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgWaqJCxtsD02DsTu=p=Q2=ZzWNZ5bf_atmbbD9N6JQQ@mail.gmail.com>
Message-ID: <CAL_JsqKgWaqJCxtsD02DsTu=p=Q2=ZzWNZ5bf_atmbbD9N6JQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: convert display-timings to
 DT schema
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
> Add display-timings.yaml - that references panel-timings.yaml.
> display-timings.yaml will be used for display bindings
> when they are converted to meta-schema format.
>
> For now the old display-timing.txt points to the new
> display-timings.yaml - and all users are left as-is.
>
> v2:
>   - Updated native-mode description
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/panel/display-timing.txt | 124 +-----------------
>  .../display/panel/display-timings.yaml        |  68 ++++++++++
>  2 files changed, 69 insertions(+), 123 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/display-timings.yaml


> diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> new file mode 100644
> index 000000000000..508302cd307a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: display timing bindings
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +properties:
> +  $nodename:
> +    const: display-timings
> +
> +  native-mode:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      The default dispaly timing is the one specified as native-mode.
> +      If no native-mode is specified then the first node is assume the
> +      native mode.
> +
> +patternProperties:
> +  "^timing.*$":

'.*$' can be omitted.

Probably should have a 'type: object' here too.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>


> +    allOf:
> +      - $ref: panel-timing.yaml#
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
