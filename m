Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343AE4D31AC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 16:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8C710E6A3;
	Wed,  9 Mar 2022 15:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2611410E6A3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646839343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mneM/WNFthdHoCaTLUluTMs3GUmvrKmERUkOEBdbV4E=;
 b=hTw0ECc0aB31n+5ZUZjyfp2oD0xbQ8N6pSHkiizxRGalqdQm6YHPGNjuDtbwucyXlKhVPs
 oFdvRgd0IBeQOpRjiG4hQ/U4URcRSdf2YK1uxpe9gAoTpnmSL8nBE511QW5lhw+HuFSgQJ
 KSeP3cl/yB69rWJGMJ6fDsUr4azvxRo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-PdTq9ekxM8yvY-GgnofM8w-1; Wed, 09 Mar 2022 10:22:20 -0500
X-MC-Unique: PdTq9ekxM8yvY-GgnofM8w-1
Received: by mail-ej1-f69.google.com with SMTP id
 hq34-20020a1709073f2200b006d677c94909so1475339ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 07:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mneM/WNFthdHoCaTLUluTMs3GUmvrKmERUkOEBdbV4E=;
 b=uEmU0pdKCPxQunBcm68ZU+Lbd6VLbHWxFLksF+6TSEmHYOneeDlrqXqymj/7s62AWF
 eJweK9XbrFvGYYnPC5wnhZPvsesODLpvHIMFMCRuHDlwDFWWaKHmLKN0nKiqDtJjvRWa
 rOxxGBqR+my7WoEn8rPHhmBmFlDYVhy5EN13gBpGOdwJ5oA3tgOanUrYIaji1Mz4fOWW
 vjREeSLy7R1mwgSsdYyB+olZbkBMreyQjZ+jeSUoqptcGFVWNAaPJVf4CtBOZj16hIW0
 4QrcdWwkzNoKCJnWOk27WIChQqMKpnWS+VW9G0jeVtDcyd3OoAmR05DCyZIUdllADxzd
 Pzrg==
X-Gm-Message-State: AOAM5336Ncb8brQtwmGGdNQcXLzzs3y2F5SMG8K+0ucy7UWoxY9vMv5F
 4R4SMhxQtTrOa0iCSFAFTq37dljnhDsw3nxbI9X8zrH0UltfEdgDH0NCn57SW3ALDANF3HAGO8I
 ck0qOUhF/SBlDVdOcCFZSiubXOMFX
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id
 o14-20020a170906974e00b006bb4f90a6aemr247655ejy.452.1646839338284; 
 Wed, 09 Mar 2022 07:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziRMzZOZnW1jEBvyL3LG1iaCafKKjIYlfg05PLKeAXnhU7iSyiTNyEMVVrkawKHW4S7bevlg==
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id
 o14-20020a170906974e00b006bb4f90a6aemr247614ejy.452.1646839337773; 
 Wed, 09 Mar 2022 07:22:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0?
 (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a056402349000b004162fd77252sm945043edc.95.2022.03.09.07.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 07:22:17 -0800 (PST)
Message-ID: <e4baccb2-6c45-4220-f3ba-a72659b17725@redhat.com>
Date: Wed, 9 Mar 2022 16:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] drm/amdgpu: Add support for drm_privacy_screen
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, harry.wentland@amd.com, alexdeucher@gmail.com
References: <20220309150606.1877288-1-sean@poorly.run>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220309150606.1877288-1-sean@poorly.run>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 rajatja@google.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/9/22 16:06, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the necessary hooks to make amdgpu aware of privacy
> screens. On devices with privacy screen drivers (such as thinkpad-acpi),
> the amdgpu driver will defer probe until it's ready and then sync the sw
> and hw state on each commit the connector is involved and enabled.
> 
> Changes in v2:
> -Tweaked the drm_privacy_screen_get() error check to avoid logging
>  errors when privacy screen is absent (Hans)
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/477640/ #v1

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  9 +++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  3 +++
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++++++-
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 2ab675123ae3..e2cfae56c020 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_managed.h>
>  #include "amdgpu_drv.h"
> @@ -1988,6 +1989,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  {
>  	struct drm_device *ddev;
>  	struct amdgpu_device *adev;
> +	struct drm_privacy_screen *privacy_screen;
>  	unsigned long flags = ent->driver_data;
>  	int ret, retry = 0, i;
>  	bool supports_atomic = false;
> @@ -2063,6 +2065,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	size = pci_resource_len(pdev, 0);
>  	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
>  
> +	/* If the LCD panel has a privacy screen, defer probe until its ready */
> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
> +	drm_privacy_screen_put(privacy_screen);
> +
>  	/* Get rid of things like offb */
>  	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
>  	if (ret)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e1d3db3fe8de..9e2bb6523add 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9781,6 +9781,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  		if (acrtc) {
>  			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
>  			old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
> +
> +			/* Sync the privacy screen state between hw and sw */
> +			drm_connector_update_privacy_screen(new_con_state);
>  		}
>  
>  		/* Skip any modesets/resets */
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 740435ae3997..594a8002975a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -27,6 +27,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/dp/drm_dp_mst_helper.h>
>  #include <drm/dp/drm_dp_helper.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include "dm_services.h"
>  #include "amdgpu.h"
>  #include "amdgpu_dm.h"
> @@ -506,6 +507,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  				       struct amdgpu_dm_connector *aconnector,
>  				       int link_index)
>  {
> +	struct drm_device *dev = dm->ddev;
>  	struct dc_link_settings max_link_enc_cap = {0};
>  
>  	aconnector->dm_dp_aux.aux.name =
> @@ -519,8 +521,20 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>  				      &aconnector->base);
>  
> -	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
> +	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		struct drm_privacy_screen *privacy_screen;
> +
> +		/* Reference given up in drm_connector_cleanup() */
> +		privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
> +		if (!IS_ERR(privacy_screen)) {
> +			drm_connector_attach_privacy_screen_provider(&aconnector->base,
> +								     privacy_screen);
> +		} else if (PTR_ERR(privacy_screen) != -ENODEV) {
> +			drm_err(dev, "Error getting privacy screen, ret=%d\n",
> +				PTR_ERR(privacy_screen));
> +		}
>  		return;
> +	}
>  
>  	dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
>  	aconnector->mst_mgr.cbs = &dm_mst_cbs;

