Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D53D3B81
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 15:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBCB6EDB3;
	Fri, 23 Jul 2021 13:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245DE6EDB3;
 Fri, 23 Jul 2021 13:56:56 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i39-20020a9d17270000b02904cf73f54f4bso249533ota.2; 
 Fri, 23 Jul 2021 06:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ehby42LJVzYzzEgEfJpnqXt3RS4EATRTZo8lJDwzNGc=;
 b=K0ZSHlqB6XGmAZ9MfQQEd82euD2BU/D7UKJK+2AGkhVvpeSeTEiLUSRWVWFW1NLCbP
 rClcBMITUt8HlTEcMlx/G2FPyFjs1rfVJ4g+58BNZ7IK4GdZrDE9o2o76CYb5WES3hT0
 Maxl9gcLO3/LCd/mzlAfcXMpiHNX5wUWyeDTY2RnUdR4RhmM1PS2NZfmurZ8uaNr9VOK
 91xYtMpELh8XxUX5CSoHXVLgrDcWGMhUkku7n5CDkjwK+UW7oqUogbAO0B5u8PMuYywo
 GbC8apMgFPCU8CRFN5G9W6X81JNSiMYER5S5EetmY8tTKDDAHIOdQTmchFmbLF05Gbvu
 8e2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ehby42LJVzYzzEgEfJpnqXt3RS4EATRTZo8lJDwzNGc=;
 b=rBICNb4GXS0qSVB4wjI9pibSVGNFmOiyNOGWcgTvfatCzHBITAcnOTHK2KGcExTJR+
 fKHQ7AB+nLRSZeFXQgRLtJHopn4AA39f2au1tgHNJMP1Jfm/HuyWVNiRe3+bqSQwaF8K
 GLGvyeGIeCzcKjCZxOxmV1I6EJyygZlF1/5pVGoD5Wx0evzvfrq2jzVU3xWP3bCJ/i5g
 WgMfmwtuIOWFMl4w4sjqqHDS3VB+pfGMJk1NkiGMyZQ3b2309n73pGR80Ao8cr1X7M0I
 8Adbl2EdHEevxua0XtFRhRFpaq+jPQ6qI3WZkVoB9QoeeYD76tEaL3XHUlb7kgnR7KHq
 H7YQ==
X-Gm-Message-State: AOAM5325QlCbPhIFT0ByK3FxoWEmGH/rZPD/fNJ6Ty84kPg41LMNhapr
 tz59x1AViBqYIEnp5NHvPVpF8Q/FUdNWylZcBW0=
X-Google-Smtp-Source: ABdhPJy+kobtP53ctsHskwLfL8JJMLZhUy15StTH5Z9+K20GrirS1TgupQyyj4FwJVO13YFIidxvLcG/nwv6YmxwHbo=
X-Received: by 2002:a05:6830:1f3b:: with SMTP id
 e27mr3082548oth.311.1627048615537; 
 Fri, 23 Jul 2021 06:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <20210715091820.1613726-9-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210715091820.1613726-9-tvrtko.ursulin@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Jul 2021 09:56:44 -0400
Message-ID: <CADnq5_NHDEJohUdgjJqDXD4UX1zzU00WQGV4jSMJNDNDrxFAFQ@mail.gmail.com>
Subject: Re: [RFC 8/8] drm/amdgpu: Convert to common fdinfo format
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Nieto,
 David M" <David.Nieto@amd.com>, Roy Sun <Roy.Sun@amd.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ David, Roy

