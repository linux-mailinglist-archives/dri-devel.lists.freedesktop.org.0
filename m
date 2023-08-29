Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED2778CCC6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 21:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E510E48E;
	Tue, 29 Aug 2023 19:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A7110E48E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 19:15:56 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d77f614243aso4497582276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693336555; x=1693941355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfJDxd6xiv8SsO6QR9Mfg+H9iWZWtXyb03BdqvUJPXw=;
 b=JurVVWB+pMlQkN8TzsPP5woSfeE2VRArY22517SPLQ7Ha0qbktNwKl2wwJHHkLTN7L
 Enjbzk8rovk6MOQS5JQdXCFBi14VaQlFfyhkMkaujdjFvV4v4Pe0fhLUZiedqRp7SFBE
 vKDV1z4myH8jnYTgQs338f9Pp0KSt7r2RunxpTEQoUGF7wd+VhPY0+R19mNTyZ5sConH
 U1x4iyEhA68fM28zPF/kVjvl+9xX0OFjQIAT49g0VxIdbuH64A0fvm5X9JKGnm+Pi37j
 SSzkUwKqU9BLkPBr215K8VXME3Yqr7tMWjaHxLEY1seEm10YyK50D1FLj2g8JC6K37QX
 IAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693336555; x=1693941355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfJDxd6xiv8SsO6QR9Mfg+H9iWZWtXyb03BdqvUJPXw=;
 b=QsNTe32tZqHwEizQUYY/ssOq/lRN4F65XikJmkKS2HWOxpGQ+DX4tUAhGcp6w54X67
 lX6YfW55YJvJycwDVrk6mXkIWhOlgpImwh2v7gWOrIeY95vXLFtdeT7+oj/oRZdWXTJq
 yHArFoqsUvYJ1EZYFhLvHPzIuODFgbIRU/dJhIHJsDj1x8KNn2sF5BCubX76yq03BYDb
 tqAZ6zHkB4lywbDQMAIWBmgoeaXIc4KvaVnnf+oJwlU0s5Y5Ap1mLma3i3KxT5n4vB4w
 jsnroS99X+LLWzpqcDO+PDTNVqD7aNKX8mfW4T46k0LYxvoAauuJAW3qWV+BTEevNUuU
 wplg==
X-Gm-Message-State: AOJu0YzIr9Hied18irogj0W0bl5+jbe+rLLFffEnM5ThQCP0IYOHh5hK
 uqRdcrrC3Igm+c0UZlDP03CmhopSlVxD/4U0sKB5Ng==
X-Google-Smtp-Source: AGHT+IGM9boKhJwkuJdxOFhOk+DAD51L/UJNB0UGPSzWJ8F8YwzgzPA4USM42tbLjNaDPww+leYnHBpBrZ4WEv2zCdA=
X-Received: by 2002:a25:b8b:0:b0:c73:e6b5:c452 with SMTP id
 133-20020a250b8b000000b00c73e6b5c452mr59733ybl.2.1693336555551; Tue, 29 Aug
 2023 12:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com>
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
 <CAA8EJpr8WPmsgiXb16OipvtouwztKYjVWLYK04Z0DvQ7frtJiw@mail.gmail.com>
 <e52d9a0a-f748-22fb-e68c-4b819d97d0cd@quicinc.com>
 <CAA8EJpohD05+JuHoGai9NoM-GH8JN9MGtf4CKtBJpPm5n25dwA@mail.gmail.com>
 <c522a944-4ae1-098b-0205-b0810325114c@quicinc.com>
In-Reply-To: <c522a944-4ae1-098b-0205-b0810325114c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Aug 2023 22:15:44 +0300
Message-ID: <CAA8EJpoEQAjRPnZD5uErSUO=3v-J3yHwZCEU2WcX8RXjV_ZcsQ@mail.gmail.com>
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

On Tue, 29 Aug 2023 at 22:09, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 8/29/2023 11:51 AM, Dmitry Baryshkov wrote:
> > On Tue, 29 Aug 2023 at 20:22, Abhinav Kumar <quic_abhinavk@quicinc.com>=
 wrote:
> >>
> >>
> >>
> >> On 8/29/2023 9:43 AM, Dmitry Baryshkov wrote:
> >>> On Tue, 29 Aug 2023 at 19:37, Abhinav Kumar <quic_abhinavk@quicinc.co=
m> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 8/29/2023 2:26 AM, Dmitry Baryshkov wrote:
> >>>>> On Tue, 29 Aug 2023 at 12:22, <neil.armstrong@linaro.org> wrote:
> >>>>>>
> >>>>>> On 28/08/2023 19:07, Abhinav Kumar wrote:
> >>>>>>> Hi Neil
> >>>>>>>
> >>>>>>> Sorry I didnt respond earlier on this thread.
> >>>>>>>
> >>>>>>> On 8/28/2023 1:49 AM, neil.armstrong@linaro.org wrote:
> >>>>>>>> Hi Jessica,
> >>>>>>>>
> >>>>>>>> On 25/08/2023 20:37, Jessica Zhang wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 8/21/2023 3:01 AM, neil.armstrong@linaro.org wrote:
> >>>>>>>>>> Hi Maxime,
> >>>>>>>>>>
> >>>>>>>>>> On 21/08/2023 10:17, Maxime Ripard wrote:
> >>>>>>>>>>> Hi,
> >>>>>>>>>>>
> >>>>>>>>>>> On Fri, Aug 18, 2023 at 10:25:48AM +0200, neil.armstrong@lina=
ro.org wrote:
> >>>>>>>>>>>> On 17/08/2023 20:35, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>> On 16/08/2023 10:51, neil.armstrong@linaro.org wrote:
> >>>>>>>>>>>>>> Sending HS commands will always work on any controller, it=
's all
> >>>>>>>>>>>>>> about LP commands. The Samsung panels you listed only send=
 HS
> >>>>>>>>>>>>>> commands so they can use prepare_prev_first and work on an=
y
> >>>>>>>>>>>>>> controllers.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I think there is some misunderstanding there, supported by =
the
> >>>>>>>>>>>>> description of the flag.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> If I remember correctly, some hosts (sunxi) can not send DC=
S
> >>>>>>>>>>>>> commands after enabling video stream and switching to HS mo=
de, see
> >>>>>>>>>>>>> [1]. Thus, as you know, most of the drivers have all DSI pa=
nel setup
> >>>>>>>>>>>>> commands in drm_panel_funcs::prepare() /
> >>>>>>>>>>>>> drm_bridge_funcs::pre_enable() callbacks, not paying attent=
ion
> >>>>>>>>>>>>> whether these commands are to be sent in LP or in HS mode.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Previously DSI source drivers could power on the DSI link e=
ither in
> >>>>>>>>>>>>> mode_set() or in pre_enable() callbacks, with mode_set() be=
ing the
> >>>>>>>>>>>>> hack to make panel/bridge drivers to be able to send comman=
ds from
> >>>>>>>>>>>>> their prepare() / pre_enable() callbacks.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> With the prev_first flags being introduced, we have establi=
shed that
> >>>>>>>>>>>>> DSI link should be enabled in DSI host's pre_enable() callb=
ack and
> >>>>>>>>>>>>> switched to HS mode (be it command or video) in the enable(=
)
> >>>>>>>>>>>>> callback.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> So far so good.
> >>>>>>>>>>>>
> >>>>>>>>>>>> It seems coherent, I would like first to have a state of all=
 DSI host
> >>>>>>>>>>>> drivers and make this would actually work first before addin=
g the
> >>>>>>>>>>>> prev_first flag to all the required panels.
> >>>>>>>>>>>
> >>>>>>>>>>> This is definitely what we should do in an ideal world, but a=
t least for
> >>>>>>>>>>> sunxi there's no easy way for it at the moment. There's no do=
cumentation
> >>>>>>>>>>> for it and the driver provided doesn't allow this to happen.
> >>>>>>>>>>>
> >>>>>>>>>>> Note that I'm not trying to discourage you or something here,=
 I'm simply
