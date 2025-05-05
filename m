Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1DAA95E9
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 16:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8733A10E3FE;
	Mon,  5 May 2025 14:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Omd279pK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02D10E0EC;
 Mon,  5 May 2025 14:32:16 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so2880927f8f.3; 
 Mon, 05 May 2025 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746455535; x=1747060335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axcTletN3onFH9TdiUcWOvMByt/CipEaCtPt5X+peyA=;
 b=Omd279pKHofeVX0EWFqPbaew9DHH3T0eVgAI2Hu3dQNiBSJuo2BDdONhrc45759kYv
 EoOf3FZ090wQTk884ZC0zjrQMpnrQ9BGT4u6K9TBz5nOcRaXl209Roni8xBxiswTrRQR
 npHeKCfCcXzwo/KwjRso7MvLdvxGb0PPIr8U13ly6Ii3lF6pPsRLKrufAy4LpJ8YAeqc
 aESF3JkQWArDQ7e8y9tLwdTxpLAsYwQC8iAxXMekfEZXAveOLUt4oLflMWn2xSEwu3YX
 GqGYShvtGsb31poCGNU5tqz/krO+YEczrVQ3Zu6Maq4vU6Lbpd7NGysnMUxpQxkhCC4j
 aSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746455535; x=1747060335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axcTletN3onFH9TdiUcWOvMByt/CipEaCtPt5X+peyA=;
 b=K6SyZk+DWMot7FmthkjAacojpTa0V+DeFu9FnS1s4i+UOEr0PTCVctxAVX3lQOJP9g
 FkdU657hAUnj8P9p+XebbxRakUB9m7/9h4EOFkR6+bSIMjtaINzPs15D7a525OIdVG9v
 uWwqQvtuSRxC0wYLvIHGUuuE+L0LlioebPk1S9HRE3j/B1Qv7TNvRcbI3dqKoDhacbp0
 id/ZRw8R+loMZoxzP9kSGoSbgaBOFi4M7yZfoyFZBOQHjkdrdVFWiOMKZYUJggvTPZcY
 84RpYIBxoxlWsY9yPRl/9dqIedF9hYgGnOlvdakV2CMew3C1uEu+iD1AkZgz6Mj5GN5k
 j9SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDJOT7v5FiwLExeDRhO01LB+cdq4lDk6jUxuYNaxz+73bUaI2X6/DYr7+t/6SMFQK8IREkVi724OHn@lists.freedesktop.org,
 AJvYcCVmEZj2sFuUggwnA1N+jHJztsdtLprWWPD2dXsMStzdz8nwi8dryFXugqxhGsZh01A3dR+KjECVSe0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdGHd9EqVlUSpE7eqaEG6cGi5Hmr1LVEd88/4yNlLx/qxvChUt
 xJqiFFaRUjIiwfo7Vls2+8tFuhqJkbxuB5rJE5q4LEvBYXdmGXFVJSm4iK3CuHmbfyGS0OyqJo4
 9G+D/PchJ+pYr48G8UkVW1+ENiw==
X-Gm-Gg: ASbGncuPwqeUGI5SqkruM5AeNsTtEV531GCdxx0R6JcSP+s1EBOnToBKlcNalrNbhIY
 9sJEYFK5iYnIEs6w6m/cQqlFat4LCnybm9Jb+HOGh1yVtLsU1H+60OBV4CUncfzKvtOaLKpJsHb
 7GG6s8bFLW1AxMzXpcH38wsWxC8nId8g0j
X-Google-Smtp-Source: AGHT+IEpLZzfABGBl4SzwHv7LpPGQr9xaqbDwCAbziwz3FEckNzGnRmgLvBtOt8Yv9nmz0pQSNBt1UwTH0+tcPdCs7M=
X-Received: by 2002:a5d:5f86:0:b0:39e:e499:3efd with SMTP id
 ffacd0b85a97d-3a09cf1e11fmr5803552f8f.42.1746455534305; Mon, 05 May 2025
 07:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-5-alex.vinarskis@gmail.com>
 <6495e342-512f-469f-9d66-bb9f47fb551d@quicinc.com>
 <CAMcHhXqFE6-tnT0m9=3N1wSaTyEPMFA0zTfVqwJmgqz60tBAoQ@mail.gmail.com>
 <d1eb55ae-92e5-4a34-af46-5d076512a06b@quicinc.com>
 <CAMcHhXrJuADN=kN7p-YMy8vEqCk+JVfQ38S=gEW+JtDTe7mivQ@mail.gmail.com>
In-Reply-To: <CAMcHhXrJuADN=kN7p-YMy8vEqCk+JVfQ38S=gEW+JtDTe7mivQ@mail.gmail.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 5 May 2025 16:32:01 +0200
X-Gm-Features: ATxdqUHfTrWfMSUEraJyO7Pn1MQ5waVcvCnuT5JxVgfSh_D8V6xLHLXqSXugNJw
Message-ID: <CAMcHhXoH7GuaMyL3v4E3dwQE3kyrAgQtqNL=fk0tRNO=wjzvHQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com,
 abel.vesa@linaro.org, 
 johan@kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 May 2025 at 00:06, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> On Sun, 4 May 2025 at 05:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wr=
