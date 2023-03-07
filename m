Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDE6AE4AE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5367210E539;
	Tue,  7 Mar 2023 15:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CAF10E513
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678202936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mpdpmI7KgcjNXVU4fScFD2Vn3ilLXHnksYiTvVI2i8=;
 b=SF69O6thZlCQEnfO3IR5pfJ3RWLgFwSc0hc4HcITvyu+L3CftuvFE81j5xIgLDFf/9CYaq
 q2t/WZXh9t/2aXPNnuIBMdAzFyf6qLrEHwvRt3461shGDTovvELpLLNwHPOwMb5ZnQqoxn
 KHdXVgBPKdyrxO5D/Pn6drhDGfWs2CA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139--VPdSQdPM6ycuCjRX1Qi6Q-1; Tue, 07 Mar 2023 10:28:53 -0500
X-MC-Unique: -VPdSQdPM6ycuCjRX1Qi6Q-1
Received: by mail-lf1-f72.google.com with SMTP id
 c15-20020a05651200cf00b004b6fe4513b7so3777332lfp.23
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 07:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678202932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mpdpmI7KgcjNXVU4fScFD2Vn3ilLXHnksYiTvVI2i8=;
 b=Aq5r7wM72mbWtFioZThysij2UCt2hxlJBykWVc57jUaC5boWqyqBqEm8awUUc2I2B5
 Ne6nTuPl2hxYb3s66nyPKQafW9BfEe4lpYnqgqFZMDx0DyYzev/+1EcC3h83ouMOlrUo
 L+63h2VZMPvCUzw3ZlIeD9U0GtScYzcZZx/BKhPS+cV9Rl8zEpoXoggIuuoJuOlE92NE
 hothelht/sXFgyx39+dIMXahve+sXrlLKU/UHfDMfyt1UI3GAbuOUjry5W9/UQBsqYFu
 w/YTLyN0QAnMnjHK2pv4tQziBYLRieA6MyKDMt9i6wyHpW7cotfMiDx7FHzSuQa8sjkj
 fU4g==
X-Gm-Message-State: AO0yUKWG4oEcwr6OvkO+07ts+qwGEpJ/L5hwt0Icg/r4W8res5KfOKD0
 HWADYLqBLMTYARf6zng4YLyg7l+iKFGsh12EbY3Sc0GBus4msBxkhu7sHswnJSGi0E7vuikD3ZB
 Nj7cIn7FDEKL+pLjLFJwUxCr8CLdwZ+N8aTGN+O1cMzJx
X-Received: by 2002:a2e:8341:0:b0:293:4ba5:f626 with SMTP id
 l1-20020a2e8341000000b002934ba5f626mr7451548ljh.2.1678202932385; 
 Tue, 07 Mar 2023 07:28:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9N5WjGggkPxbsbAgzfNZEHbaEHwXQQjFnG03FVWmAfqGB3+4trqu/vFiXfRDCxwNViYOm3r6wdYBYHckvXM2g=
X-Received: by 2002:a2e:8341:0:b0:293:4ba5:f626 with SMTP id
 l1-20020a2e8341000000b002934ba5f626mr7451530ljh.2.1678202932054; Tue, 07 Mar
 2023 07:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-15-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-15-917ff5bc80a8@asahilina.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 7 Mar 2023 16:28:39 +0100
Message-ID: <CACO55tu8KZp0M0s5OycRgMjr+Aba=TmNfHfj6H-sOh00QMUuWg@mail.gmail.com>
Subject: Re: [PATCH RFC 15/18] drm/asahi: Add the Asahi driver UAPI [DO NOT
 MERGE]
