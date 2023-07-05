Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBB87487C7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0535B10E38C;
	Wed,  5 Jul 2023 15:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179910E38C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 15:20:25 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-bd77424c886so8049873276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688570425; x=1691162425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NZAMOcL8Jye/af3yaSjbrvGPJfLK9qoKybBywpqSYP8=;
 b=jaKnyeXhCzI63IG8PAR3T1afvNEDWJ4QxaglwGJLcLAiMtusHzWDfT3R+7QqeoPZAZ
 9S87eUpSgJkC4oT81fduykICvwaAvcudNefYjQFyUNOfI/gJP9iGPbbXyCqtILscp41s
 fv5eZVSshl+ws7ZrzhiVFxa9pq6drHc48QRv69rDqGaUcSZW7+bApiwqXpNlTifVPhMU
 35+5IkVNuj4ZdR1GwzUggPVoIymBswYkanEgiA9MwzWpMe9z0H+QY4B8zVI/HO7DWnsg
 IsvPUqF7Z4CCu6eOTjFX7WDZxHxX3eTu7pDz0rc2KhrYKd5SuPNEWPB5s7iZXJmWZfmv
 rjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688570425; x=1691162425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NZAMOcL8Jye/af3yaSjbrvGPJfLK9qoKybBywpqSYP8=;
 b=NuIbTAyvUmJreqdf644eOUJr8Wd0YxjJS2GojXhV0WI02rejs+14QshiheiXXZx2Fk
 bZc9jLEzDa4KDGaKBNokUPY9QnnvuSZ3515PDbsXeObsdyEfd1S1AZ/7s+KRctzzhp8D
 UPivA/nkhFH88C5n9f36KYNu05Wx7xLf/xGJJTZdDu+cC52rYhgppoC2yB9YKwTsp9kd
 080FAXbH91RWS4uqBIzHIwqoIFkX/5tWjI2FpzAMO1JTWT7AOhx6KCCSBhxYbHKJ6XoD
 iLufuBYCchQMOWXfhf+ZjJ5eJVBq9KADRKOFdy93j4de5DbPsaMYGdXQkjEuxftMrEhT
 J2bw==
X-Gm-Message-State: ABy/qLYfoofyvcQp4QXJFicnON702Qnm8HjP4wSxevB4MDJ4jNvRWrci
 l46l43ccbYRxi+c7iXVaWf9NooebQHxxEtvp0yQnug==
X-Google-Smtp-Source: APBJJlHk1vpTA5uaLaRclVjz1s9mRQt4WsK64OE9PqAsFvnK685YLuTLjbg0z+TgfGketcZHx+yKUNgzIr+d1TtcNtU=
X-Received: by 2002:a25:bbc2:0:b0:bff:3a4:2354 with SMTP id
 c2-20020a25bbc2000000b00bff03a42354mr17196399ybk.42.1688570425038; Wed, 05
 Jul 2023 08:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <brmrqeajbq3oyp3jjwmc6tuhiftz764u6az444xw6g7pwf5fr3@5tlp375qwhed>
 <617c8f8a-1fc7-c6a0-eaa5-ce75ff2adc1b@linaro.org>
 <CAA8EJppG=MAVpK1J_8bNnkJ23y9NtgY7a2GVResXJvhEKyNsrw@mail.gmail.com>
 <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
 <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
 <47a5678c-1eb3-dfc2-a9ac-f8e497455d11@linaro.org>
 <unsithzszj7awvsmxwr7reshso5ju7u4nssil5tty6pocictf5@gwoltpgeecer>
 <6e070141-8c0e-59ed-8a08-58c3fadb17df@linaro.org>
 <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
In-Reply-To: <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jul 2023 18:20:13 +0300
Message-ID: <CAA8EJpq_VeY=44FqYm7QAT32AR=rmMOV0RtAfNFkb1hpSp29dw@mail.gmail.com>
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
To: Maxime Ripard <mripard@kernel.org>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Jul 2023 at 17:24, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Wed, Jul 05, 2023 at 04:37:57PM +0300, Dmitry Baryshkov wrote:
> > > > >
> > > > > Either way, I'm not really sure it's a good idea to multiply the
> > > > > capabilities flags of the DSI host, and we should just stick to the
> > > > > spec. If the spec says that we have to support DSC while video is
> > > > > output, then that's what the panels should expect.
> > > >
> > > > Except some panels supports DSC & non-DSC, Video and Command mode, and
> > > > all that is runtime configurable. How do you handle that ?
> > >
> > > In this case, most of the constraints are going to be on the encoder
> > > still so it should be the one driving it. The panel will only care about
> > > which mode has been selected, but it shouldn't be the one driving it,
> > > and thus we still don't really need to expose the host capabilities.
> >
> > This is an interesting perspective. This means that we can and actually have
> > to extend the drm_display_mode with the DSI data and compression
> > information.
>
> I wouldn't extend drm_display_mode, but extending one of the state
> structures definitely.
>
> We already have some extra variables in drm_connector_state for HDMI,
> I don't think it would be a big deal to add a few for MIPI-DSI.
>
> We also floated the idea for a while to create bus-specific states, with
> helpers to match. Maybe it would be a good occasion to start doing it?
>
> > For example, the panel that supports all four types for the 1080p should
> > export several modes:
> >
> > 1920x1080-command
> > 1920x1080-command-DSC
> > 1920x1080-video
> > 1920x1080-video-DSC
> >
> > where video/command and DSC are some kinds of flags and/or information in
> > the drm_display_mode? Ideally DSC also has several sub-flags, which denote
> > what kind of configuration is supported by the DSC sink (e.g. bpp, yuv,
> > etc).
>
> So we have two things to do, right? We need to expose what the panel can
> take (ie, EDID for HDMI), and then we need to tell it what we picked
> (infoframes).
>
> We already express the former in mipi_dsi_device, so we could extend the
> flags stored there.
>
> And then, we need to tie what the DSI host chose to a given atomic state
> so the panel knows what was picked and how it should set everything up.

This is definitely something we need. Marijn has been stuck with the
panels that support different models ([1]).

Would you prefer a separate API for this kind of information or
abusing atomic_enable() is fine from your point of view?

My vote would be for going with existing operations, with the slight
fear of ending up with another DSI-specific hack (like
pre_enable_prev_first).

>
> > Another option would be to get this handled via the bus format negotiation,
> > but that sounds like worse idea to me.
>
> Yeah, I'm not really fond of the format negociation stuff either.


[1] https://lore.kernel.org/linux-arm-msm/20230521-drm-panels-sony-v1-8-541c341d6bee@somainline.org/

-- 
With best wishes
Dmitry
