Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06069F300C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 13:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45110E3A8;
	Mon, 16 Dec 2024 12:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VHlQp/aa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2251310E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 12:05:13 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3ebb2d8dac4so1257864b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 04:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734350712; x=1734955512;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8K1cOj7kv2D78Ieg03Jcwx7V33fuxfxbjFiWT6wznKI=;
 b=VHlQp/aaKHF9zI8Zt+LLRq8WsJOFMGYpWDWKFqBGnNRVpvXTUjLWLoCCP5PxjBCRrr
 SsLTisptcz4O7t2UioBhu9GrMezXER3MdGMoYh9pVGQ1wiq7u2E2iFv6pGn4EJzkaHvc
 trkkBm1eLF1yfPGIq8tkNSzcRG4WRtmnNSnbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734350712; x=1734955512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8K1cOj7kv2D78Ieg03Jcwx7V33fuxfxbjFiWT6wznKI=;
 b=OIHg8nnG2XhG+kKQjwuidJtmNQtEJv7BJisUDLH5XVPkJklv+rZ2rKsrdPDJsZv+H6
 08AfbqbtWEEFIRdYouL52GFyEh291NBQGNQR1didhcO7X0fA3YgTLgpqU9p6+WQ6vpi+
 N+2EGBNRpm5LQ4E0Xb9aRwrtA0QQNsO6LszeYKpsTAYPy4SscIQEbGdMpuCxZmM7cDTK
 4DvW9G2BbnX8ArpUSbehLHByI02tuIcb81/XRGtmf8t5AlY2/D0fmbnOFWbcNH/VAFGA
 1M7ttRR6OPEPhtY8O6EQK8hAknCJ8ANeAgET6zo4Cv8qEm5lB3HTnx4kuXi1+8AZ/688
 z3Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFfMSRmFmGvt6xOKVLQ2chVkCBmPNRdONhpgy8pMdZjAUIsqq87Ct7vhT5ig05SOKb388oMKEz7ik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjkyvY4OPZHf5tLQ721LaGEgVgw/eEjrkxr6wNEYhHKRKfs5az
 xFx1RzjfsDf+JdeLrZqtIgb6j8L7J6a13tRQqRxpTQTtsbMH841YXcpMNiFcpDn2bIw3BqkZ751
 7lmKhTR5Xd/i3csRMAc+bAuo8GDdzXwngRSN5
X-Gm-Gg: ASbGnct9wkH8BF1CjiP1BW1ia72xYsdocD669blWbb0hEmrHrESQlyyIKW5vZsflcCH
 NdTqr20NuLVbb4IWCcdalTDngo6KboR/E6AIszU83/m8Em98eqxyWFlbG1MzwvvNR2g==
X-Google-Smtp-Source: AGHT+IFavBk8Ryu/l2uAQIDip7R+XM8dm18vcpg1mDMUpMh3XpLIH+220bTofmhEwfydO6ojOcNXAm0rpubsiv89piQ=
X-Received: by 2002:a05:6808:f01:b0:3eb:3b6e:a74b with SMTP id
 5614622812f47-3eba686b29dmr6832115b6e.17.1734350712192; Mon, 16 Dec 2024
 04:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20241212055110.1862487-1-xji@analogixsemi.com>
 <vkrl7om7hepboovp2uivcnernia3ygqwrj3y3kkjydeclwvrk5@7tkdc4etkcjs>
 <BY5PR04MB673977C1DB1E774CB261C119C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
 <4q2jncpnmeu7ytuyuv5pjzurh3ai5663jmu2we6cebuad2r3r5@tfb6hf6unioc>
 <BY5PR04MB673902E047FF8ADAFD8B94B3C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
 <CAA8EJprGjuGFjZnXUxiMZMV=FO9O9CYt06H_nSL82fEOvPytyA@mail.gmail.com>
 <BY5PR04MB6739C5804F0E9764EFD3A3EBC73B2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <fyltwqxyrmy3rz75nosc4wn6z5zglwv7pelzdf5g6ztloq4ncj@yigwmszuhigb>
In-Reply-To: <fyltwqxyrmy3rz75nosc4wn6z5zglwv7pelzdf5g6ztloq4ncj@yigwmszuhigb>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 16 Dec 2024 20:05:00 +0800
Message-ID: <CAEXTbpf3Bipid7bgnYzGJ6C6d+pgPcA2mjwFijSBwz_6Ub4aaw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
 atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 "treapking@google.com" <treapking@google.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Dmitry,