On Thu, Jul 15, 2021 at 5:18 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Convert fdinfo format to one documented in drm-usage-stats.rst.
>
> Opens:
>  * Does it work for AMD?
>  * What are the semantics of AMD engine utilisation reported in percents?
>    Can it align with what i915 does or needs to document the alternative
>    in the specification document?
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: David M Nieto <David.Nieto@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/amdgpu.rst               | 26 ++++++++++++++++++++++
>  Documentation/gpu/drm-usage-stats.rst      |  7 +++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 18 ++++++++++-----
>  3 files changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
> index 364680cdad2e..b9b79c810f28 100644
> --- a/Documentation/gpu/amdgpu.rst
> +++ b/Documentation/gpu/amdgpu.rst
> @@ -322,3 +322,29 @@ smartshift_bias
>
>  .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: smartshift_bias
> +
> +.. _amdgpu-usage-stats:
> +
> +amdgpu DRM client usage stats implementation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The amdgpu driver implements the DRM client usage stats specification as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +Example of the output showing the implemented key value pairs and entire=
ty of
> +the currenly possible format options:
> +
> +::
> +
> +      pos:    0
> +      flags:  0100002
> +      mnt_id: 21
> +      drm-driver: amdgpu
> +      drm-pdev:   0000:00:02.0
> +      drm-client-id:      7
> +      drm-engine-... TODO
> +      drm-memory-... TODO
> +
> +Possible `drm-engine-` key names are: ``,... TODO.
> +
> +Possible `drm-memory-` key names are: ``,... TODO.
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/dr=
m-usage-stats.rst
> index b87505438aaa..eaaa361805c0 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -69,7 +69,7 @@ scope of each device, in which case `drm-pdev` shall be=
 present as well.
>  Userspace should make sure to not double account any usage statistics by=
 using
>  the above described criteria in order to associate data to individual cl=
ients.
>
> -- drm-engine-<str>: <uint> ns
> +- drm-engine-<str>: <uint> [ns|%]
>
>  GPUs usually contain multiple execution engines. Each shall be given a s=
table
>  and unique name (str), with possible values documented in the driver spe=
cific
> @@ -84,6 +84,9 @@ larger value within a reasonable period. Upon observing=
 a value lower than what
>  was previously read, userspace is expected to stay with that larger prev=
ious
>  value until a monotonic update is seen.
>
> +Where time unit is given as a percentage...[AMD folks to fill the semant=
ics
> +and interpretation of that]...
> +
>  - drm-memory-<str>: <uint> [KiB|MiB]
>
>  Each possible memory type which can be used to store buffer objects by t=
he
> @@ -101,3 +104,5 @@ Driver specific implementations
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
>  :ref:`i915-usage-stats`
> +
> +:ref:`amdgpu-usage-stats`
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_fdinfo.c
> index d94c5419ec25..d6b011008fe9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -76,11 +76,19 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct fi=
le *f)
>         }
>         amdgpu_vm_get_memory(&fpriv->vm, &vram_mem, &gtt_mem, &cpu_mem);
>         amdgpu_bo_unreserve(fpriv->vm.root.bo);
> -       seq_printf(m, "pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domain, b=
us,
> +
> +       /*
> +        * **************************************************************=
****
> +        * For text output format description please see drm-usage-stats.=
rst!
> +        * **************************************************************=
****
> +        */
> +
> +       seq_puts(m, "drm-driver: amdgpu\n");
> +       seq_printf(m, "drm-pdev:\t%04x:%02x:%02x.%d\npasid:\t%u\n", domai=
n, bus,
>                         dev, fn, fpriv->vm.pasid);
> -       seq_printf(m, "vram mem:\t%llu kB\n", vram_mem/1024UL);
> -       seq_printf(m, "gtt mem:\t%llu kB\n", gtt_mem/1024UL);
> -       seq_printf(m, "cpu mem:\t%llu kB\n", cpu_mem/1024UL);
> +       seq_printf(m, "drm-memory-vram:\t%llu KiB\n", vram_mem/1024UL);
> +       seq_printf(m, "drm-memory-gtt:\t%llu KiB\n", gtt_mem/1024UL);
> +       seq_printf(m, "drm-memory-cpu:\t%llu KiB\n", cpu_mem/1024UL);
>         for (i =3D 0; i < AMDGPU_HW_IP_NUM; i++) {
>                 uint32_t count =3D amdgpu_ctx_num_entities[i];
>                 int idx =3D 0;
> @@ -96,7 +104,7 @@ void amdgpu_show_fdinfo(struct seq_file *m, struct fil=
e *f)
>                         perc =3D div64_u64(10000 * total, min);
>                         frac =3D perc % 100;
>
> -                       seq_printf(m, "%s%d:\t%d.%d%%\n",
> +                       seq_printf(m, "drm-engine-%s%d:\t%d.%d %%\n",
>                                         amdgpu_ip_name[i],
>                                         idx, perc/100, frac);
>                 }
> --
> 2.30.2
>