ote:
> >
> > Hi Alex
> >
> > Thanks for the response.
> >
> > My updates below. I also had one question for Abel below.
> >
> > Thanks
> >
> > Abhinav
> >
> > On 5/1/2025 8:56 AM, Aleksandrs Vinarskis wrote:
> > > On Thu, 1 May 2025 at 04:11, Abhinav Kumar <quic_abhinavk@quicinc.com=
> wrote:
> > >>
> > >>
> > >>
> > >> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > >>> DisplayPort requires per-segment link training when LTTPR are switc=
hed
> > >>> to non-transparent mode, starting with LTTPR closest to the source.
> > >>> Only when each segment is trained individually, source can link tra=
in
> > >>> to sink.
> > >>>
> > >>> Implement per-segment link traning when LTTPR(s) are detected, to
> > >>> support external docking stations. On higher level, changes are:
> > >>>
> > >>> * Pass phy being trained down to all required helpers
> > >>> * Run CR, EQ link training per phy
> > >>> * Set voltage swing, pre-emphasis levels per phy
> > >>>
> > >>> This ensures successful link training both when connected directly =
to
> > >>> the monitor (single LTTPR onboard most X1E laptops) and via the doc=
king
> > >>> station (at least two LTTPRs).
> > >>>
> > >>> Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > >>>
> > >>
> > >> Thanks for the patch to improve and add support for link training in
> > >> non-transparent mode.
> > >>
> > >> Some questions below as the DP 2.1a spec documentation is not very c=
lear
> > >> about segmented link training as you noted in the cover letter, so I=
 am
