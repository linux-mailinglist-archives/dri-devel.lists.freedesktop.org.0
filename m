Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF18CDDA7
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 01:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6923E10E901;
	Thu, 23 May 2024 23:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O+ld1Mm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A9B10E901
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 23:22:53 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e538a264e0so114394911fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716506571; x=1717111371; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JFndDbSEPFGWTHHMY8d+FZXd6zTs2WlrRGp5IfPBkeI=;
 b=O+ld1Mm4whLHssc7nIK7uhpk0EPUlgVjbClRkpBi8j8DP4SUToJOtO2vM7bThFzuj6
 OrHDrzSUOywu/DzOOZaiwNY1rbbj5n/DLx1YSZ2Np5rVBFO6ZhBb9MkNjirOUdxFLim4
 O/4DH7fxPv36i1dgUMDlBZxX9OVlNyWAaziVJ/0Agbd0qhA+ab/cH8hkcbkcNV8KTacT
 twOPgs1A6F7lpUov4rSxbMqXErNfRZczWBEtGqiHGjvaiU0bGnRHSQ3O6NbU34b+QUK6
 QDv1ounFq2HxO8Wu0NFCyCJbeQF7IX82cWUcKCckZVPZTiwOAlVrBXlgpP0xVlOVdvCu
 LWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716506571; x=1717111371;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JFndDbSEPFGWTHHMY8d+FZXd6zTs2WlrRGp5IfPBkeI=;
 b=ht42gp/5serPvzKyB9ofYis+o90bAOmtyPU7KdbeoCkwPI92QFddtMYEsuqdG3/uqi
 oZ0fKyEIi2yDEmS7H8SFcYImN+KzSnuC29scZShmATVb5f71bANFhEbdfbJ3l1Q0JO1v
 JT2yStY19x+CsiNeL9MYNKdLV8tBy3TjBgpCaEyCUXWRC1NYD4HIXuh4Bg3Dk0pasUDj
 zTNJmENPW1ZwiC+gV+e46QXFcZBON0EcBSqEcOlQ0PmJerRYzWMOEbDN8cMB+1tJ+m/e
 WPEIdc3yyzz3T0w1AXkVscZ7Tiq219Fcmg8pkbR4mk8EDsKMSwkZn2HeeXKlOK/eGaH4
 uHhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg9WAK70Es6IZO/UfVGWklJq9klnEI89YSr57Htb/v/FefkdnTRoocnsjuUWk907u4pqc7c/6zSZz58UC2XMztT9BkotaP48aUlaltn6fi
X-Gm-Message-State: AOJu0YxvOcLyPx5CWJtHwHSJo0N/ighEk+DGEfLVVgPmu8Fb3qsKR4AF
 JB8+ZSTkYWue5t/swZ0ArIud0amCc9xKmlqkItD7VUVNX/rZ1ZmQHWPyjcj4l8Y=
X-Google-Smtp-Source: AGHT+IF4P8BB0TG4cx6LOlYv3K27CXQM5lsuUzYsdgB4XMRi7GyT4ZdjwvZ5ytrxEpqVrOoi24g7HQ==
X-Received: by 2002:a2e:b784:0:b0:2e0:3f37:5af5 with SMTP id
 38308e7fff4ca-2e95b2564a0mr3991731fa.41.1716506571062; 
 Thu, 23 May 2024 16:22:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e95bcd7c20sm231521fa.33.2024.05.23.16.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 16:22:50 -0700 (PDT)
Date: Fri, 24 May 2024 02:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>, Yakir Yang <ykk@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH RFC] drm/panel-edp: add fat warning against adding new
 panel compatibles
Message-ID: <6pivdkrvtknj4g4nniq3fesdzp2pyskkkhn57kg2huro7v253q@ygco3sc23u76>
References: <20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org>
 <CAD=FV=Xz1VsF8jG0q-Ldk+p=NY-ChJkTk0iW8fq2bO=oRFvXRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Xz1VsF8jG0q-Ldk+p=NY-ChJkTk0iW8fq2bO=oRFvXRA@mail.gmail.com>
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

