Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1540C78C163
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 11:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2EE10E0F8;
	Tue, 29 Aug 2023 09:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F8C10E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:27:00 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d77f97a0e72so4050985276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693301220; x=1693906020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rncOYQIuAQgqKpIg2DngBM8FjKlziU9kBU2dsVTOJSE=;
 b=JleJxYo/C5xQ9ZBH9omd3YHxbzjzlIQlHwdQEesUDZhAUqK2s0fwbyqAVSEaKrRPYp
 9YEc/AfKeQLbqvR1fns5bDThTHyuHUHARHAn9UVhMcugzY15E5hW1mFlOzVxjOtMIwsn
 PlQSP36rgi5/wOHPKbI3PCNkIFwM6jrYCuqLOOs8aNiBrcc98+Yvwt4PL3aE6nfmmZWa
 6nBC6ufPwQehhKA2yu8G7ZIDWSchRBzrkIEO7wAmqcGwlhXOI7bC2LTqS4VyaTj+ujQR
 Iiok3Ga9gwZb3T0naxelcblVouxa/zl9cZ9eIdNHut9eKh7sz2JjUeKEF6MYAARDFZub
 Prdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693301220; x=1693906020;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rncOYQIuAQgqKpIg2DngBM8FjKlziU9kBU2dsVTOJSE=;
 b=W+rifCbqAsXYKK/jm0itwJyhvzeSmMDuQ/7kCfPHpqgh9bw+H5QEmFuhLz8t0VmJxf
 IFZ1QkX1QmuV3bQ/u5Mk0mhXrB3tHAdDpDkx6wF1+J6PbfL1grrVC/3VqNIGcJhgJOrZ
 kfmmRoDJm4kzVLejWeWzpMM9z7yq4TDQbHPTUR9is70kvnNhHVW9Gv8LfDkT+1eDt/oa
 pZsT014JIUU9gebZIZ6Q87UJmW137pYh4YoxEx47H+oVEPizIT99u9doR4Ox0jU28/X0
 u2pnpja7jD1HYXrKGkg94/C0h6sJnKWZZG9W5nn6wvwPVMlGHJe9d0nkprtjkB8MsgIJ
 kSkw==
X-Gm-Message-State: AOJu0YwRb71G+8YoJaSUL5eDHArCytQ+PIdqJ2VmguXa3FOGcpl+wFA1
 iIJdm2GtAAjKSK5aKfklqdB9kq1qpCPw1iOhCtT5KQ==
X-Google-Smtp-Source: AGHT+IGOJIVja4WlJoTCC2WR4GPrb51KCysWjER66TzYL+i8U5IHtUpLou74scJTgL2/Uv1zLJctMibsPaRHMdIKAH0=
X-Received: by 2002:a25:5044:0:b0:d05:3d5b:b63 with SMTP id
 e65-20020a255044000000b00d053d5b0b63mr29312288ybb.25.1693301219725; Tue, 29
 Aug 2023 02:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
 <dde2774e-6f0b-21d0-e9c9-4a5bd1eac4e8@linaro.org>
 <2f9a9450-438b-257d-759c-22b273a7b35d@quicinc.com>
 <c183d823-81d4-6d7c-98d9-649fa4041262@quicinc.com>
 <6c0dd9fd-5d8e-537c-804f-7a03d5899a07@linaro.org>
 <548b0333-103b-ac66-0fc5-f29e7cc50596@quicinc.com>
 <6e1f6cb7-7f88-48dc-b494-1a5e990e1a33@linaro.org>
 <ff1b04c3-c852-4e28-9054-3cebb4ca5d6e@linaro.org>
 <c7c5c8f0-16e6-47bd-94e8-ce924163dfd3@linaro.org>
 <giimknikofbipipawfmrcjiar5qfyw3t7sqy3iewjahsm3ktkt@qcn4g23zfcnj>
 <76e76728-974e-46ff-8046-c61c54d07c76@linaro.org>
 <54b37d60-61b1-e939-c71d-30aecad65598@quicinc.com>
 <0cb96702-b396-4223-870f-b798d32991ee@linaro.org>
 <7571be78-5560-13bf-d754-cabc8ad6140d@quicinc.com>
 <56c11316-57ce-45d5-927c-84f65a1c227e@linaro.org>
In-Reply-To: <56c11316-57ce-45d5-927c-84f65a1c227e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Aug 2023 12:26:48 +0300
Message-ID: <CAA8EJpqQkb1wumNJWkKV2o5+52FopHyPRvxBewLxGFXnTJFA9A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
To: neil.armstrong@linaro.org
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, quic_parellan@quicinc.com,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023 at 12:22, <neil.armstrong@linaro.org> wrote:
>
> On 28/08/2023 19:07, Abhinav Kumar wrote:
> > Hi Neil
> >
> > Sorry I didnt respond earlier on this thread.
> >
> > On 8/28/2023 1:49 AM, neil.armstrong@linaro.org wrote:
> >> Hi Jessica,
> >>
> >> On 25/08/2023 20:37, Jessica Zhang wrote:
> >>>
> >>>
> >>> On 8/21/2023 3:01 AM, neil.armstrong@linaro.org wrote:
> >>>> Hi Maxime,
> >>>>
> >>>> On 21/08/2023 10:17, Maxime Ripard wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On Fri, Aug 18, 2023 at 10:25:48AM +0200, neil.armstrong@linaro.org=
 wrote:
> >>>>>> On 17/08/2023 20:35, Dmitry Baryshkov wrote:
> >>>>>>> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
> >>>>>>>> Sending HS commands will always work on any controller, it's all
> >>>>>>>> about LP commands. The Samsung panels you listed only send HS
> >>>>>>>> commands so they can use prepare_prev_first and work on any
> >>>>>>>> controllers.
> >>>>>>>
> >>>>>>> I think there is some misunderstanding there, supported by the
> >>>>>>> description of the flag.
> >>>>>>>
> >>>>>>> If I remember correctly, some hosts (sunxi) can not send DCS
> >>>>>>> commands after enabling video stream and switching to HS mode, se=
e
> >>>>>>> [1]. Thus, as you know, most of the drivers have all DSI panel se=
tup
> >>>>>>> commands in drm_panel_funcs::prepare() /
> >>>>>>> drm_bridge_funcs::pre_enable() callbacks, not paying attention
> >>>>>>> whether these commands are to be sent in LP or in HS mode.
> >>>>>>>
> >>>>>>> Previously DSI source drivers could power on the DSI link either =
in
> >>>>>>> mode_set() or in pre_enable() callbacks, with mode_set() being th=
e
> >>>>>>> hack to make panel/bridge drivers to be able to send commands fro=
m
> >>>>>>> their prepare() / pre_enable() callbacks.
> >>>>>>>
> >>>>>>> With the prev_first flags being introduced, we have established t=
hat
> >>>>>>> DSI link should be enabled in DSI host's pre_enable() callback an=
d
> >>>>>>> switched to HS mode (be it command or video) in the enable()
> >>>>>>> callback.
> >>>>>>>
> >>>>>>> So far so good.
> >>>>>>
> >>>>>> It seems coherent, I would like first to have a state of all DSI h=
ost
> >>>>>> drivers and make this would actually work first before adding the
> >>>>>> prev_first flag to all the required panels.
> >>>>>
> >>>>> This is definitely what we should do in an ideal world, but at leas=
t for
> >>>>> sunxi there's no easy way for it at the moment. There's no document=
ation
> >>>>> for it and the driver provided doesn't allow this to happen.
> >>>>>
> >>>>> Note that I'm not trying to discourage you or something here, I'm s=
imply
> >>>>> pointing out that this will be something that we will have to take =
into
> >>>>> account. And it's possible that other drivers are in a similar
> >>>>> situation.
> >>>>>
> >>>>>>> Unfortunately this change is not fully backwards-compatible. This
> >>>>>>> requires that all DSI panels sending commands from prepare() shou=
ld
> >>>>>>> have the prepare_prev_first flag. In some sense, all such patches
> >>>>>>> might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_firs=
t
> >>>>>>> flag to drm_panel").
> >>>>>>
> >>>>>> This kind of migration should be done *before* any possible
> >>>>>> regression, not the other way round.
> >>>>>>
> >>>>>> If all panels sending commands from prepare() should have the
> >>>>>> prepare_prev_first flag, then it should be first, check for
> >>>>>> regressions then continue.
> >>>>>>
> >>>>>> <snip>
> >>>>>>
> >>>>>>>>
> >>>>>>>> I understand, but this patch doesn't qualify as a fix for
> >>>>>>>> 9e15123eca79 and is too late to be merged in drm-misc-next for
> >>>>>>>> v6.6, and since 9e15123eca79 actually breaks some support it
> >>>>>>>> should be reverted (+ deps) since we are late in the rc cycles.
> >>>>>>>
> >>>>>>> If we go this way, we can never reapply these patches. There will=
 be
> >>>>>>> no guarantee that all panel drivers are completely converted. We
> >>>>>>> already have a story without an observable end -
> >>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >>>>>>
> >>>>>> I don't understand this point, who would block re-applying the pat=
ches ?
> >>>>>>
> >>>>>> The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over mult=
iple
> >>>>>> Linux version and went smoothly because we reverted regressing pat=
ches
> >>>>>> and restarted when needed, I don't understand why we can't do this
> >>>>>> here aswell.
> >>>>>>
> >>>>>>> I'd consider that the DSI driver is correct here and it is about =
the
> >>>>>>> panel drivers that require fixes patches. If you care about the
> >>>>>>> particular Fixes tag, I have provided one several lines above.
> >>>>>>
> >>>>>> Unfortunately it should be done in the other way round, prepare fo=
r
> >>>>>> migration, then migrate,
> >>>>>>
> >>>>>> I mean if it's a required migration, then it should be done and I'=
ll
> >>>>>> support it from both bridge and panel PoV.
> >>>>>>
> >>>>>> So, first this patch has the wrong Fixes tag, and I would like a
> >>>>>> better explanation on the commit message in any case. Then I would
> >>>>>> like to have an ack from some drm-misc maintainers before applying=
 it
