Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78556AC5241
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD5F10E410;
	Tue, 27 May 2025 15:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JhJrF1uL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334C410E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:41:06 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-742c9563fd9so2396045b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748360463; x=1748965263;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeydDyU8ewlBXPi1n8ex9WFeBrnGziCIRQQWhLDa9Ek=;
 b=JhJrF1uLe8IHDVTcfDt7cJXxgHsCUohTPGFGR6Pz8TpxoPUOfABnpSpjJtRQN5M/lu
 7j7mcHID6+9/bUPF9Gg5DchSPX7J5QD14CZ9VYK3Q/Sui5NAsk+TLsB3l+ReycLqlQLQ
 zzu5EzcxMNEQmaf3TDKVYZYd6jaIjAD6UFRbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748360463; x=1748965263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XeydDyU8ewlBXPi1n8ex9WFeBrnGziCIRQQWhLDa9Ek=;
 b=JDnoKlYY0ZZs/QVOXnS2nKIT7RR0uuwwttjcoM20AuajL15pyEZornDFF9WtTfQbIN
 3yEHjeVC3WOpXMUxa/eSKxDkIkaKECgfUUnGzjKedwOn1mGqx/9Ms960zJZBvWWYMKR8
 /vfNlfpwNI0djmhXr9uthyTD4XPSexx/LW4YYHlD4V7ZZIgT7B9IOmCAH05hUGKp2v4S
 rq49TFg88VzGsprdUlq9NgrTHs6egKkWwSQh+wSL7QMfoQkZcdc5Trr5zoDc4+pliSMy
 0g28FoRei7aU2KaNaOWAQKsxusnMoa5mMEA9jm/v4u5v3zzJpg/EDktzKYvpSCsqSQV/
 HoGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXagXkFxIwoyT6jFWNAfthS3ljvFEwgzSc33bEGAEwfnRORCnYSzCHOsSZLFzPHjF2fIvzkTZqnlnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmKq8crnBneiUTnxGB6k7oODpZ1/uci7Tf7a6rGpHZV/dz/pxQ
 XejrAuCSuElXfvfaQcFUQFz7Blas73iWcM1DJg9GuPmj+I7jQC7Oe9X3sNbGxbPXhvL6c2rK5uu
 4kYI=
X-Gm-Gg: ASbGncv86WhIiRUixbec4d1mhxF/1Pto2JkQUY7lpu2RBHeg3aKswwEpDrpeSiBucm+
 IU0F8MNvxAql3EgWzIMuKk734OiKvekICdRC9XKUmEJ3ngpIA2XE5l64SQeR6g6c4dR8ofP1fRy
 FR0KmHRuqirjHJ0Htlf8FWiu8m2NfkJwcjZBfKgpg2wu+Rh8Qv7zp3shW6ceF5nRrlfKivjLyuA
 SMxx2ZSzk/dHUJ0egWCLLwn/a9wyNa+MeiJAyllifeOa27HrgPiRLj2K6VhJT+Hl+OdyeX/K8xW
 fX9TriUHA5yUOgjlangTVn9vbVfK26O8b3GZOXXPkVcy/dKVBLkrSLACCLuvspg3gSzrgl37Ard
 hvnxzH+yCxztIyPQ=
X-Google-Smtp-Source: AGHT+IGz/dypFCU39d+ubXOjPXVOHYWSz5Sn+LAhtBrltQtwpjvdHmzZB4+tEM9+PZwCuDjRjPsd2Q==
X-Received: by 2002:a05:6a21:6d83:b0:201:85f4:ad07 with SMTP id
 adf61e73a8af0-2188c373325mr19790850637.33.1748360463467; 
 Tue, 27 May 2025 08:41:03 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2c4d53e1e6sm363785a12.16.2025.05.27.08.41.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 08:41:01 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-311d5fdf1f0so86610a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVpqUrdOjTVazRQiQTT4gTHpEuGlCwAAdQUASm88UgsYPxttli9MwPgTisrQ4TJmihINqxD94xG1h0=@lists.freedesktop.org
X-Received: by 2002:a17:90b:3ec6:b0:30a:4700:ca91 with SMTP id
 98e67ed59e1d1-3110f31c2ebmr18375340a91.1.1748360461082; Tue, 27 May 2025
 08:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
 <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
In-Reply-To: <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 08:40:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WeY+7rkf+61TEv2=O_QEufQ+-6JWLnNnVq4YC_vPRZUQ@mail.gmail.com>
X-Gm-Features: AX0GCFu6oHYgEYO-UX_wnBKECT_7Fwxez_Qo8ePpiYfVvnR_WniA6Ewzh05Szp0
Message-ID: <CAD=FV=WeY+7rkf+61TEv2=O_QEufQ+-6JWLnNnVq4YC_vPRZUQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, 
 max.krummenacher@toradex.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com
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

On Thu, May 22, 2025 at 6:14=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge=
_detect(struct drm_bridge *bridge)
> > >  {
> > >         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge)=
;
> > >         int val =3D 0;
> > > +       u8 link_status[DP_LINK_STATUS_SIZE];
> > >
> > > -       pm_runtime_get_sync(pdata->dev);
> > > -       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > > -       pm_runtime_put_autosuspend(pdata->dev);
> > > +       val =3D drm_dp_dpcd_read_link_status(&pdata->aux, link_status=
);
> > >
> > > -       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> > > -                                        : connector_status_disconnec=
ted;
> > > +       if (val < 0)
> > > +               return connector_status_disconnected;
> > > +       else
> > > +               return connector_status_connected;
> >
> > I'd really rather not do this. It took me a little while to realize
> > why this was working and also not being slow like your 400ms delay
> > was. I believe that each time you do the AUX transfer it grabs a
> > pm_runtime reference and then puts it with "autosuspend". Then you're
> > relying on the fact that detect is called often enough so that the
> > autosuspend doesn't actually hit so the next time your function runs
> > then it's fast. Is that accurate?
> >
> > I'd rather see something like this in the bridge's probe (untested)
> >
> >   if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort) {
> >     pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> >
> >     /*
> >      * In order for DRM_BRIDGE_OP_DETECT to work in a reasonable
> >      * way we need to keep the bridge powered on all the time.
> >      * The bridge takes hundreds of milliseconds to debounce HPD
> >      * and we simply can't wait that amount of time in every call
> >      * to detect.
> >      */
> >     pm_runtime_get_sync(pdata->dev);
> >   }
> >
> > ...obviously you'd also need to find the right times to undo this in
> > error handling and in remove.
>
> What about:
> - keeping pm_runtime_get()/put_autosuspend() in detect, but..

I guess? The problem is that if the calls in pm_runtime_get() actually
cause the device to be resumed then detect() will not actually work.
The chip simply won't report HPD right after being powered on because
it needs the debouncing time. ...so having the calls there is
misleading. Instead, I'd rather have a comment in there about why we
_don't_ have the pm_runtime_get() calls there...


> - also adding .hpd_enable() / .hpd_disable() callbacks which would also
>   get and put the runtime PM, making sure that there is no additional
>   delay in .detect()?

Sounds reasonable to me and sounds like it works.
