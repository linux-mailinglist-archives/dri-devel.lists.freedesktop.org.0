Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B708CA3C7
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 23:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4BD10E7B3;
	Mon, 20 May 2024 21:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fE6QWMEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE93C10E7B3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 21:20:19 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2e73359b8fbso8591251fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 14:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716240018; x=1716844818; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3OnVUqe8WIOEFDqCc+0DCZdCPjLUoGnkXveHx6yIHnM=;
 b=fE6QWMEnxhaZFtPC3QOs2tyqotxev1sMlNgJ1IDyZ5NCUMpCUDM9sKLBp1utOXsOHY
 EOMYuBiUo2QzF6r9Rk/3+fiPDWuMu2pUYmTF38xzVCUs+vkGHiRpKFpwSyLaexQQ1tVr
 wPBolGCn7c7ER2/S/0Bb/Ph/v5nEcHQf3yXyHnUsKdT1p6mG5v3AJlFUaNS7xIijIjmH
 K82gjAHNtKkOv85Ivaew8s4NA7BtdeTm4npr5LM9bmHdnxRPLOxNkhKNXz6Gjdqk9d/g
 CenwsuvRDpgdQecwjwuAjiOZkvlHY4+259MDUbFl04F4aPg1TmaGlu7jHkARj+lmIak3
 2hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716240018; x=1716844818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3OnVUqe8WIOEFDqCc+0DCZdCPjLUoGnkXveHx6yIHnM=;
 b=us1O2MSVdU2erNhROEiFNTK0C48qeNa7b5VEdqUM2W9KaInmpv1z7Vp5d50dTgW1LX
 ycANCZ0u4HazKHWxSogjGkPRzItGQIDUZjf3a8Bar7wvoEEHMueuyqmXJDbqhv0Cyfsg
 5RzfHLDXV81yADYZHSXkxvCyag/LrjxeY/8fvYX7xIHKh4FBjdmR+uyrJdg9M7/sgKEB
 a8gKB54oRuXMQirM4JNeBQ6u41/3VyiKx9hE+DdiPAvjO6w8qPVEvY8VP5qDKahHBf8X
 bSPI3wVs64mUKswxlxQQe6X93K8Qwl50VZyyE854rOtT7LNCW0kJptSrBShp3hwlrn//
 HKgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOz6DpCQxJn8ZBOtof2GKxkB+0dGP27CP6THfrU0jWL6rCas4hfEzh4cCeGE1e8M9vVN97/8EMwQ3OYc+KuGjLsZwkbKBAtvJzPsp3gs5A
X-Gm-Message-State: AOJu0YzsC4dphbKH5+yDRGg7EGmkHOXhxf2IA3gy65GvZZes9H7CDVmj
 HutQPY8i+5Eozs9q5Zqxj4lofTn5LCR6FOOIZoyVpPcHONTBNLXfaHCUWc5+yx1HQVcFDs4WLVC
 S
X-Google-Smtp-Source: AGHT+IH8++U4qMlcx4n1na7YaGa/qdPYn/zbKCk2mmxyuC1CZNaV7VzAUp8FuYGfDxIdDohPt4CTqw==
X-Received: by 2002:a05:6512:3e01:b0:515:d1a6:1b07 with SMTP id
 2adb3069b0e04-5220fc7bdc8mr36914963e87.15.1716240017912; 
 Mon, 20 May 2024 14:20:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-523765da43dsm2473464e87.121.2024.05.20.14.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 14:20:17 -0700 (PDT)
Date: Tue, 21 May 2024 00:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <g4nwb5cgcg2wff4qogzayhdrj3omneeusfjqmdupghy6zlji5m@kp55dmkbj6k3>
References: <20240520125551.11534-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520125551.11534-1-linux@treblig.org>
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

On Mon, May 20, 2024 at 01:55:51PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> has dropped all the users of the struct bridge_init from the
> exynos_dp_core, while retaining unused structure definition.
> Later on the driver was reworked and the definition migrated
> to the analogix_dp driver. Remove unused struct bridge_init definition.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
