Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E65D91671C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741A610E047;
	Tue, 25 Jun 2024 12:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G0w6FfIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A6E10E047
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:13:52 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a72517e6225so294963566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719317631; x=1719922431;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aqlN25UlqZjEdbsm+c0y2Igx5fr3O3fLmRuZB5TvsM=;
 b=G0w6FfIa4HQMlWFojgNI0KAWYRlxfxOC5KfK3MwDOdaHwMlMXXNLBPD05exD2a8EWL
 FzgBDKNouRN4QFGCmPvpubS+Jx0f81XXReZppqg7M+Tg6WJquMpnm5wVRnIGFZBLT9oB
 xZqZXxqzMPqnx6y3c3g16kdstZcK/erRWOBIcBgqeLCcH0qCgMspAUfjWNAy8hdOrxH+
 m9I9RnTW7uVlfY6aiytc7vJpjIiempnrtqCi+iFIYCeVVpZbMQUm5ZaYSQFMXY/hzO+Y
 MlZqPx3lNYessFVwnJOMagu+yfy30nsWVgswkkfPOwWSHRYxNntENsrPd+n9fnCmh/aL
 R9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719317631; x=1719922431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aqlN25UlqZjEdbsm+c0y2Igx5fr3O3fLmRuZB5TvsM=;
 b=u60Q4gezyeFkqyvmKptMhuRV4QexW+3bNusGwPy8PlCeCDY53PCO1C0jnfpS4SRPyf
 47hZJa5Xbag6OiXRn1kuytY2lhoxlOXOORh6ACQXPrS2vLiCJNXPEDJEjcuDi4tOGaim
 0WbjWGMXg2GFNP9l630oYxxAJFrOAIcK0gSFKI/XrGW2lib/sah6Xa/vhjcrjS2ht1Iv
 XnIEFSawpfpdDgEg8Az4D0UNPGmzuAH2vOsIo0FRdL3uniIxY1la/pHFd182q2qzoXIJ
 tttCWCkwykhyjZZlcwUmvWrLRohhuf640QyFka4WDl5qcnwerNhnRJ4MMM1J/1VvAAs+
 pnlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp1DipAI/lHCy/EvEcb6UOzc6TsfaGFz3K3mWMBFzBiLHm4YrGelIvo9J+J1+dRWzbZjcl0HwaFYzDgGomOI/CU4OY2tMiOF0tYuoHhwXC
X-Gm-Message-State: AOJu0YxubBlkFUenHVzfRyuu0YqdCNOGTqVOqceWm2roPCIanSVLfhc4
 w7/TcV/65+P78Qy/k4KWLtsqfOwMIMkMEUoNqKB6DylM7oL5asaqA1EOc4QE2j9jVwa8eSp/GCv
 L593MpPz6R7plnH/wixSVD+eAdRbSwWW5WKL+4Q==
X-Google-Smtp-Source: AGHT+IHnx3byeR6SWSyo0RC+TkodiX814p8nMvNg+URFKCyjYQAqtSA26OzrFjigEwWHlCmMsfRBmsFbEJ+5T61424E=
X-Received: by 2002:a17:906:230d:b0:a6f:50ae:e0a with SMTP id
 a640c23a62f3a-a715f978a7amr456836266b.37.1719317630566; Tue, 25 Jun 2024
 05:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240624141926.5250-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <de8ab492-272c-4bed-92eb-a0c3303543b2@quicinc.com>
In-Reply-To: <de8ab492-272c-4bed-92eb-a0c3303543b2@quicinc.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Tue, 25 Jun 2024 20:13:39 +0800
Message-ID: <CA+6=WdSDSvcMJsmUNW6NXqNXktYjp0xdqk8Y+FakiPBYcXfgGw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] drm/panel: jd9365da: Modify the method of sending
 commands
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 jagan@edgeble.ai, neil.armstrong@linaro.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Shuijing Li <shuijing.li@mediatek.corp-partner.google.com>
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

