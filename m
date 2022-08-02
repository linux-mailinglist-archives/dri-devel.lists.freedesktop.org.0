Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9491588394
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 23:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4717310EED5;
	Tue,  2 Aug 2022 21:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF79011239C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659475759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFOfmxtVu7EZMOowjLBWPWu+qgxqHqWTX6y+slZ99hs=;
 b=Y/uMQ1w9yO4gEJCs6TJKvJs9MivWkd20d/7Xy2WPfVzTWYhgjZR0LOyvzKAtYyOJl68cRv
 4H9ihPzZIzNMje91+j+BMy+ylaFD6mwpQHhH7+nKPXJkhDcXQEjrb/K+5dns5JJcvPCvQR
 J50T+IYuLLeBu6sdRVZXmV9CAyk5+zY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-TRqnw1yoNVKNfhqZbqI_ww-1; Tue, 02 Aug 2022 17:29:18 -0400
X-MC-Unique: TRqnw1yoNVKNfhqZbqI_ww-1
Received: by mail-qk1-f199.google.com with SMTP id
 br36-20020a05620a462400b006b5fa8e5dd5so12305176qkb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 14:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=PFOfmxtVu7EZMOowjLBWPWu+qgxqHqWTX6y+slZ99hs=;
 b=Vj8LkuYU9S1FmlDXOYG62FSFqsCDisJjXduvpOoLqfZ+DBI77Z0W2cI7Eh2ROLA3Hj
 UfSiaOQZQXuQ4pYEPmb9N07yP985AdilH3RvmciFHIwHO3GvSfJg4ssBuO+ngRLrO7cp
 W3YYy21QTsfch6QCCitaig6wG0b4WeWqTbGhR4G4lsDkiS+11asBj1dwB+N2D0+M/1J/
 qdZSm80Pe8NgMVV7VQdunIphgSMjnJgPCgMkRO7E9PxgZ0+SWCwt19ZMpNNMKj4+FaJp
 8wT3axIIBl0IM78KycsDnRe1M7SrXX+kgkCnXo8iG33SCV9JdJtCobmJweyujzq3H1jl
 mMiw==
X-Gm-Message-State: AJIora9RvyC7ubbrgbkPG46eixmeLsCNFy/mzNxRwN91rRp0RvW0Gw4R
 TMTXY/PRGIibwPfmtWlZsUdvifbKXcfFYZCIoIG3tvlLkwTfCZ51vrC91MGLLLPRMQSNih3pkN9
 zmAxariEUKTMt60qum4ruBZ0Hg8pA
X-Received: by 2002:ac8:5949:0:b0:31e:f363:989 with SMTP id
 9-20020ac85949000000b0031ef3630989mr20253536qtz.483.1659475758101; 
 Tue, 02 Aug 2022 14:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uM6ENWF40N2cTsO8PnfzSE/yAqj+3SmfvzwYKtIvLD+0dP6KYNAIDIhegvVFrNuTn9EFo6Wg==
X-Received: by 2002:ac8:5949:0:b0:31e:f363:989 with SMTP id
 9-20020ac85949000000b0031ef3630989mr20253501qtz.483.1659475757766; 
 Tue, 02 Aug 2022 14:29:17 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 bm7-20020a05620a198700b006b629f86244sm11354510qkb.50.2022.08.02.14.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 14:29:17 -0700 (PDT)
Message-ID: <612b5b77b9c4cc9e32f62cfd83b3bad15d43ee06.camel@redhat.com>
Subject: Re: [RESEND RFC 04/18] drm/display/dp_mst: Call them time slots,
 not VCPI slots
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Tue, 02 Aug 2022 17:29:14 -0400
In-Reply-To: <CO6PR12MB54899A4F412F3BE9A105CD6FFCAD9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-5-lyude@redhat.com>
 <CO6PR12MB54899A4F412F3BE9A105CD6FFCAD9@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 open list <linux-kernel@vger.kernel.org>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, "Li, 
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Shih,
 Jude" <Jude.Shih@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Wu, 
 Hersen" <hersenxs.wu@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, He Ying <heying24@huawei.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Li, Roman" <Roman.Li@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 "Kazlauskas, 
 Nicholas" <Nicholas.Kazlauskas@amd.com>, Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-06-15 at 04:28 +0000, Lin, Wayne wrote:
> [Public]
> 
> Thank you Lyude for addressing this!
> 
> VCPI is also a confusing naming to me at first glance since it stands for 
> Virtual Channel Payload Identification which is just an ID number ( we can 
>  look up these payload IDs In DPCD 0x2C1 ~0x2FF).
> 
> I also look up left VCPI terms in rest of the code. Seems like we still can
> modify 
> some parts here? Like:
> 
> /**
>  * struct drm_dp_vcpi - Virtual Channel Payload Identifier
>  * @vcpi: Virtual channel ID.
>  * @pbn: Payload Bandwidth Number for this channel
>  * @aligned_pbn: PBN aligned with slot size
>  * @num_slots: number of slots for this PBN
>  */
> struct drm_dp_vcpi {
>         int vcpi;
>         int pbn;
>         int aligned_pbn;
>         int num_slots;
> };
> 
> Would like to change the structure name to  "struct drm_dp_mst_vcp {}" to
> represent
> the virtual channel payload. Not specific to the ID.
> Would like to know your thoughts : )

JFYI - I didn't rename this structure because we actually remove it entirely
in later patches

> 
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Wednesday, June 8, 2022 3:29 AM
> > To: dri-devel@lists.freedesktop.org; nouveau@lists.freedesktop.org; amd-
> > gfx@lists.freedesktop.org
> > Cc: Lin, Wayne <Wayne.Lin@amd.com>; Ville Syrjälä
> > <ville.syrjala@linux.intel.com>; Zuo, Jerry <Jerry.Zuo@amd.com>; Jani
> > Nikula
> > <jani.nikula@intel.com>; Imre Deak <imre.deak@intel.com>; Daniel Vetter
> > <daniel.vetter@ffwll.ch>; Sean Paul <sean@poorly.run>; Wentland, Harry
> > <Harry.Wentland@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;
> > Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Jani Nikula
> > <jani.nikula@linux.intel.com>; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Rodrigo Vivi <rodrigo.vivi@intel.com>;
> > Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Ben Skeggs
> > <bskeggs@redhat.com>; Karol Herbst <kherbst@redhat.com>; Kazlauskas,
> > Nicholas <Nicholas.Kazlauskas@amd.com>; Li, Roman
> > <Roman.Li@amd.com>; Shih, Jude <Jude.Shih@amd.com>; Simon Ser
> > <contact@emersion.fr>; Wu, Hersen <hersenxs.wu@amd.com>; Thomas
> > Zimmermann <tzimmermann@suse.de>; Lakha, Bhawanpreet
> > <Bhawanpreet.Lakha@amd.com>; José Roberto de Souza
> > <jose.souza@intel.com>; He Ying <heying24@huawei.com>; Matt Roper
> > <matthew.d.roper@intel.com>; Sean Paul <seanpaul@chromium.org>; Hans
> > Verkuil <hverkuil-cisco@xs4all.nl>; Fernando Ramos <greenfoo@u92.eu>;
> > Javier Martinez Canillas <javierm@redhat.com>; open list <linux-
> > kernel@vger.kernel.org>; open list:INTEL DRM DRIVERS <intel-
> > gfx@lists.freedesktop.org>
> > Subject: [RESEND RFC 04/18] drm/display/dp_mst: Call them time slots, not
> > VCPI slots
> > 
> > VCPI is only sort of the correct term here, originally the majority of
> > this code
> > simply referred to timeslots vaguely as "slots" - and since I started
> > working
> > on it and adding atomic functionality, the name "VCPI slots" has been used
> > to
> > represent time slots.
> > 
> > Now that we actually have consistent access to the DisplayPort spec thanks
> > to
> > VESA, I now know this isn't actually the proper term - as the
> > specification
> > refers to these as time slots.
> > 
> > Since we're trying to make this code as easy to figure out as possible,
> > let's
> > take this opportunity to correct this nomenclature and call them by their
> > proper name - timeslots. Likewise, we rename various functions
> > appropriately, along with replacing references in the kernel documentation
> > and various debugging messages.
> > 
> > It's important to note that this patch series leaves the legacy MST code
> > untouched for the most part, which is fine since we'll be removing it soon
> > anyhow. There should be no functional changes in this series.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Imre Deak <imre.deak@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Sean Paul <sean@poorly.run>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  28 ++---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 106 +++++++++---------
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   5 +-
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |   4 +-
> >  include/drm/display/drm_dp_mst_helper.h       |   6 +-
> >  6 files changed, 75 insertions(+), 76 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index ad4571190a90..f84a4ad736d8 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -7393,7 +7393,7 @@ static int dm_encoder_helper_atomic_check(struct
> > drm_encoder *encoder,
> >                 clock = adjusted_mode->clock;
> >                 dm_new_connector_state->pbn =
> > drm_dp_calc_pbn_mode(clock, bpp, false);
> >         }
> > -       dm_new_connector_state->vcpi_slots =
> > drm_dp_atomic_find_vcpi_slots(state,
> > +       dm_new_connector_state->vcpi_slots =
> > +drm_dp_atomic_find_time_slots(state,
> > 
> > mst_mgr,
> > 
> > mst_port,
> > 
> > dm_new_connector_state->pbn, diff --git
> > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 9221b6690a4a..e40ff51e7be0 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -378,7 +378,7 @@ static int dm_dp_mst_atomic_check(struct
> > drm_connector *connector,
> >                         return 0;
> >                 }
> > 
> > -       return drm_dp_atomic_release_vcpi_slots(state,
> > +       return drm_dp_atomic_release_time_slots(state,
> >                                                 mst_mgr,
> >                                                 mst_port);
> >  }
> > @@ -689,7 +689,7 @@ static void increase_dsc_bpp(struct
> > drm_atomic_state *state,
> > 
> >                 if (initial_slack[next_index] > fair_pbn_alloc) {
> >                         vars[next_index].pbn += fair_pbn_alloc;
> > -                       if (drm_dp_atomic_find_vcpi_slots(state,
> > +                       if (drm_dp_atomic_find_time_slots(state,
> > 
> > params[next_index].port->mgr,
> > 
> > params[next_index].port,
> > 
> > vars[next_index].pbn,
> > @@ -699,7 +699,7 @@ static void increase_dsc_bpp(struct
> > drm_atomic_state *state,
> >                                 vars[next_index].bpp_x16 =
> > bpp_x16_from_pbn(params[next_index], vars[next_index].pbn);
> >                         } else {
> >                                 vars[next_index].pbn -= fair_pbn_alloc;
> > -                               if (drm_dp_atomic_find_vcpi_slots(state,
> > +                               if (drm_dp_atomic_find_time_slots(state,
> > 
> > params[next_index].port->mgr,
> > 
> > params[next_index].port,
> > 
> > vars[next_index].pbn,
> > @@ -708,7 +708,7 @@ static void increase_dsc_bpp(struct
> > drm_atomic_state *state,
> >                         }
> >                 } else {
> >                         vars[next_index].pbn += initial_slack[next_index];
> > -                       if (drm_dp_atomic_find_vcpi_slots(state,
> > +                       if (drm_dp_atomic_find_time_slots(state,
> > 
> > params[next_index].port->mgr,
> > 
> > params[next_index].port,
> > 
> > vars[next_index].pbn,
> > @@ -718,7 +718,7 @@ static void increase_dsc_bpp(struct
> > drm_atomic_state *state,
> >                                 vars[next_index].bpp_x16 =
> > params[next_index].bw_range.max_target_bpp_x16;
> >                         } else {
> >                                 vars[next_index].pbn -=
> > initial_slack[next_index];
> > -                               if (drm_dp_atomic_find_vcpi_slots(state,
> > +                               if (drm_dp_atomic_find_time_slots(state,
> > 
> > params[next_index].port->mgr,
> > 
> > params[next_index].port,
> > 
> > vars[next_index].pbn,
> > @@ -775,7 +775,7 @@ static void try_disable_dsc(struct drm_atomic_state
> > *state,
> >                         break;
> > 
> >                 vars[next_index].pbn =
> > kbps_to_peak_pbn(params[next_index].bw_range.stream_kbps);
> > -               if (drm_dp_atomic_find_vcpi_slots(state,
> > +               if (drm_dp_atomic_find_time_slots(state,
> >                                                   params[next_index].port-
> > > mgr,
> >                                                   params[next_index].port,
> >                                                   vars[next_index].pbn,
> > @@ -787,7 +787,7 @@ static void try_disable_dsc(struct drm_atomic_state
> > *state,
> >                         vars[next_index].bpp_x16 = 0;
> >                 } else {
> >                         vars[next_index].pbn =
> > kbps_to_peak_pbn(params[next_index].bw_range.max_kbps);
> > -                       if (drm_dp_atomic_find_vcpi_slots(state,
> > +                       if (drm_dp_atomic_find_time_slots(state,
> > 
> > params[next_index].port->mgr,
> > 
> > params[next_index].port,
> > 
> > vars[next_index].pbn,
> > @@ -873,11 +873,11 @@ static bool
> > compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
> >                 vars[i + k].pbn =
> > kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
> >                 vars[i + k].dsc_enabled = false;
> >                 vars[i + k].bpp_x16 = 0;
> > -               if (drm_dp_atomic_find_vcpi_slots(state,
> > -                                                params[i].port->mgr,
> > -                                                params[i].port,
> > -                                                vars[i + k].pbn,
> > -
> > dm_mst_get_pbn_divider(dc_link)) < 0)
> > +               if (drm_dp_atomic_find_time_slots(state,
> > +                                                 params[i].port->mgr,
> > +                                                 params[i].port,
> > +                                                 vars[i + k].pbn,
> > +
> > dm_mst_get_pbn_divider(dc_link)) < 0)
> >                         return false;
> >         }
> >         if (!drm_dp_mst_atomic_check(state) && !debugfs_overwrite) { @@
> > -891,7 +891,7 @@ static bool compute_mst_dsc_configs_for_link(struct
> > drm_atomic_state *state,
> >                         vars[i + k].pbn =
> > kbps_to_peak_pbn(params[i].bw_range.min_kbps);
> >                         vars[i + k].dsc_enabled = true;
> >                         vars[i + k].bpp_x16 =
> > params[i].bw_range.min_target_bpp_x16;
> > -                       if (drm_dp_atomic_find_vcpi_slots(state,
> > +                       if (drm_dp_atomic_find_time_slots(state,
> >                                                           params[i].port-
> > >mgr,
> >                                                           params[i].port,
> >                                                           vars[i + k].pbn,
> > @@ -901,7 +901,7 @@ static bool compute_mst_dsc_configs_for_link(struct
> > drm_atomic_state *state,
> >                         vars[i + k].pbn =
> > kbps_to_peak_pbn(params[i].bw_range.stream_kbps);
> >                         vars[i + k].dsc_enabled = false;
> >                         vars[i + k].bpp_x16 = 0;
> > -                       if (drm_dp_atomic_find_vcpi_slots(state,
> > +                       if (drm_dp_atomic_find_time_slots(state,
> >                                                           params[i].port-
> > >mgr,
> >                                                           params[i].port,
> >                                                           vars[i + k].pbn,
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 38eecb89e22d..702ff5d9ecc7 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -4304,11 +4304,11 @@ struct edid *drm_dp_mst_get_edid(struct
> > drm_connector *connector, struct drm_dp_
> > EXPORT_SYMBOL(drm_dp_mst_get_edid);
> > 
> >  /**
> > - * drm_dp_find_vcpi_slots() - Find VCPI slots for this PBN value
> > + * drm_dp_find_vcpi_slots() - Find time slots for this PBN value
> >   * @mgr: manager to use
> >   * @pbn: payload bandwidth to convert into slots.
> >   *
> > - * Calculate the number of VCPI slots that will be required for the given
> > PBN
> > + * Calculate the number of time slots that will be required for the
> > + given PBN
> >   * value. This function is deprecated, and should not be used in atomic
> >   * drivers.
> >   *
> > @@ -4345,17 +4345,17 @@ static int drm_dp_init_vcpi(struct
> > drm_dp_mst_topology_mgr *mgr,  }
> > 
> >  /**
> > - * drm_dp_atomic_find_vcpi_slots() - Find and add VCPI slots to the state
> > + * drm_dp_atomic_find_time_slots() - Find and add time slots to the
> > + state
> >   * @state: global atomic state
> >   * @mgr: MST topology manager for the port
> > - * @port: port to find vcpi slots for
> > + * @port: port to find time slots for
> >   * @pbn: bandwidth required for the mode in PBN
> >   * @pbn_div: divider for DSC mode that takes FEC into account
> >   *
> > - * Allocates VCPI slots to @port, replacing any previous VCPI allocations
> > it
> > + * Allocates time slots to @port, replacing any previous timeslot
> > + allocations it
> >   * may have had. Any atomic drivers which support MST must call this
> > function
> >   * in their &drm_encoder_helper_funcs.atomic_check() callback to change
> > the
> > - * current VCPI allocation for the new state, but only when
> > + * current timeslot allocation for the new state, but only when
> >   * &drm_crtc_state.mode_changed or &drm_crtc_state.connectors_changed
> > is set
> >   * to ensure compatibility with userspace applications that still use the
> >   * legacy modesetting UAPI.
> > @@ -4365,17 +4365,17 @@ static int drm_dp_init_vcpi(struct
> > drm_dp_mst_topology_mgr *mgr,
> >   *
> >   * Additionally, it is OK to call this function multiple times on the
> > same
> >   * @port as needed. It is not OK however, to call this function and
> > - * drm_dp_atomic_release_vcpi_slots() in the same atomic check phase.
> > + * drm_dp_atomic_release_time_slots() in the same atomic check phase.
> >   *
> >   * See also:
> > - * drm_dp_atomic_release_vcpi_slots()
> > + * drm_dp_atomic_release_time_slots()
> >   * drm_dp_mst_atomic_check()
> >   *
> >   * Returns:
> >   * Total slots in the atomic state assigned for this port, or a negative
> > error
> >   * code if the port no longer exists
> >   */
> > -int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> > +int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
> >                                   struct drm_dp_mst_topology_mgr *mgr,
> >                                   struct drm_dp_mst_port *port, int pbn,
> >                                   int pbn_div)
> > @@ -4392,17 +4392,17 @@ int drm_dp_atomic_find_vcpi_slots(struct
> > drm_atomic_state *state,
> >         list_for_each_entry(pos, &topology_state->payloads, next) {
> >                 if (pos->port == port) {
> >                         payload = pos;
> > -                       prev_slots = payload->vcpi;
> > +                       prev_slots = payload->time_slots;
> >                         prev_bw = payload->pbn;
> > 
> >                         /*
> >                          * This should never happen, unless the driver
> > tries
> > -                        * releasing and allocating the same VCPI
> > allocation,
> > +                        * releasing and allocating the same timeslot
> > allocation,
> >                          * which is an error
> >                          */
> >                         if (WARN_ON(!prev_slots)) {
> >                                 drm_err(mgr->dev,
> > -                                       "cannot allocate and release VCPI
> > on
> > [MST PORT:%p] in the same state\n",
> > +                                       "cannot allocate and release time
> > slots on [MST PORT:%p] in the
> > +same state\n",
> >                                         port);
> >                                 return -EINVAL;
> >                         }
> > @@ -4420,7 +4420,7 @@ int drm_dp_atomic_find_vcpi_slots(struct
> > drm_atomic_state *state,
> > 
> >         req_slots = DIV_ROUND_UP(pbn, pbn_div);
> > 
> > -       drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p]
> > VCPI %d -> %d\n",
> > +       drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p]
> > TU %d ->
> > +%d\n",
> >                        port->connector->base.id, port->connector->name,
> >                        port, prev_slots, req_slots);
> >         drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p]
> > PBN %d -> %d\n", @@ -4437,20 +4437,20 @@ int
> > drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> >                 payload->port = port;
> >                 list_add(&payload->next, &topology_state->payloads);
> >         }
> > -       payload->vcpi = req_slots;
> > +       payload->time_slots = req_slots;
> >         payload->pbn = pbn;
> > 
> >         return req_slots;
> >  }
> > -EXPORT_SYMBOL(drm_dp_atomic_find_vcpi_slots);
> > +EXPORT_SYMBOL(drm_dp_atomic_find_time_slots);
> > 
> >  /**
> > - * drm_dp_atomic_release_vcpi_slots() - Release allocated vcpi slots
> > + * drm_dp_atomic_release_time_slots() - Release allocated time slots
> >   * @state: global atomic state
> >   * @mgr: MST topology manager for the port
> > - * @port: The port to release the VCPI slots from
> > + * @port: The port to release the time slots from
> >   *
> > - * Releases any VCPI slots that have been allocated to a port in the
> > atomic
> > + * Releases any time slots that have been allocated to a port in the
> > + atomic
> >   * state. Any atomic drivers which support MST must call this function in
> >   * their &drm_connector_helper_funcs.atomic_check() callback when the
> >   * connector will no longer have VCPI allocated (e.g. because its CRTC
> > was
> > @@ -4459,18 +4459,18 @@
> > EXPORT_SYMBOL(drm_dp_atomic_find_vcpi_slots);
> >   * It is OK to call this even if @port has been removed from the system.
> >   * Additionally, it is OK to call this function multiple times on the
> > same
> >   * @port as needed. It is not OK however, to call this function and
> > - * drm_dp_atomic_find_vcpi_slots() on the same @port in a single atomic
> > check
> > + * drm_dp_atomic_find_time_slots() on the same @port in a single atomic
> > + check
> >   * phase.
> >   *
> >   * See also:
> > - * drm_dp_atomic_find_vcpi_slots()
> > + * drm_dp_atomic_find_time_slots()
> >   * drm_dp_mst_atomic_check()
> >   *
> >   * Returns:
> >   * 0 if all slots for this port were added back to
> >   * &drm_dp_mst_topology_state.avail_slots or negative error code
> >   */
> > -int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
> > +int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
> >                                      struct drm_dp_mst_topology_mgr *mgr,
> >                                      struct drm_dp_mst_port *port)
> >  {
> > @@ -4494,16 +4494,16 @@ int drm_dp_atomic_release_vcpi_slots(struct
> > drm_atomic_state *state,
> >                 return -EINVAL;
> >         }
> > 
> > -       drm_dbg_atomic(mgr->dev, "[MST PORT:%p] VCPI %d -> 0\n", port,
> > pos->vcpi);
> > -       if (pos->vcpi) {
> > +       drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port,
> > pos->time_slots);
> > +       if (pos->time_slots) {
> >                 drm_dp_mst_put_port_malloc(port);
> > -               pos->vcpi = 0;
> > +               pos->time_slots = 0;
> >                 pos->pbn = 0;
> >         }
> > 
> >         return 0;
> >  }
> > -EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
> > +EXPORT_SYMBOL(drm_dp_atomic_release_time_slots);
> > 
> >  /**
> >   * drm_dp_mst_update_slots() - updates the slot info depending on the DP
> > ecoding format @@ -4557,7 +4557,7 @@ bool
> > drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> > 
> >         ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
> >         if (ret) {
> > -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d
> > ret=%d\n",
> > +               drm_dbg_kms(mgr->dev, "failed to init time slots=%d
> > ret=%d\n",
> >                             DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> >                 drm_dp_mst_topology_put_port(port);
> >                 goto out;
> > @@ -5083,8 +5083,8 @@ drm_dp_mst_duplicate_state(struct
> > drm_private_obj *obj)
> >         INIT_LIST_HEAD(&state->payloads);
> > 
> >         list_for_each_entry(pos, &old_state->payloads, next) {
> > -               /* Prune leftover freed VCPI allocations */
> > -               if (!pos->vcpi)
> > +               /* Prune leftover freed timeslot allocations */
> > +               if (!pos->time_slots)
> >                         continue;
> > 
> >                 payload = kmemdup(pos, sizeof(*payload), GFP_KERNEL);
> > @@ -5116,7 +5116,7 @@ static void drm_dp_mst_destroy_state(struct
> > drm_private_obj *obj,
> > 
> >         list_for_each_entry_safe(pos, tmp, &mst_state->payloads, next) {
> >                 /* We only keep references to ports with non-zero VCPIs */
> > -               if (pos->vcpi)
> > +               if (pos->time_slots)
> >                         drm_dp_mst_put_port_malloc(pos->port);
> >                 kfree(pos);
> >         }
> > @@ -5242,28 +5242,28 @@
> > drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,  }
> > 
> >  static inline int
> > -drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > drm_dp_mst_topology_mgr *mgr,
> > -                                        struct drm_dp_mst_topology_state
> > *mst_state)
> > +drm_dp_mst_atomic_check_payload_alloc_limits(struct
> > drm_dp_mst_topology_mgr *mgr,
> > +                                            struct
> > drm_dp_mst_topology_state *mst_state)
> >  {
> >         struct drm_dp_mst_atomic_payload *payload;
> >         int avail_slots = mst_state->total_avail_slots, payload_count = 0;
> > 
> >         list_for_each_entry(payload, &mst_state->payloads, next) {
> >                 /* Releasing payloads is always OK-even if the port is
> > gone */
> > -               if (!payload->vcpi) {
> > -                       drm_dbg_atomic(mgr->dev, "[MST PORT:%p]
> > releases all VCPI slots\n",
> > +               if (!payload->time_slots) {
> > +                       drm_dbg_atomic(mgr->dev, "[MST PORT:%p]
> > releases all time slots\n",
> >                                        payload->port);
> >                         continue;
> >                 }
> > 
> > -               drm_dbg_atomic(mgr->dev, "[MST PORT:%p] requires %d
> > vcpi slots\n",
> > -                              payload->port, payload->vcpi);
> > +               drm_dbg_atomic(mgr->dev, "[MST PORT:%p] requires %d
> > time slots\n",
> > +                              payload->port, payload->time_slots);
> > 
> > -               avail_slots -= payload->vcpi;
> > +               avail_slots -= payload->time_slots;
> >                 if (avail_slots < 0) {
> >                         drm_dbg_atomic(mgr->dev,
> > -                                      "[MST PORT:%p] not enough VCPI
> > slots in
> > mst state %p (avail=%d)\n",
> > -                                      payload->port, mst_state,
> > avail_slots +
> > payload->vcpi);
> > +                                      "[MST PORT:%p] not enough time
> > slots in
> > mst state %p (avail=%d)\n",
> > +                                      payload->port, mst_state,
> > avail_slots +
> > +payload->time_slots);
> >                         return -ENOSPC;
> >                 }
> > 
> > @@ -5274,7 +5274,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> > drm_dp_mst_topology_mgr *mgr,
> >                         return -EINVAL;
> >                 }
> >         }
> > -       drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI
> > avail=%d used=%d\n",
> > +       drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p TU
> > avail=%d
> > +used=%d\n",
> >                        mgr, mst_state, avail_slots, mst_state-
> > >total_avail_slots -
> > avail_slots);
> > 
> >         return 0;
> > @@ -5363,7 +5363,7 @@ int drm_dp_mst_atomic_enable_dsc(struct
> > drm_atomic_state *state,
> >         struct drm_dp_mst_topology_state *mst_state;
> >         struct drm_dp_mst_atomic_payload *pos;
> >         bool found = false;
> > -       int vcpi = 0;
> > +       int time_slots = 0;
> > 
> >         mst_state = drm_atomic_get_mst_topology_state(state, port->mgr);
> > 
> > @@ -5379,30 +5379,30 @@ int drm_dp_mst_atomic_enable_dsc(struct
> > drm_atomic_state *state,
> > 
> >         if (!found) {
> >                 drm_dbg_atomic(state->dev,
> > -                              "[MST PORT:%p] Couldn't find VCPI
> > allocation in
> > mst state %p\n",
> > +                              "[MST PORT:%p] Couldn't find payload in mst
> > state %p\n",
> >                                port, mst_state);
> >                 return -EINVAL;
> >         }
> > 
> >         if (pos->dsc_enabled == enable) {
> >                 drm_dbg_atomic(state->dev,
> > -                              "[MST PORT:%p] DSC flag is already set to
> > %d,
> > returning %d VCPI slots\n",
> > -                              port, enable, pos->vcpi);
> > -               vcpi = pos->vcpi;
> > +                              "[MST PORT:%p] DSC flag is already set to
> > %d,
> > returning %d time slots\n",
> > +                              port, enable, pos->time_slots);
> > +               time_slots = pos->time_slots;
> >         }
> > 
> >         if (enable) {
> > -               vcpi = drm_dp_atomic_find_vcpi_slots(state, port->mgr,
> > port,
> > pbn, pbn_div);
> > +               time_slots = drm_dp_atomic_find_time_slots(state, port-
> > > mgr, port,
> > +pbn, pbn_div);
> >                 drm_dbg_atomic(state->dev,
> > -                              "[MST PORT:%p] Enabling DSC flag,
> > reallocating
> > %d VCPI slots on the port\n",
> > -                              port, vcpi);
> > -               if (vcpi < 0)
> > +                              "[MST PORT:%p] Enabling DSC flag,
> > reallocating
> > %d time slots on the port\n",
> > +                              port, time_slots);
> > +               if (time_slots < 0)
> >                         return -EINVAL;
> >         }
> > 
> >         pos->dsc_enabled = enable;
> > 
> > -       return vcpi;
> > +       return time_slots;
> >  }
> >  EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
> >  /**
> > @@ -5412,15 +5412,15 @@
> > EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
> >   *
> >   * Checks the given topology state for an atomic update to ensure that
> > it's
> >   * valid. This includes checking whether there's enough bandwidth to
> > support
> > - * the new VCPI allocations in the atomic update.
> > + * the new timeslot allocations in the atomic update.
> >   *
> >   * Any atomic drivers supporting DP MST must make sure to call this after
> >   * checking the rest of their state in their
> >   * &drm_mode_config_funcs.atomic_check() callback.
> >   *
> >   * See also:
> > - * drm_dp_atomic_find_vcpi_slots()
> > - * drm_dp_atomic_release_vcpi_slots()
> > + * drm_dp_atomic_find_time_slots()
> > + * drm_dp_atomic_release_time_slots()
> >   *
> >   * Returns:
> >   *
> > @@ -5436,7 +5436,7 @@ int drm_dp_mst_atomic_check(struct
> > drm_atomic_state *state)
> >                 if (!mgr->mst_state)
> >                         continue;
> > 
> > -               ret = drm_dp_mst_atomic_check_vcpi_alloc_limit(mgr,
> > mst_state);
> > +               ret = drm_dp_mst_atomic_check_payload_alloc_limits(mgr,
> > mst_state);
> >                 if (ret)
> >                         break;
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 061b277e5ce7..0c922667398a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -70,7 +70,7 @@ static int intel_dp_mst_compute_link_config(struct
> > intel_encoder *encoder,
> >                                                        crtc_state-
> > >pipe_bpp,
> >                                                        false);
> > 
> > -               slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp-
> > > mst_mgr,
> > +               slots = drm_dp_atomic_find_time_slots(state, &intel_dp-
> > > mst_mgr,
> >                                                       connector->port,
> >                                                       crtc_state->pbn,
> > 
> > drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
> > @@ -344,8 +344,7 @@ intel_dp_mst_atomic_check(struct drm_connector
> > *connector,
> >         }
> > 
> >         mgr = &enc_to_mst(to_intel_encoder(old_conn_state-
> > > best_encoder))->primary->dp.mst_mgr;
> > -       ret = drm_dp_atomic_release_vcpi_slots(&state->base, mgr,
> > -                                              intel_connector->port);
> > +       ret = drm_dp_atomic_release_time_slots(&state->base, mgr,
> > +intel_connector->port);
> > 
> >         return ret;
> >  }
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 4347f0b61797..631dba5a2418 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1070,7 +1070,7 @@ nv50_msto_atomic_check(struct drm_encoder
> > *encoder,
> >                                                     false);
> >         }
> > 
> > -       slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr, mstc-
> > > port,
> > +       slots = drm_dp_atomic_find_time_slots(state, &mstm->mgr, mstc-
> > > port,
> >                                               asyh->dp.pbn, 0);
> >         if (slots < 0)
> >                 return slots;
> > @@ -1282,7 +1282,7 @@ nv50_mstc_atomic_check(struct drm_connector
> > *connector,
> >                         return 0;
> >         }
> > 
> > -       return drm_dp_atomic_release_vcpi_slots(state, mgr, mstc->port);
> > +       return drm_dp_atomic_release_time_slots(state, mgr, mstc->port);
> >  }
> > 
> >  static int
> > diff --git a/include/drm/display/drm_dp_mst_helper.h
> > b/include/drm/display/drm_dp_mst_helper.h
> > index 5671173f9f37..8ab4f14f2344 100644
> > --- a/include/drm/display/drm_dp_mst_helper.h
> > +++ b/include/drm/display/drm_dp_mst_helper.h
> > @@ -544,7 +544,7 @@ struct drm_dp_payload {
> > 
> >  struct drm_dp_mst_atomic_payload {
> >         struct drm_dp_mst_port *port;
> > -       int vcpi;
> > +       int time_slots;
> >         int pbn;
> >         bool dsc_enabled;
> >         struct list_head next;
> > @@ -846,7 +846,7 @@ void drm_dp_mst_connector_early_unregister(struct
> > drm_connector *connector,  struct drm_dp_mst_topology_state
> > *drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
> >                                                                     struct
> > drm_dp_mst_topology_mgr *mgr);  int __must_check -
> > drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
> > +drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
> >                               struct drm_dp_mst_topology_mgr *mgr,
> >                               struct drm_dp_mst_port *port, int pbn,
> >                               int pbn_div);
> > @@ -858,7 +858,7 @@ int __must_check
> >  drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state,
> >                                   struct drm_dp_mst_topology_mgr *mgr);
> > int __must_check -drm_dp_atomic_release_vcpi_slots(struct
> > drm_atomic_state *state,
> > +drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
> >                                  struct drm_dp_mst_topology_mgr *mgr,
> >                                  struct drm_dp_mst_port *port);
> >  int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr
> > *mgr,
> > --
> > 2.35.3
> --
> Regards,
> Wayne Lin

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

