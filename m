Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32A715CB6
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 13:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD2210E389;
	Tue, 30 May 2023 11:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D0210E144
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 11:11:20 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-565a3cdba71so60818927b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685445078; x=1688037078;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2Aw1Y+LNx+6x6rqkl3hDGtyQpbkH+fbTyufgVbhUx3g=;
 b=j/znRIUxKJksQNwddxQU58ISTnn7vK+X/i5ctJxZ9kV6Zy74Y7/Ykn1i3yLD1unHfB
 g1n31aO8w98GIWhpkbzZdHOXZnpLE2VSfzmvc/YNKfYQ+LBduA0dV7wxL+4vq+e3GzxM
 sAdSD89FDbS9Y4yyVzNrAZCaHYJpp5Q4IIQoIbini+Vow6/Aj3cpWNe0+W6ligWOPT2u
 ARA3eKBN3lrXEJPxQhCOpk/6dZoqf4VOoqMec7n/yDYe8vrRCOvF8UzCReBELiA6OU9O
 T1cqBbP8F832jq3ASijrL+IzrUy3RQNNoH6YoT9idANpQ6ukYRvvIxPv5UNVQ9n5LYH9
 Z0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685445078; x=1688037078;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Aw1Y+LNx+6x6rqkl3hDGtyQpbkH+fbTyufgVbhUx3g=;
 b=WGjWXh9MtEc+aXfZ24Fqt0NXu8qpxDyR1YiQSaoPH5bnY2vu+wnoGHANLe3/per1iC
 VkCqJpRCYWOKG+K9FTd4vQWGuxyG/w/I2JMqKlwFDMBbLPjGfsrRXtCOmXGmAlVFcKyb
 Qdz5c5p7K/EceJEK55KLJ0GWKb4PJyo+lpOTJZlgtIkT/72YEGBm1QrtQUaiBIsxaPXK
 d3/MfnWuIi8L8DS2w+o1GBSJhfKhha9ZbebDk+loJh+e6Lv5cfx/ZUVzx0rcKonLMf/T
 uL3mTD7mjSg+rhYG5DGNWR/vOS+g9RsXGHa0jb8FBbyK71u2ptP81OZXDL12U0PUYtR6
 CW/Q==
X-Gm-Message-State: AC+VfDwgeBrWWpuQE9BuAMHhmFkH7ssp6Co8JTdMbvvwnmDQin+W1LrW
 Ab0HsICBcMNcwDfQ3+vr8tuDYlVFNgbazw8V6U/TJA==
X-Google-Smtp-Source: ACHHUZ5W8uyQC5KcaoA8JpMcpez1cJAmTKelhw60cKwxaP/qh9Nq55tKrVcBkj3EzUU6ZABnGEZGlGc1VHQoEZDvPAA=
X-Received: by 2002:a0d:e212:0:b0:55d:a4fb:864a with SMTP id
 l18-20020a0de212000000b0055da4fb864amr1965071ywe.14.1685445078295; Tue, 30
 May 2023 04:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <71675a02-0801-62dc-2673-4a0907636b21@linaro.org>
 <CAA8EJpq=HZqiBZ6bpUNH47VmASuH+Mi5OD5BHmg0TPwtsKHf8w@mail.gmail.com>
 <oxgtbj7qmsdvz5gl4bud64jedmhdmvphjfge7uy6uwulefqfsa@pleslv2zgwbp>
 <ebc3ff33-6e4f-b107-33c6-f35b03307058@linaro.org>
 <v3ac2ihqjce7vxcsjnm7ett2vc6wb4hb3bb6x4widd55eintw7@fgkyipbbl2ei>
 <d52b384f-9853-3921-d4f2-5aedb7ef4c61@linaro.org>
 <ao2w7eiuc4olqbycmdviqrpqbdpoltusixlllied7jbo5fucap@xv6xvgi43yio>
In-Reply-To: <ao2w7eiuc4olqbycmdviqrpqbdpoltusixlllied7jbo5fucap@xv6xvgi43yio>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 May 2023 14:11:06 +0300
Message-ID: <CAA8EJpqt_VCE+Nz8w5mRMrg_oN87xByk2NKy8v+9LLPjP-nLYw@mail.gmail.com>
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony Xperia
 XZ3
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, neil.armstrong@linaro.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 May 2023 at 11:27, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-30 01:39:10, Dmitry Baryshkov wrote:
> > On 30/05/2023 01:37, Marijn Suijten wrote:
> > > On 2023-05-30 01:18:40, Dmitry Baryshkov wrote:
> > > <snip>
> > >>>>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
> > >>>>>>> +    if (ret < 0) {
> > >>>>>>> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
> > >>>>>>> +        return ret;
> > >>>>>>> +    }
> > >>>>>>
> > >>>>>> My usual question: should the mipi_dsi_dcs_exit_sleep_mode() / mipi_dsi_dcs_set_display_on() be moved from prepare() to enable() part?
> > >>>>>
> > >>>>>
> > >>>>> No, prepare is called before the video stream is started and when display is still in LPM mode and the mode hasn't been set.
> > >>>>>
> > >>>>
> > >>>> Yes, that's my point. Shouldn't we enable the panel _after_ starting the stream?
> > >>>
> > >>> I have never investigated what it takes to split these functions, but
> > >>> some of these panels do show some corruption at startup which may be
> > >>> circumvented by powering the panel on after starting the video stream?
> > >>>
> > >>> I'm just not sure where to make the split: downstream does describe a
> > >>> qcom,mdss-dsi-on-command and qcom,mdss-dsi-post-panel-on-command, where
> > >>> the latter only contains set_display_on() (not exit_sleep_mode()).
> > >>> It is documented like:
> > >>>
> > >>>       same as "qcom,mdss-dsi-on-command" except commands are sent after
> > >>>       displaying an image."
> > >>>
> > >>> So this seems like the right way to split them up, I'll test this out on
> > >>> all submitted panel drivers.
> > >>
> > >> Interesting enough, Neil suggested that sending all the commands during
> > >> pre_enable() is the correct sequence (especially for VIDEO mode panels),
> > >> since not all DSI hosts can send commands after switching to the VIDEO mode.
> > >
> > > Note that all these panels and Driver-ICs are command-mode, and/or
> > > programmed to run in command-mode, so there shouldn't be any notion of a
> > > VIDEO stream (any command-mode frame is just an "arbitrary command" as
> > > far as I understood).
> >
> > Yes, from the data stream point of view. I was talking about the DSI
> > host being able to send arbitrary commands or not after enabling the
> > video/cmd stream.
>
> Is this a known limitation of SM8250 then?  Or is the brightness_set
> issue more likely a "problem" with the panel that the downstream kernel
> is "somehow" working around or aware of, and I just haven't found
> how/where it deals with that?
> (Alternatively we could be "doing it wrong" for other panels but it
>  turns out to be working anyway)

Please excuse me for not being explicit enough. Qualcomm hardware
doesn't have this problem. Thus I was completely unaware of it before
talking to Neil.
So, our hardware works in most of the cases.

-- 
With best wishes
Dmitry
