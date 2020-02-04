Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885BC152065
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 19:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0E26E8A8;
	Tue,  4 Feb 2020 18:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D696E8A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 18:22:24 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id t129so5454800vkg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 10:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cype+1HdLaYeGzPg6QLAFeuguxQu4poaB2OEsU3y04s=;
 b=IUlAuvrBfjzl5pITuJlx+XC7sqgnBZqUwLmF9uQn/eUBKie2QtVpwI2xPwyf+a/syV
 OXaRJG/EOJB0KrDkMikM6npajjVQ8ecz9K2nJbZhUH8PLIkih+o8CsokUdnJCJGnn+ZP
 U2WqwmKL8+8A6UKrfacQQUvqu+UoXenC43pCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cype+1HdLaYeGzPg6QLAFeuguxQu4poaB2OEsU3y04s=;
 b=Nx1o91XjQ7z+uXS0hyp/tG2VqkiShgYCuhj84bYvWDlB7q04wsy1md0CmxSE9MY5hF
 qbnQrJVCImpHuqzjFdGH09i4IH4KJxhSo4y6aZekLX52mu+EIaahuJi5OroPapfTeDrT
 RaZmYiMOLdVut98lMwwbtvlbcFIQEEYeuhOQ4xAygeHX1VAsV06mXxNNGn2tE/mPby4S
 9JpdsuBzVf/vB8F/zOvQf+FAI7i099bLk/QCmcHsbALsq5X1z4E/c3cr369hndFJmHOJ
 RYA4gWH5opRiFLPsubNKlR3/2H23iD5xayHZP/fALbeGuk5e8d1CAtd17iaMCu43PTPX
 TItA==
X-Gm-Message-State: APjAAAUvexyu3br/o+LEF4CwAET89NRdxBOTEk0ZDY3qTOPDs4NntMXs
 37w8309MwjunW11J4bginkmORvMCTrQ=
X-Google-Smtp-Source: APXvYqxMhaRwa5J85ecpW54Qe9/R6vhNPaKB1lfJ9CVkxGdLODnnRKEzDEjikM8ChDeARIH/GX4m1w==
X-Received: by 2002:a1f:d583:: with SMTP id m125mr17576110vkg.17.1580840542547; 
 Tue, 04 Feb 2020 10:22:22 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id m11sm7426019vkm.52.2020.02.04.10.22.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 10:22:21 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id u6so5447483vkn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 10:22:21 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr17919151vke.40.1580840540768; 
 Tue, 04 Feb 2020 10:22:20 -0800 (PST)
MIME-Version: 1.0
References: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Feb 2020 10:22:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XXyYTqVV4=e8Kz0tYQ=5TWjZi2QETNL_0BaFqKi5o0Cg@mail.gmail.com>
Message-ID: <CAD=FV=XXyYTqVV4=e8Kz0tYQ=5TWjZi2QETNL_0BaFqKi5o0Cg@mail.gmail.com>
Subject: Re: [v1] dt-bindings: msm:disp: update dsi and dpu bindings
To: Harigovindan P <harigovi@codeaurora.org>
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
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 4, 2020 at 6:15 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Updating bindings of dsi and dpu by adding and removing certain
> properties.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         - Adding "ahb" clock as a required property.
>         - Adding "bus", "rot", "lut" as optional properties for sc7180 device.
>         - Removing properties from dsi bindings that are unused.
>         - Removing power-domain property since DSI is the child node of MDSS
>           and it will inherit supply from its parent.
>
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 7 +++++++
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 5 -----
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index 551ae26..dd58472a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -19,6 +19,7 @@ Required properties:
>    The following clocks are required:
>    * "iface"
>    * "bus"
> +  * "ahb"

This is only required for sc7180?  ...or old SoCs should have had it
all along too?


>    * "core"
>  - interrupts: interrupt signal from MDSS.
>  - interrupt-controller: identifies the node as an interrupt controller.
> @@ -50,6 +51,8 @@ Required properties:
>  - clock-names: device clock names, must be in same order as clocks property.
>    The following clocks are required.
>    * "bus"
> +  For the device "qcom,sc7180-dpu":
> +  * "bus" - is an optional property due to architecture change.

This is a really odd way to write it for two reasons:
* You're breaking up the flow of the list.
* This shouldn't be listed as "optional" in sc7180 but unless there is
some reason to ever provide it on sc7180.  It should simply be
disallowed.

Maybe instead just:

   The following clocks are required.
-  * "bus"
+  * "bus" (anything other than qcom,sc7180-dpu)

We really need to get this into yaml ASAP but that'd probably be OK to
tide us over.

NOTE: when converting to yaml, ideally we'll have a separate file per
SoC to avoid crazy spaghetti, see commit 2a8aa18c1131 ("dt-bindings:
clk: qcom: Fix self-validation, split, and clean cruft") in clk-next
for an example of starting the transition to one yaml per SoC (at
least for anything majorly different).


>    * "iface"
>    * "core"
>    * "vsync"
> @@ -70,6 +73,10 @@ Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
>  - assigned-clock-rates: list of clock frequencies sorted in the same order as
>    the assigned-clocks property.
> +- For the device "qcom,sc7180-dpu":
> +  clock-names: optional device clocks, needed for accessing LUT blocks.
> +  * "rot"
> +  * "lut"
>
>  Example:
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586..61d659a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -8,13 +8,10 @@ Required properties:
>  - reg-names: The names of register regions. The following regions are required:
>    * "dsi_ctrl"
>  - interrupts: The interrupt signal from the DSI block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.

Is this supposed to be removed from all SoCs using this bindings, or
just yours?

I'll also note that you left it in the "Example:" below.


>  - clocks: Phandles to device clocks.
>  - clock-names: the following clocks are required:
> -  * "mdp_core"
>    * "iface"
>    * "bus"
> -  * "core_mmss"

As Jeffrey pointed out, you shouldn't be removing these from old SoCs.
In "drivers/gpu/drm/msm/dsi/dsi_cfg.c" you can clearly see them used.
Maybe it's time for you to do the yaml conversion and handle this
correctly per-SoC.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
