Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A340B1723EC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 17:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C066E951;
	Thu, 27 Feb 2020 16:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14ACD6E960
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 16:50:21 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7C69246A8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 16:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582822220;
 bh=FyWAvV9W4uLcTtFZzaV8oagBiwmxzHMrlZt2Nl+L7BY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fBa0giuWcebLxY6glY2aWH6VZ3VxxBO9cYQwUAJW9/BS97BIiN+5ISHAPlSVyBlMT
 NYtbtOUbPUv2uAP1m/KfyR2gT8T+sw5rJc91B6JBvTZcnW7ECsY6PW0Ctua3vFiH88
 alOqc9YW0g6HF5mYsmlSBEzCQgM1jJ3qmdBV2qWg=
Received: by mail-qk1-f176.google.com with SMTP id m2so3781102qka.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 08:50:20 -0800 (PST)
X-Gm-Message-State: APjAAAXDvMHO55HWSCFCTxN4biIN5TN7i0vx7g7slQmekrzb7Wf2QzUL
 7fmJTbh9gtL07vHs8+f4v5S1yzVjtkWlHQlTdQ==
X-Google-Smtp-Source: APXvYqyWrls57v0p+99llkshAFrLOH8Ax4ge+p84ASrUSG0BZ+VtTRV6ts66XH20u13O6L6wKhBS+1IxasPsZX079IY=
X-Received: by 2002:a37:a750:: with SMTP id q77mr88866qke.119.1582822219778;
 Thu, 27 Feb 2020 08:50:19 -0800 (PST)
MIME-Version: 1.0
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
 <1582710377-15489-2-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1582710377-15489-2-git-send-email-kevin3.tang@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 27 Feb 2020 10:50:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL08g0TaNob7gcKgTx5OXgwBEfKy6f5AK73xuYhMRMNkw@mail.gmail.com>
Message-ID: <CAL_JsqL08g0TaNob7gcKgTx5OXgwBEfKy6f5AK73xuYhMRMNkw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 1/6] dt-bindings: display: add Unisoc's drm master
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 David Airlie <airlied@linux.ie>, Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 3:46 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> From: Kevin Tang <kevin.tang@unisoc.com>
>
> The Unisoc DRM master device is a virtual device needed to list all
> DPU devices or other display interface nodes that comprise the
> graphics subsystem
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../devicetree/bindings/display/sprd/drm.yaml      | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> new file mode 100644
> index 0000000..b5792c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc DRM master device
> +
> +maintainers:
> +  - Mark Rutland <mark.rutland@arm.com>
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

We try to avoid these virtual nodes and bind with actual h/w nodes.
Can you have more than one DPU and if so does it need to be a single
DRM driver instance?

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