> > >> also only reviewing i915 as reference here.
> > >>
> > >>
> > >>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > >>> Tested-by: Rob Clark <robdclark@gmail.com>
> > >>> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> > >>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > >>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >>> ---
> > >>>    drivers/gpu/drm/msm/dp/dp_ctrl.c | 126 ++++++++++++++++++++++---=
------
> > >>>    1 file changed, 89 insertions(+), 37 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm=
/dp/dp_ctrl.c
> > >>> index d8633a596f8d..35b28c2fcd64 100644
> > >>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > >>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > >>> @@ -1034,10 +1034,12 @@ static int msm_dp_ctrl_set_vx_px(struct msm=
_dp_ctrl_private *ctrl,
> > >>>        return 0;
> > >>>    }
> > >>>
> > >>> -static int msm_dp_ctrl_update_vx_px(struct msm_dp_ctrl_private *ct=
rl)
> > >>> +static int msm_dp_ctrl_update_phy_vx_px(struct msm_dp_ctrl_private=
 *ctrl,
> > >>> +                                     enum drm_dp_phy dp_phy)
> > >>>    {
> > >>>        struct msm_dp_link *link =3D ctrl->link;
> > >>> -     int ret =3D 0, lane, lane_cnt;
> > >>> +     int lane, lane_cnt, reg;
> > >>> +     int ret =3D 0;
> > >>>        u8 buf[4];
> > >>>        u32 max_level_reached =3D 0;
> > >>>        u32 voltage_swing_level =3D link->phy_params.v_level;
> > >>> @@ -1075,8 +1077,13 @@ static int msm_dp_ctrl_update_vx_px(struct m=
sm_dp_ctrl_private *ctrl)
> > >>>
> > >>>        drm_dbg_dp(ctrl->drm_dev, "sink: p|v=3D0x%x\n",
> > >>>                        voltage_swing_level | pre_emphasis_level);
> > >>> -     ret =3D drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
> > >>> -                                     buf, lane_cnt);
> > >>> +
> > >>> +     if (dp_phy =3D=3D DP_PHY_DPRX)
> > >>> +             reg =3D DP_TRAINING_LANE0_SET;
> > >>> +     else
> > >>> +             reg =3D DP_TRAINING_LANE0_SET_PHY_REPEATER(dp_phy);
> > >>> +
> > >>> +     ret =3D drm_dp_dpcd_write(ctrl->aux, reg, buf, lane_cnt);
> > >>
> > >> For the max voltage and swing levels, it seems like we need to use t=
he
> > >> source (DPTX) or the DPRX immediately upstream of the RX we are tryi=
ng
> > >> to train. i915 achieves it with below:
> > >>
> > >>           /*
> > >>            * Get voltage_max from the DPTX_PHY (source or LTTPR) ups=
tream
> > >> from
> > >>            * the DPRX_PHY we train.
> > >>            */
> > >>           if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy)=
)
> > >>                   voltage_max =3D intel_dp->voltage_max(intel_dp, cr=
tc_state);
> > >>           else
> > >>                   voltage_max =3D intel_dp_lttpr_voltage_max(intel_d=
p,
> > >> dp_phy + 1);
> > >>
> >
> > Before I update on the below set of questions from Alex, let me clarify
> > one point from Abel.
> >
> > Hi Abel
> >
> > Apologies to ask this late, but as per the earlier discussions we had
> > internally, I thought we wanted to set the LTTPR to transparent mode to
> > avoid the issues. The per-segment link training becomes a requirement i=
f
> > we use non-transparent mode iiuc.
> >
> > In the description of the PHY_REPEATER_MODE DPCD register, it states
> > like below:
> >
> > "A DPTX operating with 8b/10b Link Layer (MAIN_LINK_CHANNEL_CODING_SET
> > register (DPCD Address 00108h) is programmed to 01h) may configure LTTP=
Rs
> > to either Transparent (default) or Non-transparent mode.
> > A DPTX that establishes the DP link with 128b/132b channel coding shall
> > write
> > 02h to the MAIN_LINK_CHANNEL_CODING_SET register and configure LTTPRs
> > to Non-transparent mode."
> >
> > As per the msm dp code, we are using 8b/10b encoding, like below
> >
> > static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
> >                          int *training_step)
> > {
> >          int ret =3D 0;
> >          const u8 *dpcd =3D ctrl->panel->dpcd;
> >          u8 encoding[] =3D { 0, DP_SET_ANSI_8B10B };
> >
> > So can you pls elaborate why we set the PHY_REPEATER_MODE to
> > non-transparent mode because drm_dp_lttpr_init() will set the LTTPR to
> > non-transparent mode.
> >
> > The second part of the section is what was described in the commit text
> > of the 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling") but
> >
> > "Before performing link training with LTTPR(s), the DPTX may place the
> > LTTPR(s) in
> > Non-transparent mode by first writing 55h to the PHY_REPEATER_MODE
> > register, and then
> > writing AAh. This operation does not need to be performed on subsequent
> > link training actions
> > unless a downstream device unplug event is detected."
> >
> > So just wanted to understand this better that was there any requirement
> > to put it to non-transparent mode other than the section of the spec
> > highlighted above? Because above lines are only suggesting that if we
> > want to put the LTTPR to non-transparent mode, how to do it but not to
> > always do it. Please let me know your comments.
> >
> > I shall also check internally on this to close this.
> >
> >
> > Hi Alex
> >
> > >>
> > >> But I do not see (unless I missed) how this patch takes care of this
> > >> requirement.
> > >>
> > >> Same holds true for preemph too
> > >
> > > Thanks for you review,
> > >
> > > This is a very good point. You are right, in the present state it doe=
s
> > > not. Intel's driver is verifying whether LTTPRs supports
> > > DP_TRAIN_LEVEL_3 or only DP_TRAIN_LEVEL_2, while my current change
> > > follows msm-dp's default which was recently set to DP_TRAIN_LEVEL_3
> > > [1]. I came to conclusion that in particular case it was not required
> > > to verify that LTTPR indeed supports training level 3, but do not
> > > remember the details as its been a few months... should've document i=
t
> > > :)
> > >
> >
> > > As I recall, from one of the DP specs onward (has to be 1.4a then,
> > > since LTTPR was initially introduced in DP 1.3, but register for phy
> > > capabilities only added in 1.4a [2]) it mandates training level 3
> > > support for LTTPRs, so the assumption would've be correct in that
> > > case. Is this something you could verify from the official
> > > documentation? Unfortunately I do not have sources to back this
> > > statement, so it may be incorrect...
> > >
> >
> > I went through DP spec 1.4(a), DP 2.0 and DP 2.1(a). This is what is
> > mentioned below:
> >
> >
> > "LTTPR shall support all required voltage swing and pre-emphasis
> > combinations defined
> > in Table 3-2. The LTTPR shall reflect its support of optional Voltage
> > Swing Level 3
> > and Pre-emphasis Level 3 in the VOLTAGE_SWING_LEVEL_3_SUPPORTED and
> > VOLTAGE_SWING_LEVEL_3_SUPPORTED bits, respectively, in the
> > TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s) (e.g., DPCD
> > Address F0021h for LTTPR1, bits 0 and 1, respectively)."
> >
> >  From this paragraph, it means that LTTPR support for levels 0/1/2 can
> > be assumed and level 3 is optional. Whether or not level 3 is supported
> > comes from the TRANSMITTER_CAPABILITY_PHY_REPEATERx register(s).
> >
> > This aligns with i915 implementation.
> >
> >
> > Now, right after this, there is another paragraph in the spec:
> >
> > "If the DPTX sets the voltage swing or pre-emphasis to a level that the
> > LTTPR does not support,
> > the LTTPR shall set its transmitter levels as close as possible to thos=
e
> > requested by the DPTX.
> > Although the LTTPR=E2=80=99s level choosing is implementation-specific,=
 the
