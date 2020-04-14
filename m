Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467821A7B13
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038D06E102;
	Tue, 14 Apr 2020 12:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A606A6E102
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:44:58 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y24so13769803wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 05:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/DbyWC/V56uvP1+UtYrcBWXMbTIi6NrJJc/uH5SPhRA=;
 b=OBKXPg8mO7r+/bMZCHJqbFG41NF9nczOd+ao7FLXejqEhOzCZB1CPcBa1uQj3oLdnH
 oaPJ4u0IcrFkievPfPe5sFhKkxw/cnoQ6qrmmWCaQg7r9qRgvyiz1wgDlx8CnbMrEZtb
 MUu3GywGrmTp8WbK6KfIRfc6BsYNZPyHF57oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/DbyWC/V56uvP1+UtYrcBWXMbTIi6NrJJc/uH5SPhRA=;
 b=LXEDgfM1+p6IavT2PFMCgmn5XB+LwJzRon7vjOvD8rTNLm+7FoiENFzULtMenXjGmG
 fDuwO60xu+1AXZdXzIqKNSJJCMA60tecMExFSWmoepBFaS1IoblJK0P3+zaKy6iWbaWo
 9b49PKZzyuCpOWEkpE+S4RPMct2bPNQqfm+xIMQzODj2OFdUqz6ee8NVZk2t8k9EVdaU
 ow5iMoIzrY9mS5NIDgHTfqeQnN1kewqWYjBlFYQZhvO2rqq0BwhN9nP8+ytOpO7KH9FS
 2kc8xQPRNMXU/mIHGEIBreQ9qPpLHfyNuIv5x/ijMzyEmZdQvs9rNPKsIL0vLPxfuV+R
 I1qQ==
X-Gm-Message-State: AGi0PuaPssaLcM0g+cnhdy1w3CxzCrVsT9KKXR6fullq9qdLnPfJmiZ/
 e+UCzo4v+Jlt4WAsNZKbYAaiyg==
X-Google-Smtp-Source: APiQypLwnSqSoceH29nhs87TKD1t19EW/JQDDyWXymflZZp6Lwi0u1irOfQ08W703ofifDHmR1DMTQ==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr23288178wmb.34.1586868297304; 
 Tue, 14 Apr 2020 05:44:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k8sm17130062wrm.52.2020.04.14.05.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:44:56 -0700 (PDT)
Date: Tue, 14 Apr 2020 14:44:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/dp: Expose connector VRR
 info via debugfs
Message-ID: <20200414124454.GW3456981@phenom.ffwll.local>
References: <20200414050807.13531-1-manasi.d.navare@intel.com>
 <20200414050807.13531-3-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414050807.13531-3-manasi.d.navare@intel.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 dri-devel@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 10:08:07PM -0700, Manasi Navare wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> =

> [Why]
> It's useful to know the min and max vrr range for IGT testing.
> =

> [How]
> Expose the min and max vfreq for the connector via a debugfs file
> on the connector, "i915_vrr_info".
> =

> Example usage: cat /sys/kernel/debug/dri/0/DP-1/i915_vrr_info
> =

> v3:
> * Remove the unnecessary debug print (Manasi)
> v2:
> * Fix the typo in max_vfreq (Manasi)
> * Change the name of node to i915_vrr_info so we can add
> other vrr info for more debug info (Manasi)
> * Change the VRR capable to display Yes or No (Manasi)
> * Fix indentation checkpatch errors (Manasi)
> =

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Tested-by: Manasi Navare <manasi.d.navare@intel.com>

So if I'm understanding things correctly AMD butchered the VRR stuff and
only exposes it when:

- VRR_ENABLED is set
- _and_ you're using the legacy page_flip path, atomic flip doesn't
  support it
- _and_ the PAGE_FLIP_ASYNC flag is set.

That's pretty bonkers uapi, and I think before we add a new driver we need
to figure out how to make this work. Works case we might need a revert
hammer for the amdgpu side and new VRR properties so we're not tricking
any existing userspace into something where stuff then would break.

But I'm hoping we can do a bit more clever than that. Or maybe I'm just
wrong on how amdgpu vrr works.

Adding amd folks.
-Daniel

> ---
>  .../drm/i915/display/intel_display_debugfs.c  | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drive=
rs/gpu/drm/i915/display/intel_display_debugfs.c
> index bdeea2e02642..35b229ab4d19 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -2096,6 +2096,21 @@ static const struct file_operations i915_dsc_fec_s=
upport_fops =3D {
>  	.write =3D i915_dsc_fec_support_write
>  };
>  =

> +static int i915_vrr_info_show(struct seq_file *m, void *data)
> +{
> +	struct drm_connector *connector =3D m->private;
> +
> +	if (connector->status !=3D connector_status_connected)
> +		return -ENODEV;
> +
> +	seq_printf(m, "Vrr_capable: %s\n", yesno(intel_dp_is_vrr_capable(connec=
tor)));
> +	seq_printf(m, "Min: %u\n", (u8)connector->display_info.monitor_range.mi=
n_vfreq);
> +	seq_printf(m, "Max: %u\n", (u8)connector->display_info.monitor_range.ma=
x_vfreq);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(i915_vrr_info);
> +
>  /**
>   * intel_connector_debugfs_add - add i915 specific connector debugfs fil=
es
>   * @connector: pointer to a registered drm_connector
> @@ -2130,9 +2145,14 @@ int intel_connector_debugfs_add(struct drm_connect=
or *connector)
>  =

>  	if (INTEL_GEN(dev_priv) >=3D 10 &&
>  	    (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DisplayPort ||
> -	     connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP))
> +	     connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)) {
>  		debugfs_create_file("i915_dsc_fec_support", S_IRUGO, root,
>  				    connector, &i915_dsc_fec_support_fops);
>  =

> +		if (INTEL_GEN(dev_priv) >=3D 12)
> +			debugfs_create_file("i915_vrr_info", S_IRUGO,
> +					    root, connector, &i915_vrr_info_fops);
> +	}
> +
>  	return 0;
>  }
> -- =

> 2.19.1
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
