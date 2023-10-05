Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACB77BA5C8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 18:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B244D10E428;
	Thu,  5 Oct 2023 16:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4F210E425;
 Thu,  5 Oct 2023 16:20:54 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1dd8304b980so737292fac.2; 
 Thu, 05 Oct 2023 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696522853; x=1697127653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHuPA9EDctsR5mPS8VKo5pOonks660/cZg00M82Ff1U=;
 b=EcPqQXoeCmwh1luX8MvlHm+SmFJLJ52ZGhuZknIrocjS+dzmqeWWAfDcwCp+gfnagp
 2juNvDeu/La14JEYb4WKSZmPba08QWID8v1zUR7NT0peSj6X59qftiErdUyDgZdW2yAO
 eD9U3V1vKhlnCLTMG0968GmeRr9XHMJaO2kGlqnFNhmAqfonmqwjyhNZ5kd4bi1HXSxW
 cIDG4qhn3hXL2fZkB5gkNUytKQD5ILDtkg1BZGwf/JIcyjcOUGXvr3dHOLS9S11DqPq/
 FBeSSVFAQvSX2wB5FuwlIhIYZqlYSLMMtwaSWM0vlsH5j+i8NQzzuh9tR7DRTddQu/mc
 ZoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696522853; x=1697127653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHuPA9EDctsR5mPS8VKo5pOonks660/cZg00M82Ff1U=;
 b=FKDRduDGFiQ9mO3ZNtpNkUOqT1czW7c2/GWJmOQKp1GAeCgkrGFj8qNDmxVFOeycPF
 WCwjpHtJd1XlroBAhIakTWNA3ePL+hrXntSBPdHo1hhKcyC/RZXz8FCf4oSDqB3adl69
 O55RUhyHzCRrns8VWdHReuu4ir560Zj7g0gbtlYEZgvBS2kzZduA9DhIyulhijVNPudB
 7g+bFSdVaJsbGuCAHzZeURfq/xQq7dfO1OkS7F7f9jq8IrLBiH6rpwHPMa2cd0+B5Sae
 8Et0jdefPYdj1lwbEGeKzfOYmnX/wgGtqLIxFlnNu/Sb37PCT4/GVoJM4BzRCeC6KAk9
 FhAQ==
X-Gm-Message-State: AOJu0YyWX1XCG7RJCQlJ1ndp6pVmFhB5Z1cjbyy9u1VHeoSGZohUdljU
 qKY6oSci9MvOhax+d6QrbqieGZWoysEfRIKt/RY=
X-Google-Smtp-Source: AGHT+IHAPm2j6xnBpG6CVfnIUdRa+JLuLOkUt0G5jBlBP5px0CCT5yrdIxcva8i6Ap4rte17dG3/fIfBFQxwY2LOGYU=
X-Received: by 2002:a05:6870:17a3:b0:1d6:5c40:11b6 with SMTP id
 r35-20020a05687017a300b001d65c4011b6mr6652121oae.14.1696522853250; Thu, 05
 Oct 2023 09:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231005080405.169841-1-Wayne.Lin@amd.com>
In-Reply-To: <20231005080405.169841-1-Wayne.Lin@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Oct 2023 12:20:42 -0400
Message-ID: <CADnq5_Or472AG=G-Wp8af91tKCqPheWNnpgrsj4m23m4jQH3Xw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix mst hub unplug warning
To: Wayne Lin <Wayne.Lin@amd.com>
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
Cc: jerry.zuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 5, 2023 at 4:04=E2=80=AFAM Wayne Lin <Wayne.Lin@amd.com> wrote:
>
> [Why]
> Unplug mst hub will cause warning. That's because
> dm_helpers_construct_old_payload() is changed to be called after
> payload removement from dc link.
>
> In dm_helpers_construct_old_payload(), We refer to the vcpi in
> payload allocation table of dc link to construct the old payload
> and payload is no longer in the table when we call the function
> now.
>
> [How]
> Refer to the mst_state to construct the number of time slot for old
> payload now. Note that dm_helpers_construct_old_payload() is just
> a quick workaround before and we are going to abandon it soon.
>
> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/r=
emovement")
> Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>

