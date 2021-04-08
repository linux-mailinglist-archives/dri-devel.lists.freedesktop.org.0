Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B90359042
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 01:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55106E40D;
	Thu,  8 Apr 2021 23:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 101073 seconds by postgrey-1.36 at gabe;
 Thu, 08 Apr 2021 23:16:30 UTC
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779CF6E40D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 23:16:30 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1DBAA1FAF2;
 Fri,  9 Apr 2021 01:16:27 +0200 (CEST)
Received: by mail-vs1-f44.google.com with SMTP id h20so2030576vsu.1;
 Thu, 08 Apr 2021 16:16:27 -0700 (PDT)
X-Gm-Message-State: AOAM531mhwwacsLqMv6TukdjVx9+Z2hjRQNoGPyyOpHeLM1GjFPxA/62
 uMUZNix8gztr3aDDQ5RuS7JUyn4+VsUS+rMwRqY=
X-Google-Smtp-Source: ABdhPJw6EYN1JMtoqLeAzxdZC79DvwurUARvz2v73JW8EL5WAz2/XfMweZwCJD4zHKDB52Cr44AIVeAzm2ovWTShR8s=
X-Received: by 2002:a67:7751:: with SMTP id s78mr6096451vsc.3.1617923786067;
 Thu, 08 Apr 2021 16:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
 <20210406214726.131534-2-marijn.suijten@somainline.org>
 <6413863d04df9743e2d7e81beff5c3e8@codeaurora.org>
 <04860f05-f79f-de0b-13d1-aba85065b4da@somainline.org>
 <CAF6AEGuoLgBSZOou1TSb-d2o6tHS-L-E7AQLS5RM4aOogvRG7Q@mail.gmail.com>
In-Reply-To: <CAF6AEGuoLgBSZOou1TSb-d2o6tHS-L-E7AQLS5RM4aOogvRG7Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Date: Fri, 9 Apr 2021 01:16:13 +0200
X-Gmail-Original-Message-ID: <CAK7fi1aUXy2i8zY0Cb5Svq0s1H9cSAvY4hq+BsiWgdphwm-ebA@mail.gmail.com>
Message-ID: <CAK7fi1aUXy2i8zY0Cb5Svq0s1H9cSAvY4hq+BsiWgdphwm-ebA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/mdp5: Configure PP_SYNC_HEIGHT to
 double the vtotal
To: Rob Clark <robdclark@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Martin Botka <martin.botka@somainline.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: multipart/mixed; boundary="===============1642146574=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1642146574==
Content-Type: multipart/alternative; boundary="0000000000008ad23305bf7e3c14"

--0000000000008ad23305bf7e3c14
Content-Type: text/plain; charset="UTF-8"

Il gio 8 apr 2021, 21:05 Rob Clark <robdclark@gmail.com> ha scritto:

> On Wed, Apr 7, 2021 at 12:11 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> >
> > Il 07/04/21 20:19, abhinavk@codeaurora.org ha scritto:
> > > Hi Marijn
> > >
> > > On 2021-04-06 14:47, Marijn Suijten wrote:
> > >> Leaving this at a close-to-maximum register value 0xFFF0 means it
> takes
> > >> very long for the MDSS to generate a software vsync interrupt when the
> > >> hardware TE interrupt doesn't arrive.  Configuring this to double the
> > >> vtotal (like some downstream kernels) leads to a frame to take at most
> > >> twice before the vsync signal, until hardware TE comes up.
> > >>
> > >> In this case the hardware interrupt responsible for providing this
> > >> signal - "disp-te" gpio - is not hooked up to the mdp5 vsync/pp logic
> at
> > >> all.  This solves severe panel update issues observed on at least the
> > >> Xperia Loire and Tone series, until said gpio is properly hooked up to
> > >> an irq.
> > >
> > > The reason the CONFIG_HEIGHT was at such a high value is to make sure
> that
> > > we always get the TE only from the panel vsync and not false positives
> > > coming
> > > from the tear check logic itself.
> > >
> > > When you say that disp-te gpio is not hooked up, is it something
> > > incorrect with
> > > the schematic OR panel is not generating the TE correctly?
> > >
> >
> > Sometimes, some panels aren't getting correctly configured by the
> > OEM/ODM in the first place: especially when porting devices from
> > downstream to upstream, developers often get in a situation in which
> > their TE line is either misconfigured or the DriverIC is not configured
> > to raise V-Sync interrupts.
> > Please remember: some DDICs need a "commands sequence" to enable
> > generating the TE interrupts, sometimes this is not standard, and
> > sometimes OEMs/ODMs are not even doing that in their downstream code
> > (but instead they work around it in creative ways "for reasons", even
> > though their DDIC supports indeed sending TE events).
> >
> > This mostly happens when bringing up devices that have autorefresh
> > enabled from the bootloader (when the bootloader sets up the splash
> > screen) by using simple-panel as a (hopefully) temporary solution to get
> > through the initial stages of porting.
> >
> > We are not trying to cover cases related to incorrect schematics or
> > hardware mistakes here, as the fix for that - as you know - is to just
> > fix your hardware.
> > What we're trying to do here is to stop freezes and, in some cases,
> > lockups, other than false positives making the developer go offroad when
> > the platform shows that something is wrong during early porting.
> >
> > Also, sometimes, some DDICs will not generate TE interrupts when
> > expected... in these cases we get a PP timeout and a MDP5 recovery: this
> > is totally avoidable if we rely on the 2*vtotal, as we wouldn't get
> > through the very time consuming task of recovering the entire MDP.
> >
> > Of course, if something is wrong in the MDP and the block really needs
> > recovery, this "trick" won't save anyone and the recovery will anyway be
> > triggered, as the PP-done will anyway timeout.
>
> So, is this (mostly) a workaround due to TE not wired up?  In which
> case I think it is ok, but maybe should have a comment about the
> interaction with TE?
>