> > levels chosen shall
> > comply with Section 3.5.4."
>
> Hi Abhinav,
>
> Could you please provide the exact section number and DP spec version
> for this paragraph? For reference in the commit message, see below.
>
> >
> > This tells us that even if we try to do a level3 and the LTTPR does not
> > support it, it will use the one closest to this.
> >
> > So overall, even though i915's implementation is the accurate one, the
> > DP spec does mention that the LTTPR can adjust. I just hope all LTTPRs
> > can adjust to this. Hopefully this clarifies the requirements spec-wise=
.
>
> Thanks for this clarification, this is extremely useful. A bit sad
> that DP spec is only available to VESA members.
> So my assumption was indeed incorrect. This also explains why eg.
> AMD's driver works, nice.
>
> >
> > Hence I am okay with this change as such as multiple folks including us
> > have given a Tested-by but I would like this to be documented in the
> > commit text so that full context is preserved. The only concern I have
> > is I hope that the level to which the LTTPR adjusts will be correct as
> > that again is "implementation specific".
>
> I started implementing i915's approach meanwhile, to see the
> difference in behaviour. POC fixup for patch 3,4 of this series can be
> found in [1]. Discovered something interesting:
> * Dell WD19TB docking station's LTTPR reports support of training level 3
> * PS8833 retimer in Asus Zenbook A14 reports support of training level 3
> * PS8830 retimer in Dell XPS 9345 claims to _not_ report support
> training level 3. This is the case on two different machines with BIOS
> 1.9.0 (PS8830 payload version 5.3.0.14) and BIOS 2.5.0 (PS8830 payload
> version 9.3.0.01).
>
> This leads to interesting test results:
> * Asus Zenbook A14 (PS8833, supports train level 3) with direct
> monitor connection via Type-C works, both in current version of msm-dp
> (aka AMD's approach) and with additional patches I linked above (aka
> i915's approach)
> * Dell XPS 9345 (PS8830, claims to not support train level 3) with
> Dell WD19TB (supports train level 3) works, both in current version of
> msm-dp and with additional patches I linked above. In this
> combination, PS8830->WD19TB segment training succeeds with vs=3D2, pe=3D0
> already.
> * Dell XPS 9345 (PS8830, claims to not support train level 3) with
> direct monitor connection via Type-C works with current version of
> msm-dp, but does _not_ work with additional patches I linked above.
> For PS8830->Monitor segment training, after reaching vs=3D2,pe=3D0 and
> being stopped from going higher (due to PS8830 claiming it cannot do
> train level 3), link training fails. With current msm-dp state
> however, the same PS8830->Monitor segment training succeeds with
> vs=3D2,pe=3D1. This is contrary to retimer reporting it does not support
> train level 3 - it in fact does, and in case with 1m long Type-C to DP
> cable it only works with train level 3. Bug in P8830's LTTPR
> implementation? :)
>
> Combining both patches linked above as well as debug patch to force
> max train level to 3 like it was before [2], here are detailed logs:
> Asus Zenbook A14, BIOS version "UX3407QA.305":
> ```
> phy #1: params reset                                                 #
> training DPRX (phy1/PS8833)
> phy #1: max_v_level=3D3, max_p_level=3D3                    # DPTX source
> (X1E) supports train level 3
> phy #1: forcing max_v_level=3D3, max_p_level=3D3
> phy #1: v_level=3D0, p_level=3D0                                      #
> passes with vs=3D0,ps=3D0
> phy #1: max_v_level=3D3, max_p_level=3D3
> phy #0: params reset
> # training DPRX (phy0/Monitor)
> phy #0: max_v_level=3D3, max_p_level=3D3                     # DPTX sourc=
e
> (phy1/PS8833) supports train level 3
> phy #0: forcing max_v_level=3D3, max_p_level=3D3
> phy #0: v_level=3D0, p_level=3D0
> phy #0: max_v_level=3D3, max_p_level=3D3
> phy #X: v_level=3D2, p_level=3D0
> phy #0: v_level=3D2, p_level=3D0
> phy #0: max_v_level=3D3, max_p_level=3D3
> phy #X: v_level=3D2, p_level=3D1
> phy #0: v_level=3D2, p_level=3D1                                       #
> training passes with vs=3D2,ps=3D1
> phy #0: max_v_level=3D3, max_p_level=3D3
> ```
>
> Dell XPS 9345, BIOS version "2.5.0", PS8830 payload version "9.3.0.01":
> ```
> phy #1: params reset                                                 #
> training DPRX (phy1/PS8830)
> phy #1: max_v_level=3D3, max_p_level=3D3                    # DPTX source
> (X1E) supports train level 3
> phy #1: forcing max_v_level=3D3, max_p_level=3D3
> phy #1: v_level=3D0, p_level=3D0                                     #
> passes with vs=3D0,ps=3D0
> phy #1: max_v_level=3D3, max_p_level=3D3
> phy #0: params reset                                                 #
> training DPRX (phy0/Monitor)
> phy #0: max_v_level=3D2, max_p_level=3D2                    # DPTX source
> (phy1/PS8830) claims to not support train level 3
> phy #0: forcing max_v_level=3D3, max_p_level=3D3        # Ignore
> advertised levels, force to max=3D3, otherwise training fails
> phy #0: v_level=3D0, p_level=3D0
> phy #0: max_v_level=3D3, max_p_level=3D3
> phy #X: v_level=3D2, p_level=3D0
> phy #0: v_level=3D2, p_level=3D0
> phy #0: max_v_level=3D3, max_p_level=3D3
> phy #X: v_level=3D2, p_level=3D1
> phy #0: v_level=3D2, p_level=3D1                                     #
> training passes with vs=3D2,ps=3D1 (aka train level 3)
> phy #0: max_v_level=3D3, max_p_level=3D3
> ```
>
> While, as you correctly mentioned, i915's implementation would be a
> more accurate one, and I can respin to v5 with [1] applied to patches
> 3,4 of this series respectively, it appears that at least on some X1E
> based devices with PS8830 that would break DP output support at least
> in some cases. The fact that the same device with the same monitor
> works on Windows suggests that Windows driver also uses AMD's approach
> of just assuming LTTPR can do train level 3, without verifying it, and
> letting LTTPR figure the rest. I have asked other community members to
> cross-check these findings on another X1E platform with PS8830
> retimers. With this in mind, I am very glad to hear that you are okay
> with this change as such, as it now appears that a more accurate
> implementation would've caused additional issues.

