Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19B1B30DE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 22:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821FE6E32F;
	Tue, 21 Apr 2020 20:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC56E32F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 20:00:18 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t11so7288307pgg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
 b=YWDFSsi9ryGa8bDJzYeDNw+vx+TvNzV2BxgbgfORIvrP64vyZ1imeGOhyAgmGNngvm
 eCYaSD73vnaoGoKUeQgCKH+Hr66n7gWLTjfCaUfz+rjOnTy5EdTl9YkbziW6tCDs5Jff
 8eLrKW28QiInsEbBv0ijdwTtski0qBKHoilQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
 b=p0ml1x5y+0IM4InK2HSkv2qKQiwUOk8vZE9WF/jYuwkDjoKgu4vtBUVeibFTfj4Fhi
 EJ3DG9n49Bb+AHvwl4K6Sgyl8Ai5hZf7IJnEtY9/fL7F5a9nYteW+VQvqlOA/H0/Ww6t
 Dl+UNjSCVWrBfZsv9/TDUxVMVnMdhUZIlzsaDNnzK6piJlRBxTvc4Y2K74NHZVtKj1jF
 0+Dx/e6zdYpHt3yjUA7ci263jKlXuBPHKRA4BK7gOREBQNoOizOmDo1TybYHchPLhx/P
 ORTlZzLRM4hSTaJacfk2mhEVc4ytBJ8MoYh3jVeShHVwVWsg9RbCa28kr5+9Kq6P8dmc
 4GoA==
X-Gm-Message-State: AGi0PuYP3TKbW7bRY34gJ47Xjwc+jVwLE7uzS+lHtwSupmEDjxzn24kz
 0pmlAvogXy6mebJjFU+acnuup3aGrjo=
X-Google-Smtp-Source: APiQypIRuEpl74OEh/r7qvhYCkgt2cE/s/0bvJj5YQ7FRv0j5NRQrJj0QGCAqQNBlGDnOqKGb1/peQ==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr23894600pgk.429.1587499217639; 
 Tue, 21 Apr 2020 13:00:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 20sm2423112pfx.116.2020.04.21.13.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 13:00:16 -0700 (PDT)
Date: Tue, 21 Apr 2020 13:00:15 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCH v11 1/2] drm/panel: add support for rm69299 visionox
 panel driver
Message-ID: <20200421200015.GH199755@google.com>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200421045508.21137-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421045508.21137-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 21, 2020 at 10:25:07AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Please keep tags from previous versions (like my Reviewed-by from v7)
when making minimal changes.

Also there is no need to keep sending the bindings patch, it already
landed in drm-misc.

> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..3ef4cc80044a
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c

...

> +MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> -- 
> 2.25.1

The last two lines break the patch:

git am /tmp/v11-1-2-drm-panel-add-support-for-rm69299-visionox-panel-driver.patch
Applying: drm/panel: add support for rm69299 visionox panel driver
error: corrupt patch at line 379
Patch failed at 0001 drm/panel: add support for rm69299 visionox panel driver

Besides the broken format:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