To: Asahi Lina <lina@asahilina.net>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 7, 2023 at 3:28=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> Adds the Asahi GPU driver UAPI. Note: this API is not yet stable and
> therefore not ready for merging!
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  include/uapi/drm/asahi_drm.h | 556 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 556 insertions(+)
>
> diff --git a/include/uapi/drm/asahi_drm.h b/include/uapi/drm/asahi_drm.h
> new file mode 100644
> index 000000000000..7b15b486d03d
> --- /dev/null
> +++ b/include/uapi/drm/asahi_drm.h
> @@ -0,0 +1,556 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) The Asahi Linux Contributors
> + *
> + * Heavily inspired by xe_drm.h.
> + */
> +#ifndef _ASAHI_DRM_H_
> +#define _ASAHI_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +#define DRM_ASAHI_UNSTABLE_UABI_VERSION                10006
> +
> +#define DRM_ASAHI_GET_PARAMS                   0x00
> +#define DRM_ASAHI_VM_CREATE                    0x01
> +#define DRM_ASAHI_VM_DESTROY                   0x02
> +#define DRM_ASAHI_GEM_CREATE                   0x03
> +#define DRM_ASAHI_GEM_MMAP_OFFSET              0x04
> +#define DRM_ASAHI_GEM_BIND                     0x05
> +#define DRM_ASAHI_QUEUE_CREATE                 0x06
> +#define DRM_ASAHI_QUEUE_DESTROY                        0x07
> +#define DRM_ASAHI_SUBMIT                       0x08
> +#define DRM_ASAHI_GET_TIME                     0x09
> +
> +#define DRM_ASAHI_MAX_CLUSTERS 32
> +
> +struct drm_asahi_params_global {
> +       __u32 unstable_uabi_version;
> +       __u32 pad0;
> +
> +       __u64 feat_compat;
> +       __u64 feat_incompat;
> +
> +       __u32 gpu_generation;
> +       __u32 gpu_variant;
> +       __u32 gpu_revision;
> +       __u32 chip_id;
> +
> +       __u32 num_dies;
> +       __u32 num_clusters_total;
> +       __u32 num_cores_per_cluster;
> +       __u32 num_frags_per_cluster;
> +       __u32 num_gps_per_cluster;
> +       __u32 num_cores_total_active;
> +       __u64 core_masks[DRM_ASAHI_MAX_CLUSTERS];
> +
> +       __u32 vm_page_size;
> +       __u32 pad1;
> +       __u64 vm_user_start;
> +       __u64 vm_user_end;
> +       __u64 vm_shader_start;
> +       __u64 vm_shader_end;
> +
> +       __u32 max_syncs_per_submission;
> +       __u32 max_commands_per_submission;
> +       __u32 max_commands_in_flight;
> +       __u32 max_attachments;
> +
> +       __u32 timer_frequency_hz;
> +       __u32 min_frequency_khz;
> +       __u32 max_frequency_khz;
> +       __u32 max_power_mw;
> +
> +       __u32 result_render_size;
> +       __u32 result_compute_size;
> +};
> +
> +/*
> +enum drm_asahi_feat_compat {
> +};
> +*/
> +
> +enum drm_asahi_feat_incompat {
> +       DRM_ASAHI_FEAT_MANDATORY_ZS_COMPRESSION =3D (1UL) << 0,
> +};
> +
> +struct drm_asahi_get_params {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @param: Parameter group to fetch (MBZ) */
> +       __u32 param_group;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +
> +       /** @value: User pointer to write parameter struct */
> +       __u64 pointer;
> +
> +       /** @value: Size of user buffer, max size supported on return */
> +       __u64 size;
> +};
> +
> +struct drm_asahi_vm_create {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @value: Returned VM ID */
> +       __u32 vm_id;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +struct drm_asahi_vm_destroy {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @value: VM ID to be destroyed */
> +       __u32 vm_id;
> +
> +       /** @pad: MBZ */
> +       __u32 pad;
> +};
> +
> +#define ASAHI_GEM_WRITEBACK    (1L << 0)
> +#define ASAHI_GEM_VM_PRIVATE   (1L << 1)
> +
> +struct drm_asahi_gem_create {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @size: Size of the BO */
> +       __u64 size;
> +
> +       /** @flags: BO creation flags */
> +       __u32 flags;
> +
> +       /** @handle: VM ID to assign to the BO, if ASAHI_GEM_VM_PRIVATE i=
s set. */
> +       __u32 vm_id;
> +
> +       /** @handle: Returned GEM handle for the BO */
> +       __u32 handle;
> +};
> +
> +struct drm_asahi_gem_mmap_offset {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @handle: Handle for the object being mapped. */
> +       __u32 handle;
> +
> +       /** @flags: Must be zero */
> +       __u32 flags;
> +
> +       /** @offset: The fake offset to use for subsequent mmap call */
> +       __u64 offset;
> +};
> +
> +enum drm_asahi_bind_op {
> +       ASAHI_BIND_OP_BIND =3D 0,
> +       ASAHI_BIND_OP_UNBIND =3D 1,
> +       ASAHI_BIND_OP_UNBIND_ALL =3D 2,
> +};
> +
> +#define ASAHI_BIND_READ                (1L << 0)
> +#define ASAHI_BIND_WRITE       (1L << 1)
> +
> +struct drm_asahi_gem_bind {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @obj: Bind operation */
> +       __u32 op;
> +
> +       /** @flags: One or more of ASAHI_BIND_* */
> +       __u32 flags;
> +
> +       /** @obj: GEM object to bind */
> +       __u32 handle;
> +
> +       /** @vm_id: The ID of the VM to bind to */
> +       __u32 vm_id;
> +
> +       /** @offset: Offset into the object */
> +       __u64 offset;
> +
> +       /** @range: Number of bytes from the object to bind to addr */
> +       __u64 range;
> +
> +       /** @addr: Address to bind to */
> +       __u64 addr;
> +};
> +
> +enum drm_asahi_cmd_type {
> +       DRM_ASAHI_CMD_RENDER =3D 0,
> +       DRM_ASAHI_CMD_BLIT =3D 1,
> +       DRM_ASAHI_CMD_COMPUTE =3D 2,
> +};
> +
> +/* Note: this is an enum so that it can be resolved by Rust bindgen. */
> +enum drm_asahi_queue_cap {
> +       DRM_ASAHI_QUEUE_CAP_RENDER      =3D (1UL << DRM_ASAHI_CMD_RENDER)=
,
> +       DRM_ASAHI_QUEUE_CAP_BLIT        =3D (1UL << DRM_ASAHI_CMD_BLIT),
> +       DRM_ASAHI_QUEUE_CAP_COMPUTE     =3D (1UL << DRM_ASAHI_CMD_COMPUTE=
),
> +};
> +
> +struct drm_asahi_queue_create {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @flags: MBZ */
> +       __u32 flags;
> +
> +       /** @vm_id: The ID of the VM this queue is bound to */
> +       __u32 vm_id;
> +
> +       /** @type: Bitmask of DRM_ASAHI_QUEUE_CAP_* */
> +       __u32 queue_caps;
> +
> +       /** @priority: Queue priority, 0-3 */
> +       __u32 priority;
> +
> +       /** @queue_id: The returned queue ID */
> +       __u32 queue_id;
> +};
> +
> +struct drm_asahi_queue_destroy {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @queue_id: The queue ID to be destroyed */
> +       __u32 queue_id;
> +};
> +
> +enum drm_asahi_sync_type {
> +       DRM_ASAHI_SYNC_SYNCOBJ =3D 0,
> +       DRM_ASAHI_SYNC_TIMELINE_SYNCOBJ =3D 1,
> +};
> +
> +struct drm_asahi_sync {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @sync_type: One of drm_asahi_sync_type */
> +       __u32 sync_type;
> +
> +       /** @handle: The sync object handle */
> +       __u32 handle;
> +
> +       /** @timeline_value: Timeline value for timeline sync objects */
> +       __u64 timeline_value;
> +};
> +
> +enum drm_asahi_subqueue {
> +       DRM_ASAHI_SUBQUEUE_RENDER =3D 0, /* Also blit */
> +       DRM_ASAHI_SUBQUEUE_COMPUTE =3D 1,
> +       DRM_ASAHI_SUBQUEUE_COUNT =3D 2,
> +};
> +
> +#define DRM_ASAHI_BARRIER_NONE ~(0U)
> +
> +struct drm_asahi_command {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @type: One of drm_asahi_cmd_type */
> +       __u32 cmd_type;
> +
> +       /** @flags: Flags for command submission */
> +       __u32 flags;
> +
> +       /** @cmdbuf: Pointer to the appropriate command buffer structure =
*/
> +       __u64 cmd_buffer;
> +
> +       /** @cmdbuf: Size of the command buffer structure */
> +       __u64 cmd_buffer_size;
> +
> +       /** @cmdbuf: Offset into the result BO to return information abou=
t this command */
> +       __u64 result_offset;
> +
> +       /** @cmdbuf: Size of the result data structure */
> +       __u64 result_size;
> +
> +       /** @barriers: Array of command indices per subqueue to wait on *=
/
> +       __u32 barriers[DRM_ASAHI_SUBQUEUE_COUNT];
> +};
> +
> +struct drm_asahi_submit {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @in_syncs: An optional array of drm_asahi_sync to wait on bef=
ore starting this job. */
> +       __u64 in_syncs;
> +
> +       /** @in_syncs: An optional array of drm_asahi_sync objects to sig=
nal upon completion. */
> +       __u64 out_syncs;
> +
> +       /** @commands: Pointer to the drm_asahi_command array of commands=
 to submit. */
> +       __u64 commands;
> +
> +       /** @flags: Flags for command submission (MBZ) */
> +       __u32 flags;
> +
> +       /** @queue_id: The queue ID to be submitted to */
> +       __u32 queue_id;
> +
> +       /** @result_handle: An optional BO handle to place result data in=
 */
> +       __u32 result_handle;
> +
> +       /** @in_sync_count: Number of sync objects to wait on before star=
ting this job. */
> +       __u32 in_sync_count;
> +
> +       /** @in_sync_count: Number of sync objects to signal upon complet=
ion of this job. */
> +       __u32 out_sync_count;
> +
> +       /** @pad: Number of commands to be submitted */
> +       __u32 command_count;
> +};
> +
> +/* FIXME: This doesn't make any sense, figure out exactly what the attac=
hment flags are */
> +#define ASAHI_ATTACHMENT_C    0
> +#define ASAHI_ATTACHMENT_Z    1
> +#define ASAHI_ATTACHMENT_S    2
> +
> +struct drm_asahi_attachment {
> +       __u32 type;
> +       __u32 size;
> +       __u64 pointer;
> +};
> +
> +#define ASAHI_RENDER_NO_CLEAR_PIPELINE_TEXTURES (1UL << 0)
> +#define ASAHI_RENDER_SET_WHEN_RELOADING_Z_OR_S (1UL << 1)
> +#define ASAHI_RENDER_MEMORYLESS_RTS_USED (1UL << 2) /* Not yet implement=
ed */
> +#define ASAHI_RENDER_PROCESS_EMPTY_TILES (1UL << 3)
> +#define ASAHI_RENDER_NO_VERTEX_CLUSTERING (1UL << 4)
> +
> +struct drm_asahi_cmd_render {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       __u64 flags;
> +
> +       __u64 encoder_ptr;
> +
> +       __u64 attachments;
> +       __u32 attachment_count;
> +       __u32 pad;
> +
> +       __u64 depth_buffer_1;
> +       __u64 depth_buffer_2;
> +       __u64 depth_buffer_3;
> +       __u64 depth_meta_buffer_1;
> +       __u64 depth_meta_buffer_2;
> +       __u64 depth_meta_buffer_3;
> +
> +       __u64 stencil_buffer_1;
> +       __u64 stencil_buffer_2;
> +       __u64 stencil_buffer_3;
> +       __u64 stencil_meta_buffer_1;
> +       __u64 stencil_meta_buffer_2;
> +       __u64 stencil_meta_buffer_3;
> +
> +       __u64 scissor_array;
> +       __u64 depth_bias_array;
> +       __u64 visibility_result_buffer;
> +
> +       __u64 zls_ctrl;
> +       __u64 ppp_multisamplectl;
> +       __u32 ppp_ctrl;
> +
> +       __u32 fb_width;
> +       __u32 fb_height;
> +
> +       __u32 utile_width;
> +       __u32 utile_height;
> +
> +       __u32 samples;
> +       __u32 layers;
> +
> +       __u32 encoder_id;
> +       __u32 cmd_ta_id;
> +       __u32 cmd_3d_id;
> +
> +       __u32 iogpu_unk_49;
> +       __u32 iogpu_unk_212;
> +       __u32 iogpu_unk_214;
> +
> +       __u32 merge_upper_x;
> +       __u32 merge_upper_y;
> +
> +       __u32 load_pipeline;
> +       __u32 load_pipeline_bind;
> +
> +       __u32 store_pipeline;
> +       __u32 store_pipeline_bind;
> +
> +       __u32 partial_reload_pipeline;
> +       __u32 partial_reload_pipeline_bind;
> +
> +       __u32 partial_store_pipeline;
> +       __u32 partial_store_pipeline_bind;
> +
> +       __u32 depth_dimensions;
> +       __u32 isp_bgobjdepth;
> +       __u32 isp_bgobjvals;
> +};
> +
> +struct drm_asahi_cmd_compute {
> +       __u64 flags;
> +
> +       __u64 encoder_ptr;
> +       __u64 encoder_end;
> +
> +       __u64 attachments;
> +       __u32 attachment_count;
> +       __u32 pad;
> +
> +       __u64 buffer_descriptor;
> +
> +       __u32 buffer_descriptor_size; /* ? */
> +       __u32 ctx_switch_prog;
> +
> +       __u32 encoder_id;
> +       __u32 cmd_id;
> +
> +       __u32 iogpu_unk_40;
> +       __u32 iogpu_unk_44;
> +};
> +
> +enum drm_asahi_status {
> +       DRM_ASAHI_STATUS_PENDING =3D 0,
> +       DRM_ASAHI_STATUS_COMPLETE,
> +       DRM_ASAHI_STATUS_UNKNOWN_ERROR,
> +       DRM_ASAHI_STATUS_TIMEOUT,
> +       DRM_ASAHI_STATUS_FAULT,
> +       DRM_ASAHI_STATUS_KILLED,
> +       DRM_ASAHI_STATUS_NO_DEVICE,
> +};
> +
> +enum drm_asahi_fault {
> +       DRM_ASAHI_FAULT_NONE =3D 0,
> +       DRM_ASAHI_FAULT_UNKNOWN,
> +       DRM_ASAHI_FAULT_UNMAPPED,
> +       DRM_ASAHI_FAULT_AF_FAULT,
> +       DRM_ASAHI_FAULT_WRITE_ONLY,
> +       DRM_ASAHI_FAULT_READ_ONLY,
> +       DRM_ASAHI_FAULT_NO_ACCESS,
> +};
> +
> +struct drm_asahi_result_info {
> +       /** @status: One of enum drm_asahi_status */
> +       __u32 status;
> +
> +       /** @reason: One of drm_asahi_fault_type */
> +       __u32 fault_type;
> +
> +       /** @unit: Unit number, hardware dependent */
> +       __u32 unit;
> +
> +       /** @sideband: Sideband information, hardware dependent */
> +       __u32 sideband;
> +
> +       /** @level: Page table level at which the fault occurred, hardwar=
e dependent */
> +       __u8 level;
> +
> +       /** @read: Fault was a read */
> +       __u8 is_read;
> +
> +       /** @pad: MBZ */
> +       __u16 pad;
> +
> +       /** @unk_5: Extra bits, hardware dependent */
> +       __u32 extra;
> +
> +       /** @address: Fault address, cache line aligned */
> +       __u64 address;
> +};
> +
> +#define DRM_ASAHI_RESULT_RENDER_TVB_GROW_OVF (1UL << 0)
> +#define DRM_ASAHI_RESULT_RENDER_TVB_GROW_MIN (1UL << 1)
> +#define DRM_ASAHI_RESULT_RENDER_TVB_OVERFLOWED (1UL << 2)
> +
> +struct drm_asahi_result_render {
> +       /** @address: Common result information */
> +       struct drm_asahi_result_info info;
> +
> +       /** @flags: Zero or more of of DRM_ASAHI_RESULT_RENDER_* */
> +       __u64 flags;
> +
> +       /** @vertex_ts_start: Timestamp of the start of vertex processing=
 */
> +       __u64 vertex_ts_start;
> +
> +       /** @vertex_ts_end: Timestamp of the end of vertex processing */
> +       __u64 vertex_ts_end;
> +
> +       /** @fragment_ts_start: Timestamp of the start of fragment proces=
sing */
> +       __u64 fragment_ts_start;
> +
> +       /** @fragment_ts_end: Timestamp of the end of fragment processing=
 */
> +       __u64 fragment_ts_end;
> +
> +       /** @tvb_size_bytes: TVB size at the start of this render */
> +       __u64 tvb_size_bytes;
> +
> +       /** @tvb_usage_bytes: Total TVB usage in bytes for this render */
> +       __u64 tvb_usage_bytes;
> +
> +       /** @num_tvb_overflows: Number of TVB overflows that occurred for=
 this render */
> +       __u32 num_tvb_overflows;
> +};
> +
> +struct drm_asahi_result_compute {
> +       /** @address: Common result information */
> +       struct drm_asahi_result_info info;
> +
> +       /** @flags: Zero or more of of DRM_ASAHI_RESULT_COMPUTE_* */
> +       __u64 flags;
> +
> +       /** @ts_start: Timestamp of the start of this compute command */
> +       __u64 ts_start;
> +
> +       /** @vertex_ts_end: Timestamp of the end of this compute command =
*/
> +       __u64 ts_end;
> +};
> +
> +struct drm_asahi_get_time {
> +       /** @extensions: Pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @flags: MBZ. */
> +       __u64 flags;
> +
> +       /** @tv_sec: On return, seconds part of a point in time */
> +       __s64 tv_sec;
> +
> +       /** @tv_nsec: On return, nanoseconds part of a point in time */
> +       __s64 tv_nsec;
> +
> +       /** @gpu_timestamp: On return, the GPU timestamp at that point in=
 time */
> +       __u64 gpu_timestamp;
> +};
> +
> +/* Note: this is an enum so that it can be resolved by Rust bindgen. */
> +enum {
> +   DRM_IOCTL_ASAHI_GET_PARAMS       =3D DRM_IOWR(DRM_COMMAND_BASE + DRM_=
ASAHI_GET_PARAMS, struct drm_asahi_get_params),
> +   DRM_IOCTL_ASAHI_VM_CREATE        =3D DRM_IOWR(DRM_COMMAND_BASE + DRM_=
ASAHI_VM_CREATE, struct drm_asahi_vm_create),
> +   DRM_IOCTL_ASAHI_VM_DESTROY       =3D DRM_IOW(DRM_COMMAND_BASE + DRM_A=
SAHI_VM_DESTROY, struct drm_asahi_vm_destroy),
> +   DRM_IOCTL_ASAHI_GEM_CREATE       =3D DRM_IOWR(DRM_COMMAND_BASE + DRM_=
ASAHI_GEM_CREATE, struct drm_asahi_gem_create),
> +   DRM_IOCTL_ASAHI_GEM_MMAP_OFFSET  =3D DRM_IOWR(DRM_COMMAND_BASE + DRM_=
ASAHI_GEM_MMAP_OFFSET, struct drm_asahi_gem_mmap_offset),
> +   DRM_IOCTL_ASAHI_GEM_BIND         =3D DRM_IOW(DRM_COMMAND_BASE + DRM_A=
SAHI_GEM_BIND, struct drm_asahi_gem_bind),
> +   DRM_IOCTL_ASAHI_QUEUE_CREATE     =3D DRM_IOWR(DRM_COMMAND_BASE + DRM_=
ASAHI_QUEUE_CREATE, struct drm_asahi_queue_create),
> +   DRM_IOCTL_ASAHI_QUEUE_DESTROY    =3D DRM_IOW(DRM_COMMAND_BASE + DRM_A=
SAHI_QUEUE_DESTROY, struct drm_asahi_queue_destroy),
> +   DRM_IOCTL_ASAHI_SUBMIT           =3D DRM_IOW(DRM_COMMAND_BASE + DRM_A=
SAHI_SUBMIT, struct drm_asahi_submit),
> +   DRM_IOCTL_ASAHI_GET_TIME         =3D DRM_IOWR(DRM_COMMAND_BASE + DRM_=
ASAHI_GET_TIME, struct drm_asahi_get_time),
> +};

heh.. I had the same issue in mesa and wasn't thinking of doing this instea=
d

> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _ASAHI_DRM_H_ */
>
> --
> 2.35.1
>

