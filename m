Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C83CA72DFB5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8418C10E359;
	Tue, 13 Jun 2023 10:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424CF10E357
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:37:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f74cda5f1dso2095752e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 03:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686652653; x=1689244653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FcIqiwGu4sLEkTe056TBYKLsIuMHS5/22uZLcaXmrIg=;
 b=q38P38oFNz436rbtz93StwiYL/vFP7MMNqPeNIqejeYdXIrrCA3boHSyNWjxCLq+yT
 dL/m53B2SwFPNECbkZSRBytuIDffRItcWoVo+WlXh39G5Czhu9zYzZNMndOPjJyGARt5
 kbl072mpM6tDiMEqdz247ltufPd3+4qHo6Oeg9xmLT5SlA1fjzpla2uhD6mm/axrTWYJ
 izBLn9ywFt38UPfmPSDd7ZYJOXCxjbaWU5b05peQOck/vQznRpGC6CifT0xizIH1bxmu
 Tgoj9P9zSDjP2ZN4rY88dTvxN0xd364jYAjGfSlb2E2YQE15gsbGsvyx1gRL5t7XbU0j
 m4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686652653; x=1689244653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FcIqiwGu4sLEkTe056TBYKLsIuMHS5/22uZLcaXmrIg=;
 b=HEa4N1alzVA6DaoMRT6W0gj6GZma7g9EnF0bwlLyXz9GkrdklR9gO15JZyLL02ltwx
 fu06WUCln1FEITde8j7pwAdmlGmPnSMK+Q+VOYT8UDYR1NdbDQUI5ZUm0tXxmB2XB7um
 /NMSExEwu6Td5FBNPyn9Lt1ftZftLHsIZNnSD53+nQp+171T9+0LAjmDTq9aJ1tfQOXX
 v9HSbh/k7GZwy8I4Ve0VgRZLvbpzNjIA7Y7Bni0WUZapcalHy8hL4suG6Yln2Z1Z3nps
 cXzqdeff/BG6EWW0upr/Zx80PjtOzWNijYt1BtXz3jhLjn3NsTJEXcBYyqkSuhp6fCS5
 SxzQ==
X-Gm-Message-State: AC+VfDxI0uIcPbA6M1gtlnPiRBZIdnIxCvxoFicQSbDCA5i3LmxBsvPV
 ckN2nieli/uJy9K8kyF8Sv+5Eg==
X-Google-Smtp-Source: ACHHUZ75Fs8dPw0U408VxzYcAqvN1dg4+0El4azN/49u3r8xhE324PvUci35OMNH6AhJBTgTqhwkRg==
X-Received: by 2002:a19:2d4e:0:b0:4f3:93d6:377b with SMTP id
 t14-20020a192d4e000000b004f393d6377bmr4733972lft.37.1686652652707; 
 Tue, 13 Jun 2023 03:37:32 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a7bc409000000b003f6050d35c9sm13973436wmi.20.2023.06.13.03.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:37:32 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:37:30 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Message-ID: <20230613103730.GA169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 geert+renesas@glider.be, linux-sh@vger.kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 michael.j.ruhl@intel.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 stable@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:07:39PM +0200, Thomas Zimmermann wrote:
> Struct bd6107_platform_data refers to a platform device within
> the Linux device hierarchy. The test in bd6107_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
>
> Fixes: 67b43e590415 ("backlight: Add ROHM BD6107 backlight driver")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.12+
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

PS Please don't treat this as an Acked-by, if you want to land this
   patchset via a single tree please coordinate with Lee Jones!