Cross-confirmed on X1E DevKit with PS8830, and HP Omnibook X14 with
PS8830 - in both cases PS8830 reports max train level as 2 instead of
3. In the case of DevKit, training of phy0 (monitor) was already
passing with vs=3D2,pe=3D0 (source phy1/ps8830). In case of HP Omnibook
with some dongles attached, in the worst case training of phy0
(monitor) passed with vs=3D3,pe=3D0 (source phy1/ps8830), thus confirming
that PS8830 indeed supports training level 3, but reports otherwise in
its capabilities.

Alex

>
> >
> > I would still like to hear from Abel though about whether setting to
> > non-transparent mode was needed in the first place.
>
> Fwiw, without Abel's initial change DP output didn't work on X1E
> platform at all, neither direct monitor connection nor docking
> station. Not sure if that is because PS883x found in most X1E/X1P
> laptops do not work in transparent mode at all (even though they
> should've), or laptop's firmware would leave it in some weird state,
> and perhaps re-enabling transparent mode would've also fixed it.
>
> Lets wait for Abel's answer and the rest of this conversation to be
> resolved, and as I see it the next step would be for me to respin to
> v5 current change as is, in order to update the commit message of 4th
> patch to reflect the new findings and reference DP spec and section,
> as per the first comment of this reply.
>
> Thanks for your help,
> Alex
>
> [1] https://github.com/alexVinarskis/linux-x1e80100-dell-tributo/tree/msm=
/dp-lttpr-segment-lt
> [2] https://github.com/alexVinarskis/linux-x1e80100-dell-tributo/tree/msm=
/dp-lttpr-segment-lt-debug
>
>
> >
> > Thanks
> >
> > Abhinav
> > > Now reviewing it again, my reasoning may to be wrong, as source
> > > supporting training level 3 and DP 1.4a does not necessarily imply
> > > that external LTTPR does, nor that external LTTPR is DP 1.4a
> > > compliant.
> > >
> > > fwiw, after quickly inspecting AMD's driver it seems it also assumes
> > > DP_TRAIN_LEVEL_3 support for LTTPR and does not explicitly verify it.
> > > Similarly to proposed msm solution, iteration over phys [3] calls
> > > `perform_8b_10b_clock_recovery_sequence` [4] which is generic for bot=
h
> > > DPRX and LTTPR(s). This eventually calls `dp_is_max_vs_reached` [5] t=
o
> > > check against hardcoded value of 3 [6]. Generally, it appears no othe=
r
> > > driver use `
> > > drm_dp_lttpr_voltage_swing_level_3_supported` or
> > > `drm_dp_lttpr_pre_emphasis_level_3_supported` helpers introduced by
> > > Intel, nor directly use register 0xf0021.
> > >
> > > Alternatively, if we cannot verify that LTTPR is expected to always
> > > support DP_TRAIN_LEVEL_3, I change this patch to match Intel's exampl=
e
> > > of retrieving max vs and pe per phy. As it appears to be a bit time
> > > sensitive, can have it done and re-tested on all available hardware b=
y
> > > Monday. Please let me know your thoughts.
> > >
> > > Thanks,
> > > Alex
> > >
> > > [1] https://lore.kernel.org/all/20240203-dp-swing-3-v1-1-6545e1706196=
@linaro.org/
> > > [2] https://patchwork.freedesktop.org/patch/329863/
> > > [3] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/=
amd/display/dc/link/protocols/link_dp_training_8b_10b.c#L396-L430
> > > [4] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/=
amd/display/dc/link/protocols/link_dp_training_8b_10b.c#L176-L294
> > > [5] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/=
amd/display/dc/link/protocols/link_dp_training.c#L462-L475
> > > [6] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/=
amd/display/dc/dc_dp_types.h#L80
> > >
> > >>
> > >>           if (intel_dp_phy_is_downstream_of_source(intel_dp, dp_phy)=
)
> > >>                   preemph_max =3D intel_dp->preemph_max(intel_dp);
> > >>           else
> > >>                   preemph_max =3D intel_dp_lttpr_preemph_max(intel_d=
p,
> > >> dp_phy + 1);
> > >>
> > >>           drm_WARN_ON_ONCE(display->drm,
> > >>                            preemph_max !=3D DP_TRAIN_PRE_EMPH_LEVEL_=
2 &&
> > >>                            preemph_max !=3D DP_TRAIN_PRE_EMPH_LEVEL_=
3);
> > >>
> > >>
> > >>>        if (ret =3D=3D lane_cnt)
> > >>>                ret =3D 0;
> > >>>
> > >>> @@ -1084,9 +1091,10 @@ static int msm_dp_ctrl_update_vx_px(struct m=
sm_dp_ctrl_private *ctrl)
> > >>>    }
> > >>>
> > >>>    static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_pri=
vate *ctrl,
> > >>> -             u8 pattern)
> > >>> +             u8 pattern, enum drm_dp_phy dp_phy)
> > >>>    {
> > >>>        u8 buf;
> > >>> +     int reg;
> > >>>        int ret =3D 0;
> > >>>
> > >>>        drm_dbg_dp(ctrl->drm_dev, "sink: pattern=3D%x\n", pattern);
> > >>> @@ -1096,7 +1104,12 @@ static bool msm_dp_ctrl_train_pattern_set(st=
ruct msm_dp_ctrl_private *ctrl,
> > >>>        if (pattern && pattern !=3D DP_TRAINING_PATTERN_4)
> > >>>                buf |=3D DP_LINK_SCRAMBLING_DISABLE;
> > >>>
> > >>> -     ret =3D drm_dp_dpcd_writeb(ctrl->aux, DP_TRAINING_PATTERN_SET=
, buf);
> > >>> +     if (dp_phy =3D=3D DP_PHY_DPRX)
> > >>> +             reg =3D DP_TRAINING_PATTERN_SET;
> > >>> +     else
> > >>> +             reg =3D DP_TRAINING_PATTERN_SET_PHY_REPEATER(dp_phy);
> > >>> +
> > >>> +     ret =3D drm_dp_dpcd_writeb(ctrl->aux, reg, buf);
> > >>>        return ret =3D=3D 1;
> > >>>    }
> > >>>
> > >>> @@ -1115,12 +1128,16 @@ static int msm_dp_ctrl_read_link_status(str=
uct msm_dp_ctrl_private *ctrl,
> > >>>    }
> > >>>
> > >>>    static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *=
ctrl,
> > >>> -                     int *training_step)
> > >>> +                     int *training_step, enum drm_dp_phy dp_phy)
> > >>>    {
> > >>> +     int delay_us;
> > >>>        int tries, old_v_level, ret =3D 0;
> > >>>        u8 link_status[DP_LINK_STATUS_SIZE];
> > >>>        int const maximum_retries =3D 4;
> > >>>
> > >>> +     delay_us =3D drm_dp_read_clock_recovery_delay(ctrl->aux,
> > >>> +                                                 ctrl->panel->dpcd=
, dp_phy, false);
> > >>> +
> > >>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> > >>>
> > >>>        *training_step =3D DP_TRAINING_1;
> > >>> @@ -1129,18 +1146,19 @@ static int msm_dp_ctrl_link_train_1(struct =
msm_dp_ctrl_private *ctrl,
> > >>>        if (ret)
> > >>>                return ret;
> > >>>        msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
> > >>> -             DP_LINK_SCRAMBLING_DISABLE);
> > >>> +             DP_LINK_SCRAMBLING_DISABLE, dp_phy);
> > >>>
> > >>> -     ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> > >>> +     msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> > >>> +     ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
> > >>>        if (ret)
> > >>>                return ret;
> > >>>
> > >>>        tries =3D 0;
> > >>>        old_v_level =3D ctrl->link->phy_params.v_level;
> > >>>        for (tries =3D 0; tries < maximum_retries; tries++) {
> > >>> -             drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctr=
l->panel->dpcd);
> > >>> +             fsleep(delay_us);
> > >>>
> > >>> -             ret =3D msm_dp_ctrl_read_link_status(ctrl, link_statu=
s);
> > >>> +             ret =3D drm_dp_dpcd_read_phy_link_status(ctrl->aux, d=
p_phy, link_status);
> > >>>                if (ret)
> > >>>                        return ret;
> > >>>
> > >>> @@ -1161,7 +1179,7 @@ static int msm_dp_ctrl_link_train_1(struct ms=
m_dp_ctrl_private *ctrl,
> > >>>                }
> > >>>
> > >>>                msm_dp_link_adjust_levels(ctrl->link, link_status);
> > >>> -             ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> > >>> +             ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
> > >>>                if (ret)
> > >>>                        return ret;
> > >>>        }
> > >>> @@ -1213,21 +1231,31 @@ static int msm_dp_ctrl_link_lane_down_shift=
(struct msm_dp_ctrl_private *ctrl)
> > >>>        return 0;
> > >>>    }
> > >>>
> > >>> -static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_=
private *ctrl)
> > >>> +static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_=
private *ctrl,
> > >>> +                                            enum drm_dp_phy dp_phy=
)
> > >>>    {
> > >>> -     msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISAB=
LE);
> > >>> -     drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dp=
cd);
> > >>> +     int delay_us;
> > >>> +
> > >>> +     msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISAB=
LE, dp_phy);
> > >>> +
> > >>> +     delay_us =3D drm_dp_read_channel_eq_delay(ctrl->aux,
> > >>> +                                             ctrl->panel->dpcd, dp=
_phy, false);
> > >>> +     fsleep(delay_us);
> > >>>    }
> > >>>
> > >>>    static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *=
ctrl,
> > >>> -                     int *training_step)
> > >>> +                     int *training_step, enum drm_dp_phy dp_phy)
> > >>>    {
> > >>> +     int delay_us;
> > >>>        int tries =3D 0, ret =3D 0;
> > >>>        u8 pattern;
> > >>>        u32 state_ctrl_bit;
> > >>>        int const maximum_retries =3D 5;
> > >>>        u8 link_status[DP_LINK_STATUS_SIZE];
> > >>>
> > >>> +     delay_us =3D drm_dp_read_channel_eq_delay(ctrl->aux,
> > >>> +                                             ctrl->panel->dpcd, dp=
_phy, false);
> > >>> +
> > >>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> > >>>
> > >>>        *training_step =3D DP_TRAINING_2;
> > >>> @@ -1247,12 +1275,12 @@ static int msm_dp_ctrl_link_train_2(struct =
msm_dp_ctrl_private *ctrl,
> > >>>        if (ret)
> > >>>                return ret;
> > >>>
> > >>> -     msm_dp_ctrl_train_pattern_set(ctrl, pattern);
> > >>> +     msm_dp_ctrl_train_pattern_set(ctrl, pattern, dp_phy);
> > >>>
> > >>>        for (tries =3D 0; tries <=3D maximum_retries; tries++) {
> > >>> -             drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->p=
anel->dpcd);
> > >>> +             fsleep(delay_us);
> > >>>
> > >>> -             ret =3D msm_dp_ctrl_read_link_status(ctrl, link_statu=
s);
> > >>> +             ret =3D drm_dp_dpcd_read_phy_link_status(ctrl->aux, d=
p_phy, link_status);
> > >>>                if (ret)
> > >>>                        return ret;
> > >>>
> > >>> @@ -1262,7 +1290,7 @@ static int msm_dp_ctrl_link_train_2(struct ms=
m_dp_ctrl_private *ctrl,
> > >>>                }
> > >>>
> > >>>                msm_dp_link_adjust_levels(ctrl->link, link_status);
> > >>> -             ret =3D msm_dp_ctrl_update_vx_px(ctrl);
> > >>> +             ret =3D msm_dp_ctrl_update_phy_vx_px(ctrl, dp_phy);
> > >>>                if (ret)
> > >>>                        return ret;
> > >>>
> > >>> @@ -1271,9 +1299,32 @@ static int msm_dp_ctrl_link_train_2(struct m=
sm_dp_ctrl_private *ctrl,
> > >>>        return -ETIMEDOUT;
> > >>>    }
> > >>>
> > >>> +static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *=
ctrl,
> > >>> +                                   int *training_step, enum drm_dp=
_phy dp_phy)
> > >>> +{
> > >>> +     int ret;
> > >>> +
> > >>> +     ret =3D msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy)=
;
> > >>> +     if (ret) {
> > >>> +             DRM_ERROR("link training #1 on phy %d failed. ret=3D%=
d\n", dp_phy, ret);
> > >>> +             return ret;
> > >>> +     }
> > >>> +     drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d success=
ful\n", dp_phy);
> > >>> +
> > >>> +     ret =3D msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy)=
;
> > >>> +     if (ret) {
> > >>> +             DRM_ERROR("link training #2 on phy %d failed. ret=3D%=
d\n", dp_phy, ret);
> > >>> +             return ret;
> > >>> +     }
> > >>> +     drm_dbg_dp(ctrl->drm_dev, "link training #2 on phy %d success=
ful\n", dp_phy);
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>>    static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ct=
rl,
> > >>>                        int *training_step)
> > >>>    {
> > >>> +     int i;
> > >>>        int ret =3D 0;
> > >>>        const u8 *dpcd =3D ctrl->panel->dpcd;
> > >>>        u8 encoding[] =3D { 0, DP_SET_ANSI_8B10B };
> > >>> @@ -1286,8 +1337,6 @@ static int msm_dp_ctrl_link_train(struct msm_=
dp_ctrl_private *ctrl,
> > >>>        link_info.rate =3D ctrl->link->link_params.rate;
> > >>>        link_info.capabilities =3D DP_LINK_CAP_ENHANCED_FRAMING;
> > >>>
> > >>> -     msm_dp_link_reset_phy_params_vx_px(ctrl->link);
> > >>> -
> > >>>        msm_dp_aux_link_configure(ctrl->aux, &link_info);
> > >>>
> > >>>        if (drm_dp_max_downspread(dpcd))
> > >>> @@ -1302,24 +1351,27 @@ static int msm_dp_ctrl_link_train(struct ms=
m_dp_ctrl_private *ctrl,
> > >>>                                &assr, 1);
> > >>>        }
> > >>>
> > >>> -     ret =3D msm_dp_ctrl_link_train_1(ctrl, training_step);
> > >>> +     for (i =3D ctrl->link->lttpr_count - 1; i >=3D 0; i--) {
> > >>> +             enum drm_dp_phy dp_phy =3D DP_PHY_LTTPR(i);
> > >>> +
> > >>> +             ret =3D msm_dp_ctrl_link_train_1_2(ctrl, training_ste=
p, dp_phy);
> > >>> +             msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
> > >>> +
> > >>> +             if (ret)
> > >>> +                     break;
> > >>> +     }
> > >>> +
> > >>>        if (ret) {
> > >>> -             DRM_ERROR("link training #1 failed. ret=3D%d\n", ret)=
;
> > >>> +             DRM_ERROR("link training of LTTPR(s) failed. ret=3D%d=
\n", ret);
> > >>>                goto end;
> > >>>        }
> > >>>
> > >>> -     /* print success info as this is a result of user initiated a=
ction */
> > >>> -     drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
> > >>> -
> > >>> -     ret =3D msm_dp_ctrl_link_train_2(ctrl, training_step);
> > >>> +     ret =3D msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PH=
Y_DPRX);
> > >>>        if (ret) {
> > >>> -             DRM_ERROR("link training #2 failed. ret=3D%d\n", ret)=
;
> > >>> +             DRM_ERROR("link training on sink failed. ret=3D%d\n",=
 ret);
> > >>>                goto end;
> > >>>        }
> > >>>
> > >>> -     /* print success info as this is a result of user initiated a=
ction */
> > >>> -     drm_dbg_dp(ctrl->drm_dev, "link training #2 successful\n");
> > >>> -
> > >>>    end:
> > >>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
> > >>>
> > >>> @@ -1636,7 +1688,7 @@ static int msm_dp_ctrl_link_maintenance(struc=
t msm_dp_ctrl_private *ctrl)
> > >>>        if (ret)
> > >>>                goto end;
> > >>>
> > >>> -     msm_dp_ctrl_clear_training_pattern(ctrl);
> > >>> +     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
> > >>>
> > >>>        msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_=
SEND_VIDEO);
> > >>>
> > >>> @@ -1660,7 +1712,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern=
(struct msm_dp_ctrl_private *ctrl)
> > >>>                return false;
> > >>>        }
> > >>>        msm_dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_=
requested);
> > >>> -     msm_dp_ctrl_update_vx_px(ctrl);
> > >>> +     msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
> > >>>        msm_dp_link_send_test_response(ctrl->link);
> > >>>
> > >>>        pattern_sent =3D msm_dp_catalog_ctrl_read_phy_pattern(ctrl->=
catalog);
> > >>> @@ -1902,7 +1954,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *m=
sm_dp_ctrl)
> > >>>                        }
> > >>>
> > >>>                        /* stop link training before start re traini=
ng  */
> > >>> -                     msm_dp_ctrl_clear_training_pattern(ctrl);
> > >>> +                     msm_dp_ctrl_clear_training_pattern(ctrl, DP_P=
HY_DPRX);
> > >>>                }
> > >>>
> > >>>                rc =3D msm_dp_ctrl_reinitialize_mainlink(ctrl);
> > >>> @@ -1926,7 +1978,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *m=
sm_dp_ctrl)
> > >>>                 * link training failed
> > >>>                 * end txing train pattern here
> > >>>                 */
> > >>> -             msm_dp_ctrl_clear_training_pattern(ctrl);
> > >>> +             msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX)=
;
> > >>>
> > >>>                msm_dp_ctrl_deinitialize_mainlink(ctrl);
> > >>>                rc =3D -ECONNRESET;
> > >>> @@ -1997,7 +2049,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl =
*msm_dp_ctrl, bool force_link_train
> > >>>                msm_dp_ctrl_link_retrain(ctrl);
> > >>>
> > >>>        /* stop txing train pattern to end link training */
> > >>> -     msm_dp_ctrl_clear_training_pattern(ctrl);
> > >>> +     msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
> > >>>
> > >>>        /*
> > >>>         * Set up transfer unit values and set controller state to s=
end
> > >>
> >
