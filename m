Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6778C9D4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538AF10E44C;
	Tue, 29 Aug 2023 16:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C1B10E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:44:09 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d7b89ae27d3so417125276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693327448; x=1693932248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qCzfq3Oyzc8Upq2fAC3RqGHqdoKRwWkK6rtUM7ZahTw=;
 b=WADvpsAjUw2ivaFZmIY+ojPVWep6uV3JuDHS7BFVGkCmazSQy7NyI8PueaMW8erQp0
 gQI+6F8wZ+SmrJRVg4OhNqY7uIOxLQYW+ni3KBxgFYtIgtDrb4tQMUtbc3QBM6oDlu07
 CdrPLf8ltkqyeprttlPty2aEfuINchr+FKkXT0zrSysvT5DuPtsWo9sonfJ13pqPp0oX
 jGuSIH+Cz1CprVVVnCJdGwIH9ZTYfErBxvGuJ1Td7O+SiH1QLDwUK5+rLyTtzRjuUJmW
 c779MRvGPZnTxirTvnWXwOt4pP9qL82Wp9DTB/KH1ZynBt+m2I7gIEZTTFiktILjOcRU
 DE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693327448; x=1693932248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qCzfq3Oyzc8Upq2fAC3RqGHqdoKRwWkK6rtUM7ZahTw=;
 b=Q3an0SjXo3c+iNkwCk9coDcuhzxll88w3bsYPD+D0IKYq+o7CPLpp8sQqnMNaRGJoL
 lPaDjzgmYG0KkXjeOW67V2tKwlFC+c1VHA36uzxMTHk5YA6iGLn8ERXMMSfCelsgPnMF
 h3m9do87wqizGxUt0BcUqxnXntV1q7ddW4+Q4JTQcSkB6Amjbr4JndQvsTTA29UygMrK
 rj+jST3cKzKts/NQxTDutRSQhoLYGFMAimKDq8EK1bjlPWOpeMr9PMc1qrtr4KM9ak+j
 iWyx2F/R4jDVmr4DgM9uwZe60TSL5wrQZgG7gE0VoiJG5X6n4Kd0qW4oN6PyT7lKwtG4
 oV9w==
X-Gm-Message-State: AOJu0YyevXwhpx19QGS/PQiTADun1YdfFPqgEQl/VSnjJYEeNNJECASh
 iYwcAwsVeEI/Fzj+r4YBEWsfTmxbRqBhHsd4mbYfsQ==
X-Google-Smtp-Source: AGHT+IGPrrwBBXEX0BG102PZbWRqyKSgh3UlFWooPE4k7GVJsWD4jfi5n/I65H0PNPxk0jqpwopeWzOXcS751QutQK4=
X-Received: by 2002:a25:ac0a:0:b0:d7b:7249:6dc2 with SMTP id
 w10-20020a25ac0a000000b00d7b72496dc2mr1831676ybi.30.1693327448319; Tue, 29
 Aug 2023 09:44:08 -0700 (PDT)
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
 <CAA8EJpqQkb1wumNJWkKV2o5+52FopHyPRvxBewLxGFXnTJFA9A@mail.gmail.com>
 <5512f228-680b-0259-cfc5-6dae6d4da392@quicinc.com>
