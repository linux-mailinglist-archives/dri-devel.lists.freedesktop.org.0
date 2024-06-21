Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51E912DE1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 21:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B4810E064;
	Fri, 21 Jun 2024 19:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gz4pB+Tr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9E510E064
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 19:33:47 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-443586c2091so589521cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 12:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1718998427; x=1719603227;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Le2MkNdTd7ht732px20a1wWOLqrtTMx4YCE6l0MH95w=;
 b=gz4pB+TroRW2FS36R4DUHYlT8yrMcPDocmReeP1LZEKupmDjxczCjLbdoABssQHed7
 2ELBCcjj43Cn8EEP7gk2jTZlZAAA8kDyZ2SdcOAhY8wknOu5A77P+QSpUiLAbKAUif38
 TwAUplTGSmLSUndul21zwyvJLl4RZA1lp+/wq2nZtwcBaj3D47fpAuLK8FYQrYRn1sDU
 +caVRzkMBO7AB8yFqR5XjYQI49VLoBx3v/rh2u1sLYiLDmmtoW0yB6zA94Szs6JUbZf2
 k3Lm/xVV5ms8RSl0tZx6SQrpSTXUyb1TUaxUrynWymZIsCkntbj0a+ATtlMt2j7jRsPv
 YdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718998427; x=1719603227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Le2MkNdTd7ht732px20a1wWOLqrtTMx4YCE6l0MH95w=;
 b=QLnGSxwanIA+fExOedvVYn/k9RaRy2s1cOVkD+7eclchXgbalBHr8BhsZXMen+ToOA
 zxvMHW3/SmBT0lZQyYG4GYG6R6Ad/Tn7NFGaM1HkaFkMDuzTQvOFYk+RG7fpNj2PQQpV
 S3+TSPC9wg4nuR8g+jwdRwjldwBOskMl9B2JxXHoVeBOx2VKxF6P+GDSULvZN7fooGyy
 4+BdXep7rIVAig+iYM2d4SXDdcAfoCI6phKm3smLzGCQxTbiQESJX7O0+sbXJchOwIkU
 MDt6SN/eovvZYKJ/O1TbjxCOTj6633pKZx39cV4nR33M/1IWdDeL+8ZRPejMC3ovw9PY
 M9ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzVRAtdcJ+lnexGuU4rT5KwG192Z4TZGOlwukNQy8WFG8VSC84AONFHv7lfNzNSCwj7RKWGpVoYyeLQELbPDJLxfPswSqZnBgil17fem58
X-Gm-Message-State: AOJu0YxVDpyvYZkMuXS36NGvkne4bo4JCJC0tpBP9quFHtMIwh2l2H3j
 WD7wB+V3cyk8SVW4e5WbOO2o2zkZC4/Vd4vMdNMQe6es0w7xIy5vPpzVEu7pSg+1ClCCbqP5TqH
 Zl1d5sutTUNUZz8Nvm+14hhHBBLj1DtH7Tp8C
X-Google-Smtp-Source: AGHT+IFrMD+rZzDa0ZVM2nBbSOJX2XJ6FBHeQxjvTimHBSdAG5CC6HH/3+o7haZPxilyiYFmJuIdUGRz/upXWdTumZA=
X-Received: by 2002:a05:622a:83:b0:441:54bb:50eb with SMTP id
 d75a77b69052e-444ce39fd5dmr117391cf.28.1718998426491; Fri, 21 Jun 2024
 12:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240620080509.18504-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240620080509.18504-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Fri, 21 Jun 2024 12:33:31 -0700
Message-ID: <CAD=FV=Xf26n+ZtUXHAwhQin76+z_Zkg+KWf++pGWWrHtgU83jQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm/panel: jd9365da: Modify the method of sending
 commands
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Hi,

On Thu, Jun 20, 2024 at 1:05=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> Currently, the init_code of the jd9365da driver is placed
> in the enable() function and sent, but this seems to take
> a long time. It takes 17ms to send each instruction (an init
> code consists of about 200 instructions), so it takes
> about 3.5s to send the init_code. So we moved the sending
> of the inti_code to the prepare() function, and each
> instruction seemed to take only 25=CE=BCs.
>
> We checked the DSI host and found that the difference in
> command sending time is caused by the different modes of
> the DSI host in prepare() and enable() functions.
> Our DSI Host only supports sending cmd in LP mode, The
> prepare() function can directly send init_code (LP->cmd)
> in LP mode, but the enable() function is in HS mode and
> needs to switch to LP mode before sending init code
> (HS->LP->cmd->HS). Therefore, it takes longer to send
> the command.
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>
> Changes between V4 and V3:
> - 1. Only move mipi_dsi_dcs_write_buffer from enable() function to prepar=
e() function,
> -    and no longer use mipi_dsi_dcs_write_seq_multi.
>
> V3:https://lore.kernel.org/all/20240614145510.22965-2-lvzhaoxiong@huaqin.=
corp-partner.google.com/
>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 24 +++++++++----------
>  1 file changed, 11 insertions(+), 13 deletions(-)

This seems reasonable to me, but I'd prefer someone with more MIPI
experience than me to actually give it a good review to make sure that
the argument about things being in prepare() vs enable() makes sense
to them.

Actually, that makes me look at your CC list, which seems to be
missing some important people. You should have run
`./scripts/get_maintainer.pl` and used that to help you make your CC
list, but you're missing some important people including the
maintainer of this driver and the panel maintainer. I've added a few
of those people to this patch. If you send future versions please
include folks that get_maintainer points out.


> @@ -117,7 +107,15 @@ static int jadard_prepare(struct drm_panel *panel)
>         msleep(10);
>
>         gpiod_set_value(jadard->reset, 1);
> -       msleep(120);
> +       msleep(130);
> +
> +       for (i =3D 0; i < desc->num_init_cmds; i++) {
> +               const struct jadard_init_cmd *cmd =3D &desc->init_cmds[i]=
;
> +
> +               ret =3D mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365D=
A_INIT_CMD_LEN);

In general people don't like the table-based approach for DSI init.
For this patch it's probably OK, but before the later patch where you
add a new panel you'll probably need to transition to a separate init
per panel and then use mipi_dsi_dcs_write_seq_multi() in there. I'll
comment more on the later patch. In other words, one possible v5
should be a 5-patch series:

Patch #1: this patch
Patch #2: DT binding
Patch #3: switch jd9365da to use mipi_dsi_dcs_write_seq_multi() but no
functional changes.
Patch #4: add your new panel.
Patch #5: orientation.



-Doug