On Tue, Jun 25, 2024 at 7:41=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
>
>
> On 6/24/2024 7:19 AM, Zhaoxiong Lv wrote:
> > Currently, the init_code of the jd9365da driver is placed
> > in the enable() function and sent, but this seems to take
> > a long time. It takes 17ms to send each instruction (an init
> > code consists of about 200 instructions), so it takes
> > about 3.5s to send the init_code. So we moved the sending
> > of the inti_code to the prepare() function, and each
> > instruction seemed to take only 25=CE=BCs.
> >
> > We checked the DSI host and found that the difference in
> > command sending time is caused by the different modes of
> > the DSI host in prepare() and enable() functions.
> > Our DSI Host only supports sending cmd in LP mode, The
> > prepare() function can directly send init_code (LP->cmd)
> > in LP mode, but the enable() function is in HS mode and
> > needs to switch to LP mode before sending init code
> > (HS->LP->cmd->HS). Therefore, it takes longer to send
> > the command.
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
>
> Hi Zhaoxiong,
>
> Just curious, if the host expects that commands are sent in LP mode, why
> isn't the MIPI_DSI_MODE_LPM flag set before sending the DCS commands?
>
> Thanks,
>
> Jessica Zhang

hi jessica

We have tried to set dsi->mode_flags to MIPI_DSI_MODE_LPM in the
probe() function,
but this seems to still happen. MTK colleagues believe that the host
dsi configuration is
still in LP mode during the prepare() function, and when in the
enable() function, the host
dsi is already in HS mode. However, since the command must be sent in
LP mode, it will
switch back and forth between HS->LP->HS.

Add Mediatek colleagues=EF=BC=88shuijing.li@mediatek.corp-partner.google.co=
m=EF=BC=89


>
> > ---
> > Changes between V5 and V4:
> > - 1. No changes.
> >
> > V4:https://lore.kernel.org/all/20240620080509.18504-2-lvzhaoxiong@huaqi=
n.corp-partner.google.com/
> >
> > Changes between V4 and V3:
> > - 1. Only move mipi_dsi_dcs_write_buffer from enable() function to prep=
are() function,
> > -    and no longer use mipi_dsi_dcs_write_seq_multi.
> >
> > V3:https://lore.kernel.org/all/20240614145510.22965-2-lvzhaoxiong@huaqi=
n.corp-partner.google.com/
> >
> > ---
> >   .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 24 +++++++++---------=
-
> >   1 file changed, 11 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers=
/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > index 4879835fe101..a9c483a7b3fa 100644
> > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > @@ -52,21 +52,9 @@ static int jadard_enable(struct drm_panel *panel)
> >   {
> >       struct device *dev =3D panel->dev;
> >       struct jadard *jadard =3D panel_to_jadard(panel);
> > -     const struct jadard_panel_desc *desc =3D jadard->desc;
> >       struct mipi_dsi_device *dsi =3D jadard->dsi;
> > -     unsigned int i;
> >       int err;
> >
> > -     msleep(10);
> > -
> > -     for (i =3D 0; i < desc->num_init_cmds; i++) {
> > -             const struct jadard_init_cmd *cmd =3D &desc->init_cmds[i]=
;
> > -
> > -             err =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365D=
A_INIT_CMD_LEN);
> > -             if (err < 0)
> > -                     return err;
> > -     }
> > -
> >       msleep(120);
> >
> >       err =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > @@ -100,6 +88,8 @@ static int jadard_disable(struct drm_panel *panel)
> >   static int jadard_prepare(struct drm_panel *panel)
> >   {
> >       struct jadard *jadard =3D panel_to_jadard(panel);
> > +     const struct jadard_panel_desc *desc =3D jadard->desc;
> > +     unsigned int i;
> >       int ret;
> >
> >       ret =3D regulator_enable(jadard->vccio);
> > @@ -117,7 +107,15 @@ static int jadard_prepare(struct drm_panel *panel)
> >       msleep(10);
> >
> >       gpiod_set_value(jadard->reset, 1);
> > -     msleep(120);
> > +     msleep(130);
> > +
> > +     for (i =3D 0; i < desc->num_init_cmds; i++) {
> > +             const struct jadard_init_cmd *cmd =3D &desc->init_cmds[i]=
;
> > +
> > +             ret =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365D=
A_INIT_CMD_LEN);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       return 0;
> >   }
> > --
> > 2.17.1
> >