> >>>>>>>>>>> pointing out that this will be something that we will have to=
 take into
> >>>>>>>>>>> account. And it's possible that other drivers are in a simila=
r
> >>>>>>>>>>> situation.
> >>>>>>>>>>>
> >>>>>>>>>>>>> Unfortunately this change is not fully backwards-compatible=
. This
> >>>>>>>>>>>>> requires that all DSI panels sending commands from prepare(=
) should
> >>>>>>>>>>>>> have the prepare_prev_first flag. In some sense, all such p=
atches
> >>>>>>>>>>>>> might have Fixes: 5ea6b1702781 ("drm/panel: Add prepare_pre=
v_first
> >>>>>>>>>>>>> flag to drm_panel").
> >>>>>>>>>>>>
> >>>>>>>>>>>> This kind of migration should be done *before* any possible
> >>>>>>>>>>>> regression, not the other way round.
> >>>>>>>>>>>>
> >>>>>>>>>>>> If all panels sending commands from prepare() should have th=
e
> >>>>>>>>>>>> prepare_prev_first flag, then it should be first, check for
> >>>>>>>>>>>> regressions then continue.
> >>>>>>>>>>>>
> >>>>>>>>>>>> <snip>
> >>>>>>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> I understand, but this patch doesn't qualify as a fix for
> >>>>>>>>>>>>>> 9e15123eca79 and is too late to be merged in drm-misc-next=
 for
> >>>>>>>>>>>>>> v6.6, and since 9e15123eca79 actually breaks some support =
it
> >>>>>>>>>>>>>> should be reverted (+ deps) since we are late in the rc cy=
cles.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> If we go this way, we can never reapply these patches. Ther=
e will be
> >>>>>>>>>>>>> no guarantee that all panel drivers are completely converte=
d. We
> >>>>>>>>>>>>> already have a story without an observable end -
> >>>>>>>>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I don't understand this point, who would block re-applying t=
he patches ?
> >>>>>>>>>>>>
> >>>>>>>>>>>> The migration to DRM_BRIDGE_ATTACH_NO_CONNECTOR was done ove=
r multiple
> >>>>>>>>>>>> Linux version and went smoothly because we reverted regressi=
ng patches
> >>>>>>>>>>>> and restarted when needed, I don't understand why we can't d=
o this
> >>>>>>>>>>>> here aswell.
> >>>>>>>>>>>>
> >>>>>>>>>>>>> I'd consider that the DSI driver is correct here and it is =
about the
> >>>>>>>>>>>>> panel drivers that require fixes patches. If you care about=
 the
> >>>>>>>>>>>>> particular Fixes tag, I have provided one several lines abo=
ve.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Unfortunately it should be done in the other way round, prep=
are for
> >>>>>>>>>>>> migration, then migrate,
> >>>>>>>>>>>>
> >>>>>>>>>>>> I mean if it's a required migration, then it should be done =
and I'll
> >>>>>>>>>>>> support it from both bridge and panel PoV.
> >>>>>>>>>>>>
> >>>>>>>>>>>> So, first this patch has the wrong Fixes tag, and I would li=
ke a
> >>>>>>>>>>>> better explanation on the commit message in any case. Then I=
 would
> >>>>>>>>>>>> like to have an ack from some drm-misc maintainers before ap=
plying it
> >>>>>>>>>>>> because it fixes a patch that was sent via the msm tree thus=
 per the
> >>>>>>>>>>>> drm-misc rules I cannot apply it via the drm-misc-next-fixes=
 tree.
> >>>>>>>>>>>
> >>>>>>>>>>> Sorry, it's not clear to me what you'd like our feedback on e=
xactly?
> >>>>>>>>>>
> >>>>>>>>>> So let me resume the situation:
> >>>>>>>>>>
> >>>>>>>>>> - pre_enable_prev_first was introduced in [1]
> >>>>>>>>>> - some panels made use of pre_enable_prev_first
> >>>>>>>>>> - Visionox VTDR6130 was enabled on SM8550 systems and works on=
 v6.5 kernels and before
> >>>>>>>>>> - patch [2] was introduced on MSM DRM tree, breaking VTDR6130 =
on SM8550 systems (and probably other Video mode panels on Qcom platforms)
> >>>>>>>>>> - this fix was sent late, and is now too late to be merged via=
 drm-misc-next
> >>>>>>>>>
> >>>>>>>>> Hi Neil and Maxime,
> >>>>>>>>>
> >>>>>>>>> I agree with Neil that 9e15123eca79 was the commit that introdu=
ced the issue (since it changed the MSM DSI host behavior).
> >>>>>>>>>
> >>>>>>>>> However, I'm not too keen on simply reverting that patch becaus=
e
> >>>>>>>>>
> >>>>>>>>> 1) it's not wrong to have the dsi_power_on in pre_enable. Argua=
bly, it actually makes more sense to power on DSI host in pre_enable than i=
n modeset (since modeset is meant for setting the bridge mode), and
> >>>>>>>>
> >>>>>>>> I never objected that, it's the right path to go.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Ack.
> >>>>>>>
> >>>>>>>>>
> >>>>>>>>> 2) I think it would be good practice to keep specific bridge ch=
ip checks out of the DSI host driver.
> >>>>>>>>
> >>>>>>>> We discussed about a plan with Maxime and Dmitry about that, and=
 it would require adding
