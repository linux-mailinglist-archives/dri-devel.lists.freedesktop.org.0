Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4411A6D9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0353F6EAD2;
	Wed, 11 Dec 2019 09:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DD96EA9C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 09:18:58 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id x1so18987283qkl.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HKEkJlSc9PUHDbwOS6vfx+sFyodRNxa1XYp4dtKnetk=;
 b=uE+O7mcagMbDL+clpgKh8tDqCkZrsQ86Lr2uW7e7QMDmpBiNZom6KeOJD2RRkrInJ5
 2LMHujH4fxwxDzj0ryrw9djNN4lq7ZZ1WD8JabxkpnjJum+XoVzWvrVbYk9vTJscxj4t
 GfSad+mhibdJQyiFsNRY4wnZhwCPp67UqMkpL3WiJ4Qc2AbnHn+z/OsTCg/ex/BNibr2
 7gu9jV8qaQL/VqD6rB0mnnlTqftpr0olkbLwOwu0/MP7AJe7Bm8PMof4SqyVifFfoS6/
 m6FFrdfV75y729VF9BjIyZyawVZt3t2ONxc7ahTjVeSpRLzdQNUNuHGQVh2/iCVDtT0Q
 /kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HKEkJlSc9PUHDbwOS6vfx+sFyodRNxa1XYp4dtKnetk=;
 b=tpM5+vBipehQr5N762+W3Xq/P0C+UDXBleZl1SSNUVSVEc6P3gez2CT3oWeqMzzprK
 awEoRyf2cD6XaeybZcJFYmCP0urzhzpO/vO0TsrXXiLzg0UXWkVvWp6whNmk1L+AYgvr
 voEs4HjIJx9dQ/E+hHLevpg0zjdHVEnUigPYEpYsYg3yvLINUlTXZKBvgeeSqcA7DwVd
 VX8wgJ7f7kwxlEl6boNK9e0mZI/iDVulqtWhWofE8TvaXqid2I6AY/hUt9vRU2SFvUi7
 Vwm/6zbaiIpV10cfIqYVkXEo8SluOkTv+bjvv51j7s5EveO8KXCAmkVq0KuBuAdWyFUu
 9MYg==
X-Gm-Message-State: APjAAAUE8SjCcgGdhfmITTBYLfeQgvPIohHBZIt1k+ShTGxxUmrxkQ6Y
 +eOFnPKHSCIndCPKeI4e7XA7xsbdDmgfTC2WUJ/vT1Fp
X-Google-Smtp-Source: APXvYqzIUQgdCo1/5ayeK/0g6dI86WtIXWRqFbl9mgM7LykMOrY9ORAF9XSdcdbrTpia81Qfi1R9MiRfZZ7enxiGJBE=
X-Received: by 2002:a37:851:: with SMTP id 78mr1980287qki.266.1576055938134;
 Wed, 11 Dec 2019 01:18:58 -0800 (PST)
MIME-Version: 1.0
References: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
 <1575966995-13757-5-git-send-email-kevin3.tang@gmail.com>
 <CACvgo50Hgbb8ywX2RgFqkitxwBG64EhP9g1TSxgLkQf-6L6soA@mail.gmail.com>
In-Reply-To: <CACvgo50Hgbb8ywX2RgFqkitxwBG64EhP9g1TSxgLkQf-6L6soA@mail.gmail.com>
From: tang pengchuan <kevin3.tang@gmail.com>
Date: Wed, 11 Dec 2019 09:18:46 +0800
Message-ID: <CAFPSGXZMmfeBxkNhuNR59bX26_69_y5C13P7qY-UawVDa7Q3Jw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/8] drm/sprd: add Unisoc's drm display controller
 driver
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Baolin Wang <baolin.wang@linaro.org>, David Airlie <airlied@linux.ie>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: multipart/mixed; boundary="===============1042335071=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1042335071==
Content-Type: multipart/alternative; boundary="00000000000056b93605996a1e88"

--00000000000056b93605996a1e88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Emil Velikov <emil.l.velikov@gmail.com> =E4=BA=8E2019=E5=B9=B412=E6=9C=8811=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=881:14=E5=86=99=E9=81=93=EF=BC=
=9A