On Mon, Dec 16, 2024 at 7:59=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Dec 16, 2024 at 08:33:23AM +0000, Xin Ji wrote:
> > > -----Original Message-----
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Sent: Friday, December 13, 2024 9:17 PM
> > > To: Xin Ji <xji@analogixsemi.com>
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent =
Pinchart
> > > <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>;
> > > Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.or=
g>;
> > > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bernie Liang
> > > <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com>;
> > > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > > kernel@vger.kernel.org
> > > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > > atomic_enable()
> > >
> > > CAUTION: This email originated from outside of the organization. Plea=
se do not
> > > click links or open attachments unless you recognize the sender, and =
know the
> > > content is safe.
> > >
> > >
> > > On Fri, 13 Dec 2024 at 13:00, Xin Ji <xji@analogixsemi.com> wrote:
> > > >
> > > > Hi Dmitry, sorry, I didn't clear describe the reason.
> > >
> > > Please. Do not top-post. Please paste your answer under the question,=
 not
> > > somewhere at the top of the email. This allows us to have a more cons=
tructive
> > > dialog. Additional bonus if you can fix your email client to insert s=
ensible quoting
> > > information instead of dumping the headers of the original email.
> > Hi Dmitry, OK, sorry about it. Currently, we have problem to fetch emai=
l from
> > Microsoft on Ubuntu. I'll try to fix it later.
> > >
> > > >
> > > > Anx7625 implement DSI to DP convert behind USB Type-C port, when us=
er
> > > > plug into USB Type-C Dongle with DP monitor, the user space will
> > > > enable HDCP feature, then kernel do HDCP and output display and set
> > > > HDCP content to ENABLE, but the issue happened if user manually cha=
nge the
> > > monitor's resolution later.
> > > >
> > > > Each time user change the resolution, kernel will call bridge
> > > > interface .atomic_disable() and .atomic_enable(), the old driver wi=
ll
> > > > keep HDCP state to ENABLE, this is a BUG, when user change the
> > > > resolution, kernel must change HDCP content too (mustn't keep to
> > > > ENABLE),
> > >
> > > Why? Could you please point me to the corresponding documentation or =
a code
> > > path in the other driver? Preferably i915, AMD or Nouveau.
> > As https://elixir.bootlin.com/linux/v6.12.5/source/drivers/gpu/drm/drm_=
connector.c#L1423:
> >         - ENABLED -> DESIRED (termination of authentication)
> > As there is no other interface to tell anx7625 bridge driver, so the I =
think best place to handle
> > ENABLE -> DESIRED in .atomic_disable().
>
> I was looking for something like cdns_mhdp_connector_atomic_check(),
> which switches to UNDESIRED if there is no new CRTC. Likewise i915
> driver performs this in intel_hdcp_atomic_check() if there is a need for
> modeset.

I believe you mean "DESIRED" here.
>
> For the "termination of authentication" case see
> cdns_mhdp_hdcp_check_link(), which detects if the HDCP got disabled by
> HW and then updates the status accordingly.
>
> >
> > >
> > > > as DRM doc said, kernel cannot change from ENABLE to UNDESIRE, so n=
ext
> > > > patch, I'll change it to DESIRE in .atomic_disable().
>
> This e.g. will result in HDCP being restarted for all modesets. Is this
> an expected behaviour?

