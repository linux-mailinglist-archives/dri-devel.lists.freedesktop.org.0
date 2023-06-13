Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A649C72DFBA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 12:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB5310E357;
	Tue, 13 Jun 2023 10:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7876510E357
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:38:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f738f579ceso39962085e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686652699; x=1689244699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cAWffXJhiZCuKdmLvadUWaZhgzR3HLgGd9VEe5lJrAY=;
 b=oWTv+jER8ka1Qe57jA4SaFw0YkAFNR9MLs8EHWTLGK0gdjURb8827U7zjqwpiSvT5T
 e0eaDxvtT7uG5+Wp8EirrXTjTOUQX2j/fLOLaZq/pJ+64Ba00r5H9S/pK7U4dMRJK0L9
 Qc7Or4upS3NpLZcvQbHuxgTi02642jsuq/VHjVcUfbnag6BeSFitZ8VihbqRMQ/amt5S
 6rAO7D1sOS/m+HDxZaf78NEI9Ak53UleVXMM+lSrWWnyEM8j5n0WiG1dLUXPUJpPa+UJ
 39Dun5o3c331GsTFkjQ3ooru5EdNZi10JosHPeRADIMH5vkoBHrH65cHPo29D6Ml/R0w
 z2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686652699; x=1689244699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAWffXJhiZCuKdmLvadUWaZhgzR3HLgGd9VEe5lJrAY=;
 b=jpoD5rfBo+4WS6sgWIn7rViln9lbPKofEDUd6cKSnK0TY77H+GHD3DDOuB7fybrrNu
 dN1d+jQ8+UOlEfDQqoCHFmrfiMGMBtTqusQwCCaZ4zzCfeYmLjV+qtmND8u2v+QHfPx9
 3kGzjCOnQq/RNb0gB7jktIrShX3Br8YJndb9louSfa4Tmzc5P+7dwnGO8FFreD2Bx8tj
 hvOTRqfyiaUbvWRhr1ykSDzeDx3I6l4m0+/hwVkaSQIHbdmFwdPw5r4wka4rPZ3RKv7t
 FDhzuxxB+pILhsMeTRaRewwrJRlxnn+QBYoFbUpBH1f7es/zeiCfOcUbLMdGi+505cZV
 rIqg==
X-Gm-Message-State: AC+VfDxNk5gFEpLTJd47Rktgbi1mhyARsMZBQSsEX1LK7yTgudWeOD0Z
 nd/OGJ6/lnkB4RRcgFlehv7o7Q==
X-Google-Smtp-Source: ACHHUZ7XbWL7BIDfabVlTuRqNRZTwEQFmx5C8dduAKY+peonAhPu4Kc2nONW4msTEVohgZimbq+iHA==
X-Received: by 2002:a1c:ed03:0:b0:3f6:69f:75e0 with SMTP id
 l3-20020a1ced03000000b003f6069f75e0mr7721992wmh.25.1686652699406; 
 Tue, 13 Jun 2023 03:38:19 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a7bc7ce000000b003f50d6ee334sm13982145wmk.47.2023.06.13.03.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:38:19 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:38:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/38] backlight/bd6107: Rename struct
 bd6107_platform_data.fbdev to 'dev'
Message-ID: <20230613103817.GB169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-3-tzimmermann@suse.de>
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
 michael.j.ruhl@intel.com, linux-omap@vger.kernel.org, sam@ravnborg.org,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 04:07:40PM +0200, Thomas Zimmermann wrote:
> Rename struct bd6107_platform_data.fbdev to 'dev', as it stores a
> pointer to the Linux platform device; not the fbdev device. Makes
> the code easier to understand.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
