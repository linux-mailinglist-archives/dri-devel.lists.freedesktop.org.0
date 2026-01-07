Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A3CFE962
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 16:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61B210E622;
	Wed,  7 Jan 2026 15:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KvnguLM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AE610E622
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767799977;
 bh=71w7t8LPiVaLndk62hfpDxPw5Rh8GKJYeQFA5QugTfM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KvnguLM7W827qa3jHzZItssUqG3D+7+zhzIF9CYTAA+KxQEKFT8FILFjaGIp0IOmn
 NlGkV/s89nRjc1rOTy1+u4YS81KPf+sna+9Uml1XbZx9Kf9eJfyp9ga+NZbDOwt3vf
 tj/7hMe2tFj+ijqb5m+bkI6yXSnU5Pp0Yx2s+MW3FC8sBrku0pOg3iXZ6PS1WWC9ov
 KVs0rnnWLyFN4psR8vYh8QAspV+5+WazHLPVjNr0q4yyY3DNDttR+tcEw3gKWfaD5E
 ioJbDujUCEgrj8ITRD7YDMYsR+mzE+GLnmX+fumKMaOUgjbmz/wH/G3WwMJPI6Mtp6
 Nf17ppBLNReMQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 55BFA17E14FA;
 Wed,  7 Jan 2026 16:32:57 +0100 (CET)
Date: Wed, 7 Jan 2026 16:32:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 1/7] drm/panthor: Add performance counter uAPI
Message-ID: <20260107163250.672bcd35@fedora>
In-Reply-To: <a642cad5-fd6f-4d5c-8259-41e68d5eba99@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-2-lukas.zapolskas@arm.com>
 <20251217153751.5fbc68ea@fedora>
 <a642cad5-fd6f-4d5c-8259-41e68d5eba99@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi Lukas,

On Wed, 7 Jan 2026 15:13:38 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> Hello Boris,
>=20
> On 17/12/2025 14:37, Boris Brezillon wrote:
> > Hi Lukas,
> >=20
> > On Mon, 15 Dec 2025 17:14:47 +0000
> > Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:
> >  =20
> >> This patch extends the DEV_QUERY ioctl to return information about the
> >> performance counter setup for userspace, and introduces the new
> >> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
> >> performance counters.
> >>
> >> The new design is inspired by the perf aux ringbuffer [0], with the
> >> insert and extract indices being mapped to userspace, allowing
> >> multiple samples to be exposed at any given time. To avoid pointer
> >> chasing, the sample metadata and block metadata are inline with
> >> the elements they describe.
> >>
> >> Userspace is responsible for passing in resources for samples to be
> >> exposed, including the event file descriptor for notification of new
> >> sample availability, the ringbuffer BO to store samples, and the
> >> control BO along with the offset for mapping the insert and extract
> >> indices. Though these indices are only a total of 8 bytes, userspace
> >> can then reuse the same physical page for tracking the state of
> >> multiple buffers by giving different offsets from the BO start to
> >> map them.
> >>
> >> [0]: https://docs.kernel.org/userspace-api/perf_ring_buffer.html
> >>
> >> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
> >> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> >> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> >> Reviewed-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> >> ---
> >>  include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 565 insertions(+)
> >>
> >> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor=
_drm.h
> >> index e238c6264fa1..d1a92172e878 100644
> >> --- a/include/uapi/drm/panthor_drm.h
> >> +++ b/include/uapi/drm/panthor_drm.h
> >> @@ -154,6 +154,9 @@ enum drm_panthor_ioctl_id {
> >>  	 * This is useful for imported BOs.
> >>  	 */
> >>  	DRM_PANTHOR_BO_QUERY_INFO,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session=
. */
> >> +	DRM_PANTHOR_PERF_CONTROL,
> >>  };
> >> =20
> >>  /**
> >> @@ -253,6 +256,9 @@ enum drm_panthor_dev_query_type {
> >>  	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group=
 priorities information.
> >>  	 */
> >>  	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
> >> +
> >> +	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter inte=
rface information. */
> >> +	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
> >>  };
> >> =20
> >>  /**
> >> @@ -445,6 +451,135 @@ struct drm_panthor_group_priorities_info {
> >>  	__u8 pad[3];
> >>  };
> >> =20
> >> +/**
> >> + * enum drm_panthor_perf_feat_flags - Performance counter configurati=
on feature flags.
> >> + */
> >> +enum drm_panthor_perf_feat_flags {
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block sta=
tes are supported. */
> >> +	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT =3D 1 << 0,
> >> +};
> >> +
> >> +/**
> >> + * enum drm_panthor_perf_block_type - Performance counter supported b=
lock types.
> >> + */
> >> +enum drm_panthor_perf_block_type {
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
> >> +	DRM_PANTHOR_PERF_BLOCK_METADATA =3D 0,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
> >> +	DRM_PANTHOR_PERF_BLOCK_FW,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
> >> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
> >> +	DRM_PANTHOR_PERF_BLOCK_TILER,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
> >> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
> >> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
> >> +	DRM_PANTHOR_PERF_BLOCK_FIRST =3D DRM_PANTHOR_PERF_BLOCK_FW,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
> >> +	DRM_PANTHOR_PERF_BLOCK_LAST =3D DRM_PANTHOR_PERF_BLOCK_SHADER,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
> >> +	DRM_PANTHOR_PERF_BLOCK_MAX =3D DRM_PANTHOR_PERF_BLOCK_LAST + 1,
> >> +}; =20
> >=20
> > I'd really prefer if we were not exposing block types as uAPI if those
> > are not truly needed for the UMD/KMD to agree on things. The counter
> > block knowledge exists in userspace (because it has to if we want to
> > attach meaning to counters), and I don't really see the need to
> > standardize it here. In my experience, any definition that's not
> > absolutely required might become a liability at some point. In that
> > case, I can already imagine new GPUs shuffling the block IDs, getting
> > rid of some, adding new ones, ... If we have to accommodate the enum
> > for those changes it will become a mess. On the other hand, if we make
> > the block ID an opaque u8, it just becomes HW knowledge that the
> > UMD/perfcnt lib has already (GPU_ID, plus other PERFCNT specific dev
> > queries if some stuff are implementation-defined).
> >  =20
>=20
> These IDs are not being provided from the HW, but rather attached to the =
segment=20
> in the kernel. Identifying the blocks in userspace was much easier in JM,=
 since=20
