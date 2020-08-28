Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DB256173
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 21:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195606E065;
	Fri, 28 Aug 2020 19:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002666E065
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 19:39:46 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7FAF20936
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598643585;
 bh=xUFISk9C2T5Th/TVRS1zOH9gJGTo5NUogulgUtWd1kU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N9hZCAXitny7X+xFMoghz/azRkTxxqJGZFJfVUgNxDYJYQcrYH3BO5cNXbM+ukhm1
 UC5gCezt1fG/ImIewN9HfE4Wd4zSz/KAAZov6JPbCZoojn5jtiBQa1b8sF6+PgXedL
 LtrMlfbi8Bh1Gg/5eVQ0jIlz6UwPjm4l5v9jHI5c=
Received: by mail-ot1-f53.google.com with SMTP id a65so197981otc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:39:45 -0700 (PDT)
X-Gm-Message-State: AOAM530oB8uXazJjHme3yJdZsfuYKTELqNyeJyZeuXK3OjfxEiCuVJYf
 BikOCSnrxv3KiQWaneF2BQPB27wPGvyexqytdg==
X-Google-Smtp-Source: ABdhPJyi4hrkJ9gGCQ7RWa0qmwaJus2XjYIXCWK0Rz7SdHaCJdzgpAplFiv/WVecDA/b30q8ixGX5hi9dJRXZEEjFy8=
X-Received: by 2002:a05:6830:1d94:: with SMTP id
 y20mr159768oti.129.1598643585206; 
 Fri, 28 Aug 2020 12:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
 <1595930879-2478-2-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1595930879-2478-2-git-send-email-kevin3.tang@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 28 Aug 2020 13:39:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKn+=idtoRiSqwSNQwfsiVRSrDSznQXWrpm=RET_hegRw@mail.gmail.com>
Message-ID: <CAL_JsqKn+=idtoRiSqwSNQwfsiVRSrDSznQXWrpm=RET_hegRw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 4:08 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> From: Kevin Tang <kevin.tang@unisoc.com>
>
> The Unisoc DRM master device is a virtual device needed to list all
> DPU devices or other display interface nodes that comprise the
> graphics subsystem
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../devicetree/bindings/display/sprd/drm.yaml      | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml

If you want bindings reviewed, then you need to Cc
devicetree@vger.kernel.org. Otherwise you may be waiting until the 6th
version or later or never.

>
> diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> new file mode 100644
> index 0000000..b5792c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0

New bindings should be dual licensed:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc DRM master device

DRM is a Linux thing and shouldn't be part of a binding.

> +
> +maintainers:
> +  - Mark Rutland <mark.rutland@arm.com>

No, this should be you or someone that knows the h/w.

> +
> +description: |
> +  The Unisoc DRM master device is a virtual device needed to list all
> +  DPU devices or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: sprd,display-subsystem
> +
> +  ports:
> +    description:
> +      Should contain a list of phandles pointing to display interface port
> +      of DPU devices.
> +
> +required:
> +  - compatible
> +  - ports
> +
> +examples:
> +  - |
> +    display-subsystem {
> +        compatible = "sprd,display-subsystem";
> +        ports = <&dpu_out>;

We generally try to avoid this virtual node as it doesn't represent
any h/w. Can't you bind the driver to the DPU directly?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