On Thu, May 23, 2024 at 08:36:39AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, May 22, 2024 at 3:07 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add a fat warning against adding new panel compatibles to the panel-edp
> > driver. All new users of the eDP panels are supposed to use the generic
> > "edp-panel" compatible device on the AUX bus. The remaining compatibles
> > are either used by the existing DT or were used previously and are
> > retained for backwards compatibility.
> >
> > Suggested-by: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > The following compatibles were never used by the devices supported by
> > the upstream kernel and are a subject to possible removal:
> >
> > - auo,b133han05
> 
> Ack. Looks like this was added by Bjorn but by the time the dts for
> the board (from context, sc8180x-primus) using it made it upstream it
> was using "edp-panel".
> 
> 
> > - auo,b140han06
> 
> Ack. Same as above, but this time the board was "sc8180x-lenovo-flex-5g".
> 
> 
> > - ivo,m133nwf4-r0
> 
> Ack. Also added by Bjorn but not easy to tell from context which board
> it was from. "m133nwf4" never shows up in the history of arm64 qcom
> dts files.
> 
> 
> > - lg,lp097qx1-spa1
> 
> Maybe. Added by Yakir at Rockchip. I don't think this was ChromeOS
> related so I don't have any inside knowledge. Presumably this is for
> some other hardware they were using. Probably worth CCing Rockchip
> mailing list. It's entirely possible that they have downstream dts
> files using this and there's no requirement to upstream dts files that
> I'm aware of.

I see. Adding him to the CC list.

> 
> 
> > - lg,lp129qe
> 
> NAK. See "arch/arm/boot/dts/nvidia/tegra124-venice2.dts"

Yes. I even had a comment next to it. And then blindly posted it here.

> 
> 
> > - samsung,lsn122dl01-c01
> 
> Maybe. Also by Yakir at Rockchip and also doesn't appear to be
> ChromeOS, so you should ask them.
> 
> 
> > - samsung,ltn140at29-301
> 
> NAK. arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dts
> 
> 
> > - sharp,ld-d5116z01b
> 
> Added by Jeffrey Hugo. Maybe Cc him to make sure it's OK to delete?

I pinged him on IRC.

> 
> 
> > - sharp,lq140m1jw46
> 
> Ack. Feel free to delete. This was used in the sc7280 reference board
> (hoglin/zoglin) and by the time the dts made it upstream it was
> already using generic edp-panel.
> 
> 
> > - starry,kr122ea0sra
> 
> Ack. From my previous notes: "starry,kr122ea0sra - rk3399-gru-gru
> (reference board, not upstream)". Nobody needs this.
> 
> 
> > I'm considering dropping them, unless there is a good reason not to do
> > so.
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 6db277efcbb7..95b25ec67168 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match[] = {
> >         {
> >                 /* Must be first */
> >                 .compatible = "edp-panel",
> > -       }, {
> > +       },
> > +       /*
> > +        * Do not add panels to the list below unless they cannot be handled by
> > +        * the generic edp-panel compatible.
> > +        *
> > +        * The only two valid reasons are:
> > +        * - because of the panel issues (e.g. broken EDID or broken
> > +        *   identification),
> > +        * - because the platform which uses the panel didn't wire up the AUX
> > +        *   bus properly.
> 
> You mean that they physically didn't wire up the AUX bus? I don't
> think that's actually possible. I don't believe you can use an eDP
> panel without this working. Conceivably a reason to add here is if
> there's some old platform that hasn't coded up support for AUX bus.
> ...but it would be much preferred to update the platform driver to
> support it.

I was thinking about the DT/driver side of the story. Let me rephrase it
in a cleaner way.

-- 
With best wishes
Dmitry
