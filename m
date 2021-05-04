Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109293726BD
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 09:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E376EA99;
	Tue,  4 May 2021 07:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7BC6EA95
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 07:43:21 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id y7so11656291ejj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=T437ufXcFQfh2vf8BzFPeP3ANbU0aKdpNP7I1Lbc0Vw=;
 b=lChERQKl0NnJlNYYs3WD/9INmqVvpMtlGycZ/M3ujVJJjsi0rOqlMYfeI/bEcSdacy
 I3eYReSwcpcmHwy0BeznmqHtU6Q5jYiUvm37kZHZJEDCs6nslm92Mstvjp9Hs1Y6KlHO
 xiYgVX2bpFg40uMh7T/5WD+WxevDUqKjWhgZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=T437ufXcFQfh2vf8BzFPeP3ANbU0aKdpNP7I1Lbc0Vw=;
 b=cSRtFwPC8DPXL+nZfDZuiVzM1GrxsCgJHDtJiCp/NTiMuYAr3zjOXv+Dv61n+HTu4+
 kFkbyFfXpZmFsPP9ZsyLSzDAZkGqz1Wf3h81INb+oaScZaOnMJwLwwsDYE26PeklWOqd
 r+y/p1tx1KgvqM9EFtMuO8oACxFN7Z7NuyQgjR05dkgHv0bQ/SKrIumGIbiEmWuRTaDD
 9ERmpF9Z2lsLGy8dXg7KHyuod0NuEB5bdTiEPSGrGDwr9/EUFXQGoVOEYx3UezF7jB+U
 OxWz2xAau0suWyfKnGXiXwRBJmzOU5VoxyaMHDRl/6OynbS2inLavNBc9hXPAJ5aqAaI
 bp2Q==
X-Gm-Message-State: AOAM530UZGA9f+0P9xg53iGfRss5t4w9jTICvB9IY1JVKkvn0AZ4ArPL
 5WwPh9EsucL2g8MfiB1eGKfM+w==
X-Google-Smtp-Source: ABdhPJy427L+gXilEP/lgLdQZgt2hWUrN/fy5m5KwbYbYHqxj2+g4Nqk5tfoMxe8KYmJ/mwcF/0d4Q==
X-Received: by 2002:a17:906:c04a:: with SMTP id
 bm10mr20420768ejb.521.1620114200482; 
 Tue, 04 May 2021 00:43:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z22sm934890ejo.113.2021.05.04.00.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 00:43:19 -0700 (PDT)
Date: Tue, 4 May 2021 09:43:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Heads up to maintainers] Re: [PATCH v8 1/1] drm/drm_mst: Use
 Extended Base Receiver Capability DPCD space
Message-ID: <YJD7Fv40M3aEfUr0@phenom.ffwll.local>
References: <20210428234346.1085977-1-nikola.cornij@amd.com>
 <20210428234346.1085977-2-nikola.cornij@amd.com>
 <2bc4cf58838635b357e77d2a132fd901dc477c71.camel@redhat.com>
 <8735v82unm.fsf@intel.com> <87mttc1ajm.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mttc1ajm.fsf@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>, amd-gfx@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, mikita.lipski@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 03, 2021 at 11:33:33AM +0300, Jani Nikula wrote:
> On Fri, 30 Apr 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Thu, 29 Apr 2021, Lyude Paul <lyude@redhat.com> wrote:
> >> JFYI Jani and Ben: I will be pushing this patch to drm-misc-next somet=
ime
> >> today if there's no objections
> >
> > Thanks for the heads-up, I think this breaks i915. See my review
> > comments elsewhere in the thread.
> =

> Looks like this was merged anyway.

Yeah in general rule of thumb is to let cross-driver stuff soak for a week
(assuming correctly cc'ed and all that already). I think that's the sweet
spot between maintainers who complain that it's too short and others
complaining it's too quick :-)
-Daniel

> =

> 98025a62cb00 ("drm/dp_mst: Use Extended Base Receiver Capability DPCD spa=
ce")
> =

> I'm not happy how this played out.
> =

> 1) You need to Cc relevant people
> =

> 2) You need to get the ack before merging changes
> =

> 3) You need to give people more than a day to react, with time zones and
> all; I replied as soon as I saw the heads-up, but it was already too
> late
> =

> It's broken on i915, and perhaps that could be fixed.
> =

> However I also think using DP spec rate codes and calling them "rate" is
> a bad interface, especially when the unit breaks down with DP 2.0 rate
> codes. It's confusing and it's not future proof. Fixing that afterwards
> falls to whoever comes next to pick up the pieces.
> =

> I'd rather just see this reverted and redone.
> =

