Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D31527AD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 09:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224686F4C8;
	Wed,  5 Feb 2020 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22156F374;
 Tue,  4 Feb 2020 14:44:26 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id s85so12626611ill.11;
 Tue, 04 Feb 2020 06:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBPgZrCmoCK+adPpBYU1UgcBrMjDVFByBZS7ldjpSQg=;
 b=E4Xyb8LiS6clI+5dqopwS6OxlDQ+b2NTz73F0W4FBbpOs3EEVtrxId487UD5r2m8PL
 HI1VKjnvEvRLgZHOARQnfMSd/8EYJBGf4HCw7TL3k5RWfK7MXwYBuwxzq5oPF2t+Rlj9
 cUlguf56kwFgdu16U9HCo7Ywnsgeo7Xa2Q1TAIEEfAB1KOl0uPL6ce+TmnvfJ75C01BO
 RchsaGygoM1zofuLrx75cI9PGtpn83vxqyx0smAb8D/AtI1SrGB5Pqmu2TmrDqxnnizT
 dI4bdSBfpQFHNjxcIIqJ3ELyp8k9XQolPw6DnXnPyk1BG6S3YqzNa0SvghlBrEvh2FXT
 sJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBPgZrCmoCK+adPpBYU1UgcBrMjDVFByBZS7ldjpSQg=;
 b=YWkKVtD+s74n8vJ51izsKZM2FrMLAr4UTAKJRFcW7OpJtj2SvTasUC2sroWxW+LW9L
 Hirc38ljTw85ANg4RLFpQ9DJNlx7WKrN8cMsYnmpBEfAKKYCejNbhIXS4qNKrglm0c2n
 jsiajbHLo3/a+mIQQDS8A2uXEaymHLR4CTb+jzrROTF82gQzWyYyN6XAovTXOQVKoQjJ
 0tJtQqQXj5e1qWR1Yi3kOImVSPQmVEoWFxcV/R5jczxNQLteZW5Ve18FzFKlx/WU8qIq
 CESY7JkDM1qJ9saYToaH5sX7DiNhHnz9sN+XAzHMxo6WAMD8WWWMHBnIZajk0nBLkG/j
 vmTw==
X-Gm-Message-State: APjAAAUunS6N9Favj6S3k340YHgwfVEm7GP+0iJNxqJjUXKXmE7gTqU9
 onH6tJt+YZgMIyeWsS6bzMuprdx3HrtvOqZsSmk=
X-Google-Smtp-Source: APXvYqwK9TpjhX0h1rx34qAMHunSgEc+MuYa+gdNBn5BAmQldz1Y+KTnEKcwvvlYqWn8uE+Twe4govU8jiD5qoDHMWo=
X-Received: by 2002:a92:5e8b:: with SMTP id f11mr27598714ilg.178.1580827466019; 
 Tue, 04 Feb 2020 06:44:26 -0800 (PST)
MIME-Version: 1.0
References: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 4 Feb 2020 07:44:14 -0700
Message-ID: <CAOCk7NoAY7QaoBufG=JOR54PocdtrMsxUh9HmdWEwQ4zSG5MDg@mail.gmail.com>
Subject: Re: [Freedreno] [v1] dt-bindings: msm:disp: update dsi and dpu
 bindings
To: Harigovindan P <harigovi@codeaurora.org>
X-Mailman-Approved-At: Wed, 05 Feb 2020 08:52:53 +0000
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
Cc: DTML <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 4, 2020 at 7:15 AM Harigovindan P <harigovi@codeaurora.org> wrote:
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
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586..61d659a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -8,13 +8,10 @@ Required properties:
>  - reg-names: The names of register regions. The following regions are required:
>    * "dsi_ctrl"
>  - interrupts: The interrupt signal from the DSI block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
>  - clocks: Phandles to device clocks.
>  - clock-names: the following clocks are required:
> -  * "mdp_core"
>    * "iface"
>    * "bus"
> -  * "core_mmss"

Why do you think these are unused?  I see them used in the driver, and
as far as I can tell these get routed to the hardware, therefore they
should be described in DT.

>    * "byte"
>    * "pixel"
>    * "core"
> @@ -156,7 +153,6 @@ Example:
>                         "core",
>                         "core_mmss",
>                         "iface",
> -                       "mdp_core",
>                         "pixel";
>                 clocks =
>                         <&mmcc MDSS_AXI_CLK>,
> @@ -164,7 +160,6 @@ Example:
>                         <&mmcc MDSS_ESC0_CLK>,
>                         <&mmcc MMSS_MISC_AHB_CLK>,
>                         <&mmcc MDSS_AHB_CLK>,
> -                       <&mmcc MDSS_MDP_CLK>,
>                         <&mmcc MDSS_PCLK0_CLK>;
>
>                 assigned-clocks =
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
