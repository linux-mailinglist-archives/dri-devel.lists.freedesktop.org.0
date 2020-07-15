Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785622143C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 20:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6E6E303;
	Wed, 15 Jul 2020 18:26:41 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B391B6E303
 for <dri-devel@freedesktop.org>; Wed, 15 Jul 2020 18:26:39 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d18so2343250edv.6
 for <dri-devel@freedesktop.org>; Wed, 15 Jul 2020 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oTQol0VmjKmBPC+M8imaYKdXV0XGdfLv0rh0VWky9EE=;
 b=uEvZT5ws7+T1jnEVo6h4JbcKv8hKOxVCiJq7OPNIAvwfhDPmyGLsLZHzlj3+UQdbDu
 AJKToPAaUqlIXFAC4vBVNmIbeFB8QSK3UYuQk68sX+Joam1O4wNo/I0UIbhcua/xk60a
 e1JadHF+95xJiCjkb4BPqj69zzhrMH3vOdDr9/57zwNbf1j0o51CmK+HkV8Fnv1oh3mq
 dsHG/eup+01xytoaipZGKywOhJg0gANnXIIwUNiURsyiVQoE6F3fjv5GsM9a4ECmV1Zu
 nsh/4VmIRcvcEWOFyXfYT657uKLnIh76SWifvHzJigNGdoc3EB2Y3w8AuF8RT8CkFJo2
 ey+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oTQol0VmjKmBPC+M8imaYKdXV0XGdfLv0rh0VWky9EE=;
 b=KrUubeMY6cYxAtvZHZLQzACSr0wfdnf9/KSCnbZSnom/HNdu2vrt6yMQ6B641u6L+8
 y474rA3eiOEebfwug0mB61jGQhfKV4c3dEA/ERnJsHsTnncQX4I2Z59vxFi/syFRr+iR
 nCWN2ZKHdNFysGz+UIHCTGUEYc7lHHmA9q+icOUu1VbKVFHYIZ9fUUikeLhRO2VAEUI6
 zm+7je6vEnaOx9iWhY3/eaTZcxbABNisR2MO3rQYBR3Zd7wAn5lp3dPPh1592tDJNA80
 z0uyk05k+Ymg5Oy5Hnyhi5eOuRmyZoBTWlaLSckk3yyqHrDbj5H56+t9wTh0Ivea2idZ
 I7bA==
X-Gm-Message-State: AOAM533msY3H7rwauZQcH6RQh+5si9nU3OpWcWzsUolra4IP/8BLWCzf
 bjc7ZTVfsGPVBisTLVxgnv7G1asP5thEyTdKKlw=
X-Google-Smtp-Source: ABdhPJxLqEBMfJSdn3WSobb0Oqp5l9KTaKAbyXt1aXJeFG4g+SFo7Aq+S0ThjrslTJ53COSNmM0KR2c9PV+YQEl8Ctc=
X-Received: by 2002:a05:6402:304a:: with SMTP id
 bu10mr915071edb.70.1594837598280; 
 Wed, 15 Jul 2020 11:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <1594644106-22449-6-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594644106-22449-6-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Jul 2020 11:27:11 -0700
Message-ID: <CAF6AEGs9Ei=MAhC=OOfxHvw_AGeF25LTCrWLzxB_kGN7e2PgNA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: sc7180: Add interconnects
 property for GPU
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 5:42 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> From: Sharat Masetty <smasetty@codeaurora.org>
>
> This patch adds the interconnects property to the GPU node. This enables
> the GPU->DDR path bandwidth voting.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 31b9217..a567297 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1470,6 +1470,8 @@
>                         operating-points-v2 = <&gpu_opp_table>;
>                         qcom,gmu = <&gmu>;
>
> +                       interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;

I suppose this and the 845 dts patch should have:

   interconnect-names = "gfx-mem";

(OTOH not having it was a good way to notice a bug in the driver
handling the legacy case without having 'interconnect-names')

BR,
-R


> +
>                         gpu_opp_table: opp-table {
>                                 compatible = "operating-points-v2";
>
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