> =

> BR,
> Jani.
> =

> =

> >
> > BR,
> > Jani.
> >
> >
> >>
> >> On Wed, 2021-04-28 at 19:43 -0400, Nikola Cornij wrote:
> >>> [why]
> >>> DP 1.4a spec madates that if DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is
> >>> set, Extended Base Receiver Capability DPCD space must be used. Witho=
ut
> >>> doing that, the three DPCD values that differ will be wrong, leading =
to
> >>> incorrect or limited functionality. MST link rate, for example, could
> >>> have a lower value. Also, Synaptics quirk wouldn't work out well when
> >>> Extended DPCD was not read, resulting in no DSC for such hubs.
> >>> =

> >>> [how]
> >>> Modify MST topology manager to use the values from Extended DPCD where
> >>> applicable.
> >>> =

> >>> To prevent regression on the sources that have a lower maximum link r=
ate
> >>> capability than MAX_LINK_RATE from Extended DPCD, have the drivers
> >>> supply maximum lane count and rate at initialization time.
> >>> =

> >>> This also reverts 'commit 2dcab875e763 ("Revert drm/dp_mst: Retrieve
> >>> extended DPCD caps for topology manager")', brining the change back to
> >>> the original 'commit ad44c03208e4 ("drm/dp_mst: Retrieve extended DPCD
> >>> caps for topology manager")'.
> >>> =

> >>> Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
> >>> ---
> >>> =A0.../display/amdgpu_dm/amdgpu_dm_mst_types.c=A0=A0 |=A0 5 +++
> >>> =A0.../gpu/drm/amd/display/dc/core/dc_link_dp.c=A0 | 18 ++++++++++
> >>> =A0drivers/gpu/drm/amd/display/dc/dc_link.h=A0=A0=A0=A0=A0 |=A0 2 ++
> >>> =A0drivers/gpu/drm/drm_dp_mst_topology.c=A0=A0=A0=A0=A0=A0=A0=A0 | 33=
 ++++++++++++-------
> >>> =A0drivers/gpu/drm/i915/display/intel_dp_mst.c=A0=A0 |=A0 6 +++-
> >>> =A0drivers/gpu/drm/nouveau/dispnv50/disp.c=A0=A0=A0=A0=A0=A0 |=A0 3 +-
> >>> =A0drivers/gpu/drm/radeon/radeon_dp_mst.c=A0=A0=A0=A0=A0=A0=A0 |=A0 7=
 ++++
> >>> =A0include/drm/drm_dp_mst_helper.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 | 12 ++++++-
> >>> =A08 files changed, 71 insertions(+), 15 deletions(-)
> >>> =