Mostly, yes.


> Currently I have this patch in msm-next-staging but I guess we need to
> decide in the next day or so whether to drop it or smash in a comment?
>
> BR,
> -R
>

Marijn, can you please urgently throw a comment in, reminding that these
timers are interacting with TE and send a fast V2?

Cheers,
 - Angelo


> > >>
> > >> Suggested-by: AngeloGioacchino Del Regno
> > >> <angelogioacchino.delregno@somainline.org>
> > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >> Reviewed-by: AngeloGioacchino Del Regno
> > >> <angelogioacchino.delregno@somainline.org>
> > >> ---
> > >>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > >> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > >> index ff2c1d583c79..2d5ac03dbc17 100644
> > >> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > >> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > >> @@ -51,7 +51,7 @@ static int pingpong_tearcheck_setup(struct
> > >> drm_encoder *encoder,
> > >>
> > >>      mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_CONFIG_VSYNC(pp_id), cfg);
> > >>      mdp5_write(mdp5_kms,
> > >> -        REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), 0xfff0);
> > >> +        REG_MDP5_PP_SYNC_CONFIG_HEIGHT(pp_id), (2 * mode->vtotal));
> > >>      mdp5_write(mdp5_kms,
> > >>          REG_MDP5_PP_VSYNC_INIT_VAL(pp_id), mode->vdisplay);
> > >>      mdp5_write(mdp5_kms, REG_MDP5_PP_RD_PTR_IRQ(pp_id),
> > >> mode->vdisplay + 1);
>

--0000000000008ad23305bf7e3c14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Il gio 8 apr 2021, 21:05 Rob Clark &lt;<a href=3D"mailto:r=
obdclark@gmail.com">robdclark@gmail.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Wed, Apr 7, 2021 at 12:11 PM AngeloGioacchino D=
el Regno<br>
&lt;<a href=3D"mailto:angelogioacchino.delregno@somainline.org" target=3D"_=
blank" rel=3D"noreferrer">angelogioacchino.delregno@somainline.org</a>&gt; =
wrote:<br>
&gt;<br>
&gt; Il 07/04/21 20:19, <a href=3D"mailto:abhinavk@codeaurora.org" target=
=3D"_blank" rel=3D"noreferrer">abhinavk@codeaurora.org</a> ha scritto:<br>
&gt; &gt; Hi Marijn<br>
&gt; &gt;<br>
&gt; &gt; On 2021-04-06 14:47, Marijn Suijten wrote:<br>
&gt; &gt;&gt; Leaving this at a close-to-maximum register value 0xFFF0 mean=
s it takes<br>
&gt; &gt;&gt; very long for the MDSS to generate a software vsync interrupt=
 when the<br>
&gt; &gt;&gt; hardware TE interrupt doesn&#39;t arrive.=C2=A0 Configuring t=
his to double the<br>
&gt; &gt;&gt; vtotal (like some downstream kernels) leads to a frame to tak=
e at most<br>
&gt; &gt;&gt; twice before the vsync signal, until hardware TE comes up.<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; In this case the hardware interrupt responsible for providing=
 this<br>
&gt; &gt;&gt; signal - &quot;disp-te&quot; gpio - is not hooked up to the m=
dp5 vsync/pp logic at<br>
&gt; &gt;&gt; all.=C2=A0 This solves severe panel update issues observed on=
 at least the<br>
