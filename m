Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59AD8A80AA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 12:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAD9113390;
	Wed, 17 Apr 2024 10:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EJnU3aTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D40113390
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 10:20:11 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516cbf3fd3dso6861332e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713349209; x=1713954009; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Zrs6iAAO4SVBswghNTTZW+QUAJVqns3ugAjr/mrsbC8=;
 b=EJnU3aTSrJO9WmKHVrEgDdIf88kpDjzikT5kBjl7NeirLbEsDius6yJsusM34lySz7
 87mNO4CwsbxJp6n/z6tFvhKiG5PYfQpm0/b8UgVvhDHp1r0FVJyLGROMWl94EoX1u/+a
 6r6Jx/zOZOuhQPBpaQgc4hGxQ4z/ETGqkjnQi0hCG/DgG9XblaVlKE/AfxSkVvGuiLqx
 SkC1urROHwUsQS31HrXl+oyqKvc/3w+wLuHGve4Nprme1qisZULHqC+RIN3xK74YkqaH
 5TH0kZZVRDmxi3gSYx4Sde1z8LblN/DT26eHU8xo44vWwqGfXrx3onJWkqgx6+byOX1Q
 V/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713349209; x=1713954009;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zrs6iAAO4SVBswghNTTZW+QUAJVqns3ugAjr/mrsbC8=;
 b=aV8TdtLJ4fuqyMpVvlsf7dVhUk5bmCLZl1mXHUnApTGvf199SosBRA9cLbe1C4Sg5j
 TuHSs7LuU0YvtGYAY9s90fynBWi/13gQDpd4sxyPvO0lQdPouxz0ev1/0qCpKXHaKiwI
 t5BLIMwXJCxdA9spBFr8FUOWXer3au65GtV6jjhBOtVQ2wI8HzwHiMX9NCb1EDmNZrLe
 2siagqMQ8q3bi75Tx3Kxlb+6Xzn3Z6U40+YtDKP3OZ40I5e+HfVStH+ZiLb/UySDX7Sr
 ug+VwCXSTaO+jg0lLHeXnb46deMxwt5ezeKe5lhms+LoSw9+lhg5SIR5DlAkvfQVkj6f
 g3sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcml5OU1NmxJbeNdMeAzGZKlK4Mm5ZE5aSh3KA5/4wsSOYy9pWbVpJ5aj7uNf6pg9XB/r+m1WPE14WNlVXSfgpO6iq4XhDoWCzI6wvP24k
X-Gm-Message-State: AOJu0YzLtXl0hnfVejFbqY4cFyiwA0bPIsjRjE3P74j8uW8nWjqPDKYv
 NtMZls9w9msr0I+ftE1BtY15C+4ST+3pZN/oDK8drdRjSDOQqhGny6NmWNyoT00=
X-Google-Smtp-Source: AGHT+IEOahWQed32kV3EmBcZ13tNLL9ukzZ1h1XrxShRCPrrH1eKgqV1FmVUa9zexHbub5gfEuA/6g==
X-Received: by 2002:a05:6512:a88:b0:515:a8e0:bf3c with SMTP id
 m8-20020a0565120a8800b00515a8e0bf3cmr14614083lfu.32.1713349209568; 
 Wed, 17 Apr 2024 03:20:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 w12-20020ac2598c000000b00516c403d243sm1901592lfn.60.2024.04.17.03.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:20:09 -0700 (PDT)
Date: Wed, 17 Apr 2024 13:20:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] component: Support masters with no subcomponents
Message-ID: <h47tqpveo7iitrz2luqifb7fidrhfv4o4rsivvb7bacbhj4qcg@xmamgxyfk3qr>
References: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
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

On Wed, Apr 17, 2024 at 11:12:09AM +0200, Herman van Hazendonk wrote:
> This happens in the MSM DRM driver when it is used
> without any subcomponents, which is a special corner
> case.
> 
> If the MDP4 is used with nothing but the LVDS display,
> we get this problem that no components are found since
> the LVDS is part of the MDP4 itself.
> 
> We cannot use a NULL match, so create a dummy match
> with no components for this case so the driver will
> still probe nicely without adding a secondary
> complicated probe() path to the MSM DRM driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
> This happens in the MSM DRM driver when it is used
> without any subcomponents, which is a special corner
> case.
> 
> If the MDP4 is used with nothing but the LVDS display,
> we get this problem that no components are found since
> the LVDS is part of the MDP4 itself.
> 
> We cannot use a NULL match, so create a dummy match
> with no components for this case so the driver will
> still probe nicely without adding a secondary
> complicated probe() path to the MSM DRM driver.
> ---
>  drivers/base/component.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index 741497324d78..bb79e7a77bb0 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -497,6 +497,10 @@ static void free_aggregate_device(struct aggregate_device *adev)
>  	kfree(adev);
>  }
>  
> +static struct component_match dummy_match = {
> +	.num = 0,
> +};

I think it's better to handle this in the MDP4 driver code.

Also note that LVDS / LCDC support should be fixed anyway. The DT needs
to pass LCDC clock (which it doesn't). apq8064 uses DSI2 clock after
reparenting it onto the LVDS clock generated by MDP4. Previous
generations should have a separate LCDC clock coming from MMCC.

> +
>  /**
>   * component_master_add_with_match - register an aggregate driver
>   * @parent: parent device of the aggregate driver
> @@ -516,6 +520,9 @@ int component_master_add_with_match(struct device *parent,
>  	struct aggregate_device *adev;
>  	int ret;
>  
> +	if (!match)
> +		match = &dummy_match;
> +
>  	/* Reallocate the match array for its true size */
>  	ret = component_match_realloc(match, match->num);
>  	if (ret)
> 
> ---
> base-commit: 96fca68c4fbf77a8185eb10f7557e23352732ea2
> change-id: 20240417-component-dummy-a9aae5ac7234
> 
> Best regards,
> -- 
> Herman van Hazendonk <github.com@herrie.org>
> 

-- 
With best wishes
Dmitry