Pushed to drm-misc-next.  Thanks!

Alex

> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 38 +++++++++----------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index baf7e5254fb3..2f94bcf128c0 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -204,15 +204,16 @@ void dm_helpers_dp_update_branch_info(
>  {}
>
>  static void dm_helpers_construct_old_payload(
> -                       struct dc_link *link,
> -                       int pbn_per_slot,
> +                       struct drm_dp_mst_topology_mgr *mgr,
> +                       struct drm_dp_mst_topology_state *mst_state,
>                         struct drm_dp_mst_atomic_payload *new_payload,
>                         struct drm_dp_mst_atomic_payload *old_payload)
>  {
> -       struct link_mst_stream_allocation_table current_link_table =3D
> -                                                                       l=
ink->mst_stream_alloc_table;
> -       struct link_mst_stream_allocation *dc_alloc;
> -       int i;
> +       struct drm_dp_mst_atomic_payload *pos;
> +       int pbn_per_slot =3D mst_state->pbn_div;
> +       u8 next_payload_vc_start =3D mgr->next_start_slot;
> +       u8 payload_vc_start =3D new_payload->vc_start_slot;
> +       u8 allocated_time_slots;
>
>         *old_payload =3D *new_payload;
>
> @@ -221,20 +222,17 @@ static void dm_helpers_construct_old_payload(
>          * struct drm_dp_mst_atomic_payload are don't care fields
>          * while calling drm_dp_remove_payload_part2()
>          */
> -       for (i =3D 0; i < current_link_table.stream_count; i++) {
> -               dc_alloc =3D
> -                       &current_link_table.stream_allocations[i];
> -
> -               if (dc_alloc->vcp_id =3D=3D new_payload->vcpi) {
> -                       old_payload->time_slots =3D dc_alloc->slot_count;
> -                       old_payload->pbn =3D dc_alloc->slot_count * pbn_p=
er_slot;
> -                       break;
> -               }
> +       list_for_each_entry(pos, &mst_state->payloads, next) {
> +               if (pos !=3D new_payload &&
> +                   pos->vc_start_slot > payload_vc_start &&
> +                   pos->vc_start_slot < next_payload_vc_start)
> +                       next_payload_vc_start =3D pos->vc_start_slot;
>         }
>
> -       /* make sure there is an old payload*/
> -       ASSERT(i !=3D current_link_table.stream_count);
> +       allocated_time_slots =3D next_payload_vc_start - payload_vc_start=
;
>
> +       old_payload->time_slots =3D allocated_time_slots;
> +       old_payload->pbn =3D allocated_time_slots * pbn_per_slot;
>  }
>
>  /*
> @@ -272,8 +270,8 @@ bool dm_helpers_dp_mst_write_payload_allocation_table=
(
>                 drm_dp_add_payload_part1(mst_mgr, mst_state, new_payload)=
;
>         } else {
>                 /* construct old payload by VCPI*/
> -               dm_helpers_construct_old_payload(stream->link, mst_state-=
>pbn_div,
> -                                               new_payload, &old_payload=
);
> +               dm_helpers_construct_old_payload(mst_mgr, mst_state,
> +                                                new_payload, &old_payloa=
d);
>                 target_payload =3D &old_payload;
>
>                 drm_dp_remove_payload_part1(mst_mgr, mst_state, new_paylo=
ad);
> @@ -366,7 +364,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>         if (enable) {
>                 ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state->base=
.state, new_payload);
>         } else {
> -               dm_helpers_construct_old_payload(stream->link, mst_state-=
>pbn_div,
> +               dm_helpers_construct_old_payload(mst_mgr, mst_state,
>                                                  new_payload, &old_payloa=
d);
>                 drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payl=
oad, new_payload);
>         }
> --
> 2.37.3
>
