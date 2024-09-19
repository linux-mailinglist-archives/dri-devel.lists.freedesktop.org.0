Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14D97CD13
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 19:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BDC10E012;
	Thu, 19 Sep 2024 17:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L3Qd1Xxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A2B10E012;
 Thu, 19 Sep 2024 17:30:08 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2d87a57c06fso197950a91.2; 
 Thu, 19 Sep 2024 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726767008; x=1727371808; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=97+mEwR3fIOEA2ngQvBPBxiFuXvvJ137NHN/DSkniIw=;
 b=L3Qd1XxnYoBhvRz+H3Xs29skga2cso97jqJEZobsvFPILdm60Zc3dP4VOYeQUrDGGe
 l9H7j3n+qDfSmpv6GhpOGzIduo076rl0cM0BRaalCym2DzqvKKCQedgFtBaUpUrl4Hxt
 hl7nRkKSutr3zEal14TlA3fpJSXe4Ns4hv8nW+AIX2AjrVuICV8QXRnX/LqZskFp+/7G
 +qmFothrt3ZQyKoK1myRgEjyihppZizBZQY2pAJAO7wUjezKcD8A3+j9WYB3Xb+6WWrR
 UTvL6Oy7+jL41gxXP55sSar4x+NZ0Y9eOAiyyoKbBlfjdvMdJMvHN8QNzzwJLlBN46tO
 bqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726767008; x=1727371808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=97+mEwR3fIOEA2ngQvBPBxiFuXvvJ137NHN/DSkniIw=;
 b=Py+Aq/zU0aVHkNV/TJlQC+yC9/VIRk6Rj2KZoordSSzX36k7Ej9c0CQTZGbqX0YUVd
 oQ2P7Ib6G19Hs++BbR7wrpJnunEj+DPCOSpalobXLe8jUe2dd1EQer/HtJSe2pV6dZrk
 7uItpnOZw3OxUdXTEUZPz+f1W/dF3LxIrdDv/Gy946amVQnEDn1IaM2DJ3Cp85pWl7T3
 JHbjicZTerbeYoZFMfDSIdzDpSaEQwehNye8OStlUyhIpUWRn7sdc5J14a8dXRKQS7MB
 n6GinMdT8wyVuNCAG+mnN+dTht/+Yq2wgf4Agz8SW50DXj1mYRpKjRlHcicjbiL1AJzS
 DHIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV76WIx1RkQNs41hTi52megkVtBCz250lEBC4HAKbscBUQRh0t2PXSg/U1fwXzqntWTSaBP5l0w@lists.freedesktop.org,
 AJvYcCXyEuqO+wVrKgnEU741GCTfmSpL7ZuGmprIlytaMb8/ifNB2F71VwoXVjxUJgiUuLA5SPkMsM8ebR5I@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu8FH4LFm2CdqbhnYbWekHCVnk9SPHDXbkBve1VsP3UvOkvggC
 V7830Pw2EB5jE0obDpFT/QnRMuiF06TOUNySsRP+zKyLE6nDvFDX1DOOcFIfsPUcYpbM0LA9g5E
 22sDoOA0uBfb/UEhLNFixXF3np8FDRg==
X-Google-Smtp-Source: AGHT+IHZHD7O5Q3IIaNCbthsMXB1XM/2SUTdorOHktn8dgmxh9KR9uYqDkj4H+Zz+V/6Tb/taiMxk3WOolKRRrpP214=
X-Received: by 2002:a17:90a:bf10:b0:2db:60b:697d with SMTP id
 98e67ed59e1d1-2dd7f7621a7mr72492a91.7.1726767007812; Thu, 19 Sep 2024
 10:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-11-mario.limonciello@amd.com>
 <77b34bd2-3727-42bf-aa0a-4f24ad7232cd@amd.com>
 <e879e296-9453-4a76-a879-52b33143261d@amd.com>
In-Reply-To: <e879e296-9453-4a76-a879-52b33143261d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Sep 2024 13:29:56 -0400
Message-ID: <CADnq5_P78bmWA+xWt0fq6=oSFt33K2TToEFDTx2CudTEuDuAoA@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, 
 Melissa Wen <mwen@igalia.com>, kernel-dev@igalia.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
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

