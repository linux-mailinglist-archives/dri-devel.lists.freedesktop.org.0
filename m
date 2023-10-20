Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7EB7D12E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F066110E5D0;
	Fri, 20 Oct 2023 15:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3E10E5D0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:34:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE51F62212
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C864C433CC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697816094;
 bh=xiAEjRmww6/BxtbQQYblks4hL/CkDuN33VM/Ugwom6U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ws3Rm6Z21vFfjHwVeYMktTvrddWZL8CnIl7a2K/YVwu8zW2lzEL8QCdKBjdbCE0+b
 TxmKa+U8XzgOD8WqIPHOEpGeDZKCBnVExzIiFFHDgvC2ivXbS1eZvGcq7Q41raK+Et
 zjLjVZcM7cVw/VqiB4mxwtO04sSDuKE3ay5ogThzJdXwIdcR9p8NhmYvMFMEgCjlT+
 Awlhq5VgxA/grtAULpKTIeNvUJzF/nWXkWhV3Ew1zO3hU9Okwq3tbLGBg0uMnyZ2TZ
 pt2Al8U+kPJ411UjOEQSEW40kJeNU1AZ/NQ+O9OKzU7asStno22V/YtLkS0DBebxTM
 Por5CcyRFQxuA==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5046bf37ec1so1237739e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 08:34:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YwehB/TX1rz69SXJ2i4B/XphKQYXCakinZ6L559ZHDMTQ1x70+0
 cY2Ep4dTu9SITjqAm/z12PT7yTMLGS7SzqAIsg==
X-Google-Smtp-Source: AGHT+IGGfrI6448U2jdzaZAybL6ixVBj5cEamLBYPee1zT/Mmiauuaf6vjmiJ6zlQdze3HklPl/J37MqqQwOuB95J5k=
X-Received: by 2002:a19:ee14:0:b0:507:9a64:adf0 with SMTP id
 g20-20020a19ee14000000b005079a64adf0mr1693725lfb.10.1697816092553; Fri, 20
 Oct 2023 08:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231014071520.1342189-1-javierm@redhat.com>
 <20231014071520.1342189-7-javierm@redhat.com>
In-Reply-To: <20231014071520.1342189-7-javierm@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 20 Oct 2023 10:34:40 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com>
Message-ID: <CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M0PrxRFKz_Y4v37yMJvvA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] dt-bindings: display: Add SSD132x OLED controllers
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 14, 2023 at 2:15=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Add a Device Tree binding schema for the OLED panels based on the Solomon
> SSD132x family of controllers.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Add Rob Herring's Reviewed-by tag to patch #6.
>
> Changes in v2:
> - Remove unnecessary 'oneOf' in the SSD132x DT binding schema (Conor Dool=
ey).
> - Remove unused DT nodes labels in the binding schema examples (Conor Doo=
ley).
> - Split out common Solomon properties into a separate schema (Rob Herring=
).
>
>  .../bindings/display/solomon,ssd132x.yaml     | 89 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 90 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd=
132x.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> new file mode 100644
> index 000000000000..0aa41bd9ddca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd132x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Solomon SSD132x OLED Display Controllers
> +
> +maintainers:
> +  - Javier Martinez Canillas <javierm@redhat.com>
> +
> +properties:
> +  compatible:
> +    - enum:

Now this is a warning in linux-next. The '-' should not be there.
Please send a fix.

Not sure why there wasn't a report, but most likely it didn't apply to v6.6=
-rc1.

Rob

> +        - solomon,ssd1322
> +        - solomon,ssd1325
> +        - solomon,ssd1327
