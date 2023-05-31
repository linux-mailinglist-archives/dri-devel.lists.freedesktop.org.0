Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205071883A
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46AE10E4F8;
	Wed, 31 May 2023 17:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD1C10E506
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:12:43 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4572fc781daso1628016e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685553161; x=1688145161;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ha/IiHaH5j6Z2Cbh1nO+UGmSDQbqB1V+I93hhUI/9O8=;
 b=mhhJO60JV+y4yC2WvXQhRUZyuDqeajiEG8mRNQu0Z11kY7HL+8EAExQLenYZqH7z+2
 2Mzuf9o4IusHjj3MIZfkmPEGuHE5kI6AlerYuypAxDa9bcVAgVZ5UDmC8L+8kB35CRLQ
 PLG+y1whclaJ2hDGwEHNZhA0uec3QSAi4hM9WfzLBBAVV1fN0YEEr/40yZPpgQzFvTt2
 7rEhfgpLsOrEd35guANV18iRfJ+4089lf/mkJToW6y72IHKvYr5/tv6Jf15oIxwmEN2P
 KBD4pK9y5HmuoSr5dGUw0aDtS6LEuwi2zPBapnZ9fOR4sYBv5bsmBaySBb1FXslIxQiH
 882A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685553161; x=1688145161;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ha/IiHaH5j6Z2Cbh1nO+UGmSDQbqB1V+I93hhUI/9O8=;
 b=PtJj1/XJfpQSfewayl2CRRmsMAgX8ar8T9Ng3bj6QZl4YJ6N1a8n+/qOBmHn/yhjZC
 PuWsk53U2cROOfHewqKjn94skYbO3Ewiw+h/+xQDP0HkNz8ZIQw9RuSRKCg+beIQTo3m
 vDHuzZ8aWozp/zLF6AyIGfA03jg79Bo3usqcf57sKpQ1S9aXzmaa4gFNyQoUFJqicrn8
 /LkfAlaH9vsh2yL7PCLjKnOQA33nc12B8wQ5jnWp/8fOsu+P3JEczfDg4yNE7aHycNfX
 YksLses53Ucxhn2sjKvjke62yoPsmq0yNlj/szl79btHgiDYn4yR1Oj5CxPUsKqELgs9
 z38Q==
X-Gm-Message-State: AC+VfDzSitqgvdJmpYTYdoDJn8hg9CjeXEr5aB3oIRRHSFisgsu4K+Yx
 7A1XGePP9mc0KrmLJFkz2gxDbqdQyPXUamu2Ts9QdA==
X-Google-Smtp-Source: ACHHUZ6oRlQHMt3xDrn+41gUpjU+uA1RCTiAOhFhwhwc1iVr5n/7DlebDHtwxCujodDYMCeRKw4G+OdExuKthRhprqg=
X-Received: by 2002:a1f:cb44:0:b0:457:2d6a:7b4d with SMTP id
 b65-20020a1fcb44000000b004572d6a7b4dmr2205147vkg.10.1685553161697; Wed, 31
 May 2023 10:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
In-Reply-To: <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 May 2023 20:12:31 +0300
Message-ID: <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct at
 atomic_check()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 May 2023 at 18:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
>
> >>   +    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> >
> > INTF_DSI
> >
> >> +        struct drm_bridge *bridge;
> >> +
> >> +        if (!dpu_enc->dsc) {
> >
> > This condition is not correct. We should be updating the DSC even if
> > there is one.
> >
> >> +            bridge = drm_bridge_chain_get_first_bridge(drm_enc);
> >> +            dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);
> >
> > This approach will not work for the hot-pluggable outputs. The dpu_enc
> > is not a part of the state. It should not be touched before
> > atomic_commit actually commits changes.
> where can drm_dsc_config be stored?

I'd say, get it during atomic_check (and don't store it anywhere).
Then get it during atomic_enable (and save in dpu_enc).

> >
> > Also, I don't think I like the API. It makes it impossible for the
> > driver to check that the bridge is the actually our DSI bridge or not.
> > Once you add DP here, the code will explode.
> >
> > I think instead we should extend the drm_bridge API to be able to get
> > the DSC configuration from it directly. Additional care should be put
> > to design an assymetrical API. Theoretically a drm_bridge can be both
> > DSC source and DSC sink. Imagine a DSI-to-DP or DSI-to-HDMI bridge,
> > supporting DSC on the DSI side too.
>
> Form my understanding, a bridge contains two interfaces.
>
> Therefore I would think only one bridge for dsi-to-dp bridge? and this
> bridge should represent the bridge chip?
>
> I am thinking adding an ops function, get_bridge_dsc() to struct
> drm_bridge_funcs to retrieve drm_dsc_config.

So, for this DSI-to-DP bridge will get_bridge_dsc() return DSC
configuration for  the DSI or for the DP side of the bridge?

>
> Do you have other suggestion?

Let me think about it for a few days.

-- 
With best wishes
Dmitry