> >>>>>> because it fixes a patch that was sent via the msm tree thus per t=
he
> >>>>>> drm-misc rules I cannot apply it via the drm-misc-next-fixes tree.
> >>>>>
> >>>>> Sorry, it's not clear to me what you'd like our feedback on exactly=
?
> >>>>
> >>>> So let me resume the situation:
> >>>>
> >>>> - pre_enable_prev_first was introduced in [1]
> >>>> - some panels made use of pre_enable_prev_first
> >>>> - Visionox VTDR6130 was enabled on SM8550 systems and works on v6.5 =
kernels and before
> >>>> - patch [2] was introduced on MSM DRM tree, breaking VTDR6130 on SM8=
550 systems (and probably other Video mode panels on Qcom platforms)
> >>>> - this fix was sent late, and is now too late to be merged via drm-m=
isc-next
> >>>
> >>> Hi Neil and Maxime,
> >>>
> >>> I agree with Neil that 9e15123eca79 was the commit that introduced th=
e issue (since it changed the MSM DSI host behavior).
> >>>
> >>> However, I'm not too keen on simply reverting that patch because
> >>>
> >>> 1) it's not wrong to have the dsi_power_on in pre_enable. Arguably, i=
t actually makes more sense to power on DSI host in pre_enable than in mode=
set (since modeset is meant for setting the bridge mode), and
> >>
> >> I never objected that, it's the right path to go.
> >>
> >
> > Ack.
> >
> >>>
> >>> 2) I think it would be good practice to keep specific bridge chip che=
cks out of the DSI host driver.
> >>
> >> We discussed about a plan with Maxime and Dmitry about that, and it wo=
uld require adding
> >> a proper atomic panel API to handle a "negociation" with the host cont=
roller.
> >>
> >
> > May I know what type of negotiation is needed here?
> >
> >>>
> >>>
> >>> That being said, what do you think about setting the default value of=
 prepare_prev_first to true (possibly in panel_bridge_attach)?
> >>
> >> As Dmitry pointed, all panels sending LP commands in pre_enable() shou=
ld have prepare_prev_first to true.
> >>
> >
> > I wanted to respond to this earlier but didnt get a chance.
> >
> >  From the documentation of this flag, this has nothing to do whether pa=
nels are sending the LP commands (commands sent in LP mode) OR HS commands =
(commands sent in HS mode).
> >
> > This is more about sending the commands whether the lanes are in LP11 s=
tate before sending the ON commands.
> >
> > 195      * The previous controller should be prepared first, before the=
 prepare
> > 196      * for the panel is called. This is largely required for DSI pa=
nels
> > 197      * where the DSI host controller should be initialised to LP-11=
 before
> > 198      * the panel is powered up.
> > 199      */
> > 200     bool prepare_prev_first;
> >
> > These are conceptually different and thats what I explained Dmitry in o=
ur call.
> >
> > Sending ON commands in LP11 state is a requirement I have seen with man=
y panels and its actually the right expectation as well to send the command=
s when the lanes are in a well-defined LP11 state.
> >
> >  From the panels which I have seen, the opposite is never true (OR i ha=
ve never seen it this way).
> >
> > The parade chip was the only exception and that issue was never root-ca=
used leading us to have bridge specific handling in MSM driver.
> >
> > In other words, it would be very unlikely that a panel should be broken=
 or shouldn't work when the ON commands are sent when the lanes are in LP11=
 state.
> >
> > So I agree with Jessica, that we should set the default value of this f=
lag to true in the framework so that only the bridges/panels which need thi=
s to be false do that explicitly. From the examples I pointed out including=
 MTK, even those vendors are powering on their DSI in pre_enable() which me=
ans none of these panels will work there too.
> >
> >>>
> >>> It seems to me that most panel drivers send DCS commands during pre_e=
nable, so maybe it would make more sense to power on DSI host before panel =
enable() by default. Any panel that needs DSI host to be powered on later c=
ould then explicitly set the flag to false in their respective drivers.
> >>
> >> A proper migration should be done, yes, but not as a fix on top of v6.=
5.
> >>
> >
> > I am fine to drop this fix in favor of making the prepare_prev_first as=
 default true but we need an agreement first. From what I can see, parade c=
hip will be the only one which will need this to be set to false and we can=
 make that change.
> >
> > Let me know if this works as a migration plan.
>
> Yep agreed, let's do this
>
> The panel's prepare_prev_first should be reversed to something like not_p=
repare_prev_first to make it an exception.

This will break all non-DSI panels, which might depend on the current
bridge calling order.

I started looking at the explicit DSI power up sequencing, but it will
take a few more days to mature.


--=20
With best wishes
Dmitry
