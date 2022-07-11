Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9A2570E4B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 01:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E9111A30F;
	Mon, 11 Jul 2022 23:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F5311291C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 23:28:00 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bp15so1130753ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tT3i3PdSWIbZI2/jQXTr2ht9FWXt0v5w3WnrwY7zOxE=;
 b=Ldn5e/XdivqNGq4Wo2DSw9vOq5ICFZFMjEsGK5qXKUBqT+RZBBTBUQUrgowVxl9abf
 IZvV6AFjiDL62G8G5+bfNOR9kg81XWRLWcfzrZg1n3q+TAcpqNtW0Qm6u4XsGNXO02KB
 w0cKuHUwdeLDMcYS59ah5rxS1gcxsji/tG4DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tT3i3PdSWIbZI2/jQXTr2ht9FWXt0v5w3WnrwY7zOxE=;
 b=CWb2rraxlVlxFNaCztSUdqaGKW3GM0IVERZEIjSn9b0S9KczoWQNNKAluRWPkWqPP3
 G196jbp6Mkm1KA9XrhH6WCOwzOAbaq05awJ6gT5Y+5wgU9Nt2iGRiNRQIMkmN0gwYREF
 8I+3oON7KO/5wb2Q3IsRWD3G1Ef50xZBNNLajk4HRJe6mfdDJqN4GrIqJa9yBXjIi0aD
 3PLNZotzZH3Bvxl5Xh/fOcDOOnRsbgtQoqSl2wIFJUZsyQUedv950n3MG0Bn5B6CYXqq
 1oS18vht0RYs1PzZM2E3qa1fJYKzx8N/gjuCRkdGacmVHX9xf1kuA9BSM4gn0NEaT/Iy
 r0vw==
X-Gm-Message-State: AJIora95/m1gUgCdDFuXnl8M3IrjoiWzXOoA3WlkoyzaxneqshFGmrav
 CCDmOdGuEojuAbb3WnPbUlpXkXD5grsJYKZK694=
X-Google-Smtp-Source: AGRyM1t9PSSRhpWRE6v4rRQkV4FAAxHqanh5c/n4cofsiuBibwyFENAuNgUIGEK5lIscyVdzT0YOAQ==
X-Received: by 2002:a17:907:d26:b0:726:6d3a:a336 with SMTP id
 gn38-20020a1709070d2600b007266d3aa336mr21296671ejc.469.1657582078753; 
 Mon, 11 Jul 2022 16:27:58 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 2-20020a170906218200b006fed93bf71fsm359204eju.18.2022.07.11.16.27.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 16:27:58 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id o8so3811270wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 16:27:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr728744wmb.188.1657582077548; Mon, 11
 Jul 2022 16:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
In-Reply-To: <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 16:27:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
Message-ID: <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu register list
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Update gpu register array with gpucc memory region.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index e66fc67..defdb25 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2228,10 +2228,12 @@
>                         compatible = "qcom,adreno-635.0", "qcom,adreno";
>                         reg = <0 0x03d00000 0 0x40000>,
>                               <0 0x03d9e000 0 0x1000>,
> -                             <0 0x03d61000 0 0x800>;
> +                             <0 0x03d61000 0 0x800>,
> +                             <0 0x03d90000 0 0x2000>;
>                         reg-names = "kgsl_3d0_reg_memory",
>                                     "cx_mem",
> -                                   "cx_dbgc";
> +                                   "cx_dbgc",
> +                                   "gpucc";

This doesn't seem right. Shouldn't you be coordinating with the
existing gpucc instead of reaching into its registers?

-Doug