In-Reply-To: <5512f228-680b-0259-cfc5-6dae6d4da392@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Aug 2023 19:43:56 +0300
Message-ID: <CAA8EJpr8WPmsgiXb16OipvtouwztKYjVWLYK04Z0DvQ7frtJiw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add prepare_prev_first flag to Visionox
 VTDR6130
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: neil.armstrong@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 quic_parellan@quicinc.com, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023 at 19:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 8/29/2023 2:26 AM, Dmitry Baryshkov wrote:
> > On Tue, 29 Aug 2023 at 12:22, <neil.armstrong@linaro.org> wrote:
> >>
> >> On 28/08/2023 19:07, Abhinav Kumar wrote:
> >>> Hi Neil
> >>>
> >>> Sorry I didnt respond earlier on this thread.
> >>>
> >>> On 8/28/2023 1:49 AM, neil.armstrong@linaro.org wrote:
> >>>> Hi Jessica,
> >>>>
> >>>> On 25/08/2023 20:37, Jessica Zhang wrote:
> >>>>>
> >>>>>
> >>>>> On 8/21/2023 3:01 AM, neil.armstrong@linaro.org wrote:
> >>>>>> Hi Maxime,
> >>>>>>
> >>>>>> On 21/08/2023 10:17, Maxime Ripard wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On Fri, Aug 18, 2023 at 10:25:48AM +0200, neil.armstrong@linaro.o=
rg wrote:
> >>>>>>>> On 17/08/2023 20:35, Dmitry Baryshkov wrote:
> >>>>>>>>> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
> >>>>>>>>>> Sending HS commands will always work on any controller, it's a=
ll
> >>>>>>>>>> about LP commands. The Samsung panels you listed only send HS
> >>>>>>>>>> commands so they can use prepare_prev_first and work on any
> >>>>>>>>>> controllers.
> >>>>>>>>>
> >>>>>>>>> I think there is some misunderstanding there, supported by the
> >>>>>>>>> description of the flag.
> >>>>>>>>>
> >>>>>>>>> If I remember correctly, some hosts (sunxi) can not send DCS
> >>>>>>>>> commands after enabling video stream and switching to HS mode, =
see
> >>>>>>>>> [1]. Thus, as you know, most of the drivers have all DSI panel =
setup
> >>>>>>>>> commands in drm_panel_funcs::prepare() /
> >>>>>>>>> drm_bridge_funcs::pre_enable() callbacks, not paying attention
> >>>>>>>>> whether these commands are to be sent in LP or in HS mode.
> >>>>>>>>>
> >>>>>>>>> Previously DSI source drivers could power on the DSI link eithe=
r in
> >>>>>>>>> mode_set() or in pre_enable() callbacks, with mode_set() being =
the
> >>>>>>>>> hack to make panel/bridge drivers to be able to send commands f=
rom
> >>>>>>>>> their prepare() / pre_enable() callbacks.
> >>>>>>>>>
> >>>>>>>>> With the prev_first flags being introduced, we have established=
 that
> >>>>>>>>> DSI link should be enabled in DSI host's pre_enable() callback =
and
> >>>>>>>>> switched to HS mode (be it command or video) in the enable()
> >>>>>>>>> callback.
> >>>>>>>>>
> >>>>>>>>> So far so good.
> >>>>>>>>
> >>>>>>>> It seems coherent, I would like first to have a state of all DSI=
 host
> >>>>>>>> drivers and make this would actually work first before adding th=
e
> >>>>>>>> prev_first flag to all the required panels.
> >>>>>>>
> >>>>>>> This is definitely what we should do in an ideal world, but at le=
ast for
> >>>>>>> sunxi there's no easy way for it at the moment. There's no docume=
ntation
> >>>>>>> for it and the driver provided doesn't allow this to happen.
> >>>>>>>
> >>>>>>> Note that I'm not trying to discourage you or something here, I'm=
 simply