> Hi Kevin,
>
> On Tue, 10 Dec 2019 at 08:41, Kevin Tang <kevin3.tang@gmail.com> wrote:
> >
> > From: Kevin Tang <kevin.tang@unisoc.com>
> >
> > Adds DPU(Display Processor Unit) support for the Unisoc's display
> subsystem.
> > It's support multi planes, scaler, rotation, PQ(Picture Quality) and
> more.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Baolin Wang <baolin.wang@linaro.org>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  drivers/gpu/drm/sprd/Makefile       |    6 +-
> >  drivers/gpu/drm/sprd/disp_lib.c     |  290 +++++++
> >  drivers/gpu/drm/sprd/disp_lib.h     |   40 +
> >  drivers/gpu/drm/sprd/dpu/Makefile   |    8 +
> >  drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 1464
> +++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.c     | 1152 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h     |  217 ++++++
> >  7 files changed, 3176 insertions(+), 1 deletion(-)
>
> As we can see from the diff stat this patch is huge. So it would be fairl=
y
> hard
> to provide meaningful review as-is.
>
> One can combine my earlier suggestion (to keep modeset/atomic out of 2/8)=
,
> with
> the following split:
>  - 4/8 add basic atomic modeset support - one format, one rotation 0, no
> extra
>  attributes
>  - 5/8 add extra formats
>  - 6/8 add extra rotation support
>  - ... add custom attributes
>
Ok, i will split this patch, upstream modeset and atomic at first. clock,
gloabl, enhance, extra
attributes  and so on will be upload later.
>
>
> <snip>
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/disp_lib.c
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/disp_lib.h
>
> Let's keep this code out, for now. If we really need it we could
> revive/add it
> at a later stage.
>
Ok

