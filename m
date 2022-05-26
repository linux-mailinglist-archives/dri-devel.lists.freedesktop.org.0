Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81542534EA3
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C2B10E0B7;
	Thu, 26 May 2022 11:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1145B10E0B7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 11:53:27 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id cv10so1532984pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 04:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DBUY5Zd1QZ3ylDpZBeDPkVcWL7k2XbBkmYLPOREJaco=;
 b=nJ8ddvk3ub0711h3z4x3hewy+wdokGJHDR1Y9Mzk7Xr/12kwquw060JcobRKxabwv3
 xCcH4+1KlNhfFzFDD02XnLMSYvMmtmavg5r1dv8Sy/AR6exArKsBrMPVkTDxICI1j+7Y
 0S4nNdam26CV/7g0d7PLTPSbUlc2alVMPK82BKtDasdVA4L9OGRR83++PQgX83FZDak4
 9XiHFqt2zlweArgrldEFQzxmTATbivO1/LgkWU8ay4hUX811tNa2MJkH/Uj78gkXcLTz
 n8nPOtBMURUgtLPPJeFwIhL9DBikSohOEwXUbGaqJ2/ks65T9z96lyOr3aTfIokU4vg/
 pmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DBUY5Zd1QZ3ylDpZBeDPkVcWL7k2XbBkmYLPOREJaco=;
 b=qnUpXGYJCkHvDFmOJ7+jYDsHmyEk8Nu/EiyLg2UQ7H6Gdj0E0jEovO5HGKI9iZ9SDv
 9zAdQmNBSf1fml+YxZmEmC8XObpiEaNSAT7NL+oGkPCwzHLGAk6Z+qh78XcrKZ0nwBMG
 n41pkHbqDRZml3hXY0K0Hp/e/T9ppQbOaibfXCmn73qxD/FE5GTMcM3YOpkvmjV94kM5
 hJIgUk0OzdcKyyftckDUMBKVIW21VyXX4IfyU08TwL/SU/7j/at5JDqpLaouj/acUy9p
 +c8lQ6xEroTX0ogg0GPntsU9ALKl93LvoMMLGlwmRu0aPFP1ibbch233Yyc4g7r3K+xi
 I7Ag==
X-Gm-Message-State: AOAM531KP6Qk3l6Acpa3rS1XdjGTglWbjjpGGVrlW5e1yTgMAJvOuuE3
 3bPswXdpUXTm1jGkZCNmWp9MWgt/UF4m/s7rbxTfnQ==
X-Google-Smtp-Source: ABdhPJz1kDe05YOwTPtIYmYMbHrlW9C85t0VNZFED9yvINjmuL+GufTKonXUwqIDPIkx3hkNFfZi9T/8xI1q4ajrjAQ=
X-Received: by 2002:a17:90b:4d91:b0:1df:f18f:7836 with SMTP id
 oj17-20020a17090b4d9100b001dff18f7836mr2284152pjb.152.1653566006641; Thu, 26
 May 2022 04:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220525215316.1133057-1-festevam@gmail.com>
 <20220525235025.3bpvrkd5gaft3stl@bang-olufsen.dk>
In-Reply-To: <20220525235025.3bpvrkd5gaft3stl@bang-olufsen.dk>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 26 May 2022 13:53:15 +0200
Message-ID: <CAG3jFyvcBLyEsN9eCoeJb-BM3D1K9vYHZTukZZ319U13Jj_U+A@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Move CEC definitions to
 adv7511_cec.c
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>
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
Cc: kernel test robot <lkp@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 26 May 2022 at 01:50, Alvin =C5=A0ipraga <ALSI@bang-olufsen.dk> wro=
te:
>
> On Wed, May 25, 2022 at 06:53:16PM -0300, Fabio Estevam wrote:
> > ADV7511_REG_CEC_RX_FRAME_HDR[] and ADV7511_REG_CEC_RX_FRAME_LEN[]
> > are only used inside adv7511_cec.c.
> >
> > Move their definitions to this file to avoid the following build
> > warnings when CONFIG_DRM_I2C_ADV7511_CEC is not selected:
> >
> > drivers/gpu/drm/bridge/adv7511/adv7511.h:229:17: warning: 'ADV7511_REG_=
CEC_RX_FRAME_HDR' defined but not used [-Wunused-const-variable=3D]
> > drivers/gpu/drm/bridge/adv7511/adv7511.h:235:17: warning: 'ADV7511_REG_=
CEC_RX_FRAME_LEN' defined but not used [-Wunused-const-variable=3D]
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: ab0af093bf90 ("drm: bridge: adv7511: use non-legacy mode for CEC=
 RX")
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > ---
>
> Thank you for fixing this.
>
> Reviewed-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
>
> >  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 12 ------------
> >  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 12 ++++++++++++
> >  2 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm=
/bridge/adv7511/adv7511.h
> > index 9e3bb8a8ee40..a031a0cd1f18 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > @@ -226,18 +226,6 @@
> >  #define ADV7511_REG_CEC_CLK_DIV              0x4e
> >  #define ADV7511_REG_CEC_SOFT_RESET   0x50
> >
> > -static const u8 ADV7511_REG_CEC_RX_FRAME_HDR[] =3D {
> > -     ADV7511_REG_CEC_RX1_FRAME_HDR,
> > -     ADV7511_REG_CEC_RX2_FRAME_HDR,
> > -     ADV7511_REG_CEC_RX3_FRAME_HDR,
> > -};
> > -
> > -static const u8 ADV7511_REG_CEC_RX_FRAME_LEN[] =3D {
> > -     ADV7511_REG_CEC_RX1_FRAME_LEN,
> > -     ADV7511_REG_CEC_RX2_FRAME_LEN,
> > -     ADV7511_REG_CEC_RX3_FRAME_LEN,
> > -};
> > -
> >  #define ADV7533_REG_CEC_OFFSET               0x70
> >
> >  enum adv7511_input_clock {
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_cec.c
> > index 399f625a50c8..0b266f28f150 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > @@ -15,6 +15,18 @@
> >
> >  #include "adv7511.h"
> >
> > +static const u8 ADV7511_REG_CEC_RX_FRAME_HDR[] =3D {
> > +     ADV7511_REG_CEC_RX1_FRAME_HDR,
> > +     ADV7511_REG_CEC_RX2_FRAME_HDR,
> > +     ADV7511_REG_CEC_RX3_FRAME_HDR,
> > +};
> > +
> > +static const u8 ADV7511_REG_CEC_RX_FRAME_LEN[] =3D {
> > +     ADV7511_REG_CEC_RX1_FRAME_LEN,
> > +     ADV7511_REG_CEC_RX2_FRAME_LEN,
> > +     ADV7511_REG_CEC_RX3_FRAME_LEN,
> > +};
> > +
> >  #define ADV7511_INT1_CEC_MASK \
> >       (ADV7511_INT1_CEC_TX_READY | ADV7511_INT1_CEC_TX_ARBIT_LOST | \
> >        ADV7511_INT1_CEC_TX_RETRY_TIMEOUT | ADV7511_INT1_CEC_RX_READY1 |=
 \
> > --
> > 2.25.1
> >

Applied to drm-misc-next
