Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1BB58E54
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 08:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2711D10E65B;
	Tue, 16 Sep 2025 06:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JQev0rFO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F98810E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 06:17:30 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-ea3fc715bc9so1897560276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758003449; x=1758608249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDaii2Wdk1Ox7/nqut8hlOiulSUANPWpY7ZmxRlktsA=;
 b=JQev0rFOSBXvjGrgrYYp9oTMRKY6hoPyGf889zl9HCfXy8Cj212hJBbr9TEziYIUDU
 DPhb6gJWi+cIK/yfTlNjr8A0pt4hiUSRToDhcLbEV0qYDAahedwfh0btyRJJJElsETer
 tiFT+U9kEC9M2zfMHTe5370jbW7+aqvtkXlBq572Y+JZfBAe1JZWdwst6QR6IEyiQXT8
 d2XeuE0syJoASA2E/6ITZGCmsaw9fxRAuxQlMVbhXg4IPmU2khZ1RmXLNE//LddAL7bo
 DRh/UL85bLjFPlY6GeT7t0ZtiFVEKK/t5OYc1uaSbNwgyZ2z8mnIAokWXtqN1B2e9g88
 R5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758003449; x=1758608249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDaii2Wdk1Ox7/nqut8hlOiulSUANPWpY7ZmxRlktsA=;
 b=pLAtJFecwGu+2XdT8wtF0RDspHmBaYQAhyd9V/UGNytK6CWcy4Gk8kg9vEVgz02drN
 Vef+niWe+zQeLB7srBby58IkvwHt27/MWqlqNqaunsV3qWHo9rgzfn10MFcOFcUr7d7Z
 mdvtrK/gKCLKYSTnSJcDJky1HoURsIc/8lVhoMmLVo62seAbYLnb+2LVmTCmwly2r/NZ
 sgk7uQTS1QoD4i8XFkY+32ma+2CcDed147GBddGhGQX5W3xqjPzdt+03XkBYVqCBb5rY
 v6DwHZSAjiVWq2WAF8awACmG3q84GhbdpKCihdPK5CAF7l5gluwODsmsWtceQNaTGd+d
 wl5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVigUXg+vQddrLnb6dpNIo1nqNSId1ADvNR30S/PdS3KiUNFDcbniwVjYQup68intJrhbRNlByYkvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzSz2xgywTfg4maNvkR+mzTUDJHHlAmrrW/BPQ4+FJDTEhhP9j
 fG0Gi3rI/4jRY429Xpt9izw+f3K2BpXhuYdrjtxtQLYXTvtLRo4TVvaa/VvOHQsoAYRwicKgJRV
 HR82aPD7albuhLVl6wD1X2FQMK5VIXfU=
X-Gm-Gg: ASbGncvCNdd5RMFe7so94RpGLe7DICYFL0T1TWSOvnl4yQ5rmIZ15Ku6bGHyetCz9Uz
 RgQpjcLpqedOUlBaEYxkAfMKrFQT+v46Jp5B//omSIl7efyhQejjpC4ruNkZ4NZd91LYRaRT6hy
 SNzDJ5LPHibtz/yPZwE1jqmat08OIfkzyUtEIGuHZ3B4rdLsSmFyUM6meIMNovMZOsIxrnyQah9
 E+YVqsvWQFlR/6dkL8fm5MtE29TPreh89G4h0qYb84YDXbZYAY98ckJ+FFZnpEmBOk9SGHR
X-Google-Smtp-Source: AGHT+IF+Xiqik1tR0vXGQ+PFRyD1S4moq1IqD/LOHDIbRGhH8BmE3q7KjrCrPnOYGKNgwkeY1K1KRVmqmymVnMlyYJM=
X-Received: by 2002:a05:6902:610c:b0:e9d:77de:c50a with SMTP id
 3f1490d57ef6-ea3d9a4e64dmr13041781276.17.1758003448858; Mon, 15 Sep 2025
 23:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-9-779a8a3729d9@collabora.com>
 <CAPaKu7TEN++z8r68k_4-iCyMLMthqJBUX35pgXupAHPdfttrYg@mail.gmail.com>
 <24083992.6Emhk5qWAg@workhorse>
In-Reply-To: <24083992.6Emhk5qWAg@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 15 Sep 2025 23:17:18 -0700
X-Gm-Features: AS18NWCXWyl_YVRXpDa8LQOU9lM5ZjkiSFaFNztoIDgFSKKxEgJ3VR2PFYeYjBk
Message-ID: <CAPaKu7QKUnTx-jRYfHEUJx_3bkgQ_=vEC=siTOigtQAnu4NxcQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/panthor: devfreq: add pluggable devfreq
 providers
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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

