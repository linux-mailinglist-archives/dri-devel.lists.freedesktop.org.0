Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19826D0DC9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 20:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8445E10E386;
	Thu, 30 Mar 2023 18:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825E410E386
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 18:31:54 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id d2so17036921vso.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680201111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6bmgWM4VeyB5ih4GlZbThd/2eiyQX/X/Evx0/5WbwLA=;
 b=n7Fbcx5kLC5PQCrKOLLphRB+Qj+CJ1V2n+6VE2q9x8tgdTfNT/TvljT9Ud5D0Sev+I
 jSx0/mE5wPBJBUslQrVt+msUKR8oj3psvddiRCxHXDNcC7JwUdR4++FURzyQa2lH2oPP
 QrylpyoNqKGTbaDitz5XTgPk8P5ruj9xa1qC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680201111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6bmgWM4VeyB5ih4GlZbThd/2eiyQX/X/Evx0/5WbwLA=;
 b=hHyAlYMKlIo4XKDbCQxNP5a/UWmsRQAj5MkI4iUFXDHTslpNGV2Z03eCgntjoVOuuL
 z75xZiWSPHfcA06Y3wciMhDzi6iSjJKhVoln+XmcPfzifOKjwk9brVfYduPe1kq4glWz
 Gv6EghMPeVpA37LuzGFx4JA9BmYaB3iSoNUCXr1ja8UXdcmxK8GrMv+C4u2eMXl1wkA1
 QO4FSGNeu9f7cf25E/vMfbOJ8JUL0v6F4zSBoJNSRKmB3M0rLZU00orLTM8aCOvhbVmu
 ipud5VPatBIs7O7zssde1HAOLvy3BoDLXb+zf2SQ2iwVkbb4Z3xB8iWipKxo9h3O8nGs
 n86g==
X-Gm-Message-State: AAQBX9f2SrxBLbpFFXs7sDx7QRjm5PawVx+A5vruyY2tPGNPjonfLLjD
 ah+UXIWp2MkARYi7Uv5UVPJVERPhnjbeIT9X428=
X-Google-Smtp-Source: AKy350YEcRdUOS045znz3a7a8VipQiw/C2bFNTc/ZTlaXpVe093TKLBLlgrsKiFCUTBjbuN7TCwZwg==
X-Received: by 2002:a67:f247:0:b0:426:3089:88ee with SMTP id
 y7-20020a67f247000000b00426308988eemr7970394vsm.0.1680201111286; 
 Thu, 30 Mar 2023 11:31:51 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 h4-20020a056102104400b00411c810dcb3sm4576085vsq.27.2023.03.30.11.31.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 11:31:50 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id h15so17097076vsh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 11:31:50 -0700 (PDT)
X-Received: by 2002:a67:c18a:0:b0:425:cf00:e332 with SMTP id
 h10-20020a67c18a000000b00425cf00e332mr13402479vsj.7.1680201109830; Thu, 30
 Mar 2023 11:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230324195555.3921170-1-markyacoub@google.com>
 <20230324195555.3921170-10-markyacoub@google.com>
In-Reply-To: <20230324195555.3921170-10-markyacoub@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Mar 2023 11:31:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xvu++Bvkkq+xORUB0OWq_49nupFgCqsbX0XJz8vgy0Zw@mail.gmail.com>
Message-ID: <CAD=FV=Xvu++Bvkkq+xORUB0OWq_49nupFgCqsbX0XJz8vgy0Zw@mail.gmail.com>
Subject: Re: [PATCH v7 09/10] arm64: dts: qcom: sc7180: Add support for HDCP
 in dp-controller
To: Mark Yacoub <markyacoub@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, suraj.kandpal@intel.com,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 24, 2023 at 12:56=E2=80=AFPM Mark Yacoub <markyacoub@chromium.o=
rg> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Add the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> ---
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> Changes in v7:
> -Change registers offset
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> index 47f39c547c41a..63183ac9c3c48 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -816,6 +816,14 @@ &mdss_dp {
>         status =3D "okay";
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&dp_hot_plug_det>;
> +
> +       reg =3D <0 0x0ae90000 0 0x200>,
> +             <0 0x0ae90200 0 0x200>,
> +             <0 0x0ae90400 0 0xc00>,
> +             <0 0x0ae91000 0 0x400>,
> +             <0 0x0ae91400 0 0x400>,
> +             <0 0x0aed1000 0 0x174>,
> +             <0 0x0aee1000 0 0x2c>;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
