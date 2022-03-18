Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B32F4DDFD1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B14410E558;
	Fri, 18 Mar 2022 17:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483F610E39C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:26:53 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bg10so18342881ejb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCoJVU7mrdRYYKIeNxpHu40jIUtYCc2ytq8sJtJQeGU=;
 b=G/3LRJiL3DqJDP4WBNy8s7yyrZw6nESOCNsC2Nwpxwkyj67SgiTW1sew1I9mDZ9rmq
 5LXuoS1QxtJ748Oyjmt7XCguWrg/XLVqNtIkCzWgSXsqWI6/amBXVbX/UMrghLTYUU7X
 trR4fIkpdHtHmSusLVFyY7k9PVKpBF1ayFw4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCoJVU7mrdRYYKIeNxpHu40jIUtYCc2ytq8sJtJQeGU=;
 b=wOjExte0utnZhMCQPLk7Q/EwiyI6LEJsZqkc8I+Ehh2p2r1+67xFtlG4EyjutUh9uE
 EZPIRkU4dRZjdrqxj0LKhCFFLszrSxUQt5OteoG9uArQR1FVerCXlYzlS1RQTeqHgpK8
 I1frbsl0oqjx2NyAXLoWPmXyNeK4pE8SaWFV/a2Cdx7sVZIMeMMDAd2Wy/2T4GRn0bz0
 yRrCiWUkrEBmhh0I5Ckj8lpcjVYAbR7f+jEWbzDa5Ee9JDq15UcqUiNZixEe/rNxE+eK
 0U2cmcHf9vVOCKhp3d00fuvP6bcD5myUwbQM5dMA5qs7MTEnCbkOCGfTNaLWF3MIVz7L
 qvDg==
X-Gm-Message-State: AOAM533DzxN85hx7PgHvpkyyScUlliMekN7sL/Zd7Gn/lSfe51ojYqmf
 MVr5UvHQkO+44DS6L/W229ffqOT6rL/fc3HaSRo=
X-Google-Smtp-Source: ABdhPJx2dKPOs4lk5aiv58yOgIkGTb/0LkdwZ6gxqNrEVSFljXBkrQ1jc+p0pGWmT8TXPNHZL626ng==
X-Received: by 2002:a17:907:a421:b0:6da:b635:fbed with SMTP id
 sg33-20020a170907a42100b006dab635fbedmr10173750ejc.91.1647624411499; 
 Fri, 18 Mar 2022 10:26:51 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 ho14-20020a1709070e8e00b006dbd26c2182sm3857769ejc.156.2022.03.18.10.26.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 10:26:51 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id j15so4239567eje.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:26:51 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr9062480wrs.301.1647624064675; Fri, 18
 Mar 2022 10:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 10:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
Message-ID: <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant <quic_kalyant@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 16, 2022 at 10:36 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Enable support for eDP interface via aux_bus on CRD platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v5:
>   - Change the order of patches
>   - Remove the backlight nodes
>   - Remove the bias setting
>   - Fix compilation issue
>   - Model VREG_EDP_BP for backlight power
>
> Changes in v4:
>   - Create new patch for name changes
>   - Remove output-low
>
> Changes in v3:
>   - Sort the nodes alphabetically
>   - Use - instead of _ as node names
>   - Place the backlight and panel nodes under root
>   - Change the name of edp_out to mdss_edp_out
>   - Change the names of regulator nodes
>   - Delete unused properties in the board file
>
>
> Changes in v2:
>   - Sort node references alphabetically
>   - Improve readability
>   - Move the pwm pinctrl to pwm node
>   - Move the regulators to root
>   - Define backlight power
>   - Remove dummy regulator node
>   - Cleanup pinctrl definitions
>
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 93 +++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)

At a high level, I'd expect your patch to be based upon Matthias's
series, AKA the 4 patches from:

https://lore.kernel.org/r/20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid/

I'll leave it up to you about whether you care to support eDP on the
old CRD1/2 or just on CRD3. Personally I'd think CRD3 would be enough.

Then, I'd expect your patch to mostly incorporate
<https://crrev.com/c/3379844>, though that patch was written before
aux-bus support so the panel would need to go in a different place.

Stephen already gave some comments and basing on Matthias's patches
will be a pretty big change, so I probably won't comment lots more.


> +&mdss_edp {
> +       status = "okay";
> +
> +       data-lanes = <0 1 2 3>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +
> +       aux-bus {
> +               edp_panel: edp-panel {

As Stephen pointed out, it should be called "panel".