> >>>>>>>> a proper atomic panel API to handle a "negociation" with the hos=
t controller.
> >>>>>>>>
> >>>>>>>
> >>>>>>> May I know what type of negotiation is needed here?
> >>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> That being said, what do you think about setting the default va=
lue of prepare_prev_first to true (possibly in panel_bridge_attach)?
> >>>>>>>>
> >>>>>>>> As Dmitry pointed, all panels sending LP commands in pre_enable(=
) should have prepare_prev_first to true.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I wanted to respond to this earlier but didnt get a chance.
> >>>>>>>
> >>>>>>>     From the documentation of this flag, this has nothing to do w=
hether panels are sending the LP commands (commands sent in LP mode) OR HS =
commands (commands sent in HS mode).
> >>>>>>>
> >>>>>>> This is more about sending the commands whether the lanes are in =
LP11 state before sending the ON commands.
> >>>>>>>
> >>>>>>> 195      * The previous controller should be prepared first, befo=
re the prepare
> >>>>>>> 196      * for the panel is called. This is largely required for =
DSI panels
> >>>>>>> 197      * where the DSI host controller should be initialised to=
 LP-11 before
> >>>>>>> 198      * the panel is powered up.
> >>>>>>> 199      */
> >>>>>>> 200     bool prepare_prev_first;
> >>>>>>>
> >>>>>>> These are conceptually different and thats what I explained Dmitr=
y in our call.
> >>>>>>>
> >>>>>>> Sending ON commands in LP11 state is a requirement I have seen wi=
th many panels and its actually the right expectation as well to send the c=
ommands when the lanes are in a well-defined LP11 state.
> >>>>>>>
> >>>>>>>     From the panels which I have seen, the opposite is never true=
 (OR i have never seen it this way).
> >>>>>>>
> >>>>>>> The parade chip was the only exception and that issue was never r=
oot-caused leading us to have bridge specific handling in MSM driver.
> >>>>>>>
> >>>>>>> In other words, it would be very unlikely that a panel should be =
broken or shouldn't work when the ON commands are sent when the lanes are i=
n LP11 state.
> >>>>>>>
> >>>>>>> So I agree with Jessica, that we should set the default value of =
this flag to true in the framework so that only the bridges/panels which ne=
ed this to be false do that explicitly. From the examples I pointed out inc=
luding MTK, even those vendors are powering on their DSI in pre_enable() wh=
ich means none of these panels will work there too.
> >>>>>>>
> >>>>>>>>>
> >>>>>>>>> It seems to me that most panel drivers send DCS commands during=
 pre_enable, so maybe it would make more sense to power on DSI host before =