> >>>>>>> pointing out that this will be something that we will have to tak=
e into
> >>>>>>> account. And it's possible that other drivers are in a similar
> >>>>>>> situation.
> >>>>>>>
> >>>>>>>>> Unfortunately this change is not fully backwards-compatible. Th=
is
> >>>>>>>>> requires that all DSI panels sending commands from prepare() sh=
ould
> >>>>>>>>> have the prepare_prev_first flag. In some sense, all such patch=
es
> >>>>>>>>> might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_fi=
rst
> >>>>>>>>> flag to drm_panel").
> >>>>>>>>
> >>>>>>>> This kind of migration should be done *before* any possible
> >>>>>>>> regression, not the other way round.
> >>>>>>>>
> >>>>>>>> If all panels sending commands from prepare() should have the
> >>>>>>>> prepare_prev_first flag, then it should be first, check for
> >>>>>>>> regressions then continue.
> >>>>>>>>
> >>>>>>>> <snip>
> >>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I understand, but this patch doesn't qualify as a fix for
> >>>>>>>>>> 9e15123eca79 and is too late to be merged in drm-misc-next for
> >>>>>>>>>> v6.6, and since 9e15123eca79 actually breaks some support it
> >>>>>>>>>> should be reverted (+ deps) since we are late in the rc cycles=
.
> >>>>>>>>>
> >>>>>>>>> If we go this way, we can never reapply these patches. There wi=
ll be
> >>>>>>>>> no guarantee that all panel drivers are completely converted. W=
e
> >>>>>>>>> already have a story without an observable end -
> >>>>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >>>>>>>>
> >>>>>>>> I don't understand this point, who would block re-applying the p=
atches ?
> >>>>>>>>
> >>>>>>>> The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done over mu=
ltiple
> >>>>>>>> Linux version and went smoothly because we reverted regressing p=
atches
> >>>>>>>> and restarted when needed, I don't understand why we can't do th=
is
> >>>>>>>> here aswell.
> >>>>>>>>
> >>>>>>>>> I'd consider that the DSI driver is correct here and it is abou=
t the
> >>>>>>>>> panel drivers that require fixes patches. If you care about the
> >>>>>>>>> particular Fixes tag, I have provided one several lines above.
> >>>>>>>>
> >>>>>>>> Unfortunately it should be done in the other way round, prepare =
for
> >>>>>>>> migration, then migrate,
> >>>>>>>>
> >>>>>>>> I mean if it's a required migration, then it should be done and =
I'll
> >>>>>>>> support it from both bridge and panel PoV.
> >>>>>>>>
> >>>>>>>> So, first this patch has the wrong Fixes tag, and I would like a
> >>>>>>>> better explanation on the commit message in any case. Then I wou=
ld
> >>>>>>>> like to have an ack from some drm-misc maintainers before applyi=
ng it
> >>>>>>>> because it fixes a patch that was sent via the msm tree thus per=
 the
> >>>>>>>> drm-misc rules I cannot apply it via the drm-misc-next-fixes tre=
e.
> >>>>>>>
> >>>>>>> Sorry, it's not clear to me what you'd like our feedback on exact=
ly?
> >>>>>>
> >>>>>> So let me resume the situation:
> >>>>>>
> >>>>>> - pre_enable_prev_first was introduced in [1]
> >>>>>> - some panels made use of pre_enable_prev_first
> >>>>>> - Visionox VTDR6130 was enabled on SM8550 systems and works on v6.=
5 kernels and before
> >>>>>> - patch [2] was introduced on MSM DRM tree, breaking VTDR6130 on S=
M8550 systems (and probably other Video mode panels on Qcom platforms)
> >>>>>> - this fix was sent late, and is now too late to be merged via drm=
-misc-next
> >>>>>
> >>>>> Hi Neil and Maxime,
> >>>>>
> >>>>> I agree with Neil that 9e15123eca79 was the commit that introduced =
the issue (since it changed the MSM DSI host behavior).
> >>>>>
> >>>>> However, I'm not too keen on simply reverting that patch because
> >>>>>
> >>>>> 1) it's not wrong to have the dsi_power_on in pre_enable. Arguably,=
 it actually makes more sense to power on DSI host in pre_enable than in mo=
