Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1942A3AF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 13:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF716E911;
	Tue, 12 Oct 2021 11:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE526E911;
 Tue, 12 Oct 2021 11:55:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id z11so77762925lfj.4;
 Tue, 12 Oct 2021 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=JIUb7Da7dWbEeM1lvh/qh3XFLuwM3MIhMcmUK2Fkqe8=;
 b=pX+o+x42j7t3rE8SDkgrgbDYksV2X5Ydw/WxOlBPMPZ2+ArMISQg8J/Gp5nJRi157O
 2ZhfEF9Ws02ZkNuSrD7W/CZRYI+zdu+cY5RP8V8jBuY4j1efSyG6tuR5gqyBX25nyhS6
 ghVr9tH0XhG/T0xcWv0VGbn624Crq2/rp22zvZXt+nBpPJ9IiQmFHcxMiYz9BJHzyPCe
 oCKin+PqfmMiFZNyjo6jfbeEIn8/Vs1FCwjgmoEfOZc6t1ch5DO0ZGjT5dTjQ0lXZCHU
 C7di4VmO/sP3H/gXJLfiFJw8As6IsIgNis08tw1lwvDDWoz/5KiBteqh/jUQitNME8GM
 sUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=JIUb7Da7dWbEeM1lvh/qh3XFLuwM3MIhMcmUK2Fkqe8=;
 b=WL1/fhybUQtJ8tpbrrZ6YXJqLS0Ngtqz8lu7dc0/s3pnAGh0slAjLMtjfoKkIBj4Qa
 qmkiHDsM1T0giFXoe1O5bbLNHRVxj0DabYXsJNodAgYP8ouuLdfWzbwJKSQdDu+3uuRC
 AVm9QMg9esRBge7o53Y4OKcBAEBonZ6692FYkzZL76g0YcGDoFThUFdG2SNZRllY34DM
 VJTyQ1O2cUlbSTr+XfG2ep41JcNDCnQ/mxzznLqsnPYF29wdbg1EFcj4fjSQvMADOQY4
 huvMnZ556tmNGooHfG+9bfdT2g4VnFATcq1zAuxRBbV8w58/A93Y0XMqp53iCWfZ0p8O
 RFQA==
X-Gm-Message-State: AOAM530SZ8zgjbFfMoqU9H+MA3htDxYItUwDrWes67ySmd+pD3T3gHYm
 2rXYbJogNcKjX7IuMouBwTo=
X-Google-Smtp-Source: ABdhPJxE4BYxqJUaMYokAZ5PHuM0AXyiG9JV5RWr0uUBy0dHswoEyMHGtyCMRID3WFHqBmE627MTmQ==
X-Received: by 2002:a05:6512:b29:: with SMTP id
 w41mr33403130lfu.508.1634039733272; 
 Tue, 12 Oct 2021 04:55:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t9sm1144293ljk.39.2021.10.12.04.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:55:33 -0700 (PDT)
Date: Tue, 12 Oct 2021 14:55:29 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, ville.syrjala@linux.intel.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Subject: Re: [RFC v2 00/22] Add Support for Plane Color Lut and CSC features
Message-ID: <20211012145529.687dfdee@eldfell>
In-Reply-To: <20210906213904.27918-1-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+U3XpCAE6iIZAcQ28TLWMHC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/+U3XpCAE6iIZAcQ28TLWMHC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  7 Sep 2021 03:08:42 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> This is how a typical display color hardware pipeline looks like:
>  +-------------------------------------------+
>  |                RAM                        |
>  |  +------+    +---------+    +---------+   |
>  |  | FB 1 |    |  FB 2   |    | FB N    |   |
>  |  +------+    +---------+    +---------+   |
>  +-------------------------------------------+
>        |  Plane Color Hardware Block |
>  +--------------------------------------------+
>  | +---v-----+   +---v-------+   +---v------+ |
>  | | Plane A |   | Plane B   |   | Plane N  | |
>  | | DeGamma |   | Degamma   |   | Degamma  | |
>  | +---+-----+   +---+-------+   +---+------+ |
>  |     |             |               |        |
>  | +---v-----+   +---v-------+   +---v------+ |
>  | |Plane A  |   | Plane B   |   | Plane N  | |
>  | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
>  | +---+-----+   +----+------+   +----+-----+ |
>  |     |              |               |       |
>  | +---v-----+   +----v------+   +----v-----+ |
>  | | Plane A |   | Plane B   |   | Plane N  | |
>  | | Gamma   |   | Gamma     |   | Gamma    | |
>  | +---+-----+   +----+------+   +----+-----+ |
>  |     |              |               |       |
>  +--------------------------------------------+
> +------v--------------v---------------v-------|
> ||                                           ||
> ||           Pipe Blender                    ||
> +--------------------+------------------------+
> |                    |                        |
> |        +-----------v----------+             |
> |        |  Pipe DeGamma        |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |            Pipe Color  |
> |        +-----------v----------+ Hardware    |
> |        |  Pipe CSC/CTM        |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |                        |
> |        +-----------v----------+             |
> |        |  Pipe Gamma          |             |
> |        |                      |             |
> |        +-----------+----------+             |
> |                    |                        |
> +---------------------------------------------+
>                      |
>                      v
>                Pipe Output
>=20
> This patch series adds properties for plane color features. It adds
> properties for degamma used to linearize data and CSC used for gamut
> conversion. It also includes Gamma support used to again non-linearize
> data as per panel supported color space. These can be utilize by user
> space to convert planes from one format to another, one color space to
> another etc.
>=20
> Userspace can take smart blending decisions and utilize these hardware
> supported plane color features to get accurate color profile. The same
> can help in consistent color quality from source to panel taking
> advantage of advanced color features in hardware.
>=20
> These patches add the property interfaces and enable helper functions.
> This series adds Intel's XE_LPD hw specific plane gamma feature. We
> can build up and add other platform/hardware specific implementation
> on top of this series.
>=20
> Credits: Special mention and credits to Ville Syrjala for coming up
> with a design for this feature and inputs. This series is based on
> his original design and idea.
>=20
> Note: Userspace support for this new UAPI will be done on Chrome in
> alignment with weston and general opensource community.
> Discussion ongoing with Harry Wentland, Pekka and community on color
> pipeline and UAPI design. Harry's RFC below:
> https://patchwork.freedesktop.org/series/89506/
> We need to converge on a common UAPI interface which caters to
> all the modern color hardware pipelines.=20
>=20
> ToDo: State readout for this feature will be added next.
>=20
> v2: Added UAPI description and added change in the rfc section of
> kernel Documentation folder

