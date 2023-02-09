Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9666912B8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 22:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3778D10EB9C;
	Thu,  9 Feb 2023 21:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1D810EBB6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 21:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675979014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZ5Oi4lISzTNaZ8HivJ3d+0vRYQ8hiDnbkg1xz2XSx8=;
 b=K98Xr9Ge1dRO2C6QutWPMp3RVCHegG6oOsRaACw3e0qP8dpGHqmlp96+q3UxltzW31ksB6
 Hd1hu1nHWK2AQDbBgoLQZXzP4Z3jssX2Xs2oQWXf8ukKHNqgRwO8HwIzncp7C7XN0IxGuJ
 YIkdmSDRRrEbh7GRmIVqfBCIR/aoYgk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-BcUCrSBxNTCF5du5ec1Rag-1; Thu, 09 Feb 2023 16:43:33 -0500
X-MC-Unique: BcUCrSBxNTCF5du5ec1Rag-1
Received: by mail-qt1-f200.google.com with SMTP id
 n1-20020ac85a01000000b003ba2a2c50f9so1920831qta.23
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 13:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MlEz8Y+/mCd30QRfDM6T2n4F1GL0JbkH6Xfu4wv13Dg=;
 b=wuLmaIFE0UljgBlYSSoA10cdWpb/1LmQ3akx33CroK3+/vdxRJBo0ZAixSZHn0JbWP
 ttP6jYUdhh+ju7+HIKc+CuPuDjyWEqHiqoeiEfwy7bsTqcGhGHW8vsWp/6jydpYa44pU
 JbiBvg94IMdAeTh8x19WwV1hSSlWSvtKZUP3WsaK07ZphkL3Jt5NAXYMk9o3UOKJ6Sez
 S2weWlfONY8R4etHxlULJi9ubfXmZmX29cpkopI9ZHI7UK11qd87ICS/Sr6eWDxNUDN0
 EIZq4AkFDXSaurMk3CvzDN+4tT/YTLOEL3HedKXhl7pMOyzSEpMZQ8xMtyvdrMDVsLoR
 3Clg==
X-Gm-Message-State: AO0yUKUxzl0Jpx/+pHiygzQQFCXeLEvdvSGWsPKiik7DPKqrDj7cNojB
 oyX23jW5hj3oJ1qlk6sIQd2O06Nbew/QeGaA9fi0bRJVBWyHFvNzyc55mPV+SUr4dWXu+SZs4za
 wtFGbnKzrXoP701R/X7OxpUXgUxIC
X-Received: by 2002:a05:622a:1191:b0:3b9:d14c:39f8 with SMTP id
 m17-20020a05622a119100b003b9d14c39f8mr22362744qtk.40.1675979012753; 
 Thu, 09 Feb 2023 13:43:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8ROgI3fLMZCjyJWqImLj4ICkSrLxgbOZVxOrVIDsUn7+XQUmoCbI+52Z2LSUjCedrfqW9SJw==
X-Received: by 2002:a05:622a:1191:b0:3b9:d14c:39f8 with SMTP id
 m17-20020a05622a119100b003b9d14c39f8mr22362715qtk.40.1675979012472; 
 Thu, 09 Feb 2023 13:43:32 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800:3463:5df7:aced:152e?
 ([2600:4040:5c68:6800:3463:5df7:aced:152e])
 by smtp.gmail.com with ESMTPSA id
 q1-20020ac84101000000b003b9dca4cdf4sm2000532qtl.83.2023.02.09.13.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 13:43:32 -0800 (PST)
Message-ID: <551c4eb4cb91d05393b6e740d94eabb0330d3149.camel@redhat.com>
Subject: Re: [PATCH v2 02/17] drm/display/dp_mst: Handle old/new payload
 states in drm_dp_remove_payload()
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com
Date: Thu, 09 Feb 2023 16:43:30 -0500
In-Reply-To: <Y+NSHI9QgcLGe2c1@ideak-desk.fi.intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
 <20230131150548.1614458-3-imre.deak@intel.com>
 <ed8b73096a576f317979c3dd65392371d5b77612.camel@redhat.com>
 <Y9p/ZqVVpW/YMdUy@ideak-desk.fi.intel.com>
 <c74b71b1d998ce6b062405508354dd1943aafa38.camel@redhat.com>
 <Y+I/wcEExBEbAV4L@ideak-desk.fi.intel.com>
 <045569b5595e77d169bb91c101df7544fb94bf0b.camel@redhat.com>
 <Y+NSHI9QgcLGe2c1@ideak-desk.fi.intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-02-08 at 09:41 +0200, Imre Deak wrote:
> On Tue, Feb 07, 2023 at 07:21:48PM -0500, Lyude Paul wrote:
> > On Tue, 2023-02-07 at 14:11 +0200, Imre Deak wrote:
> >=20
> > And then disabled say, payload #1, that immediately after we get the AC=
T that
> > the payload table in hardware would look like this:
> >=20
> > Payload #2: 15 slots, start_slot=3D0
> > Payload #3: 15 slots, start_slot=3D15
>=20
> The above is the actual and expected HW state state yes.
>=20
> > But it sounds like it actually would look like this in the real world?
> >=20
> > Payload #2: 15 slots, start_slot=3D15
> > Payload #3: 15 slots, start_slot=3D30
>=20
> No, the problem currently is not that start_slot of the subsequent
> payloads are not shifted towards the beginning. Rather the atomic state
> doesn't get updated properly, becoming out of sync with the HW. For
> instance in a commit resizing payload #1, in the commit phase
> (intel_atomic_commit_tail()) will begin by removing payload #1. The
> initial state is
>=20
>             old payload state         new payload state
> Payload #1: 15 slots, start_slot=3D0    20 slots, start_slot=3D0
> Payload #2: 15 slots, start_slot=3D15   15 slots, start_slot=3D15
> Payload #3: 15 slots, start_slot=3D30   15 slots, start_slot=3D30
>=20
> mgr->next_start_slot =3D 45
>=20
> intel_mst_disable_dp() will pass the old MST and payload state to
> drm_dp_remove_payload(): The MST state was added during atomic check,
> since payload #1 changed, then intel_atomic_commit() ->
> drm_atomic_helper_swap_state() sets the MST current state (returned by
> drm_atomic_get_mst_topology_state()) to point to the old state. So at

OK - this took me a while to wrap my head around but you're completely righ=
t.
It appears I totally misunderstood where the state swapping actually happen=
s
during the check -> commit sequence. I think if that's how things work too
then yeah, it definitely might not be a bad idea to move the start slot out=
 of
the atomic state :P. I guess we could just keep this in the mst manager str=
uct
instead of the commit state and make the rules for access be the same: prot=
ect
them through commit ordering, and document that the proper way of accessing
start values outside of the context of an atomic commit (if this was needed
for some reason) is:

* grab mst lock
* call drm_dp_mst_atomic_wait_for_dependencies()
* read values under lock

Thank y'all again so much for helping out with this! It is super appreciate=
d,
and once you guys push these patches upstream I will look into adopting thi=
s
for nouveau. I already poked some folks from AMD as well to make sure they'=
re
keeping an eye on this (although looking at the Cc I realize they were alre=
ady
added a while ago, whoops lol).=20

> the point drm_dp_remove_payload() returns we have:
>=20
>             old payload state         new payload state
> Payload #1: 15 slots, start_slot=3D-1   20 slots, start_slot=3D0
> Payload #2: 15 slots, start_slot=3D0    15 slots, start_slot=3D15
> Payload #3: 15 slots, start_slot=3D15   15 slots, start_slot=3D30
>=20
> mgr->next_start_slot =3D 30
>=20
> then after re-enabling payload #1, after drm_dp_add_payload_part1()
> returns (passing to it the new MST and payload state) we have:
>=20
>             old payload state         new payload state
> Payload #1: 15 slots, start_slot=3D-1   20 slots, start_slot=3D30
> Payload #2: 15 slots, start_slot=3D0    15 slots, start_slot=3D15
> Payload #3: 15 slots, start_slot=3D15   15 slots, start_slot=3D30
>=20
> mgr->next_start_slot =3D 50
>=20
> So in the new SW state payload #1 and #3 incorrectly overlap, with the
> actual HW state being:
>=20
> Payload #1: 20 slots, start_slot=3D30
> Payload #2: 15 slots, start_slot=3D0
> Payload #3: 15 slots, start_slot=3D15
>=20
> A subsequent commit will see the wrong start_slot in the SW state for
> payload #2 (15) and #3 (30).
>=20
> > So I'm curious, is there something I missed here? At what point does th=
e MST
> > hub at the other end decide that it's time to move the start slots back=
?
>=20
> The hub shifts back payloads after the DPCD write command to 0x1c0 -
> 0x1c2 to remove a payload. (The HW OTOH does the corresponding shift at
> the point of disabling the stream, in intel_mst_post_disable_dp() ->
> intel_disable_transcoder() for i915).
>=20
> > (keep in mind, the MST specification does explicitly mention that
> > there should never be holes in the payload table - so something has to
> > be shifting the payloads back).
>=20
> Right, the hubs I checked conform to this.

