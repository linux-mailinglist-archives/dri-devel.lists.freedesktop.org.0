Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279BDBD9276
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381710E5BD;
	Tue, 14 Oct 2025 11:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ckIxFOGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAF410E5B8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:57:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso1103103366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 04:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760443040; x=1761047840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nfYNvCCPGe7L50oTKoEL1dXfDHFFc9ojZJtuVOHJgeU=;
 b=ckIxFOGyYgm7qPwXSlJonJmjChMz9XkneuNmWE5qv3ZeyaCH2I49u7nIeS4mId2+Dq
 BoDcQDJog0M/pnyb2cfvdFZnbZK+X5YrjvkK5kPzdekivK4w9ldzr9Prm9+3v/soUrRg
 jHs1xENCIPkAdXkvcqJjmh+Sji8mYRKgkgfHyo1T02BBwGSZERhY5njkhT1E2I70YVj4
 FaaUyIcW04uthnHgRTABhtuWwX8dp8Od/J7tHvF+4nCyViaSqowZeDjmcAv0vAfZoKvB
 1qEgVKbA1DNt+unowIzJrqlv6lKRJC/DLeEvCOeA2i6I/GyPQ6h3NsHiI9KC+gs1M5K7
 tGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760443040; x=1761047840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfYNvCCPGe7L50oTKoEL1dXfDHFFc9ojZJtuVOHJgeU=;
 b=l1MY6sWBN6fsKFSxJFe2JN8pjiZtCV6Z2UEp5z1/wDoVg3rP1X53RpDbe1nWyeu3tQ
 wWqrPTQSv7dLKRePNshGSDcCwICgkFyNwnfg+QAy4xAM4ZB9vjk5vvM9x/hUgp11GTda
 3tROwjcYpwzSwLxTOurDwJoDIx9MiNP/pzb03hOncrUJe/trVmNVBJxQktX9fBsk7+gh
 phBrsmYeb23ct5STEfDCeMKKgqAySReN1hFM3XitpOZbUnSt3WxZD3tbdId/+vO7gAfc
 FURVmUNHxuSKGYcfSnA8461OPdGEfsvNky4AfzyUb4GGySnZ+vEf7HXFZcWxF2Ta5Gbs
 LZWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbu6KMb+jLCdgWj0FvqC3wKlhvHKWMYOZILuRDt9ToqLGIvXGf1TdecfwThEthEJqMN+I5vchGtmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcU51+NmVAW8Mxocwmh97PbnSWjdVc9v+j3dCFLtezTNR9dHqE
 7Cc709xAZ38PML5/WMKHt6M454n0ys0pg5b1C9agp78RsYmsHhB1sglw
X-Gm-Gg: ASbGnctf3T8wk6tNI7lJat11Z/biFkdGvla04AL+TNHFpaOIn9Iwz09tSdptmgGYzLP
 6MMkhCY88kTdRi83julVQLsrqdoQ5rP+PfooL5CTQ3SfBLTcfBsc5qML76TbudXpeI2FUlBg3/o
 /3+y9vAcNrjt51DQLqxrzNYSqhm1hjmEa0IMvEyHGismwchrjSGi2a8NYGdclIH9E1LOTo9kitl
 lClXnvJB1A7YbsRF7aoC6UsX1wAiFPfx5YOriCYlZkOgsxPwVBhIfGXAqF/sMhxBA/dPSWk8us0
 77l61msp9wTEwRLUiyjc8yM82/0JORvkRYauQxTOcBjq8Mzil7AQne7BF3DRDRd4NXBUG8W2EQb
 zT3wSzsO6IwqP+CYfla1bJt+SjaWwuS5O4OuSphF64ZWE0dPblLbeasRyzkRR37fTuRS3zdHRuF
 DIYKF3A8ci1F3HHu+uYfN0GbamRXbIheZmVgFE/xExs3JbG0t06ec=
X-Google-Smtp-Source: AGHT+IEO5ExkdB+Vc/eA9hYbJB2YUbFHvlBREw3jtxdBP+T0I/Kox+2SWgXKekZXvheyf/FHTlBwdw==
X-Received: by 2002:a17:906:c104:b0:b04:9ad9:5b29 with SMTP id
 a640c23a62f3a-b50ac5d1e3bmr2852743666b.54.1760443039715; 
 Tue, 14 Oct 2025 04:57:19 -0700 (PDT)
Received: from ernest.hoecke-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c129c4sm1152162066b.41.2025.10.14.04.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 04:57:19 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:57:18 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/imx: parallel-display: convert to
 devm_drm_bridge_alloc() API
Message-ID: <hr4htgladsaixbuhz6un45syyynzxl6qpshsss3cbeww6mnj7y@jbqwfnzbufqs>
References: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
 <20251014-drm-bridge-alloc-imx-ipuv3-v1-1-a1bb1dcbff50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-1-a1bb1dcbff50@bootlin.com>
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

On Tue, Oct 14, 2025 at 01:30:51PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This conversion was missed during the initial conversion of all bridges to
> the new API. Thus all kernels with commit 94d50c1a2ca3 ("drm/bridge:
> get/put the bridge reference in drm_bridge_attach/detach()") and using this
> driver now warn due to drm_bridge_attach() incrementing the refcount, which
> is not initialized without using devm_drm_bridge_alloc() for allocation.
> 
> To make the conversion simple and straightforward without messing up with
> the drmm_simple_encoder_alloc(), move the struct drm_bridge from struct
> imx_parallel_display_encoder to struct imx_parallel_display.
> 
> Also remove the 'struct imx_parallel_display *pd' from struct
> imx_parallel_display_encoder, not needed anymore.
> 
> Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
> Reported-by: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
> Closes: https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applying fixed all the WARNING regressions I saw before, thanks!

Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Kind regards,
Ernest
