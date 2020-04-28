Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417A11BCFE8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 00:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE0F6E904;
	Tue, 28 Apr 2020 22:27:26 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0DC6E904
 for <dri-devel@freedesktop.org>; Tue, 28 Apr 2020 22:27:25 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id i5so223052uaq.1
 for <dri-devel@freedesktop.org>; Tue, 28 Apr 2020 15:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MneTeEsl9HAajGzseS68PtFpQqpR7WXRnzKFmK+XRpk=;
 b=HYO8E/N+MMu6+8V05SjealqWlT/rFE3JYskdr3qTSPz02pknp0CcrhldrgkWJ1cVim
 j5eXn6RdtT3vlvnGs1toIFmKpvlBcvau1rE3BkF1izMMBMb+rvJ3u+zJrD4+/X7Uw+2B
 NKsPeC6OehmoRRTMka8FVUXHf0DP2shJ97Org=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MneTeEsl9HAajGzseS68PtFpQqpR7WXRnzKFmK+XRpk=;
 b=GQHkKHbSTiaKozig1HBqUWR2IB35n4kmR3sgDRHErDACb+ERLrhnQUTRQbHTk8UJCn
 icxkvYtPIFBIS8TitEJX0/Ycy6PK+7Jkbu9b0bymbYotolOTRK0UpRbgvelUXNIRuji/
 2O83mxC6btymi07RCoUT6XMLir7ULKC1ABGnlQgrU2pOOraBxbYCPK8PIdrPKhCwUZgm
 DxU56F7eZTg70rIjuFkVvr1/CAuBLELrMVqytu6vUs0g5jzp1v4DQf6MSLUCAoL2jPko
 Cq8dGnJmvgznD9xDN7AKDdwm0Uav8i7GdaxpwJpbDecwGcQ5a8FtANFlKuSxdP+Sxg4f
 ApWg==
X-Gm-Message-State: AGi0Pua0r7Kt2usghSA3Qk1ZuKxfkRFMoYqsTrUf9NfXx7zOiUoo+WuK
 8MlK0w+swIE9tORUDNDtMG2z78RMtJ0=
X-Google-Smtp-Source: APiQypIKRlWKKycTMhz7JNM9L1UaU2njYkv70ipJK6NLFcL6jHECUJSMhGRNsAdlzIfjyD6wZP4Juw==
X-Received: by 2002:ab0:648c:: with SMTP id p12mr20934582uam.83.1588112843547; 
 Tue, 28 Apr 2020 15:27:23 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174])
 by smtp.gmail.com with ESMTPSA id b198sm625179vkf.7.2020.04.28.15.27.22
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 15:27:22 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id q200so127361vka.13
 for <dri-devel@freedesktop.org>; Tue, 28 Apr 2020 15:27:22 -0700 (PDT)
X-Received: by 2002:a1f:9605:: with SMTP id y5mr22452968vkd.75.1588112842024; 
 Tue, 28 Apr 2020 15:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <1588073914-15712-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1588073914-15712-1-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Apr 2020 15:27:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
Message-ID: <CAD=FV=WPG4x+TTu5-169EPObhvtPEpodzjnk2WSBCQgR434xdA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm-smmu: Add a new compatible string and a
 clock
To: Sharat Masetty <smasetty@codeaurora.org>
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
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 28, 2020 at 4:39 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds a new compatible string for sc7180 and also an
> additional clock listing needed to power the TBUs and the TCU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

nit: mention sc7180 in subject, like:

dt-bindings: arm-smmu: Add sc7180 compatible string and mem_iface clock


> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..15946ac 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2
>                - qcom,sdm845-smmu-v2
>            - const: qcom,smmu-v2
>
> @@ -113,16 +114,22 @@ properties:
>        present in such cases.
>
>    clock-names:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: bus
>        - const: iface
> +      - const: mem_iface_clk

People usually frown on clock-names ending in "_clk".  Just name it "mem_iface".


>    clocks:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - description: bus clock required for downstream bus access and for the
>            smmu ptw
>        - description: interface clock required to access smmu's registers
>            through the TCU's programming interface.
> +      - description: clock required for the SMMU TBUs and the TCU

Is this clock only needed for sc7180, or would it be useful if we
enabled certain features on existing devices?  Please document exactly
when someone would provide this clock and when they'd leave it off.

...also: maybe it's obvious to those that understand IOMMUs in depth,
but to me I have no idea what your description means and why it's
different from the other two clocks.  Any way you could punch up your
description a little bit?

Looking at sdm845 I see that this clock seems to exist but wasn't
listed in the IOMMU device tree node.  Is that a mistake on sdm845?
...or is it just fine because the GPU holds the clock?  Is there a
reason the sdm845 solution and the sc7180 solution shouldn't be the
same (AKA we should either add this clock to the sdm845 device tree
file or remove it from sc7180)?

Thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