On Mon, Sep 15, 2025 at 6:34=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Saturday, 13 September 2025 00:53:50 Central European Summer Time Chia=
-I Wu wrote:
> > On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > <snipped>
> > > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/=
drm/panthor/panthor_devfreq.h
> > > index a891cb5fdc34636444f141e10f5d45828fc35b51..94c9768d5d038c4ba8516=
929edb565a1f13443fb 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> > > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> > > @@ -8,6 +8,7 @@
> > >
> > >  struct devfreq;
> > >  struct thermal_cooling_device;
> > > +struct platform_device;
> > >
> > >  struct panthor_device;
> > >
> > > @@ -43,6 +44,19 @@ struct panthor_devfreq {
> > >         spinlock_t lock;
> > >  };
> > >
> > > +struct panthor_devfreq_provider {
> > > +       /** @dev: device pointer to the provider device */
> > > +       struct device *dev;
> > > +       /**
> > > +        * @init: the provider's init callback that allocates a
> > > +        * &struct panthor_devfreq, adds it to panthor, and adds a de=
vfreq
> > > +        * device to panthor. Will be called during panthor's probe.
> > > +        */
> > > +       int (*init)(struct panthor_device *ptdev, struct device *dev)=
;
> > > +
> > > +       struct list_head node;
> > > +};
> > On mt8196, we have performance-domains to replace several other
> > properties: clocks, *-supply, power-domains, operating-points-v2.
> > There are also quirks, such as GPU_SHADER_PRESENT should be masked by
> > GF_REG_SHADER_PRESENT. It feels like that the scope of
> > panthor_devfreq_provider is more broader, and at least the naming is
> > not right.
>
> True, though I'm still not entirely sure whether mtk_mfg needs to do
> the GF_REG_SHADER_PRESENT thing. It's entirely possible this is just
> an efuse value the GPUEB reads and then puts in SRAM for us, and we
> could simply read this efuse cell ourselves. Among a list of questions
> about the hardware we're sending to MediaTek, whether this is an efuse
> cell and where it is placed is one of them.
>
> If it turns out to be the case that we can simply read an efuse in
> panthor in the other mt8196 integration code, then we can keep
> mtk_mfg basically entirely focused on the devfreq-y part. I'd really
> prefer this solution.
>
> However, assuming we can't go down this path either because this is
> not how the hardware works, or because MediaTek never replies, or
> because someone doesn't like reading efuses in panthor, I think
> generalising "devfreq_provider" to "performance_controller" or
> something like that would be a good move.
Yeah, let's see what MTK has to say on shader core mask.

Another thing is that panthor still requires a "core" clk. Is it also
required on mt8196?

>
> In a way, the fused off core mask is part of the vague domain of
> "performance", and it'll also allow us to extend it with other
> things relevant to performance control in different vendor integration
> logic designs. I'm thinking memory bandwidth control and job scheduling
> preferences. E.g. if the interconnect tells us one core is spending a
> lot of time waiting on the interconnect, maybe because a different
> piece of the SoC that's active shares the same path on the
> interconnect, we could then communicate a scheduling preference for
> the other cores that have bandwidth headroom even if they are busier
> in compute. Maybe this doesn't make sense though because interconnect
> designs are fully switched these days or panthor's scheduler will
> already figure this out from job completion times.
>
> If any other SoC vendor or people working on hardware of those vendors
> want to chime in and say whether they've got any other uses for
> communicating more than just devfreq from glue logic to panthor, then
> this would be a great time to do it, so that we can get this interface
> right from the beginning.
>
> > Another issue is I am not sure if we need to expose panthor_device
> > internals to the provider. mtk_mfg accesses very few fields of
> > panthor_device. It seems we can make the two less coupled.
> >
> > I might change my view as mtk_mfg evolves and requires tigher
> > integration with panthor. But as is, I might prefer for mtk_mfg to
> > live under drivers/soc/mediatek and provide a header for panthor to
> > use in soc-specific path.
>
> I'm not very confident it's possible to cleanly decouple them without
> inventing a bunch of very panthor-and-mfg specific interfaces that
> masquerade as general solutions in the process. It'd also mean I'd
> have to duplicate all of `panthor_devfreq_get_dev_status` instead of
> just being able to reuse it, unless that is also exposed in said
> header file, which would need a better justification than "well there
> is one other user of it and we're trying to couple it more loosely".
>
> I know that it's almost independent, but unfortunately, even a tiny
> dependency between the two will mean that mediatek_mfg will need to
> know about panthor.
>
> Other things needed from panthor are the pdevfreq->gov_data, and
> the panthor struct device* itself, as well as stuff like "fast_rate"
> in the panthor_device struct.
>
> In the future, we may want to expand this driver with governors
> beyond SIMPLE_ONDEMAND, based on the job completion duration targets
> we can communicate to the GPUEB. That may either make the driver
> more tightly coupled or more loosely coupled, I don't really know
> yet.
>
> One advantage of looking to completely decouple them (though again,
> I doubt that's possible at the moment without questionable refactors)
> could be that we could also support panfrost devices that need this.
There is also tyr, although I don't follow its status.

I can see the concern over "very panthor-and-mfg specific interfaces
that masquerade as general solutions" or "questionable refactors". But
I also don't like, for example, how mtk_mfg_init_devfreq inits
panthor_devfreq manually. Beyond initialization, the remaining
coupling comes from that we need panthor to provide get_dev_status
callback for devfreq_dev_profile, and we need mtk_mfg to provide
target and get_cur_freq callbacks. That seems like something solvable
too.

I really appreciate the work and I don't want to block it by vague
concerns. If others have no preference, we should start with what we
have.
>
> >
> >
> > > +
> > >
> > >  int panthor_devfreq_init(struct panthor_device *ptdev);
> > >
> > > @@ -57,4 +71,6 @@ int panthor_devfreq_get_dev_status(struct device *d=
ev,
> > >
> > >  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)=
;
> > >
> > > +int panthor_devfreq_register_provider(struct panthor_devfreq_provide=
r *prov);
> > > +
> > >  #endif /* __PANTHOR_DEVFREQ_H__ */
> > >
> > > --
> > > 2.51.0
> > >
> >
>
>
>
>
