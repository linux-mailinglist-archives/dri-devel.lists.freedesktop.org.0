Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4344DBA2F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 22:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6365410E526;
	Wed, 16 Mar 2022 21:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830A10E526
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 21:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647466402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cjf+sePUKjFVbs2/xMP28GG8F7q6IR/iIhSkVA49Mzo=;
 b=FxidzDfC+YWMKDhTRGJo4eTs02dgf9wSS0Z/AbKOYer+IuTuRlpt1wu9MWPJ8I/U3L/ikg
 UGuEwL7ffOSwSH8K0oSClbcJJHngNwqlAzL2K8E6AQ81/g29+luts3OY19u6kDvAn61xaN
 Kn/1G2Fwh57Ni/YOzuTH9/KlVc2XuGA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-39ZVh411MyOaeuyiLcnhpw-1; Wed, 16 Mar 2022 17:33:21 -0400
X-MC-Unique: 39ZVh411MyOaeuyiLcnhpw-1
Received: by mail-qk1-f198.google.com with SMTP id
 c19-20020a05620a0cf300b005f17891c015so2188160qkj.18
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 14:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Cjf+sePUKjFVbs2/xMP28GG8F7q6IR/iIhSkVA49Mzo=;
 b=nwXmv58Ok2se4M4Xuove4iVf5IaTj3PSZ/O1XXvE4E+Jf4eyqGkP11xZ53R69Fc0x2
 vAgD6t71LpGiGqmjIx8fv3d7Y1DRxiFtPuOXbYm0lcCiI0DqRgeN8wM5NacpUTf6gpKe
 ZP+vnNiqWj2xUyFe7HNzqpz+dCl88K5QzmJ0U565bk3CEH+yL5V8k+S2I/PWapYSkLZ2
 YANmntw2g13wPBo1+6Lzv8+Sw/NJeKv6EVv8pzviQ2j6HAi542ojFoPQVtTcFbVopdNS
 BC9ZZ2oZpoRLeu7W2LmeHLhPLqqNn6kZiQC1G3yXn7QWWqPQGIWruLDdbWCr2wva+Vcb
 iYDA==
X-Gm-Message-State: AOAM531nP/W4XqfMrChn4JIGEk/BfoKYOoX3DN7DlP4Cph+EpICI7ezJ
 CKP0vd5bKbxF7G3pxFNElY6ANFhCcoUI+FTC/9QdVRmpTBe0CcZWH6rllYBx+nEH5Ua4DrxcWbu
 ZUXPkdyZ5nYtN5Qr0/u5r1cG6mfW+
X-Received: by 2002:a05:620a:1434:b0:67d:40a2:da33 with SMTP id
 k20-20020a05620a143400b0067d40a2da33mr1108784qkj.93.1647466400912; 
 Wed, 16 Mar 2022 14:33:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMBj382llJcGhNjgXypk2KMl+brcsR3ru94ivUi6qdYSL0nMy2ik1LLlUpxmOj9dtjU/pdPw==
X-Received: by 2002:a05:620a:1434:b0:67d:40a2:da33 with SMTP id
 k20-20020a05620a143400b0067d40a2da33mr1108760qkj.93.1647466400559; 
 Wed, 16 Mar 2022 14:33:20 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
 by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm1380576qkc.121.2022.03.16.14.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 14:33:20 -0700 (PDT)
Date: Wed, 16 Mar 2022 17:33:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Don't make DRM_PANEL_BRIDGE dependent on
 DRM_KMS_HELPERS
Message-ID: <YjJXnzJmDGsrZAXj@xps13>
References: <20220315084559.23510-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20220315084559.23510-1-tzimmermann@suse.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bmasney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 narmstrong@baylibre.com, airlied@linux.ie,
 Naresh Kamboju <naresh.kamboju@linaro.org>, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kernel test robot <lkp@intel.com>,
 thierry.reding@gmail.com, robert.foss@linaro.org, airlied@redhat.com,
 Linux Kernel Functional Testing <lkft@linaro.org>, sam@ravnborg.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 09:45:59AM +0100, Thomas Zimmermann wrote:
> Fix a number of undefined references to drm_kms_helper.ko in
> drm_dp_helper.ko:
> 
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_duplicate_state':
>   drm_dp_mst_topology.c:(.text+0x2df0): undefined reference to `__drm_atomic_helper_private_obj_duplicate_state'
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_delayed_destroy_work':
>   drm_dp_mst_topology.c:(.text+0x370c): undefined reference to `drm_kms_helper_hotplug_event'
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_up_req_work':
>   drm_dp_mst_topology.c:(.text+0x7938): undefined reference to `drm_kms_helper_hotplug_event'
>   arm-suse-linux-gnueabi-ld: drivers/gpu/drm/dp/drm_dp_mst_topology.o: in function `drm_dp_mst_link_probe_work':
>   drm_dp_mst_topology.c:(.text+0x82e0): undefined reference to `drm_kms_helper_hotplug_event'
> 
> This happens if panel-edp.ko has been configured with
> 
>   DRM_PANEL_EDP=y
>   DRM_DP_HELPER=y
>   DRM_KMS_HELPER=m
> 
> which builds DP helpers into the kernel and KMS helpers sa a module.
> Making DRM_PANEL_EDP select DRM_KMS_HELPER resolves this problem.
> 
> To avoid a resulting cyclic dependency with DRM_PANEL_BRIDGE, don't
> make the latter depend on DRM_KMS_HELPER and fix the one DRM bridge
> drivers that doesn't already select DRM_KMS_HELPER. As KMS helpers
> cannot be selected directly by the user, config symbols should avoid
> depending on it anyway.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 3755d35ee1d2 ("drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: Linux Kernel Functional Testing <lkft@linaro.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>

This patch fixes the build error that I see with qcom_defconfig in
linux-next.

Tested-by: Brian Masney <bmasney@redhat.com>