&gt; &gt;&gt; Xperia Loire and Tone series, until said gpio is properly hoo=
ked up to<br>
&gt; &gt;&gt; an irq.<br>
&gt; &gt;<br>
&gt; &gt; The reason the CONFIG_HEIGHT was at such a high value is to make =
sure that<br>
&gt; &gt; we always get the TE only from the panel vsync and not false posi=
tives<br>
&gt; &gt; coming<br>
&gt; &gt; from the tear check logic itself.<br>
&gt; &gt;<br>
&gt; &gt; When you say that disp-te gpio is not hooked up, is it something<=
br>
&gt; &gt; incorrect with<br>
&gt; &gt; the schematic OR panel is not generating the TE correctly?<br>
&gt; &gt;<br>
&gt;<br>
&gt; Sometimes, some panels aren&#39;t getting correctly configured by the<=
br>
&gt; OEM/ODM in the first place: especially when porting devices from<br>
&gt; downstream to upstream, developers often get in a situation in which<b=
r>
&gt; their TE line is either misconfigured or the DriverIC is not configure=
d<br>
&gt; to raise V-Sync interrupts.<br>
&gt; Please remember: some DDICs need a &quot;commands sequence&quot; to en=
able<br>
&gt; generating the TE interrupts, sometimes this is not standard, and<br>
&gt; sometimes OEMs/ODMs are not even doing that in their downstream code<b=
r>
&gt; (but instead they work around it in creative ways &quot;for reasons&qu=
ot;, even<br>
&gt; though their DDIC supports indeed sending TE events).<br>
&gt;<br>
&gt; This mostly happens when bringing up devices that have autorefresh<br>
&gt; enabled from the bootloader (when the bootloader sets up the splash<br=
>
&gt; screen) by using simple-panel as a (hopefully) temporary solution to g=
et<br>
&gt; through the initial stages of porting.<br>
&gt;<br>
&gt; We are not trying to cover cases related to incorrect schematics or<br=
>
&gt; hardware mistakes here, as the fix for that - as you know - is to just=
<br>
&gt; fix your hardware.<br>
&gt; What we&#39;re trying to do here is to stop freezes and, in some cases=
,<br>
&gt; lockups, other than false positives making the developer go offroad wh=
en<br>
&gt; the platform shows that something is wrong during early porting.<br>
&gt;<br>
&gt; Also, sometimes, some DDICs will not generate TE interrupts when<br>
&gt; expected... in these cases we get a PP timeout and a MDP5 recovery: th=
is<br>
&gt; is totally avoidable if we rely on the 2*vtotal, as we wouldn&#39;t ge=
t<br>
&gt; through the very time consuming task of recovering the entire MDP.<br>
&gt;<br>
&gt; Of course, if something is wrong in the MDP and the block really needs=
<br>
&gt; recovery, this &quot;trick&quot; won&#39;t save anyone and the recover=
y will anyway be<br>
&gt; triggered, as the PP-done will anyway timeout.<br>
<br>
So, is this (mostly) a workaround due to TE not wired up?=C2=A0 In which<br=
>
case I think it is ok, but maybe should have a comment about the<br>
interaction with TE?<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"></blockquote></div></div><div dir=3D"auto">Mostly, yes.=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
Currently I have this patch in msm-next-staging but I guess we need to<br>
decide in the next day or so whether to drop it or smash in a comment?<br>
<br>
BR,<br>
-R<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></=
div></div><div dir=3D"auto">Marijn, can you please urgently throw a comment=
 in, reminding that these timers are interacting with TE and send a fast V2=
?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,=C2=A0</d=
iv><div dir=3D"auto">=C2=A0- Angelo</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Suggested-by: AngeloGioacchino Del Regno<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:angelogioacchino.delregno@somainline.or=
g" target=3D"_blank" rel=3D"noreferrer">angelogioacchino.delregno@somainlin=
e.org</a>&gt;<br>
&gt; &gt;&gt; Signed-off-by: Marijn Suijten &lt;<a href=3D"mailto:marijn.su=
ijten@somainline.org" target=3D"_blank" rel=3D"noreferrer">marijn.suijten@s=
omainline.org</a>&gt;<br>
&gt; &gt;&gt; Reviewed-by: AngeloGioacchino Del Regno<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:angelogioacchino.delregno@somainline.or=
g" target=3D"_blank" rel=3D"noreferrer">angelogioacchino.delregno@somainlin=
e.org</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 2 +-=
<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c=
<br>
&gt; &gt;&gt; b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c<br>
&gt; &gt;&gt; index ff2c1d583c79..2d5ac03dbc17 100644<br>
&gt; &gt;&gt; --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c<br>
&gt; &gt;&gt; +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c<br>
&gt; &gt;&gt; @@ -51,7 +51,7 @@ static int pingpong_tearcheck_setup(struct<=
br>
&gt; &gt;&gt; drm_encoder *encoder,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_CON=
FIG_VSYNC(pp_id), cfg);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 mdp5_write(mdp5_kms,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 REG_MDP5_PP_SYNC_CONFIG_HEIGHT(p=
p_id), 0xfff0);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 REG_MDP5_PP_SYNC_CONFIG_HEIGHT(p=
p_id), (2 * mode-&gt;vtotal));<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 mdp5_write(mdp5_kms,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REG_MDP5_PP_VSYNC_INIT_VAL(=
pp_id), mode-&gt;vdisplay);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 mdp5_write(mdp5_kms, REG_MDP5_PP_RD_PTR_I=
RQ(pp_id),<br>
&gt; &gt;&gt; mode-&gt;vdisplay + 1);<br>
</blockquote></div></div></div>

--0000000000008ad23305bf7e3c14--

--===============1642146574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1642146574==--
