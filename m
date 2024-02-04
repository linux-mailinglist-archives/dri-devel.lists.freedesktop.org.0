Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48B848C6F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 10:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE1010F5E4;
	Sun,  4 Feb 2024 09:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xLdkWkOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8332F10F5E4
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 09:24:58 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc6d5267cceso3102433276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Feb 2024 01:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707038697; x=1707643497; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2b+xr5BMCprvoEPQzNmAjEYtPrTUzef8KsERa7FbL7o=;
 b=xLdkWkOjFldvuR3tjMvSm/APvv5X5a96cvNmnCvlHewK1Zvul/sNODZNWb5kj/geQw
 oUOdp7sEqXSbrRmT1clYwAQfOjrvcexOqIUZNQN4TiILyXZ+1uVf9bShJtKwpJmvNihL
 2uEfyaBaztuaCj8sEg6f9ME6S1zn+XU2F9YmyP4+rqyNfW5TCnWGz3zjijLIql8PKGFa
 6YhbRNjQOkO2VaNkgHENr6O6jv1kH+UxAPKvoaRLURlsrBd/OR/c40PrwBdGpyiC2Lz3
 MtYrIHs3pBcxEmdu42+JBm7ZdJUXuGosYjkQgc62oQc4z++PjNINVSiOFDSL22LEHRAy
 Nl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707038697; x=1707643497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2b+xr5BMCprvoEPQzNmAjEYtPrTUzef8KsERa7FbL7o=;
 b=RHOn5l3zxXNBkfht7QPhhT7YXbMSKsbz9/0batnPRtlpRmUrzKYqgXqany8Gh2aZ25
 YoGNI73fDEo/uc+taaIyIFTyur+V6m36RU5Kne+lrDtAIDPg9GtZ06rYajThGNoIi4Z+
 xS6iKT4LMqM3mwd6YuxdWLnoU1Tukd2wtR09C81td/hFoIn8utQz8zmadEthA3OiH/HU
 kdJmCBNwXWU+tLgVBQkhGvA6F1FlwFh2UpXSQz+rI0UR8E+uUuBny/H30/2j1lucxfs2
 CJ/0iuxd4D4VFpwSLkPfeWT8paRfv5raX5f7GLfWp0UtlvwHDoXMroivaa9MYS5jOsEj
 7VEg==
X-Gm-Message-State: AOJu0Yx5tgt/6mO8IfGFR4BLFuS8npJn1x+NeRxjELXj5Vt/aUnv9xAH
 DBYiiy31xHsxo3FebxXvYYmvVUc2Qrm0x7iKwXZKQl52JRt+V0gUoCsLs6OgU8SIwZFtPKLSnTz
 GSXuMf0amAAqgmJJ7lnje/lRJBkWIpZmUrLCVCQ==
X-Google-Smtp-Source: AGHT+IFrkRQIUKey6pKfK37oaP++0arXgCXewd6slpJVINjoeblGZW7FplqrnL3LLdE/WzwioriNr+me01+K3r66Xcg=
X-Received: by 2002:a05:6902:248b:b0:dc6:fff9:dd7e with SMTP id
 ds11-20020a056902248b00b00dc6fff9dd7emr2742938ybb.60.1707038697653; Sun, 04
 Feb 2024 01:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20240203-bus_cleanup-gpu-v1-0-1b6ecdb5f941@marliere.net>
 <20240203-bus_cleanup-gpu-v1-1-1b6ecdb5f941@marliere.net>
In-Reply-To: <20240203-bus_cleanup-gpu-v1-1-1b6ecdb5f941@marliere.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Feb 2024 10:24:46 +0100
Message-ID: <CAA8EJpqYH3CM8exv68S7KU-CK5r=jM81UPjiW09qOiqrg1ThKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: display: make dp_aux_bus_type const
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 3 Feb 2024 at 22:20, Ricardo B. Marliere <ricardo@marliere.net> wrote:
>
> Now that the driver core can properly handle constant struct bus_type,
> move the dp_aux_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
