Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB19716C21
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F6F10E249;
	Tue, 30 May 2023 18:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A8110E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 18:19:24 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7F1FB3EF11;
 Tue, 30 May 2023 20:19:21 +0200 (CEST)
Date: Tue, 30 May 2023 20:19:20 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony
 Xperia XZ3
Message-ID: <iboet2dgdgxdailepqnq74yiwxhtxodgn4dss7seqzklxeco4f@scugkjmgz6m6>
References: <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <71675a02-0801-62dc-2673-4a0907636b21@linaro.org>
 <CAA8EJpq=HZqiBZ6bpUNH47VmASuH+Mi5OD5BHmg0TPwtsKHf8w@mail.gmail.com>
 <oxgtbj7qmsdvz5gl4bud64jedmhdmvphjfge7uy6uwulefqfsa@pleslv2zgwbp>
 <ebc3ff33-6e4f-b107-33c6-f35b03307058@linaro.org>
 <v3ac2ihqjce7vxcsjnm7ett2vc6wb4hb3bb6x4widd55eintw7@fgkyipbbl2ei>
 <d52b384f-9853-3921-d4f2-5aedb7ef4c61@linaro.org>
 <ao2w7eiuc4olqbycmdviqrpqbdpoltusixlllied7jbo5fucap@xv6xvgi43yio>
 <CAA8EJpqt_VCE+Nz8w5mRMrg_oN87xByk2NKy8v+9LLPjP-nLYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqt_VCE+Nz8w5mRMrg_oN87xByk2NKy8v+9LLPjP-nLYw@mail.gmail.com>
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

On 2023-05-30 14:11:06, Dmitry Baryshkov wrote:
> On Tue, 30 May 2023 at 11:27, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2023-05-30 01:39:10, Dmitry Baryshkov wrote:
> > > On 30/05/2023 01:37, Marijn Suijten wrote:
> > > > On 2023-05-30 01:18:40, Dmitry Baryshkov wrote:
> > > > <snip>
> > > >>>>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
> > > >>>>>>> +    if (ret < 0) {
> > > >>>>>>> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
> > > >>>>>>> +        return ret;
> > > >>>>>>> +    }
> > > >>>>>>
> > > >>>>>> My usual question: should the mipi_dsi_dcs_exit_sleep_mode() / mipi_dsi_dcs_set_display_on() be moved from prepare() to enable() part?
> > > >>>>>
> > > >>>>>
> > > >>>>> No, prepare is called before the video stream is started and when display is still in LPM mode and the mode hasn't been set.
> > > >>>>>
> > > >>>>
> > > >>>> Yes, that's my point. Shouldn't we enable the panel _after_ starting the stream?
> > > >>>
> > > >>> I have never investigated what it takes to split these functions, but
> > > >>> some of these panels do show some corruption at startup which may be
> > > >>> circumvented by powering the panel on after starting the video stream?
> > > >>>
> > > >>> I'm just not sure where to make the split: downstream does describe a
> > > >>> qcom,mdss-dsi-on-command and qcom,mdss-dsi-post-panel-on-command, where
> > > >>> the latter only contains set_display_on() (not exit_sleep_mode()).
> > > >>> It is documented like:
> > > >>>
> > > >>>       same as "qcom,mdss-dsi-on-command" except commands are sent after
> > > >>>       displaying an image."
> > > >>>
> > > >>> So this seems like the right way to split them up, I'll test this out on
> > > >>> all submitted panel drivers.
> > > >>
> > > >> Interesting enough, Neil suggested that sending all the commands during
> > > >> pre_enable() is the correct sequence (especially for VIDEO mode panels),
> > > >> since not all DSI hosts can send commands after switching to the VIDEO mode.
> > > >
> > > > Note that all these panels and Driver-ICs are command-mode, and/or
> > > > programmed to run in command-mode, so there shouldn't be any notion of a
> > > > VIDEO stream (any command-mode frame is just an "arbitrary command" as
> > > > far as I understood).
> > >
> > > Yes, from the data stream point of view. I was talking about the DSI
> > > host being able to send arbitrary commands or not after enabling the
> > > video/cmd stream.
> >
> > Is this a known limitation of SM8250 then?  Or is the brightness_set
> > issue more likely a "problem" with the panel that the downstream kernel
> > is "somehow" working around or aware of, and I just haven't found
> > how/where it deals with that?
> > (Alternatively we could be "doing it wrong" for other panels but it
> >  turns out to be working anyway)
> 
> Please excuse me for not being explicit enough. Qualcomm hardware
> doesn't have this problem. Thus I was completely unaware of it before
> talking to Neil.
> So, our hardware works in most of the cases.

Also excuse me for mocking the hardware here; it seems quite illogical
for it to not work on this specific device which is more likely a
failure in porting the panel DT to the driver than related to this
specific SoC. There's probably one of the hundred-or-so DT params
responsible for triggering a setting, delay, or other magic sequence
that gets the brightness toggle working.

- Marijn