panel enable() by default. Any panel that needs DSI host to be powered on l=
ater could then explicitly set the flag to false in their respective driver=
s.
> >>>>>>>>
> >>>>>>>> A proper migration should be done, yes, but not as a fix on top =
of v6.5.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I am fine to drop this fix in favor of making the prepare_prev_fi=
rst as default true but we need an agreement first. From what I can see, pa=
rade chip will be the only one which will need this to be set to false and =
we can make that change.
> >>>>>>>
> >>>>>>> Let me know if this works as a migration plan.
> >>>>>>
> >>>>>> Yep agreed, let's do this
> >>>>>>
> >>>>>> The panel's prepare_prev_first should be reversed to something lik=
e not_prepare_prev_first to make it an exception.
> >>>>>
> >>>>> This will break all non-DSI panels, which might depend on the curre=
nt
> >>>>> bridge calling order.
> >>>>>
> >>>>> I started looking at the explicit DSI power up sequencing, but it w=
ill
> >>>>> take a few more days to mature.
> >>>>>
> >>>>
> >>>> May I know why this would break all non-DSI panels?
> >>>
> >>> Existing panel drivers might be depending on the init order. Do we
> >>> know for sure that none of DPI panels will be broken if there is a
> >>> video stream ongoing during the reset procedure?
> >>> Or the panel-edp, which I'm pretty sure will require not_prepare_prev=
_first.
> >>>
> >>
> >> Can you please explain why would video stream be ON in pre_enable()?
> >>
> >> Even though we call msm_dsi_host_enable() in the DSI's pre_enable(), t=
he
> >> timing engine is not enabled until the encoder's enable and the first
> >> commit after that so video stream wont be sent till then.
> >
> > You are describing the MSM DSI case. I was pointing to the fact that
> > parent's pre_enable if called too early might conflict with the next
> > bridge driver in the _generic_ case. E.g. eDP or DPI. Even if is not a
> > full-featured video stream, this state might confuse the panel. So we
> > can not blindly switch the order of pre_enable callbacks for the
> > bridge-panel pair.
> >
>
> Even if the end connector was a eDP or DPI, the input to the bridge was
> DSI so I think its unlikely that video stream was on before encoder's
> enable but I cannot speak for all these interfaces/vendors.
>
> So, to accommodate both worlds, does this work?
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 9316384b4474..2b38388d4e56 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -416,7 +416,10 @@ struct drm_bridge
> *devm_drm_panel_bridge_add_typed(struct device *dev,
>                  return bridge;
>          }
>
> -       bridge->pre_enable_prev_first =3D panel->prepare_prev_first;
> +       if (connector_type =3D=3D DRM_MODE_CONNECTOR_DSI)
> +               bridge->pre_enable_prev_first =3D true;
> +       else
> +               bridge->pre_enable_prev_first =3D panel->prepare_prev_fir=
st;

looks like a hack.

>
>          *ptr =3D bridge;
>          devres_add(dev, ptr);
>
> >>
> >> drm_atomic_bridge_chain_pre_enable() is called before the encoder's en=
able.
> >>
> >> drm_atomic_bridge_chain_enable() is the one which is called after the
> >> encoder's enable().
> >>
> >>>>
> >>>> Like I said, we dont know the full details of the parade issue but I=
 do
> >>>> not see any reason why powering on a bridge chip with the DSI lanes
> >>>> being in proper LP11 state should cause an issue. Its a well defined=
 and
> >>>> documented state in DSI spec.
> >>>>
> >>>> On the contrary, trying to turn on a bridge chip before powering on =
a
> >>>> controller could have more issues as we do not know what state the l=
anes
> >>>> are in when the MIPI devices (panel or bridge) are powered up.
> >>>>
> >>>> This sets the expectation and handshake straight.
> >>>
> >>>
> >
> >
> >



--=20
With best wishes
Dmitry