>
> <snip>
>
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
> > @@ -0,0 +1,1464 @@
>
>
> > +struct gamma_entry {
> > +       u16 r;
> > +       u16 g;
> > +       u16 b;
> > +};
> > +
> Seem to be unused. Please drop this and double-check for other unused
> structs
>
>
> > +static struct scale_cfg scale_copy;
> > +static struct cm_cfg cm_copy;
> > +static struct slp_cfg slp_copy;
> > +static struct gamma_lut gamma_copy;
> > +static struct hsv_lut hsv_copy;
> > +static struct epf_cfg epf_copy;
> > +static u32 enhance_en;
> > +
> > +static DECLARE_WAIT_QUEUE_HEAD(wait_queue);
> > +static bool panel_ready =3D true;
> > +static bool need_scale;
> > +static bool mode_changed;
> > +static bool evt_update;
> > +static bool evt_stop;
> > +static u32 prev_y2r_coef;
> > +
> We should really avoid static variables. Some of the above look like
> enhancer
> state. One could create a struct keeping it alongside the rest of the
> display
> pipeline, right?
>
>
> <snip>
>
> > +static void dpu_enhance_backup(u32 id, void *param)
> > +{
> As the enhance code is fairly large, lets keep the portions to a separate
> patch.
>
enhance code is  a big feature, so i will removed it at first commit.

>
>
> <snip>
>
> > +static struct dpu_core_ops dpu_r2p0_ops =3D {
> Nit: as a general rule ops should be const.
>
>
> > +static int __init dpu_core_register(void)
> > +{
> > +       return dpu_core_ops_register(&entry);
> > +}
> > +
> > +subsys_initcall(dpu_core_register);
> I think that subsys_initcall, __init and MODULE area applicable only
> when we have multiple
> modules. Not 100% sure though ;-)
>
Yes, our display controller have multiple ip version, every version maybe
different

>
>
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c
> b/drivers/gpu/drm/sprd/sprd_dpu.c
> > new file mode 100644
> > index 0000000..43142b3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
>
> > +struct sprd_plane {
> > +       struct drm_plane plane;
> > +       struct drm_property *alpha_property;
> > +       struct drm_property *blend_mode_property;
> Core DRM already has alpha and blend_mode properties. Please reuse the co=
de
>
>
> > +       struct drm_property *fbc_hsize_r_property;
> > +       struct drm_property *fbc_hsize_y_property;
> > +       struct drm_property *fbc_hsize_uv_property;
> > +       struct drm_property *y2r_coef_property;
> > +       struct drm_property *pallete_en_property;
> > +       struct drm_property *pallete_color_property;
> Let's have these properties introduced with separate follow-up patches.
> Please mention, in the commit message, why they are specific to the drive=
r.
>
Ok, i will split it and commit later...

>
>
> <snip>
>
> > +static int sprd_dpu_init(struct sprd_dpu *dpu)
> > +{
> > +       struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +       down(&ctx->refresh_lock);
> > +
> > +       if (dpu->ctx.is_inited) {
> > +               up(&ctx->refresh_lock);
> > +               return 0;
> > +       }
> > +
> > +       if (dpu->glb && dpu->glb->power)
> > +               dpu->glb->power(ctx, true);
> > +       if (dpu->glb && dpu->glb->enable)
> > +               dpu->glb->enable(ctx);
> > +
> > +       if (ctx->is_stopped && dpu->glb && dpu->glb->reset)
> > +               dpu->glb->reset(ctx);
> > +
> > +       if (dpu->clk && dpu->clk->init)
> > +               dpu->clk->init(ctx);
> > +       if (dpu->clk && dpu->clk->enable)
> > +               dpu->clk->enable(ctx);
> > +
> > +       if (dpu->core && dpu->core->init)
> > +               dpu->core->init(ctx);
> > +       if (dpu->core && dpu->core->ifconfig)
> > +               dpu->core->ifconfig(ctx);
> > +
> Hmm I can see the core, clk and glb (ops) being added to the respective
> lists.
> Yet the code which adds those to the dpu isn't so obvious. Where is it?
>
clk and glb ops have not been submitted, so i will remove clk and glb ops
at first.

>
>
> > +       ctx->is_inited =3D true;
> > +
> Nit: is_inited -> initialized
>
>
>
> <snip>
>
> > +struct dpu_core_ops {
> > +       int (*parse_dt)(struct dpu_context *ctx,
> > +                       struct device_node *np);
> > +       u32 (*version)(struct dpu_context *ctx);
> > +       int (*init)(struct dpu_context *ctx);
> > +       void (*uninit)(struct dpu_context *ctx);
> > +       void (*run)(struct dpu_context *ctx);
> > +       void (*stop)(struct dpu_context *ctx);
> > +       void (*disable_vsync)(struct dpu_context *ctx);
> > +       void (*enable_vsync)(struct dpu_context *ctx);
> > +       u32 (*isr)(struct dpu_context *ctx);
> > +       void (*ifconfig)(struct dpu_context *ctx);
> > +       void (*write_back)(struct dpu_context *ctx, u8 count, bool
> debug);
> > +       void (*flip)(struct dpu_context *ctx,
> > +                    struct sprd_dpu_layer layers[], u8 count);
> > +       int (*capability)(struct dpu_context *ctx,
> > +                       struct dpu_capability *cap);
> > +       void (*bg_color)(struct dpu_context *ctx, u32 color);
> > +       void (*enhance_set)(struct dpu_context *ctx, u32 id, void
> *param);
> > +       void (*enhance_get)(struct dpu_context *ctx, u32 id, void
> *param);
> > +       int (*modeset)(struct dpu_context *ctx,
> > +                       struct drm_mode_modeinfo *mode);
> > +       bool (*check_raw_int)(struct dpu_context *ctx, u32 mask);
> > +};
> > +
> > +struct dpu_clk_ops {
> > +       int (*parse_dt)(struct dpu_context *ctx,
> > +                       struct device_node *np);
> > +       int (*init)(struct dpu_context *ctx);
> > +       int (*uinit)(struct dpu_context *ctx);
> > +       int (*enable)(struct dpu_context *ctx);
> > +       int (*disable)(struct dpu_context *ctx);
> > +       int (*update)(struct dpu_context *ctx, int clk_id, int val);
> > +};
> > +
> > +struct dpu_glb_ops {
> > +       int (*parse_dt)(struct dpu_context *ctx,
> > +                       struct device_node *np);
> > +       void (*enable)(struct dpu_context *ctx);
> > +       void (*disable)(struct dpu_context *ctx);
> > +       void (*reset)(struct dpu_context *ctx);
> > +       void (*power)(struct dpu_context *ctx, int enable);
> > +};
> > +
> Some of the above seem unused - parse_dt for example. Please drop the dea=
d
> code.
>
>
> HTH
> Emil
>

--00000000000056b93605996a1e88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Emil Velikov &lt;<a href=3D"mailto:emil=
.l.velikov@gmail.com">emil.l.velikov@gmail.com</a>&gt; =E4=BA=8E2019=E5=B9=
=B412=E6=9C=8811=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=881:14=E5=86=99=
=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Kevin,<br>
<br>
On Tue, 10 Dec 2019 at 08:41, Kevin Tang &lt;<a href=3D"mailto:kevin3.tang@=
gmail.com" target=3D"_blank">kevin3.tang@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com" target=
=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt;<br>
&gt; Adds DPU(Display Processor Unit) support for the Unisoc&#39;s display =
subsystem.<br>
&gt; It&#39;s support multi planes, scaler, rotation, PQ(Picture Quality) a=
nd more.<br>
&gt;<br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Baolin Wang &lt;<a href=3D"mailto:baolin.wang@linaro.org" target=
=3D"_blank">baolin.wang@linaro.org</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 6 +-<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/disp_lib.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 290 +=
++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/disp_lib.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A040 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +=
<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c | 1464 +++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.c=C2=A0 =C2=A0 =C2=A0| 1152 ++++++=
+++++++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 217 +=
+++++<br>
&gt;=C2=A0 7 files changed, 3176 insertions(+), 1 deletion(-)<br>
<br>
As we can see from the diff stat this patch is huge. So it would be fairly =
hard<br>
to provide meaningful review as-is.<br>
<br>
One can combine my earlier suggestion (to keep modeset/atomic out of 2/8), =
with<br>
the following split:<br>
=C2=A0- 4/8 add basic atomic modeset support - one format, one rotation 0, =
no extra<br>
=C2=A0attributes<br>
=C2=A0- 5/8 add extra formats<br>
=C2=A0- 6/8 add extra rotation support<br>
=C2=A0- ... add custom attributes<br></blockquote><div>Ok, i will split thi=
s patch, upstream modeset and atomic at first. clock, gloabl, enhance, extr=
a</div>attributes=C2=A0 and so on will be upload later.<blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
&lt;snip&gt;<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/disp_lib.c<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/disp_lib.h<br>
<br>
Let&#39;s keep this code out, for now. If we really need it we could revive=
/add it<br>
at a later stage.<br></blockquote><div>Ok=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&lt;snip&gt;<br>
<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/dpu/dpu_r2p0.c<br>
&gt; @@ -0,0 +1,1464 @@<br>
<br>
<br>
&gt; +struct gamma_entry {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 g;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 b;<br>
&gt; +};<br>
&gt; +<br>
Seem to be unused. Please drop this and double-check for other unused struc=
ts<br>
<br>
<br>
&gt; +static struct scale_cfg scale_copy;<br>
&gt; +static struct cm_cfg cm_copy;<br>
&gt; +static struct slp_cfg slp_copy;<br>
&gt; +static struct gamma_lut gamma_copy;<br>
&gt; +static struct hsv_lut hsv_copy;<br>
&gt; +static struct epf_cfg epf_copy;<br>
&gt; +static u32 enhance_en;<br>
&gt; +<br>
&gt; +static DECLARE_WAIT_QUEUE_HEAD(wait_queue);<br>
&gt; +static bool panel_ready =3D true;<br>
&gt; +static bool need_scale;<br>
&gt; +static bool mode_changed;<br>
&gt; +static bool evt_update;<br>
&gt; +static bool evt_stop;<br>
&gt; +static u32 prev_y2r_coef;<br>
&gt; +<br>
We should really avoid static variables. Some of the above look like enhanc=
er<br>
state. One could create a struct keeping it alongside the rest of the displ=
ay<br>
pipeline, right?<br>
<br>
<br>
&lt;snip&gt;<br>
<br>
&gt; +static void dpu_enhance_backup(u32 id, void *param)<br>
&gt; +{<br>
As the enhance code is fairly large, lets keep the portions to a separate p=
atch.<br></blockquote><div>enhance code is=C2=A0 a big feature, so i will r=
emoved it at first commit.</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
<br>
&lt;snip&gt;<br>
<br>
&gt; +static struct dpu_core_ops dpu_r2p0_ops =3D {<br>
Nit: as a general rule ops should be const.<br>
<br>
<br>
&gt; +static int __init dpu_core_register(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return dpu_core_ops_register(&amp;entry);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +subsys_initcall(dpu_core_register);<br>
I think that subsys_initcall, __init and MODULE area applicable only<br>
when we have multiple<br>
modules. Not 100% sure though ;-)<br></blockquote><div>Yes, our display con=
troller have multiple ip version, every version maybe different</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sp=
rd_dpu.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..43142b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.c<br>
<br>
&gt; +struct sprd_plane {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *alpha_property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *blend_mode_property;<=
br>
Core DRM already has alpha and blend_mode properties. Please reuse the code=
<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *fbc_hsize_r_property;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *fbc_hsize_y_property;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *fbc_hsize_uv_property=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *y2r_coef_property;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *pallete_en_property;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *pallete_color_propert=
y;<br>
Let&#39;s have these properties introduced with separate follow-up patches.=
<br>
Please mention, in the commit message, why they are specific to the driver.=
<br></blockquote><div>Ok, i will split it and commit later...=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&lt;snip&gt;<br>
<br>
&gt; +static int sprd_dpu_init(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;c=
tx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0down(&amp;ctx-&gt;refresh_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;ctx.is_inited) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0up(&amp;ctx-&g=
t;refresh_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;glb &amp;&amp; dpu-&gt;glb-&gt=
;power)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;glb-&g=
t;power(ctx, true);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;glb &amp;&amp; dpu-&gt;glb-&gt=
;enable)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;glb-&g=
t;enable(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;is_stopped &amp;&amp; dpu-&gt;=
glb &amp;&amp; dpu-&gt;glb-&gt;reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;glb-&g=
t;reset(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;clk &amp;&amp; dpu-&gt;clk-&gt=
;init)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;clk-&g=
t;init(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;clk &amp;&amp; dpu-&gt;clk-&gt=
;enable)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;clk-&g=
t;enable(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;init)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;init(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dpu-&gt;core &amp;&amp; dpu-&gt;core-&=
gt;ifconfig)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu-&gt;core-&=
gt;ifconfig(ctx);<br>
&gt; +<br>
Hmm I can see the core, clk and glb (ops) being added to the respective lis=
ts.<br>
Yet the code which adds those to the dpu isn&#39;t so obvious. Where is it?=
<br></blockquote><div>clk and glb ops have not been submitted, so i will re=
move clk and glb ops at first.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;is_inited =3D true;<br>
&gt; +<br>
Nit: is_inited -&gt; initialized<br>
<br>
<br>
<br>
&lt;snip&gt;<br>
<br>
&gt; +struct dpu_core_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*parse_dt)(struct dpu_context *ctx,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct device_node *np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 (*version)(struct dpu_context *ctx);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*init)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*uninit)(struct dpu_context *ctx);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*run)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*stop)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*disable_vsync)(struct dpu_context *=
ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*enable_vsync)(struct dpu_context *c=
tx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 (*isr)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*ifconfig)(struct dpu_context *ctx);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*write_back)(struct dpu_context *ctx=
, u8 count, bool debug);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*flip)(struct dpu_context *ctx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct sprd_dpu_layer layers[], u8 count);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*capability)(struct dpu_context *ctx,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct dpu_capability *cap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*bg_color)(struct dpu_context *ctx, =
u32 color);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*enhance_set)(struct dpu_context *ct=
x, u32 id, void *param);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*enhance_get)(struct dpu_context *ct=
x, u32 id, void *param);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*modeset)(struct dpu_context *ctx,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct drm_mode_modeinfo *mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool (*check_raw_int)(struct dpu_context *=
ctx, u32 mask);<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dpu_clk_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*parse_dt)(struct dpu_context *ctx,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct device_node *np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*init)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*uinit)(struct dpu_context *ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*enable)(struct dpu_context *ctx);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*disable)(struct dpu_context *ctx);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*update)(struct dpu_context *ctx, int=
 clk_id, int val);<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct dpu_glb_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*parse_dt)(struct dpu_context *ctx,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0struct device_node *np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*enable)(struct dpu_context *ctx);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*disable)(struct dpu_context *ctx);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*reset)(struct dpu_context *ctx);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*power)(struct dpu_context *ctx, int=
 enable);<br>
&gt; +};<br>
&gt; +<br>
Some of the above seem unused - parse_dt for example. Please drop the dead =
code.<br>
<br>
<br>
HTH<br>
Emil<br>
</blockquote></div></div>

--00000000000056b93605996a1e88--

--===============1042335071==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1042335071==--