deset (since modeset is meant for setting the bridge mode), and
> >>>>
> >>>> I never objected that, it's the right path to go.
> >>>>
> >>>
> >>> Ack.
> >>>
> >>>>>
> >>>>> 2) I think it would be good practice to keep specific bridge chip c=
hecks out of the DSI host driver.
> >>>>
> >>>> We discussed about a plan with Maxime and Dmitry about that, and it =
would require adding
> >>>> a proper atomic panel API to handle a "negociation" with the host co=
ntroller.
> >>>>
> >>>
> >>> May I know what type of negotiation is needed here?
> >>>
> >>>>>
> >>>>>
> >>>>> That being said, what do you think about setting the default value =
of prepare_prev_first to true (possibly in panel_bridge_attach)?
> >>>>
> >>>> As Dmitry pointed, all panels sending LP commands in pre_enable() sh=
ould have prepare_prev_first to true.
> >>>>
> >>>
> >>> I wanted to respond to this earlier but didnt get a chance.
> >>>
> >>>   From the documentation of this flag, this has nothing to do whether=
 panels are sending the LP commands (commands sent in LP mode) OR HS comman=
ds (commands sent in HS mode).
> >>>
> >>> This is more about sending the commands whether the lanes are in LP11=
 state before sending the ON commands.
> >>>
> >>> 195      * The previous controller should be prepared first, before t=
he prepare
> >>> 196      * for the panel is called. This is largely required for DSI =
panels
> >>> 197      * where the DSI host controller should be initialised to LP-=
11 before
> >>> 198      * the panel is powered up.
> >>> 199      */
> >>> 200     bool prepare_prev_first;
> >>>
> >>> These are conceptually different and thats what I explained Dmitry in=
 our call.
> >>>
> >>> Sending ON commands in LP11 state is a requirement I have seen with m=
any panels and its actually the right expectation as well to send the comma=
nds when the lanes are in a well-defined LP11 state.
> >>>
> >>>   From the panels which I have seen, the opposite is never true (OR i=
 have never seen it this way).
> >>>
> >>> The parade chip was the only exception and that issue was never root-=
caused leading us to have bridge specific handling in MSM driver.
> >>>
> >>> In other words, it would be very unlikely that a panel should be brok=
en or shouldn't work when the ON commands are sent when the lanes are in LP=
11 state.
> >>>
> >>> So I agree with Jessica, that we should set the default value of this=
 flag to true in the framework so that only the bridges/panels which need t=
his to be false do that explicitly. From the examples I pointed out includi=
ng MTK, even those vendors are powering on their DSI in pre_enable() which =
means none of these panels will work there too.
> >>>
> >>>>>
> >>>>> It seems to me that most panel drivers send DCS commands during pre=
_enable, so maybe it would make more sense to power on DSI host before pane=
l enable() by default. Any panel that needs DSI host to be powered on later=
 could then explicitly set the flag to false in their respective drivers.
> >>>>
> >>>> A proper migration should be done, yes, but not as a fix on top of v=
6.5.
> >>>>
> >>>
> >>> I am fine to drop this fix in favor of making the prepare_prev_first =
as default true but we need an agreement first. From what I can see, parade=
 chip will be the only one which will need this to be set to false and we c=
an make that change.
> >>>
> >>> Let me know if this works as a migration plan.
> >>
> >> Yep agreed, let's do this
> >>
> >> The panel's prepare_prev_first should be reversed to something like no=
t_prepare_prev_first to make it an exception.
> >
> > This will break all non-DSI panels, which might depend on the current
> > bridge calling order.
> >
> > I started looking at the explicit DSI power up sequencing, but it will
> > take a few more days to mature.
> >
>
> May I know why this would break all non-DSI panels?

Existing panel drivers might be depending on the init order. Do we
know for sure that none of DPI panels will be broken if there is a
video stream ongoing during the reset procedure?
Or the panel-edp, which I'm pretty sure will require not_prepare_prev_first=
.

>
> Like I said, we dont know the full details of the parade issue but I do
> not see any reason why powering on a bridge chip with the DSI lanes
> being in proper LP11 state should cause an issue. Its a well defined and
> documented state in DSI spec.
>
> On the contrary, trying to turn on a bridge chip before powering on a
> controller could have more issues as we do not know what state the lanes
> are in when the MIPI devices (panel or bridge) are powered up.
>
> This sets the expectation and handshake straight.


--=20
With best wishes
Dmitry
