Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A036C3694D5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1166E0F5;
	Fri, 23 Apr 2021 14:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2FD6E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:35:43 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id v6so21560715oiv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jbbrFFl9vrwv+CdmCwQi0I7Ko+cX89wNgsv/KroPn5Y=;
 b=YND9y+oQTfNuuRE/WdvdMgAirwez9HFLRB+aG9BPoNMwQKu6aALut9FGPg2hbWqD6t
 F3EXvj2ltRdHT+rRBp5KxOD33T91Yf8+200STJMjqxjsGjtAT2Mco+qodmLFAK84pvTZ
 pUdgdf01v4YY3dlbpOm44wrP/0SBpj6zQ5/WiLmZJmaki+i6Gv7/e9AFprsIB+WFtIjs
 7rXn6nIl+MnNEEJBeF1126DPKf+cgZHv1VOGm21NOMzYgtXYQUgVpTlQrebnqj2JMNJ5
 MqWqXre21JazMJNwKEZykbfpWbR7hKiVGO+XzEPwQhZnz6hHcZK2YnPvLk771yIzKt7j
 cbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jbbrFFl9vrwv+CdmCwQi0I7Ko+cX89wNgsv/KroPn5Y=;
 b=IgKdYM+Pxl0U4yf6prKSl73Z4TUtc/kVOzL7HH17PlfbzLiclQs2HpWc19Rrwr4QNf
 OyfU8XvXQwynMiW09eE1/KIWxr8F/c9P3/plaBcVwKUDp07W7wLDBkE+ULPG3z6iT/bs
 y1q/ummQwNBfkbgzVj0d85BuRs/UcSvsY6XVyXJ7qqNP8TfSBlrjusJlaIswLoPi0nfn
 kw5iAObXbR/ijPNvKKXF+l6+eEPJtbeDwYrC3jb3gGOD236HYWOpg1wo0HM3BAc4thmV
 SXITWQiaRjDcjTvaOLDXqZ4SGZ4QwGYgo+0OcRw5Tl7qKnf/dvUp6o2SXaa0/d6fnMQC
 fA4A==
X-Gm-Message-State: AOAM532hfH63WBu4HvUpi1qe9CzufH1icInus9hOgIeOy3QV5pne4RiO
 rtjRDG7aW6RZ01VKwrMombYIcQ==
X-Google-Smtp-Source: ABdhPJxcCUZNBug881o1uVELe/LX/FF4rYn/YAsPBI0cQIVf5vzR30LNv6mS9V2fNTK1QZAX0+vB4w==
X-Received: by 2002:a05:6808:f8e:: with SMTP id
 o14mr3036405oiw.56.1619188542856; 
 Fri, 23 Apr 2021 07:35:42 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id c14sm1202484oov.21.2021.04.23.07.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:35:42 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:35:40 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 10/27] drm/bridge: ti-sn65dsi86: Clean debugfs code
Message-ID: <YILbPCGC+Wk9Mdxx@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.10.I5fe072753290c6a77eda736ebd5778e17b7cb0fb@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.10.I5fe072753290c6a77eda736ebd5778e17b7cb0fb@changeid>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Let's cleanup the debugfs code to:
> - Check for errors.
> - Use devm to manage freeing, which also means we don't need to store
>   a pointer in our structure.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 +++++++++++++++++----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 57574132e200..0c6aa99ddc99 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -118,7 +118,6 @@
>   * @aux:          Our aux channel.
>   * @bridge:       Our bridge.
>   * @connector:    Our connector.
> - * @debugfs:      Used for managing our debugfs.
>   * @host_node:    Remote DSI node.
>   * @dsi:          Our MIPI DSI source.
>   * @edid:         Detected EDID of eDP panel.
> @@ -146,7 +145,6 @@ struct ti_sn65dsi86 {
>  	struct drm_dp_aux		aux;
>  	struct drm_bridge		bridge;
>  	struct drm_connector		connector;
> -	struct dentry			*debugfs;
>  	struct edid			*edid;
>  	struct device_node		*host_node;
>  	struct mipi_dsi_device		*dsi;
> @@ -245,18 +243,30 @@ static int status_show(struct seq_file *s, void *data)
>  
>  DEFINE_SHOW_ATTRIBUTE(status);
>  
> -static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
> +static void ti_sn65dsi86_debugfs_remove(void *data)
>  {
> -	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
> -
> -	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
> -			&status_fops);
> +	debugfs_remove_recursive(data);
>  }
>  
> -static void ti_sn65dsi86_debugfs_remove(struct ti_sn65dsi86 *pdata)
> +static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
>  {
> -	debugfs_remove_recursive(pdata->debugfs);
> -	pdata->debugfs = NULL;
> +	struct device *dev = pdata->dev;
> +	struct dentry *debugfs;
> +	int ret;
> +
> +	debugfs = debugfs_create_dir(dev_name(dev), NULL);
> +	if (IS_ERR(debugfs))
> +		ret = PTR_ERR(debugfs);
> +	else
> +		ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove,
> +					       debugfs);
> +
> +	if (ret) {

You're not supposed to handle errors from debugfs_create_dir(), but I
like what you're doing with devm here and that needs a check.

Also worth mentioning is that at this point in the patch stack the
debugfs "status" file will outlive the activation of pm_runtime, this is
however taken care of in a later patch. Given that it's unlikely to
cause a problem I don't mind this transient issue - but wanted to
mention that I reviewed the end result in this regard.


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +		dev_warn(dev, "Failed to create debugfs (%d), skipping\n", ret);
> +		return;
> +	}
> +
> +	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>  }
>  
>  /* Connector funcs */
> @@ -1310,8 +1320,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
>  
>  	kfree(pdata->edid);
>  
> -	ti_sn65dsi86_debugfs_remove(pdata);
> -
>  	drm_bridge_remove(&pdata->bridge);
>  
>  	pm_runtime_disable(pdata->dev);
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
