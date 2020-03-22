Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67818E5FF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Mar 2020 03:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1716E233;
	Sun, 22 Mar 2020 02:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDF16E233
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Mar 2020 02:23:51 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w10so12222456wrm.4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 19:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioMqBUlgEP197yOqRJldZRP4FcdjiAk47h+WqmBXfrA=;
 b=vIXRN51VH1yI4dp+CvD6MX04O1CKnXPkgl4TbZXa4W9rUq3G7vS392ucc3BQ4CHgTP
 r/huLkYYD+y5ihfiM9K09Tmj0EussGjo/TYnXlRJrzZGUYK82+EJbWm6OPnOgmDCOZTh
 c/k/WtcD2Atl5L9ug+jX2T9Y0sfxUUTl0qiDcMtu374q35nD51SAm/t8SW0oM8iwZ7Wy
 FbC2vtFm4MLu19K+3cRQTFOJyEL83n1amdV6JoynnUbh1oIbiiTwDFD/lEMqk9j0dfzj
 Dx19M2ViyyEWsQrp/PkQwVU+wYi6QRjE8HbQfu69sLyse99XC3LkZDp1N9fkazXq1IGC
 KYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioMqBUlgEP197yOqRJldZRP4FcdjiAk47h+WqmBXfrA=;
 b=TrDhCZimpf6UzGpHVkCPvM0SLY/fUEH3v3jyCz3Z8eqo7rhqQ0n3YRgX7oZYLQX7EG
 sqmIIuQynLWD7+fIDMLpctV/2nUJqfWDBUWWzT/dOQqhwZ+IPxhoEWXvrrHWDdpcuQl9
 PVTByR3K4KbSmHHC8Hm/vwNBg4IR4gqB1TohFnS7v2db8E77LJnZeGvfw73HQ/2wr4li
 yt8oiv0A0lMLdllhyU4MR50h4J5q/dPH41s7Rh50RDtJd4TTIvdFezCCbh/4y7wn0HGy
 m//zgC0bOyxuXoaju/FkXivIeLouFr/ITI3idfYIPgQOtVwgkcgbXIbecgVJQk2oEfxX
 jVsA==
X-Gm-Message-State: ANhLgQ2iBX4Jyh+yYEwFKLJCl6vb25yowk0G//E3pAftjND6NP/NyfVK
 HTbagUD8PDtrAVamPSLlu4H32K5LDifp40mMpSq83yCv1dA=
X-Google-Smtp-Source: ADFU+vsFdmXWrsHJPw61O9GrgiXWOvmQz4H1EzO5bX6oaejYFzkLeS3cOLXLjMwlseimcBcMImN4sKDPyS7I5pYtUto=
X-Received: by 2002:adf:ff82:: with SMTP id j2mr13878951wrr.48.1584843829809; 
 Sat, 21 Mar 2020 19:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
 <20200319203427.2259891-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200319203427.2259891-2-martin.blumenstingl@googlemail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 22 Mar 2020 10:23:38 +0800
Message-ID: <CAKGbVbvDEkfLyhstd0+akqq0Amt-s-JMayxiQA2OxEfZPwj_CQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: gpu: mali-utgard: Add the
 #cooling-cells property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Fri, Mar 20, 2020 at 4:35 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The GPU can be one of the big heat sources on a SoC. Allow the
> "#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
> the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
> overheating.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> index afde81be3c29..33548ca2a759 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> @@ -107,6 +107,9 @@ properties:
>
>    operating-points-v2: true
>
> +  "#cooling-cells":
> +    const: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -162,6 +165,7 @@ examples:
>        clocks = <&ccu 1>, <&ccu 2>;
>        clock-names = "bus", "core";
>        resets = <&ccu 1>;
> +      #cooling-cells = <2>;
>      };
>
>  ...
> --
> 2.25.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