>=20
> > > > So if you guys think it'd be better design-wise to store this somet=
hing else,
> > > > I've got no strong feelings either way
> > > > >=20
> > > > > > For 0-2:
> > > > > >=20
> > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > >=20
> > > > > Thanks.
> > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > > > > Cc: Karol Herbst <kherbst@redhat.com>
> > > > > > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > > > > > Cc: stable@vger.kernel.org # 6.1
> > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.int=
el.com>
> > > > > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > > > > ---
> > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
> > > > > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 26 +++++++++=
+---------
> > > > > > >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 ++-
> > > > > > >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
> > > > > > >  include/drm/display/drm_dp_mst_helper.h       |  3 ++-
> > > > > > >  5 files changed, 21 insertions(+), 16 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_=
helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > > > index a50319fc42b11..180d3893b68da 100644
> > > > > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers=
.c
> > > > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers=
.c
> > > > > > > @@ -208,7 +208,7 @@ bool dm_helpers_dp_mst_write_payload_allo=
cation_table(
> > > > > > >  =09if (enable)
> > > > > > >  =09=09drm_dp_add_payload_part1(mst_mgr, mst_state, payload);
> > > > > > >  =09else
> > > > > > > -=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload);
> > > > > > > +=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload, pay=
load);
> > > > > > > =20
> > > > > > >  =09/* mst_mgr->->payloads are VC payload notify MST branch u=
sing DPCD or
> > > > > > >  =09 * AUX message. The sequence is slot 1-63 allocated seque=
nce for each
> > > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/=
drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > index 847c10aa2098c..1990ff5dc7ddd 100644
> > > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > @@ -3342,7 +3342,8 @@ EXPORT_SYMBOL(drm_dp_add_payload_part1)=
;
> > > > > > >   * drm_dp_remove_payload() - Remove an MST payload
> > > > > > >   * @mgr: Manager to use.
> > > > > > >   * @mst_state: The MST atomic state
> > > > > > > - * @payload: The payload to write
> > > > > > > + * @old_payload: The payload with its old state
> > > > > > > + * @new_payload: The payload to write
> > > > > > >   *
> > > > > > >   * Removes a payload from an MST topology if it was successf=
ully assigned a start slot. Also updates
> > > > > > >   * the starting time slots of all other payloads which would=
 have been shifted towards the start of
> > > > > > > @@ -3350,36 +3351,37 @@ EXPORT_SYMBOL(drm_dp_add_payload_part=
1);
> > > > > > >   */
> > > > > > >  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *m=
gr,
> > > > > > >  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> > > > > > > -=09=09=09   struct drm_dp_mst_atomic_payload *payload)
> > > > > > > +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payl=
oad,
> > > > > > > +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload)
> > > > > > >  {
> > > > > > >  =09struct drm_dp_mst_atomic_payload *pos;
> > > > > > >  =09bool send_remove =3D false;
> > > > > > > =20
> > > > > > >  =09/* We failed to make the payload, so nothing to do */
> > > > > > > -=09if (payload->vc_start_slot =3D=3D -1)
> > > > > > > +=09if (new_payload->vc_start_slot =3D=3D -1)
> > > > > > >  =09=09return;
> > > > > > > =20
> > > > > > >  =09mutex_lock(&mgr->lock);
> > > > > > > -=09send_remove =3D drm_dp_mst_port_downstream_of_branch(payl=
oad->port, mgr->mst_primary);
> > > > > > > +=09send_remove =3D drm_dp_mst_port_downstream_of_branch(new_=
payload->port, mgr->mst_primary);
> > > > > > >  =09mutex_unlock(&mgr->lock);
> > > > > > > =20
> > > > > > >  =09if (send_remove)
> > > > > > > -=09=09drm_dp_destroy_payload_step1(mgr, mst_state, payload);
> > > > > > > +=09=09drm_dp_destroy_payload_step1(mgr, mst_state, new_paylo=
ad);
> > > > > > >  =09else
> > > > > > >  =09=09drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topo=
logy, not sending remove\n",
> > > > > > > -=09=09=09    payload->vcpi);
> > > > > > > +=09=09=09    new_payload->vcpi);
> > > > > > > =20
> > > > > > >  =09list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > > -=09=09if (pos !=3D payload && pos->vc_start_slot > payload->=
vc_start_slot)
> > > > > > > -=09=09=09pos->vc_start_slot -=3D payload->time_slots;
> > > > > > > +=09=09if (pos !=3D new_payload && pos->vc_start_slot > new_p=
ayload->vc_start_slot)
> > > > > > > +=09=09=09pos->vc_start_slot -=3D old_payload->time_slots;
> > > > > > >  =09}
> > > > > > > -=09payload->vc_start_slot =3D -1;
> > > > > > > +=09new_payload->vc_start_slot =3D -1;
> > > > > > > =20
> > > > > > >  =09mgr->payload_count--;
> > > > > > > -=09mgr->next_start_slot -=3D payload->time_slots;
> > > > > > > +=09mgr->next_start_slot -=3D old_payload->time_slots;
> > > > > > > =20
> > > > > > > -=09if (payload->delete)
> > > > > > > -=09=09drm_dp_mst_put_port_malloc(payload->port);
> > > > > > > +=09if (new_payload->delete)
> > > > > > > +=09=09drm_dp_mst_put_port_malloc(new_payload->port);
> > > > > > >  }
> > > > > > >  EXPORT_SYMBOL(drm_dp_remove_payload);
> > > > > > > =20
> > > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/dr=
ivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > > index f3cb12dcfe0a7..dc4e5ff1dbb31 100644
> > > > > > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > > @@ -526,6 +526,8 @@ static void intel_mst_disable_dp(struct i=
ntel_atomic_state *state,
> > > > > > >  =09=09to_intel_connector(old_conn_state->connector);
> > > > > > >  =09struct drm_dp_mst_topology_state *mst_state =3D
> > > > > > >  =09=09drm_atomic_get_mst_topology_state(&state->base, &intel=
_dp->mst_mgr);
> > > > > > > +=09struct drm_dp_mst_atomic_payload *payload =3D
> > > > > > > +=09=09drm_atomic_get_mst_payload_state(mst_state, connector-=
>port);
> > > > > > >  =09struct drm_i915_private *i915 =3D to_i915(connector->base=
.dev);
> > > > > > > =20
> > > > > > >  =09drm_dbg_kms(&i915->drm, "active links %d\n",
> > > > > > > @@ -534,7 +536,7 @@ static void intel_mst_disable_dp(struct i=
ntel_atomic_state *state,
> > > > > > >  =09intel_hdcp_disable(intel_mst->connector);
> > > > > > > =20
> > > > > > >  =09drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
> > > > > > > -=09=09=09      drm_atomic_get_mst_payload_state(mst_state, c=
onnector->port));
> > > > > > > +=09=09=09      payload, payload);
> > > > > > > =20
> > > > > > >  =09intel_audio_codec_disable(encoder, old_crtc_state, old_co=
nn_state);
> > > > > > >  }
> > > > > > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/driver=
s/gpu/drm/nouveau/dispnv50/disp.c
> > > > > > > index edcb2529b4025..ed9d374147b8d 100644
> > > > > > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > > > @@ -885,7 +885,7 @@ nv50_msto_prepare(struct drm_atomic_state=
 *state,
> > > > > > > =20
> > > > > > >  =09// TODO: Figure out if we want to do a better job of hand=
ling VCPI allocation failures here?
> > > > > > >  =09if (msto->disabled) {
> > > > > > > -=09=09drm_dp_remove_payload(mgr, mst_state, payload);
> > > > > > > +=09=09drm_dp_remove_payload(mgr, mst_state, payload, payload=
);
> > > > > > > =20
> > > > > > >  =09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->b=
ase.index, 0, 0, 0, 0);
> > > > > > >  =09} else {
> > > > > > > diff --git a/include/drm/display/drm_dp_mst_helper.h b/includ=
e/drm/display/drm_dp_mst_helper.h
> > > > > > > index 41fd8352ab656..f5eb9aa152b14 100644
> > > > > > > --- a/include/drm/display/drm_dp_mst_helper.h
> > > > > > > +++ b/include/drm/display/drm_dp_mst_helper.h
> > > > > > > @@ -841,7 +841,8 @@ int drm_dp_add_payload_part2(struct drm_d=
p_mst_topology_mgr *mgr,
> > > > > > >  =09=09=09     struct drm_dp_mst_atomic_payload *payload);
> > > > > > >  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *m=
gr,
> > > > > > >  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> > > > > > > -=09=09=09   struct drm_dp_mst_atomic_payload *payload);
> > > > > > > +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payl=
oad,
> > > > > > > +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload);
> > > > > > > =20
> > > > > > >  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *=
mgr);
> > > > > > > =20
> > > > > >=20
> > > > > > --=20
> > > > > > Cheers,
> > > > > >  Lyude Paul (she/her)
> > > > > >  Software Engineer at Red Hat
> > > > > >=20
> > > > >=20
> > > >=20
> > > > --=20
> > > > Cheers,
> > > >  Lyude Paul (she/her)
> > > >  Software Engineer at Red Hat
> > > >=20
> > >=20
> >=20
> > --=20
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