> they were more or less fixed in the layout. In CSF, on the other hand, th=
e layout
> can be a lot more dynamic, and it's not always obvious from the buffer al=
one=20
> whether a particular block type is available or not. It would require exp=
osing=20
> more of the FW values directly to the user.

Can you expand a bit here? What kind of FW values? I was assuming
counters would always be HW counters and depend on the GPU arch
major/minor plus maybe some optional features. Is the FW inserting some
SW-based counters? If that's the case, I'd still prefer to expose FW
interface versions and let the userside lib figure out where each block
is.

>=20
> >> +
> >> +/**
> >> + * enum drm_panthor_perf_clock - Identifier of the clock used to prod=
uce the cycle count values
> >> + * in a given block.
> >> + *
> >> + * Since the integrator has the choice of using one or more clocks, t=
here may be some confusion
> >> + * as to which blocks are counted by which clock values unless this i=
nformation is explicitly
> >> + * provided as part of every block sample. Not every single clock her=
e can be used: in the simplest
> >> + * case, all cycle counts will be associated with the top-level clock.
> >> + */
> >> +enum drm_panthor_perf_clock {
> >> +	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
> >> +	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
> >> +
> >> +	/**
> >> +	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible =
for the MMU, L2
> >> +	 * caches and the tiler.
> >> +	 */
> >> +	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
> >> +
> >> +	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
> >> +	DRM_PANTHOR_PERF_CLOCK_SHADER,
> >> +};
> >> +
> >> +/**
> >> + * struct drm_panthor_perf_info - Performance counter interface infor=
mation
> >> + *
> >> + * Structure grouping all queryable information relating to the perfo=
rmance counter
> >> + * interfaces.
> >> + */
> >> +struct drm_panthor_perf_info {
> >> +	/**
> >> +	 * @counters_per_block: The number of 8-byte counters available in a=
 block.
> >> +	 */
> >> +	__u32 counters_per_block;
> >> +
> >> +	/**
> >> +	 * @sample_header_size: The size of the header struct available at t=
he beginning
> >> +	 * of every sample.
> >> +	 */
> >> +	__u32 sample_header_size;
> >> +
> >> +	/**
> >> +	 * @block_header_size: The size of the header struct inline with the=
 counters for a
> >> +	 * single block.
> >> +	 */
> >> +	__u32 block_header_size; =20
> >=20
> > Are those things not directly deducible from the arch major/minor? If
> > those things are implementation-defined, I guess that's fine to expose
> > them, but otherwise I'd rely on the knowledge that exists in the UMD.
> >  =20
>=20
> They are implementation-defined, so the sizes may be the same for several=
 different arch major/minors
> and then change for all of them.

Can you be more specific? Which implementation are we talking about?
The FW implementation, or some fixed HW function that might or might
not be present? Actually, let's take a step back, can you explain where
those counters come from? I was assuming those were HW counters that
were simply forwarded by the FW. Are you saying the FW is more than
just a dummy proxy?

>=20
> >> +
> >> +	/**
> >> +	 * @sample_size: The size of a fully annotated sample, starting with=
 a sample header
> >> +	 *               of size @sample_header_size bytes, and all availabl=
e blocks for the current
> >> +	 *               configuration, each comprised of @counters_per_bloc=
k 64-bit counters and
> >> +	 *               a block header of @block_header_size bytes. =20
> >=20
> > Let's keep the kernel doc formatting consistent and drop the alignment
> > on the field name (IIRC, it also generate weird indentation in the
> > final htmldoc if we do that.
> >  =20
>=20
> Will do!=20
>=20
> >> +	 *
> >> +	 *               The user must use this field to allocate size for t=
he ring buffer. In
> >> +	 *               the case of new blocks being added, an old userspac=
e can always use
> >> +	 *               this field and ignore any blocks it does not know a=
bout.
> >> +	 */
> >> +	__u32 sample_size; =20
> >=20
> > Same thing for the sample_size, it looks like something the UMD should
> > know already, given a specific config.
> >  =20
>=20
> Not necessarily. One of the use-cases we have is libGPUCounters[0], which=
 gets embedded in applications
> at a particular version with the expectation of it functioning in a forwa=
rds compatible fashion, i.e.,=20
> running the application with an old version of the library against a new =
KMD. In that case, the UMD
> cannot infer the size of the sample purely from the fields that were prev=
iously exposed to the UMD.

That's where I'm lost. Why would the HW counter layout change based on
a KMD version? Feels like you're treating HW counters as a SW concept,
which is somewhat confusing to me. Maybe the answer to my previous
question will answer that.

Regards,

Boris
