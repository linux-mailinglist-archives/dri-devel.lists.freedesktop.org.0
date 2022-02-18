Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3244BBB1E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81F610E9D8;
	Fri, 18 Feb 2022 14:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA99410EB41
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h18so15953184edb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HEDVsJdoBlriKRiWsMiaPibDlLRBSHkQp8aBEXdrRPg=;
 b=fqRe4zP7YJl0es1coqEkQ+IA42hkW52O3II+Mzuv6ExVlmG3hQ9BH55+U9/QlFyisp
 0usnUkaPANy2IpTeSlyrZXG5nwU5PJx+kftwW3x7K85HTPrWGf5JoMKVsOXl8czZudNt
 kgmk68cPq+KhxefMKldnyo24+ONhbjWcEPftQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HEDVsJdoBlriKRiWsMiaPibDlLRBSHkQp8aBEXdrRPg=;
 b=McGg2SPFIY9mPX0FBk324mYhbafFEa95uzlvjNbzNSU5BGhVN2FgbtrjqOp285CaXh
 AeMFseui/d6iN/rr+Uv+oy92R92ZxWoOs+hmtgDkM06Fvel3ih/TgOf3EBicWWLJyllC
 0/B0XlsSK1ky5yh5NBz7UYKevBJOEQq3ArvWp8YQDLo3yNcsh4WJdFo9H4kKx2aUPVQL
 +uVNa3NH81+VwAs+KtqF9DwOEjCTkx7WiXGqS97/dm5kC/TKdKig/xWoEqFlxU1ABQz4
 Gu0/BmVYZ5EUjoOYFAa3qRfoswA8wSvlGmkf/cf0gBzDCUJ26zb2IBoSBl/W7kkq1dJi
 l9wQ==
X-Gm-Message-State: AOAM5323y7czJGF6bp6Xm3MRr63LCz1qG1Y4hWpWM1ezQK6bFFZVAjjW
 IebsGuZbf+nBCKDl7iBo7BlXToF/1QbrXbUMCZo=
X-Google-Smtp-Source: ABdhPJyROE3LW81SiGXunP8EZa4jQqicVDWoywlc9jNP3mPARUEKfz+5Hi1DCHZN2YZ2LVL2+LKGgA==
X-Received: by 2002:a05:6402:d0d:b0:412:d49c:74d3 with SMTP id
 eb13-20020a0564020d0d00b00412d49c74d3mr324921edb.207.1645196175977; 
 Fri, 18 Feb 2022 06:56:15 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id q14sm4892769edd.54.2022.02.18.06.56.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 06:56:15 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id k1so15028445wrd.8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:15 -0800 (PST)
X-Received: by 2002:a5d:4c48:0:b0:1e4:aeab:c77e with SMTP id
 n8-20020a5d4c48000000b001e4aeabc77emr6335194wrt.342.1645196174604; Fri, 18
 Feb 2022 06:56:14 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
 <YgWoAwdH/AqJUshh@builder.lan>
In-Reply-To: <YgWoAwdH/AqJUshh@builder.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Feb 2022 06:56:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XHsgg-cPVRr8jEUTGm3rf_BO5P+jQawDPq9Hju-O4uwQ@mail.gmail.com>
Message-ID: <CAD=FV=XHsgg-cPVRr8jEUTGm3rf_BO5P+jQawDPq9Hju-O4uwQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_vproddut@quicinc.com, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 quic_khsieh@quicinc.com, freedreno <freedreno@lists.freedesktop.org>,
 quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 4:04 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> > +&mdss_edp {
> > +     status = "okay";
> > +
> > +     vdda-1p2-supply = <&vreg_l6b_1p2>;
> > +     vdda-0p9-supply = <&vreg_l10c_0p8>;
> > +     /delete-property/ pinctrl-names;
> > +     /delete-property/ pinctrl-0;
>
> If the first device to enable &mdss_edp overwrites pinctrl-{names,0} in
> &mdss_dp and removes the properties in &mdss_edp, I think that's a sign
> that they should not be in the .dtsi in the first place.

Actually, I just looked more carefully here. I think the
"/delete-property" for edp_hpd here is just wrong. I'm pretty sure
that the HPD signal is hooked up on CRD and we actually need it. If
somehow deleting the property helps you then it's probably just
hacking around a bug and relying on the panel to be always powered on,
or something.

I think this gets into some of the stuff in your final patch in this
series. I found that, on my hardware, the panel doesn't come up at all
with that final patch. When I go back to how things were working in an
earlier version of your series, though, I can get things working a
little better (though still not perfect).

-Doug