The bridge could be powered off between .atomic_disable() and
.atomic_enable(), though I'm not sure if this would be a concern for
anx7625. I'll let Xin to comment on this.
>
> > > >
> > > > Thanks!
> > > > Xin
> > > >
> > > > > -----Original Message-----
> > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Sent: Friday, December 13, 2024 6:47 PM
> > > > > To: Xin Ji <xji@analogixsemi.com>
> > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laur=
ent
> > > > > Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman
> > > > > <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>;
> > > > > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Rip=
ard
> > > > > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> > > David
> > > > > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bern=
ie
> > > > > Liang <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com=
>;
> > > > > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > > > > kernel@vger.kernel.org
> > > > > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > > > > atomic_enable()
> > > > >
> > > > > CAUTION: This email originated from outside of the organization.
> > > > > Please do not click links or open attachments unless you recogniz=
e
> > > > > the sender, and know the content is safe.
> > > > >
> > > > >
> > > > > On Fri, Dec 13, 2024 at 10:06:36AM +0000, Xin Ji wrote:
> > > > > > Hi Dmitry, thanks for the review, I made some changes which cha=
nge
> > > > > > ENABLE to DESIRE in .atomic_disable(), I'll upstream it after t=
esting. Thanks!
> > > > >
> > > > > - Please don't top-post.
> > > > >
> > > > > - You still didn't explain, why do you want to do this change of =
HDCP
> > > > >   status. Could you please provide an explanation before sending =
the
> > > > >   next iteration?
> > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > Sent: Thursday, December 12, 2024 5:18 PM
> > > > > > > To: Xin Ji <xji@analogixsemi.com>
> > > > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > > > > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>;
> > > > > > > Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas
> > > > > > > Karlman <jonas@kwiboo.se>; Jernej Skrabec
> > > > > > > <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > > > > > > <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > > > > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>=
;
> > > > > David
> > > > > > > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>;
> > > > > > > Bernie Liang <bliang@analogixsemi.com>; Qilin Wen
> > > > > > > <qwen@analogixsemi.com>; treapking@google.com;
> > > > > > > dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.or=
g
> > > > > > > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP statu=
s
> > > > > > > at
> > > > > > > atomic_enable()
> > > > > > >
> > > > > > > CAUTION: This email originated from outside of the organizati=
on.
> > > > > > > Please do not click links or open attachments unless you
> > > > > > > recognize the sender, and know the content is safe.
> > > > > > >
> > > > > > >
> > > > > > > On Thu, Dec 12, 2024 at 01:51:10PM +0800, Xin Ji wrote:
> > > > > > > > When user enabled HDCP feature, userspace will set HDCP
> > > > > > > > content to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next,
> > > anx7625
> > > > > > > > will
> > > > > update
> > > > > > > HDCP
> > > > > > > > content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down
> > > > > stream
> > > > > > > support
> > > > > > > > HDCP feature.
> > > > > > > >
> > > > > > > > However once HDCP content turn to
> > > > > > > DRM_MODE_CONTENT_PROTECTION_ENABLED
> > > > > > > > userspace will not update the HDCP content to
> > > > > > > > DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor
> > > > > disconnect.
> > > > > > >
> > > > > > > It seems you've ingored a part of the previous review comment=
.
> > > > > > > It's the userspace who triggers the ENABLED -> UNDESIRED
> > > > > > > transition, not the kernel side. The change to move HDCP
> > > > > > > handling to atomic_enable() looks fine, the change to disable
> > > > > > > HDCP is not (unless I misunderstand
> > > > > something).
> > > > > > >
> > > > > > > >
> > > > > > > > So, anx7625 driver move hdcp content value checking from
> > > > > > > > bridge interface .atomic_check() to .atomic_enable(), then
> > > > > > > > update hdcp content according from currently HDCP status. A=
nd
> > > > > > > > also disabled HDCP in bridge interface .atomic_disable().
> > > > > > > >
> > > > > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 74
> > > > > > > > ++++++++++++++---------
> > > > > > > >  1 file changed, 46 insertions(+), 28 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > index a2675b121fe4..f96ce5665e8d 100644
> > > > > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > > > > @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct
> > > > > > > > anx7625_data
> > > > > > > *ctx)
> > > > > > > >                                TX_HDCP_CTRL0, ~HARD_AUTH_EN=
 &