On Thu, Sep 19, 2024 at 12:06=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 9/19/2024 11:03, Alex Hung wrote:
> > A minor comment (see inline below).
> >
> > Otherwise
> >
> > Reviewed-by: Alex Hung <alex.hung@amd.com>
> >
> > On 2024-09-18 15:38, Mario Limonciello wrote:
> >> Some manufacturers have intentionally put an EDID that differs from
> >> the EDID on the internal panel on laptops.
> >>
> >> Attempt to fetch this EDID if it exists and prefer it over the EDID
> >> that is provided by the panel. If a user prefers to use the EDID from
> >> the panel, offer a DC debugging parameter that would disable this.
> >>
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> ---
> >>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 62 +++++++++++++++++=
+-
> >>   drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
> >>   2 files changed, 66 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> index 8f4be7a1ec45..05d3e00ecce0 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> >> @@ -23,6 +23,8 @@
> >>    *
> >>    */
> >> +#include <acpi/video.h>
> >> +
> >>   #include <linux/string.h>
> >>   #include <linux/acpi.h>
> >>   #include <linux/i2c.h>
> >> @@ -874,6 +876,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link
> >> *link)
> >>       return dp_sink_present;
> >>   }
> >> +static int
> >> +dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block,
> >> size_t len)
> >> +{
> >> +    struct drm_connector *connector =3D data;
> >> +    struct acpi_device *acpidev =3D ACPI_COMPANION(connector->dev->de=
v);
> >> +    unsigned char start =3D block * EDID_LENGTH;
> >> +    void *edid;
> >> +    int r;
> >> +
> >> +    if (!acpidev)
> >> +        return -ENODEV;
> >> +
> >> +    /* fetch the entire edid from BIOS */
> >> +    r =3D acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &e=
did);
> >> +    if (r < 0) {
> >> +        DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
> >> +        return r;
> >> +    }
> >> +    if (len > r || start > r || start + len > r) {
> >> +        r =3D -EINVAL;
> >> +        goto cleanup;
> >> +    }
> >> +
> >> +    memcpy(buf, edid + start, len);
> >> +    r =3D 0;
> >> +
> >> +cleanup:
> >> +    kfree(edid);
> >> +
> >> +    return r;
> >> +}
> >> +
> >> +static const struct drm_edid *
> >> +dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
> >> +{
> >> +    struct drm_connector *connector =3D &aconnector->base;
> >> +
> >> +    if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
> >> +        return NULL;
> >> +
> >> +    switch (connector->connector_type) {
> >> +    case DRM_MODE_CONNECTOR_LVDS:
> >> +    case DRM_MODE_CONNECTOR_eDP:
> >> +        break;
> >> +    default:
> >> +        return NULL;
> >> +    }
> >> +
> >> +    if (connector->force =3D=3D DRM_FORCE_OFF)
> >> +        return NULL;
> >> +
> >> +    return drm_edid_read_custom(connector,
> >> dm_helpers_probe_acpi_edid, connector);
> >> +}
> >> +
> >>   enum dc_edid_status dm_helpers_read_local_edid(
> >>           struct dc_context *ctx,
> >>           struct dc_link *link,
> >> @@ -896,7 +952,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
> >>        * do check sum and retry to make sure read correct edid.
> >>        */
> >>       do {
> >> -        drm_edid =3D drm_edid_read_ddc(connector, ddc);
> >> +        drm_edid =3D dm_helpers_read_acpi_edid(aconnector);
> >> +        if (drm_edid)
> >> +            DRM_DEBUG_KMS("Using ACPI provided EDID for %s\n",
> >> connector->name);
> >
> > It is better to always output a message when ACPI's EDID is used withou=
t
> > enabling any debug options. How about DRM_INFO?
>
> Thanks, DRM_INFO makes sense for discoverability and will adjust it.

I'd suggest using dev_info() or one of the newer DRM macros so we know
which device we are talking about if there are multiple GPUs in the
system.

Alex

>
> >
> >> +        else
> >> +            drm_edid =3D drm_edid_read_ddc(connector, ddc);
> >>           drm_edid_connector_update(connector, drm_edid);
> >>           aconnector->drm_edid =3D drm_edid;
> >> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h
> >> b/drivers/gpu/drm/amd/include/amd_shared.h
> >> index 3f91926a50e9..1ec7c5e5249e 100644
> >> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> >> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> >> @@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
> >>        * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the
> >> time.
> >>        */
> >>       DC_FORCE_IPS_ENABLE =3D 0x4000,
> >> +    /**
> >> +     * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
> >> +     * eDP display from ACPI _DDC method.
> >> +     */
> >> +    DC_DISABLE_ACPI_EDID =3D 0x8000,
> >>   };
> >>   enum amd_dpm_forced_level;
>
