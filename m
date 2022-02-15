Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D237A4B7A3A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 23:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FC510E58A;
	Tue, 15 Feb 2022 22:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1512010E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644962960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0m+BA83aWoEiePUXOk5oy6jWnLXLhh5UqcrUWxGGpW4=;
 b=jENBNfCIQ1FSM98WTUyLWoBmGQU3/HYry6uS+BG7EBi3sk5xHe2bOKjmxQZOC+7KeOX+u5
 zhMO4oc1TKJ0Hx9lmDn8R8r46VSaws9Pkugbj4a/dol7IeN4DQmA4Of1TOiowHOB+vg2kP
 oCREGgbsYA2oJDh4BqjrSCeU1Xhi+j4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-GXmUwQiUMqa-RDmKcj6Tig-1; Tue, 15 Feb 2022 17:09:19 -0500
X-MC-Unique: GXmUwQiUMqa-RDmKcj6Tig-1
Received: by mail-wm1-f70.google.com with SMTP id
 i188-20020a1c3bc5000000b0037bb9f6feeeso2064741wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 14:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0m+BA83aWoEiePUXOk5oy6jWnLXLhh5UqcrUWxGGpW4=;
 b=YUeFfj9hf1drma1ENY+GGY44ZnABttCOIZc+3HUz+gyVoaB5/fygtIdgenqCHrQGks
 FtH1fGJRD4mIRWRo5Co4KJFNp6vcqBnzRO9YPVnN3goavyHAe3Pl7r7Jlo8CUfAplpwU
 sRL9piKwqP4BeTRUIuTEITjMP01/hxshfKP5zHbDHiIvJdFzPEB545j8LFZQynPYRl6j
 /cnZCIWv5P0X6ycfxamipRpKhyHEIC/1O3ODFY7wXvTCFrvSJiiLOal/7AymYva3HPXf
 gB9bxSs33rpHpjB/2D4rdYAXAMwO0D3xhaEwsebl+Nrh0WmuBrPPF2+xjbtk0lYtQylu
 rdbA==
X-Gm-Message-State: AOAM533VoAUj0l1wnd3aOl/3s6c8a1qtpZXcdN36CtrI6fX+T5tHi7RB
 acUZ6uGhwQiPHSIkNXI1ZmBx34hsDTRxtTqLOi8bcbTMUnzx8w0/yfAcbBXV+x8Q0xsuFeBmCe3
 OxurfLEGZFCfloo/1iarmOIo4pFut
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr733233wrl.599.1644962958200; 
 Tue, 15 Feb 2022 14:09:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHw/TEWtChpHD1Jcb3s2gMkTePeuSIRDClJ/u2UyeoC9fnBijBMv1BfwrUjbbeQYYDAmbhAg==
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr733204wrl.599.1644962957952; 
 Tue, 15 Feb 2022 14:09:17 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id y4sm12016236wrd.54.2022.02.15.14.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 14:09:17 -0800 (PST)
Message-ID: <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
Date: Tue, 15 Feb 2022 23:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] drm: Plumb debugfs_init through to panels
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 jjsu@chromium.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Doug,

On 2/5/22 01:13, Douglas Anderson wrote:

[snip]

> +static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
> +				      struct dentry *root)
> +{
> +	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +	struct drm_panel *panel = panel_bridge->panel;
> +
> +	root = debugfs_create_dir("panel", root);

This could return a ERR_PTR(-errno) if the function doesn't succeed.

I noticed that most kernel code doesn't check the return value though...

> +	if (panel->funcs->debugfs_init)

Probably if (!(IS_ERR(root) && panel->funcs->debugfs_init) ?

> +		panel->funcs->debugfs_init(panel, root);
> +}

[snip]

> @@ -436,6 +436,9 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>  	/* vrr range */
>  	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
>  			    &vrr_range_fops);

Same here, wonder if the return value should be checked.

I leave it to you to decide, but regardless of that the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

