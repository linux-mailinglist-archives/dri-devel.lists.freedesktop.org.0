Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC913022F3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715B689FC9;
	Mon, 25 Jan 2021 08:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CF789A4E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 07:24:32 +0000 (UTC)
Received: from mail-oi1-f200.google.com ([209.85.167.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1l3wEg-0001TC-SV
 for dri-devel@lists.freedesktop.org; Mon, 25 Jan 2021 07:24:31 +0000
Received: by mail-oi1-f200.google.com with SMTP id i9so5028108oih.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jan 2021 23:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2EQjAOKxa2dQV3aiCdkBak75YIOEWOzVFXlrxlER1bc=;
 b=JQw8DAVV8FN83sZRxVwTDrI1ySBqYvGNeil60/dfuoOHD3w+UADHnbYy4ZsV+7RaEV
 0nMovr0pVH3duW6v/gF4i1VkcC3FbuSmkGqr3FRarjOWhukFDHwDMmHeaKXEL4OTlhd0
 tAC9Bv658FUuuGhGp0GAO345id+A1G3iPj5mY35+goutAyM3NQYJerY/Fn9/38ypWv2J
 plWi4UMq4ZP+5APzU1iFudwo2p6drwrPs2M2Mxic8Ch6aRi+gfRAHL8QVoaXgdw8uhWn
 8wqXKvkgXcGVJdi4v6uVyEivpIkcNBZmHb3hgNwf1slHR+jMUYc892e/8ZxFqM7h87PN
 Pi0A==
X-Gm-Message-State: AOAM530RvKekfBeNK9IEO2sQCkz2uHBui33nUYVChouFCzkUnlSTmF5g
 x/5dSfOOJIFPB1k2m7+19l5RWT9gCHuNhFPu2wuiWO4ivHVuDNDGyq48cdZ51uqZi10DZQTW2aJ
 53VsV3hIKDp2j5pEsWcCvaFD0tCerPNKPTB13glm8sDEmZMfY/se1weHe/ANF9Q==
X-Received: by 2002:aca:da46:: with SMTP id r67mr2124870oig.17.1611559469857; 
 Sun, 24 Jan 2021 23:24:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylzCDHLvXlHxg0/AhglA4IWH8c/YMLRiQVjtU4QU7TF2qrrnoC1DvfrC6YdMkDxsuKO1MMmLTnTNtBU5PAIfA=
X-Received: by 2002:aca:da46:: with SMTP id r67mr2124857oig.17.1611559469507; 
 Sun, 24 Jan 2021 23:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20210113014105.28110-1-koba.ko@canonical.com>
 <20210113014105.28110-2-koba.ko@canonical.com>
 <8735z5t5qz.fsf@intel.com>
In-Reply-To: <8735z5t5qz.fsf@intel.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Mon, 25 Jan 2021 15:24:18 +0800
Message-ID: <CAJB-X+Xon6ouDFvr2LgDub=mEYR1=geffsMZYmQZFfNkKUxf4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/dp_mst: Align mst link rate with soure rate
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Approved-At: Mon, 25 Jan 2021 08:45:26 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1529834623=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1529834623==
Content-Type: multipart/alternative; boundary="000000000000b8306b05b9b46d02"

--000000000000b8306b05b9b46d02
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 13, 2021 at 7:51 PM Jani Nikula <jani.nikula@linux.intel.com>
wrote:
>
> On Wed, 13 Jan 2021, Koba Ko <koba.ko@canonical.com> wrote:
> > After read the link rate from MST hub, align with
> > maximum source rate.
> >
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c   | 8 ++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
> >  include/drm/drm_dp_helper.h             | 8 ++++++++
> >  include/drm/drm_dp_mst_helper.h         | 4 ++++
> >  4 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 6982ecbf30b5..e7ceae97be85 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3672,6 +3672,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct
drm_dp_mst_topology_mgr *mgr, bool ms
> >  {
> >       int ret = 0;
> >       struct drm_dp_mst_branch *mstb = NULL;
> > +     unsigned int max_link_rate_tbl[MAX_DRM_DP_MAX_RATE + 1] = {
> > +             DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4,
> > +             DP_LINK_BW_8_1, DP_LINK_RATE_TABLE
> > +     };
>
> Please no. Read on for why.
>
> >
> >       mutex_lock(&mgr->payload_lock);
> >       mutex_lock(&mgr->lock);
> > @@ -3693,6 +3697,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct
drm_dp_mst_topology_mgr *mgr, bool ms
> >                       goto out_unlock;
> >               }
> >
> > +             if (mgr->max_source_rate < MAX_DRM_DP_MAX_RATE)
> > +                     mgr->dpcd[1] =
max_link_rate_tbl[mgr->max_source_rate];
>
> Make ->max_source_rate the actual physical rate in kHz, and use
> drm_dp_link_rate_to_bw_code() here.
>
> > +
> >               mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr->dpcd[1],
> >                                                       mgr->dpcd[2] &
DP_MAX_LANE_COUNT_MASK);
> >               if (mgr->pbn_div == 0) {
> > @@ -5422,6 +5429,7 @@ int drm_dp_mst_topology_mgr_init(struct
drm_dp_mst_topology_mgr *mgr,
> >       mgr->aux = aux;
> >       mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
> >       mgr->max_payloads = max_payloads;
> > +     mgr->max_source_rate = MAX_DRM_DP_MAX_RATE;
> >       mgr->conn_base_id = conn_base_id;
> >       if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
> >           max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 469e765a1b7b..a89b4c823123 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5392,6 +5392,13 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
> >       intel_dp->is_mst = sink_can_mst &&
> >               i915->params.enable_dp_mst;
> >
> > +     if (intel_dp_source_supports_hbr3(intel_dp))
> > +             intel_dp->mst_mgr.max_source_rate = DRM_DP_MAX_RATE_HBR3;
> > +     else if (intel_dp_source_supports_hbr2(intel_dp))
> > +             intel_dp->mst_mgr.max_source_rate = DRM_DP_MAX_RATE_HBR2;
> > +     else
> > +             intel_dp->mst_mgr.max_source_rate = DRM_DP_MAX_RATE_HBR;
>
> Whenever this file references a "rate", it's the rate in kHz. This is
> confusing. Use the rate in kHz.
>
> Also, please look at how intel_dp_source_supports_hbr* are implemented;
> we already have all the supported source rates cached in intel_dp.
>
> The max source rate is:
>
>         intel_dp->source_rates[intel_dp->num_source_rates - 1].
>
> No need to do the if ladder here at all. If you like, you can add a
> helper:
>
> int intel_dp_max_source_rate(struct intel_dp *intel_dp)
> {
>         return intel_dp->source_rates[intel_dp->num_source_rates - 1];
> }
>
> and reuse that in the supports_hbr* functions:
>
> bool intel_dp_source_supports_hbr2(struct intel_dp *intel_dp)
> {
>         return intel_dp_max_source_rate(intel_dp) >= 540000;
> }
>
> > +
> >       drm_dp_mst_topology_mgr_set_mst(&intel_dp->mst_mgr,
> >                                       intel_dp->is_mst);
> >  }
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 6236f212da61..ef2b328469cd 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -183,6 +183,14 @@ struct drm_device;
> >  #define DP_SUPPORTED_LINK_RATES                  0x010 /* eDP 1.4 */
> >  # define DP_MAX_SUPPORTED_RATES                   8      /* 16-bit
little-endian */
> >
> > +enum drm_dp_max_link_rate {
> > +     DRM_DP_MAX_RATE_RBR = 0,
> > +     DRM_DP_MAX_RATE_HBR,
> > +     DRM_DP_MAX_RATE_HBR2,
> > +     DRM_DP_MAX_RATE_HBR3,
> > +     MAX_DRM_DP_MAX_RATE
> > +};
>
> We already have 1) actual physical rates, in kHz, and 2) the DPCD rate
> codes, such as DP_LINK_BW_1_62.
>
> Do *not* add a third representation. Prefer kHz throughout, and convert
> to/from the DPCD codes near where they are needed.
>
> > +
> >  /* Multiple stream transport */
> >  #define DP_FAUX_CAP                      0x020   /* 1.2 */
> >  # define DP_FAUX_CAP_1                           (1 << 0)
> > diff --git a/include/drm/drm_dp_mst_helper.h
b/include/drm/drm_dp_mst_helper.h
> > index f5e92fe9151c..e7d8c899fea0 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -593,6 +593,10 @@ struct drm_dp_mst_topology_mgr {
> >        * @max_payloads: maximum number of payloads the GPU can generate.
> >        */
> >       int max_payloads;
> > +     /**
> > +      * @max_source_rate: maximum link rate of source.
> > +      */
> > +     int max_source_rate;
>
> Again, make this the actual rate in kHz. That's what I'd think it is by
> reading the comment above anyway.
>
> >       /**
> >        * @conn_base_id: DRM connector ID this mgr is connected to. Only
used
> >        * to build the MST connector path value.
>
> --
> Jani Nikula, Intel Open Source Graphics Center
Hi Jani,
thanks and will send the v2 according to the suggestions.

Thanks
*Koba Ko*

--000000000000b8306b05b9b46d02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Jan 13, 2021 at 7:51 PM Jani Nikula &lt;<a href=3D=
"mailto:jani.nikula@linux.intel.com">jani.nikula@linux.intel.com</a>&gt; wr=
ote:<br>&gt;<br>&gt; On Wed, 13 Jan 2021, Koba Ko &lt;<a href=3D"mailto:kob=
a.ko@canonical.com">koba.ko@canonical.com</a>&gt; wrote:<br>&gt; &gt; After=
 read the link rate from MST hub, align with<br>&gt; &gt; maximum source ra=
te.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Koba Ko &lt;<a href=3D"mailto:=
koba.ko@canonical.com">koba.ko@canonical.com</a>&gt;<br>&gt; &gt; ---<br>&g=
t; &gt; =C2=A0drivers/gpu/drm/drm_dp_mst_topology.c =C2=A0 | 8 ++++++++<br>=
&gt; &gt; =C2=A0drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++<br>&gt;=
 &gt; =C2=A0include/drm/drm_dp_helper.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 8 ++++++++<br>&gt; &gt; =C2=A0include/drm/drm_dp_mst_helper.h =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++++<br>&gt; &gt; =C2=A04 files changed, 27 in=
sertions(+)<br>&gt; &gt;<br>&gt; &gt; diff --git a/drivers/gpu/drm/drm_dp_m=
st_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c<br>&gt; &gt; index 69=
82ecbf30b5..e7ceae97be85 100644<br>&gt; &gt; --- a/drivers/gpu/drm/drm_dp_m=
st_topology.c<br>&gt; &gt; +++ b/drivers/gpu/drm/drm_dp_mst_topology.c<br>&=
gt; &gt; @@ -3672,6 +3672,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct =
drm_dp_mst_topology_mgr *mgr, bool ms<br>&gt; &gt; =C2=A0{<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 struct d=
rm_dp_mst_branch *mstb =3D NULL;<br>&gt; &gt; + =C2=A0 =C2=A0 unsigned int =
max_link_rate_tbl[MAX_DRM_DP_MAX_RATE + 1] =3D {<br>&gt; &gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW=
_5_4,<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DP_LINK_BW_8=
_1, DP_LINK_RATE_TABLE<br>&gt; &gt; + =C2=A0 =C2=A0 };<br>&gt;<br>&gt; Plea=
se no. Read on for why.<br>&gt;<br>&gt; &gt; <br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 mutex_lock(&amp;mgr-&gt;payload_lock);<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 mutex_lock(&amp;mgr-&gt;lock);<br>&gt; &gt; @@ -3693,6 +3697,9 @@ in=
t drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool=
 ms<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 goto out_unlock;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; <br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (mgr-&gt;max_source_rate &lt; MAX_DRM_DP_MAX_RA=
TE)<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 mgr-&gt;dpcd[1] =3D max_link_rate_tbl[mgr-&gt;max_source_rate=
];<br>&gt;<br>&gt; Make -&gt;max_source_rate the actual physical rate in kH=
z, and use<br>&gt; drm_dp_link_rate_to_bw_code() here.<br>&gt;<br>&gt; &gt;=
 +<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mgr-&gt;pb=
n_div =3D drm_dp_get_vc_payload_bw(mgr-&gt;dpcd[1],<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mgr-&gt;dpcd[2] &amp; DP_MAX_LANE_COUNT_MAS=
K);<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mgr-&=
gt;pbn_div =3D=3D 0) {<br>&gt; &gt; @@ -5422,6 +5429,7 @@ int drm_dp_mst_to=
pology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0 mgr-&gt;aux =3D aux;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 mgr-&g=
t;max_dpcd_transaction_bytes =3D max_dpcd_transaction_bytes;<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 mgr-&gt;max_payloads =3D max_payloads;<br>&gt; &gt; + =
=C2=A0 =C2=A0 mgr-&gt;max_source_rate =3D MAX_DRM_DP_MAX_RATE;<br>&gt; &gt;=
 =C2=A0 =C2=A0 =C2=A0 mgr-&gt;conn_base_id =3D conn_base_id;<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 if (max_payloads + 1 &gt; sizeof(mgr-&gt;payload_mask)=
 * 8 ||<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_payloads + 1 &g=
t; sizeof(mgr-&gt;vcpi_mask) * 8)<br>&gt; &gt; diff --git a/drivers/gpu/drm=
/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c<br>&gt; =
&gt; index 469e765a1b7b..a89b4c823123 100644<br>&gt; &gt; --- a/drivers/gpu=
/drm/i915/display/intel_dp.c<br>&gt; &gt; +++ b/drivers/gpu/drm/i915/displa=
y/intel_dp.c<br>&gt; &gt; @@ -5392,6 +5392,13 @@ intel_dp_configure_mst(str=
uct intel_dp *intel_dp)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 intel_dp-&gt;is_m=
st =3D sink_can_mst &amp;&amp;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 i915-&gt;params.enable_dp_mst;<br>&gt; &gt; <br>&gt; &gt;=
 + =C2=A0 =C2=A0 if (intel_dp_source_supports_hbr3(intel_dp))<br>&gt; &gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intel_dp-&gt;mst_mgr.max_source=
_rate =3D DRM_DP_MAX_RATE_HBR3;<br>&gt; &gt; + =C2=A0 =C2=A0 else if (intel=
_dp_source_supports_hbr2(intel_dp))<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 intel_dp-&gt;mst_mgr.max_source_rate =3D DRM_DP_MAX_RATE_=
HBR2;<br>&gt; &gt; + =C2=A0 =C2=A0 else<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 intel_dp-&gt;mst_mgr.max_source_rate =3D DRM_DP_MAX_R=
ATE_HBR;<br>&gt;<br>&gt; Whenever this file references a &quot;rate&quot;, =
it&#39;s the rate in kHz. This is<br>&gt; confusing. Use the rate in kHz.<b=
r>&gt;<br>&gt; Also, please look at how intel_dp_source_supports_hbr* are i=
mplemented;<br>&gt; we already have all the supported source rates cached i=
n intel_dp.<br>&gt;<br>&gt; The max source rate is:<br>&gt;<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 intel_dp-&gt;source_rates[intel_dp-&gt;num_source_rate=
s - 1].<br>&gt;<br>&gt; No need to do the if ladder here at all. If you lik=
e, you can add a<br>&gt; helper:<br>&gt;<br>&gt; int intel_dp_max_source_ra=
te(struct intel_dp *intel_dp)<br>&gt; {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return intel_dp-&gt;source_rates[intel_dp-&gt;num_source_rates - 1];<br>&g=
t; }<br>&gt;<br>&gt; and reuse that in the supports_hbr* functions:<br>&gt;=
<br>&gt; bool intel_dp_source_supports_hbr2(struct intel_dp *intel_dp)<br>&=
gt; {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 return intel_dp_max_source_rate(i=
ntel_dp) &gt;=3D 540000;<br>&gt; }<br>&gt;<br>&gt; &gt; +<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 drm_dp_mst_topology_mgr_set_mst(&amp;intel_dp-&gt;mst_mgr=
,<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
ntel_dp-&gt;is_mst);<br>&gt; &gt; =C2=A0}<br>&gt; &gt; diff --git a/include=
/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h<br>&gt; &gt; index 6236f=
212da61..ef2b328469cd 100644<br>&gt; &gt; --- a/include/drm/drm_dp_helper.h=
<br>&gt; &gt; +++ b/include/drm/drm_dp_helper.h<br>&gt; &gt; @@ -183,6 +183=
,14 @@ struct drm_device;<br>&gt; &gt; =C2=A0#define DP_SUPPORTED_LINK_RATE=
S =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x010 /* eD=
P 1.4 */<br>&gt; &gt; =C2=A0# define DP_MAX_SUPPORTED_RATES =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8 =C2=A0 =C2=A0 =C2=A0/* 1=
6-bit little-endian */<br>&gt; &gt; <br>&gt; &gt; +enum drm_dp_max_link_rat=
e {<br>&gt; &gt; + =C2=A0 =C2=A0 DRM_DP_MAX_RATE_RBR =3D 0,<br>&gt; &gt; + =
=C2=A0 =C2=A0 DRM_DP_MAX_RATE_HBR,<br>&gt; &gt; + =C2=A0 =C2=A0 DRM_DP_MAX_=
RATE_HBR2,<br>&gt; &gt; + =C2=A0 =C2=A0 DRM_DP_MAX_RATE_HBR3,<br>&gt; &gt; =
+ =C2=A0 =C2=A0 MAX_DRM_DP_MAX_RATE<br>&gt; &gt; +};<br>&gt;<br>&gt; We alr=
eady have 1) actual physical rates, in kHz, and 2) the DPCD rate<br>&gt; co=
des, such as DP_LINK_BW_1_62.<br>&gt;<br>&gt; Do *not* add a third represen=
tation. Prefer kHz throughout, and convert<br>&gt; to/from the DPCD codes n=
ear where they are needed.<br>&gt;<br>&gt; &gt; +<br>&gt; &gt; =C2=A0/* Mul=
tiple stream transport */<br>&gt; &gt; =C2=A0#define DP_FAUX_CAP =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x020 =C2=
=A0 /* 1.2 */<br>&gt; &gt; =C2=A0# define DP_FAUX_CAP_1 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
1 &lt;&lt; 0)<br>&gt; &gt; diff --git a/include/drm/drm_dp_mst_helper.h b/i=
nclude/drm/drm_dp_mst_helper.h<br>&gt; &gt; index f5e92fe9151c..e7d8c899fea=
0 100644<br>&gt; &gt; --- a/include/drm/drm_dp_mst_helper.h<br>&gt; &gt; ++=
+ b/include/drm/drm_dp_mst_helper.h<br>&gt; &gt; @@ -593,6 +593,10 @@ struc=
t drm_dp_mst_topology_mgr {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0* @max_=
payloads: maximum number of payloads the GPU can generate.<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 int max_payloa=
ds;<br>&gt; &gt; + =C2=A0 =C2=A0 /**<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0* @=
max_source_rate: maximum link rate of source.<br>&gt; &gt; + =C2=A0 =C2=A0 =
=C2=A0*/<br>&gt; &gt; + =C2=A0 =C2=A0 int max_source_rate;<br>&gt;<br>&gt; =
Again, make this the actual rate in kHz. That&#39;s what I&#39;d think it i=
s by<br>&gt; reading the comment above anyway.<br>&gt;<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0 /**<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0* @conn_base_id: =
DRM connector ID this mgr is connected to. Only used<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* to build the MST connector path value.<br>&gt;<br>&gt=
; --<br><div>&gt; Jani Nikula, Intel Open Source Graphics Center</div><div>=
Hi Jani, <br></div><div>thanks and will send the v2 according to the sugges=
tions.</div><div><br></div><div>Thanks</div><div><i><b>Koba Ko</b></i><br><=
/div></div>

--000000000000b8306b05b9b46d02--

--===============1529834623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1529834623==--
