Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 377C757AA07
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 00:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F1A18BE7D;
	Tue, 19 Jul 2022 22:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606B818BE2E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 22:49:44 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e15so21589432edj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7PK6D+h+8OxcoWXpNYlUYth9TT/PlFLZBalPC3jKAK8=;
 b=EHnKpW8uMagKdXxRMch4+SfbCXYeOqLlfUQ+anvZ2PvnHM8fiRWUFq5iPyxi9IJKiD
 77b7i9+MJjJ7vLhXCmbjGaD98rqpdTmcS2w6p0mubl9uVAc2ifyn2SPc5z1cEP0D5S75
 pUqCQLKhrJ3SeMLUWYEPqxUKjsMtBBkPB6494=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7PK6D+h+8OxcoWXpNYlUYth9TT/PlFLZBalPC3jKAK8=;
 b=bru7lcg4ThSbQE0hiTaGHLffv5eR9xTJY6tgNsaoSNQmAtCoAzKcGwoFWa8GurBUpK
 6suT9bgngKd0K72DDuQEvkIDy81Qc5dDFZk7ABnj/aCGAwNAxLrSJuwuQvgkw5Pf7iwf
 PzURE94K3YJn5kxErpAo/M1LY++r3xvhMvQ1KS5+BFO+CPaaqUA6q4kn4qcCrqsZUL+f
 l/4tmEl8Tux6MtXPTZ1MI9mERK7fXfy9slD+ROGi3TLajwRb75Lv0fmBKyoGC/cQ+Onp
 SJODcNvuQddcEiOTBJkeTOtqGXNkgDsNnErGyu2xSCcnZlFWItyxuZngsP37FWAN4bZC
 lq8Q==
X-Gm-Message-State: AJIora8ec0YQf29ygq/xTJhlNUh8gcbJdYkojgwiyLlVr+ObeQpBIeUO
 PI1BT0y4G2dBxxNACCxyY/Yqw7UegE7wnimgcTc=
X-Google-Smtp-Source: AGRyM1tIDe4+3ANuGFBJtHKC9pnIbJctjAfSbFw7086XaJRcpC8mWsNgTTcaN/bDbfn9rch3wMqzFQ==
X-Received: by 2002:a05:6402:4490:b0:43a:8f5a:d273 with SMTP id
 er16-20020a056402449000b0043a8f5ad273mr46191213edb.6.1658270982732; 
 Tue, 19 Jul 2022 15:49:42 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 d25-20020aa7c1d9000000b0043a75f62155sm11271798edp.86.2022.07.19.15.49.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 15:49:39 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id a11so3672469wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:49:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id
 f13-20020a05600c4e8d00b003a12e4d1dd2mr1180998wmq.85.1658270978565; Tue, 19
 Jul 2022 15:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-4-nfraprado@collabora.com>
 <CAD=FV=X0End8u3nNNXSMVhuJo0KWmJYRNg3yeC9yQ+5bLKTmYg@mail.gmail.com>
In-Reply-To: <CAD=FV=X0End8u3nNNXSMVhuJo0KWmJYRNg3yeC9yQ+5bLKTmYg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 15:49:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtfnrqUOACfnVfkZE20O4diPQpHYYC5p1iX3vt9ESPYg@mail.gmail.com>
Message-ID: <CAD=FV=VtfnrqUOACfnVfkZE20O4diPQpHYYC5p1iX3vt9ESPYg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel-edp: Fix variable typo when saving hpd
 absent delay from DT
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 19, 2022 at 3:45 PM Doug Anderson <dianders@chromium.org> wrote=
:
>
> Hi,
>
> On Tue, Jul 19, 2022 at 1:39 PM N=C3=ADcolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > The value read from the "hpd-absent-delay-ms" property in DT was being
> > saved to the wrong variable, overriding the hpd_reliable delay. Fix the
> > typo.
> >
> > Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s pro=
bed by EDID")
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> >
> >  drivers/gpu/drm/panel/panel-edp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 152e00eb846f..b3536d8600f4 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -738,7 +738,7 @@ static int generic_edp_panel_probe(struct device *d=
ev, struct panel_edp *panel)
> >         of_property_read_u32(dev->of_node, "hpd-reliable-delay-ms", &re=
liable_ms);
> >         desc->delay.hpd_reliable =3D reliable_ms;
> >         of_property_read_u32(dev->of_node, "hpd-absent-delay-ms", &abse=
nt_ms);
> > -       desc->delay.hpd_reliable =3D absent_ms;
> > +       desc->delay.hpd_absent =3D absent_ms;
>
> Well that's embarrassing. In the end I never used any of these
> properties for anything shipping since HPD was always hooked up on
> later boards and the only board that needed "hpd_reliable" never ended
> up switching to the generic "edp-panel".
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll apply this right away to drm-misc-fixes.

ef2084a8388b drm/panel-edp: Fix variable typo when saving hpd absent
delay from DT
