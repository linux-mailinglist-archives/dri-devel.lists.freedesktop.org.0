Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20397DEB1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 22:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7134210E1A7;
	Sat, 21 Sep 2024 20:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="evTIbjWZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6142010E1A7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 20:02:52 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53568ffc525so3784021e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726948970; x=1727553770; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KzTjJLHGO/fZK2ZP3mh0GYV6FdmkG1EHAMPRnxKXquE=;
 b=evTIbjWZAEKiCmG1VgoC7EAG6PRPnCiKe/ekvIb6UdIafghOobJV1m0NrxDOEqFXjr
 QRusMZgwNoNLCrwZXQbknKiCxV/QX7rV/ZA2ZlyIw8xgp9IJ0GcxCXhy4is4tI7qtwBl
 c2sinqy6bChIQbNQP8wOJfu7mk9YDkAWeP+K/iJYEDVi58MgC1IYx4e493P23ZkxbdKp
 /Dq2+I4U5pQdhRxgtzthEp4rkoTJoVFcl59ib342TMvySZOkGfDyqGVKh5cILN4hDgVe
 mqdhGSlgz6SJJGIsLdbwcaRT+VVbbt9xCuJzrIRY9nfLBZkwx8RKf71D/1SUFnj6fJ+D
 SH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726948970; x=1727553770;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KzTjJLHGO/fZK2ZP3mh0GYV6FdmkG1EHAMPRnxKXquE=;
 b=JV1hAsKX9v4FQq/MTrcEcrC7dvX6S3IvDoxLPGSga7IAcDktpFvIuWILP3MBzrNP5E
 j/YKWR365BEU2lM2FKu4OgPFmctYTZZEYeoy7VZU/3r485lveUSwlVZBTKdSW/qJO33g
 yKXzFJBdIg7dPZI+FmBlPOPInvnFfCLI/tVOLUb03/snERwejRSwGvTJbfWAJ2YuZdfa
 VeYt4PUhtM+sKXljq6eq9tfoXI2ykJW2mWWAH1FyeJb6uKxFP3zxqRR2OrlDzJIG0QFn
 f/ofia6GgEvPnhunHb/Z1+x4jiCi15CoR8kt97Np9GA0DINe3HzSQqq14F214qpSgowj
 1KFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR6cpaRWYtA3cYVenyRN5LDuiHMFCYPk8PKq0MOWiex7Q6eP//bPRajwBUkgXcVGOCzkGzKEftooc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9gzowO47TqiEnRX/s4im+IKW2z7lDRC2vbo97ebya1d+ssMdT
 t8Qhct0iuX3gDSDvignnN3YM8NFb5rOEk8bsxeyRktp3ojZRnCDvHOJfElr5zms=
X-Google-Smtp-Source: AGHT+IHlkZyIV65BjpKbE85N6c+hDkQ9A1BsLH/UuQReGbYIwftQNbGiizyTppv3FTyi+Isl5pzrzA==
X-Received: by 2002:a05:6512:e94:b0:533:45dc:d2f0 with SMTP id
 2adb3069b0e04-536ac320123mr3801447e87.46.1726948969589; 
 Sat, 21 Sep 2024 13:02:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53687046795sm2684177e87.24.2024.09.21.13.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:02:49 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:02:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: tjakobi@math.uni-bielefeld.de
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 Denis Benato <benato.denis96@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm: panel-orientation-quirks: Add quirk for AYA NEO
 Founder edition
Message-ID: <36odkas4clex2azzseubqt5r6mby3ocu55lrwd5hqhvzfeo65h@tnonocnpsgo7>
References: <cover.1726492131.git.tjakobi@math.uni-bielefeld.de>
 <f71889a0b39f13f4b78481bd030377ca15035680.1726492131.git.tjakobi@math.uni-bielefeld.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f71889a0b39f13f4b78481bd030377ca15035680.1726492131.git.tjakobi@math.uni-bielefeld.de>
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

On Mon, Sep 16, 2024 at 03:18:53PM GMT, tjakobi@math.uni-bielefeld.de wrote:
> From: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> 
> Add quirk orientation for AYA NEO Founder. The name appears with spaces in
> DMI strings as other devices of the brand. The panel is the same as the
> NEXT and 2021 models. Those could not be reused as the former has VENDOR
> name as "AYANEO" without spaces and the latter has "AYADEVICE".
> 
> Tested by the JELOS team that has been patching their own kernel for a
> while now and confirmed by users in the AYA NEO and ChimeraOS discord
> servers.
> 
> Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