Hi,

thank you for this. I do believe the KMS UAPI should expose what
hardware can do (prescribed operations) rather than how they would be
often used (to realize a conversion from one space description to
another). This proposal fits quite nicely with what I have envisioned
for Weston.

I mainly went over the big picture by commenting in detail on the
proposal document, and not looking too carefully at the other
documentation or UAPI details at this time.

Unfortunately I was unable to decipher how userspace is supposed to use
the XE_LPD special gamma features.


Thanks,
pq

>=20
> Uma Shankar (22):
>   drm: RFC for Plane Color Hardware Pipeline
>   drm: Add Enhanced Gamma and color lut range attributes
>   drm: Add Plane Degamma Mode property
>   drm: Add Plane Degamma Lut property
>   drm/i915/xelpd: Define Degamma Lut range struct for HDR planes
>   drm/i915/xelpd: Add register definitions for Plane Degamma
>   drm/i915/xelpd: Enable plane color features
>   drm/i915/xelpd: Add color capabilities of SDR planes
>   drm/i915/xelpd: Program Plane Degamma Registers
>   drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
>   drm/i915/xelpd: Initialize plane color features
>   drm/i915/xelpd: Load plane color luts from atomic flip
>   drm: Add Plane CTM property
>   drm: Add helper to attach Plane ctm property
>   drm/i915/xelpd: Define Plane CSC Registers
>   drm/i915/xelpd: Enable Plane CSC
>   drm: Add Plane Gamma Mode property
>   drm: Add Plane Gamma Lut property
>   drm/i915/xelpd: Define and Initialize Plane Gamma Lut range
>   drm/i915/xelpd: Add register definitions for Plane Gamma
>   drm/i915/xelpd: Program Plane Gamma Registers
>   drm/i915/xelpd: Enable plane gamma
>=20
>  Documentation/gpu/drm-kms.rst                 |  90 +++
>  Documentation/gpu/rfc/drm_color_pipeline.rst  | 167 ++++++
>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |  12 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  38 ++
>  drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
>  .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +
>  .../gpu/drm/i915/display/intel_atomic_plane.h |   2 +
>  drivers/gpu/drm/i915/display/intel_color.c    | 513 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |   2 +
>  .../drm/i915/display/skl_universal_plane.c    |  15 +-
>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>  drivers/gpu/drm/i915/i915_reg.h               | 176 +++++-
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/drm/drm_plane.h                       |  81 +++
>  include/uapi/drm/drm_mode.h                   |  58 ++
>  16 files changed, 1337 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
>=20


--Sig_/+U3XpCAE6iIZAcQ28TLWMHC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFld7EACgkQI1/ltBGq
qqfE2A/8DpdbGdXqIB3oKsK27U0M5p8z3AVNsw1kj9lvHGvUucLDNIf7ISi5DBNs
D0sWCuC5KBixzVDabm57W92VQRHKomrTWCrJhBWK7pzIriMx0e1sE03GIHAheICo
bnUBRcn5WFVBshWq+skWbeNIP615FmLbJcmb3tKygNb+PcF8kCSwPOzWITidot7J
Ji5IPlG1PjfihZACnAuI6GtINrbBfy/fF8q3I9T6DYhoLgLTuf+MsyzMg5ApQ5Mk
FqrRVWwP4cAXMZpHN0rKUG432bQ+TjXaqyTI632QtL6eFGycSrRKQNIJY7gQJPCI
A2ax5+rdpCfyj5p/oeMwP6bOwzOuKe7AlmqWRtqHTpibLiZjZKj4AJi6r5njVlgF
vIzTHPbTdNRNfks/0ttbZ68TGdivgEULjzziTz+jDQezhD4LfihgIg+/alBfUz9a
BoBrTj8G476hgemYCTO32JqHaqW/zKm8olZ1z+NQ8L9qBXe1t/7d2/5MXdgTz2xC
gKQm7EQKnyv9bg8gkj4bqhuKiM5qM2iRJUg4FPpwOgZlD/Qwrx9o2HFJf3fGooi4
ZWEwbyyuzCauh2SXc69xN/wiK5bTPBfr09QUQOjGzocE0lB/ONDBQB+fHvwRjWv7
oAnE0YCH/SYusNXEnk6cy1tIL/Ltu/RhixJlDUYLgZp3TaDRF5c=
=mQgk
-----END PGP SIGNATURE-----

--Sig_/+U3XpCAE6iIZAcQ28TLWMHC--