> >>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_type=
s.c
> >>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> >>> index 997567f6f0ba..b7e01b6fb328 100644
> >>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> >>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> >>> @@ -429,6 +429,8 @@ void amdgpu_dm_initialize_dp_connector(struct
> >>> amdgpu_display_manager *dm,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct amdgpu_dm_connector
> >>> *aconnector,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int link_index)
> >>> =A0{
> >>> +=A0=A0=A0=A0=A0=A0=A0struct dc_link_settings max_link_enc_cap =3D {0=
};
> >>> +
> >>> =A0=A0=A0=A0=A0=A0=A0=A0aconnector->dm_dp_aux.aux.name =3D
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0kasprintf(GFP_KERNEL,=
 "AMDGPU DM aux hw bus %d",
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 link_index);
> >>> @@ -443,6 +445,7 @@ void amdgpu_dm_initialize_dp_connector(struct
> >>> amdgpu_display_manager *dm,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (aconnector->base.connector_type =3D=3D DR=
M_MODE_CONNECTOR_eDP)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return;
> >>> =A0
> >>> +=A0=A0=A0=A0=A0=A0=A0dc_link_dp_get_max_link_enc_cap(aconnector->dc_=
link,
> >>> &max_link_enc_cap);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0drm_dp_mst_topology_mgr_init(
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0&aconnector->mst_mgr,
> >>> @@ -450,6 +453,8 @@ void amdgpu_dm_initialize_dp_connector(struct
> >>> amdgpu_display_manager *dm,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0&aconnector->dm_dp_au=
x.aux,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A016,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A04,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0max_link_enc_cap.lane_c=
ount,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0max_link_enc_cap.link_r=
ate,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0aconnector->connector=
_id);
> >>> =A0
> >>> =A0=A0=A0=A0=A0=A0=A0=A0drm_connector_attach_dp_subconnector_property=
(&aconnector->base);
> >>> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> >>> b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> >>> index 7d2e433c2275..6fe66b7ee53e 100644
> >>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> >>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> >>> @@ -1894,6 +1894,24 @@ bool dc_link_dp_sync_lt_end(struct dc_link *li=
nk,
> >>> bool link_down)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0return true;
> >>> =A0}
> >>> =A0
> >>> +bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, str=
uct
> >>> dc_link_settings *max_link_enc_cap)
> >>> +{
> >>> +=A0=A0=A0=A0=A0=A0=A0if (!max_link_enc_cap) {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0DC_LOG_ERROR("%s: Could=
 not return max link encoder caps",
> >>> __func__);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> >>> +=A0=A0=A0=A0=A0=A0=A0}
> >>> +
> >>> +=A0=A0=A0=A0=A0=A0=A0if (link->link_enc->funcs->get_max_link_cap) {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0link->link_enc->funcs->=
get_max_link_cap(link->link_enc,
> >>> max_link_enc_cap);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return true;
> >>> +=A0=A0=A0=A0=A0=A0=A0}
> >>> +
> >>> +=A0=A0=A0=A0=A0=A0=A0DC_LOG_ERROR("%s: Max link encoder caps unknown=
", __func__);
> >>> +=A0=A0=A0=A0=A0=A0=A0max_link_enc_cap->lane_count =3D 1;
> >>> +=A0=A0=A0=A0=A0=A0=A0max_link_enc_cap->link_rate =3D 6;
> >>> +=A0=A0=A0=A0=A0=A0=A0return false;
> >>> +}
> >>> +
> >>> =A0static struct dc_link_settings get_max_link_cap(struct dc_link *li=
nk)
> >>> =A0{
> >>> =A0=A0=A0=A0=A0=A0=A0=A0struct dc_link_settings max_link_cap =3D {0};
> >>> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h
> >>> b/drivers/gpu/drm/amd/display/dc/dc_link.h
> >>> index b0013e674864..cb6d0543d839 100644
> >>> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
> >>> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
> >>> @@ -346,6 +346,8 @@ bool dc_link_dp_set_test_pattern(
> >>> =A0=A0=A0=A0=A0=A0=A0=A0const unsigned char *p_custom_pattern,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0unsigned int cust_pattern_size);
> >>> =A0
> >>> +bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, str=
uct
> >>> dc_link_settings *max_link_enc_cap);
> >>> +
> >>> =A0void dc_link_enable_hpd_filter(struct dc_link *link, bool enable);
> >>> =A0
> >>> =A0bool dc_link_is_dp_sink_present(struct dc_link *link);
> >>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> >>> b/drivers/gpu/drm/drm_dp_mst_topology.c
> >>> index 5539a91b4031..31d9f3ff0d39 100644
> >>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> >>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> >>> @@ -3708,19 +3708,24 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> >>> drm_dp_mst_topology_mgr *mgr, bool ms
> >>> =A0=A0=A0=A0=A0=A0=A0=A0/* set the device into MST mode */
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (mst_state) {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0struct drm_dp_payload=
 reset_pay;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int lane_count;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0int link_rate;
> >>> =A0
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0WARN_ON(mgr->mst_prim=
ary);
> >>> =A0
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* get dpcd info */
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D drm_dp_dpcd_rea=
d(mgr->aux, DP_DPCD_REV, mgr->dpcd,
> >>> DP_RECEIVER_CAP_SIZE);
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret !=3D DP_RECEIVE=
R_CAP_SIZE) {
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0drm_dbg_kms(mgr->dev, "failed to read DPCD\n");
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ret =3D drm_dp_read_dpc=
d_caps(mgr->aux, mgr->dpcd);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (ret < 0) {
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0drm_dbg_kms(mgr->dev, "%s: failed to read DPCD, ret
> >>> %d\n",
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mgr->aux->name, ret);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0goto out_unlock;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> >>> =A0
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0lane_count =3D min_t(in=
t, mgr->dpcd[2] &
> >>> DP_MAX_LANE_COUNT_MASK, mgr->max_lane_count);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0link_rate =3D min_t(int=
, mgr->dpcd[1], mgr->max_link_rate);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0mgr->pbn_div =3D drm_=
dp_get_vc_payload_bw(mgr,
> >>> -
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0drm_dp_bw_code_to_link
> >>> _rate(mgr->dpcd[1]),
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0mgr->dpcd[2] &
> >>> DP_MAX_LANE_COUNT_MASK);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0drm_dp_bw_code_to_li
> >>> nk_rate(link_rate),
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0lane_count);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (mgr->pbn_div =3D=
=3D 0) {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0ret =3D -EINVAL;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0goto out_unlock;
> >>> @@ -5448,14 +5453,17 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_sta=
te);
> >>> =A0 * @aux: DP helper aux channel to talk to this device
> >>> =A0 * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
> >>> =A0 * @max_payloads: maximum number of payloads this GPU can source
> >>> + * @max_lane_count: maximum number of lanes this GPU supports
> >>> + * @max_link_rate: maximum link rate this GPU supports, units as in =
DPCD
> >>> =A0 * @conn_base_id: the connector object ID the MST device is connec=
ted to.
> >>> =A0 *
> >>> =A0 * Return 0 for success, or negative error code on failure
> >>> =A0 */
> >>> =A0int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *m=
gr,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_device *dev, struct drm_dp_aux
> >>> *aux,
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_dpcd_transaction_bytes,
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_payloads, int conn_base_id)
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_dpcd_transaction_bytes, int
> >>> max_payloads,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_lane_count, int max_link_rate,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int conn_base_id)
> >>> =A0{
> >>> =A0=A0=A0=A0=A0=A0=A0=A0struct drm_dp_mst_topology_state *mst_state;
> >>> =A0
> >>> @@ -5490,6 +5498,8 @@ int drm_dp_mst_topology_mgr_init(struct
> >>> drm_dp_mst_topology_mgr *mgr,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0mgr->aux =3D aux;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0mgr->max_dpcd_transaction_bytes =3D max_dpcd_=
transaction_bytes;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0mgr->max_payloads =3D max_payloads;
> >>> +=A0=A0=A0=A0=A0=A0=A0mgr->max_lane_count =3D max_lane_count;
> >>> +=A0=A0=A0=A0=A0=A0=A0mgr->max_link_rate =3D max_link_rate;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0mgr->conn_base_id =3D conn_base_id;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (max_payloads + 1 > sizeof(mgr->payload_ma=
sk) * 8 ||
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 max_payloads + 1 > sizeof(mgr->vcpi=
_mask) * 8)
> >>> @@ -5896,14 +5906,13 @@ struct drm_dp_aux
> >>> *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC=
_WITHOUT_VIRTUAL_DPCD)
> >>> &&
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 port->mgr->dpcd[DP_DPCD_REV] >=3D D=
P_DPCD_REV_14 &&
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 port->parent =3D=3D port->mgr->mst_=
primary) {
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u8 downstreamport;
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u8 dpcd_ext[DP_RECEIVER=
_CAP_SIZE];
> >>> =A0
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (drm_dp_dpcd_read(&p=
ort->aux, DP_DOWNSTREAMPORT_PRESENT,
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &downstreamport, 1) < 0)
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (drm_dp_read_dpcd_ca=
ps(port->mgr->aux, dpcd_ext) < 0)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return NULL;
> >>> =A0
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if ((downstreamport & D=
P_DWN_STRM_PORT_PRESENT) &&
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((downstreamport=
 & DP_DWN_STRM_PORT_TYPE_MASK)
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if ((dpcd_ext[DP_DOWNST=
REAMPORT_PRESENT] &
> >>> DP_DWN_STRM_PORT_PRESENT) &&
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((dpcd_ext[DP=
_DOWNSTREAMPORT_PRESENT] &
> >>> DP_DWN_STRM_PORT_TYPE_MASK)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 !=3D DP_=
DWN_STRM_PORT_TYPE_ANALOG))
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0return port->mgr->aux;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0}
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> >>> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> >>> index 860381d68d9d..a4245eb48ef4 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> >>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> >>> @@ -942,6 +942,7 @@ intel_dp_mst_encoder_init(struct intel_digital_po=
rt
> >>> *dig_port, int conn_base_id)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0struct intel_dp *intel_dp =3D &dig_port->dp;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0enum port port =3D dig_port->base.port;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0int ret;
> >>> +=A0=A0=A0=A0=A0=A0=A0int bios_max_link_rate;
> >>> =A0
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (!HAS_DP_MST(i915) || intel_dp_is_edp(inte=
l_dp))
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> >>> @@ -956,8 +957,11 @@ intel_dp_mst_encoder_init(struct intel_digital_p=
ort
> >>> *dig_port, int conn_base_id)
> >>> =A0
> >>> =A0=A0=A0=A0=A0=A0=A0=A0/* create encoders */
> >>> =A0=A0=A0=A0=A0=A0=A0=A0intel_dp_create_fake_mst_encoders(dig_port);
> >>> +=A0=A0=A0=A0=A0=A0=A0bios_max_link_rate =3D intel_bios_dp_max_link_r=
ate(&dig_port->base);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0ret =3D drm_dp_mst_topology_mgr_init(&intel_d=
p->mst_mgr, &i915->drm,
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &intel_dp->aux, 1=
6, 3,
> >>> conn_base_id);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &intel_dp->aux, 1=
6, 3,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dig_port->max_lan=
es,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bios_max_link_rat=
e / 27000,
> >>> conn_base_id);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (ret)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> >>> =A0
> >>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >>> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >>> index 1c9c0cdf85db..e02f9d2d74eb 100644
> >>> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >>> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> >>> @@ -1617,7 +1617,8 @@ nv50_mstm_new(struct nouveau_encoder *outp, str=
uct
> >>> drm_dp_aux *aux, int aux_max,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0mstm->mgr.cbs =3D &nv50_mstm;
> >>> =A0
> >>> =A0=A0=A0=A0=A0=A0=A0=A0ret =3D drm_dp_mst_topology_mgr_init(&mstm->m=
gr, dev, aux, aux_max,
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 max_payloads, con=
n_base_id);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 max_payloads, out=
p->dcb-
> >>> >dpconf.link_nr,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 outp->dcb->dpconf=
.link_bw,
> >>> conn_base_id);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (ret)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return ret;
> >>> =A0
> >>> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> >>> b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> >>> index 59cf1d288465..8f0b2dccd199 100644
> >>> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> >>> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> >>> @@ -629,13 +629,20 @@ int
> >>> =A0radeon_dp_mst_init(struct radeon_connector *radeon_connector)
> >>> =A0{
> >>> =A0=A0=A0=A0=A0=A0=A0=A0struct drm_device *dev =3D radeon_connector->=
base.dev;
> >>> +=A0=A0=A0=A0=A0=A0=A0int max_link_rate;
> >>> =A0
> >>> =A0=A0=A0=A0=A0=A0=A0=A0if (!radeon_connector->ddc_bus->has_aux)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 0;
> >>> =A0
> >>> +=A0=A0=A0=A0=A0=A0=A0if (radeon_connector_is_dp12_capable(&radeon_co=
nnector->base))
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0max_link_rate =3D 0x14;
> >>> +=A0=A0=A0=A0=A0=A0=A0else
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0max_link_rate =3D 0x0a;
> >>> +
> >>> =A0=A0=A0=A0=A0=A0=A0=A0radeon_connector->mst_mgr.cbs =3D &mst_cbs;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0return drm_dp_mst_topology_mgr_init(&radeon_c=
onnector->mst_mgr, dev,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &radeon_connec=
tor->ddc_bus->aux,
> >>> 16, 6,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4, max_link_ra=
te,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 radeon_connect=
or->base.base.id);
> >>> =A0}
> >>> =A0
> >>> diff --git a/include/drm/drm_dp_mst_helper.h
> >>> b/include/drm/drm_dp_mst_helper.h
> >>> index 20dc705642bd..b5b0bf37813b 100644
> >>> --- a/include/drm/drm_dp_mst_helper.h
> >>> +++ b/include/drm/drm_dp_mst_helper.h
> >>> @@ -593,6 +593,14 @@ struct drm_dp_mst_topology_mgr {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 * @max_payloads: maximum number of payloads =
the GPU can generate.
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 */
> >>> =A0=A0=A0=A0=A0=A0=A0=A0int max_payloads;
> >>> +=A0=A0=A0=A0=A0=A0=A0/**
> >>> +=A0=A0=A0=A0=A0=A0=A0 * @max_lane_count: maximum number of lanes the=
 GPU can drive.
> >>> +=A0=A0=A0=A0=A0=A0=A0 */
> >>> +=A0=A0=A0=A0=A0=A0=A0int max_lane_count;
> >>> +=A0=A0=A0=A0=A0=A0=A0/**
> >>> +=A0=A0=A0=A0=A0=A0=A0 * @max_link_rate: maximum link rate per lane G=
PU can output.
> >>> +=A0=A0=A0=A0=A0=A0=A0 */
> >>> +=A0=A0=A0=A0=A0=A0=A0int max_link_rate;
> >>> =A0=A0=A0=A0=A0=A0=A0=A0/**
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 * @conn_base_id: DRM connector ID this mgr i=
s connected to. Only
> >>> used
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 * to build the MST connector path value.
> >>> @@ -765,7 +773,9 @@ struct drm_dp_mst_topology_mgr {
> >>> =A0int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *m=
gr,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_device *dev, struct drm_dp_aux
> >>> *aux,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_dpcd_transaction_bytes,
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_payloads, int conn_base_id);
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_payloads,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int max_lane_count, int max_link_rate,
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 int conn_base_id);
> >>> =A0
> >>> =A0void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mg=
r *mgr);
> >>> =A0
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
