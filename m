Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8B82C8F27
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 21:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252806E886;
	Mon, 30 Nov 2020 20:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653286E886
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:29:20 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF2872087C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606768160;
 bh=8p6NimbOeCayqmrZMD8vIX/ZAIUnX0r/wxjNZ1WnXaY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W+iVilSO1VWZAI5uV16yR1HA16GxYYT2Dj/k6we3Iy77DnVtZTjvG5EtIPyjCtsPn
 H3pZ8VB7/poFR8T+ER5v1oogysTBrCEJfyDyJbQ645zP0FB4KNNviXO4UnhsrJsn4x
 8LMLojOTM8uAsBybQS1LJhUoyCs0K/WMfJaCnGaY=
Received: by mail-ed1-f44.google.com with SMTP id b2so5928624edy.13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:29:19 -0800 (PST)
X-Gm-Message-State: AOAM530X5+OnwQelnoJgt1o8LfduHFYCnDOISm2zdOZJfHs2H94XeMGe
 qSr+5CAhZ+qwZVR8AHSZZfkW01SiXZTpEv+gYA==
X-Google-Smtp-Source: ABdhPJx253fAf5hg88WZhzFWnVy0Qrr8HJJkGqNvc+PO7FdlAlN4nMcqcJFZZwVUmJlwsPlgwbYTIlwO2QOQfdpd9TI=
X-Received: by 2002:aa7:c816:: with SMTP id a22mr7112436edt.373.1606768158104; 
 Mon, 30 Nov 2020 12:29:18 -0800 (PST)
MIME-Version: 1.0
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
 <1606746513-30909-2-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1606746513-30909-2-git-send-email-kevin3.tang@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Nov 2020 13:29:06 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+fC1TzygUopiwVtwBN8JtwmnGy=VMTEvkudSQUdXiMqg@mail.gmail.com>
Message-ID: <CAL_Jsq+fC1TzygUopiwVtwBN8JtwmnGy=VMTEvkudSQUdXiMqg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: add Unisoc's drm master bindings
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

On Mon, Nov 30, 2020 at 7:28 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> From: Kevin Tang <kevin.tang@unisoc.com>

Once again, DT patches must Cc the DT list if you want them reviewed.

>
> The Unisoc DRM master device is a virtual device needed to list all
> DPU devices or other display interface nodes that comprise the
> graphics subsystem
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../display/sprd/sprd,display-subsystem.yaml       | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
> new file mode 100644
> index 0000000..9487a39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/sprd,display-subsystem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc DRM master device
> +
> +maintainers:
> +  - Kevin Tang <kevin.tang@unisoc.com>
> +
> +description: |
> +  The Unisoc DRM master device is a virtual device needed to list all
> +  DPU devices or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: sprd,display-subsystem

As I said before, we try to avoid these virtual nodes. Make the DRM
driver bind to the DPU node.

The case where this might be needed is if you have h/w that's a
mixture of shared and discrete blocks. I don't see anything here
matching that.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