> > > > > > > > 0xFF); }
> > > > > > > >
> > > > > > > > +static void anx7625_hdcp_disable_and_update_cp(struct
> > > > > > > > +anx7625_data
> > > > > > > > +*ctx) {
> > > > > > > > +     struct device *dev =3D ctx->dev;
> > > > > > > > +
> > > > > > > > +     if (!ctx->connector)
> > > > > > > > +             return;
> > > > > > > > +
> > > > > > > > +     anx7625_hdcp_disable(ctx);
> > > > > > > > +
> > > > > > > > +     ctx->hdcp_cp =3D DRM_MODE_CONTENT_PROTECTION_UNDESIRE=
D;
> > > > > > > > +     drm_hdcp_update_content_protection(ctx->connector,
> > > > > > > > +                                        ctx->hdcp_cp);
> > > > > > > > +
> > > > > > > > +     dev_dbg(dev, "update CP to UNDESIRE\n"); }
> > > > > > > > +
> > > > > > > >  static int anx7625_hdcp_enable(struct anx7625_data *ctx)  =
{
> > > > > > > >       u8 bcap;
> > > > > > > > @@ -2149,34 +2165,6 @@ static int
> > > > > > > > anx7625_connector_atomic_check(struct
> > > > > > > anx7625_data *ctx,
> > > > > > > >       if (cp =3D=3D ctx->hdcp_cp)
> > > > > > > >               return 0;
> > > > > > > >
> > > > > > > > -     if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > > > > > > -             if (ctx->dp_en) {
> > > > > > > > -                     dev_dbg(dev, "enable HDCP\n");
> > > > > > > > -                     anx7625_hdcp_enable(ctx);
> > > > > > > > -
> > > > > > > > -                     queue_delayed_work(ctx->hdcp_workqueu=
e,
> > > > > > > > -                                        &ctx->hdcp_work,
> > > > > > > > -                                        msecs_to_jiffies(2=
000));
> > > > > > > > -             }
> > > > > > > > -     }
> > > > > > > > -
> > > > > > > > -     if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED) =
{
> > > > > > > > -             if (ctx->hdcp_cp !=3D
> > > > > DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > > > > > -                     dev_err(dev, "current CP is not ENABL=
ED\n");
> > > > > > > > -                     return -EINVAL;
> > > > > > > > -             }
> > > > > > > > -             anx7625_hdcp_disable(ctx);
> > > > > > > > -             ctx->hdcp_cp =3D
> > > DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > > > > > > -             drm_hdcp_update_content_protection(ctx->conne=
ctor,
> > > > > > > > -                                                ctx->hdcp_=
cp);
> > > > > > > > -             dev_dbg(dev, "update CP to UNDESIRE\n");
> > > > > > > > -     }
> > > > > > > > -
> > > > > > > > -     if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > > > > > -             dev_err(dev, "Userspace illegal set to PROTEC=
TION ENABLE\n");
> > > > > > > > -             return -EINVAL;
> > > > > > > > -     }
> > > > > > > > -
> > > > > > > >       return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > @@ -2425,6 +2413,8 @@ static void
> > > > > > > > anx7625_bridge_atomic_enable(struct
> > > > > > > drm_bridge *bridge,
> > > > > > > >       struct anx7625_data *ctx =3D bridge_to_anx7625(bridge=
);
> > > > > > > >       struct device *dev =3D ctx->dev;
> > > > > > > >       struct drm_connector *connector;
> > > > > > > > +     struct drm_connector_state *conn_state;
> > > > > > > > +     int cp;
> > > > > > > >
> > > > > > > >       dev_dbg(dev, "drm atomic enable\n");
> > > > > > > >
> > > > > > > > @@ -2439,6 +2429,32 @@ static void
> > > > > > > > anx7625_bridge_atomic_enable(struct
> > > > > > > drm_bridge *bridge,
> > > > > > > >       _anx7625_hpd_polling(ctx, 5000 * 100);
> > > > > > > >
> > > > > > > >       anx7625_dp_start(ctx);
> > > > > > > > +
> > > > > > > > +     conn_state =3D
> > > > > > > > + drm_atomic_get_new_connector_state(state->base.state,
> > > > > > > > + connector);
> > > > > > > > +
> > > > > > > > +     if (WARN_ON(!conn_state))
> > > > > > > > +             return;
> > > > > > > > +
> > > > > > > > +     cp =3D conn_state->content_protection;
> > > > > > > > +     if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > > > > > > +             if (ctx->dp_en) {
> > > > > > > > +                     dev_dbg(dev, "enable HDCP\n");
> > > > > > > > +                     anx7625_hdcp_enable(ctx);
> > > > > > > > +
> > > > > > > > +                     queue_delayed_work(ctx->hdcp_workqueu=
e,
> > > > > > > > +                                        &ctx->hdcp_work,
> > > > > > > > +                                        msecs_to_jiffies(2=
000));
> > > > > > > > +             }
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     if (cp =3D=3D DRM_MODE_CONTENT_PROTECTION_UNDESIRED) =
{
> > > > > > > > +             if (ctx->hdcp_cp !=3D
> > > > > DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > > > > > +                     dev_err(dev, "current CP is not ENABL=
ED\n");
> > > > > > > > +                     return;
> > > > > > > > +             }
> > > > > > > > +
> > > > > > > > +             anx7625_hdcp_disable_and_update_cp(ctx);
> > > > > > > > +     }
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void anx7625_bridge_atomic_disable(struct drm_bridg=
e
> > > > > > > > *bridge, @@ -2449,6 +2465,8 @@ static void
> > > > > > > > anx7625_bridge_atomic_disable(struct
> > > > > > > > drm_bridge *bridge,
> > > > > > > >
> > > > > > > >       dev_dbg(dev, "drm atomic disable\n");
> > > > > > > >
> > > > > > > > +     anx7625_hdcp_disable_and_update_cp(ctx);
> > > > > > > > +
> > > > > > > >       ctx->connector =3D NULL;
> > > > > > > >       anx7625_dp_stop(ctx);
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.25.1
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > With best wishes
> > > > > > > Dmitry
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

Regards,
Pin-yen
