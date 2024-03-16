Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB387DB22
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 18:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AE010F2DC;
	Sat, 16 Mar 2024 17:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZL+gXX/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E310F2DC
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 17:45:11 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso2670367276.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 10:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710611110; x=1711215910; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GJNewuV/RCfXY7Ye9IxwUjaXSFdbrW2OP2WL5QHwl/E=;
 b=ZL+gXX/WG6IMa4bKIOiEVZmsnYbz3DtOxzqvSvuUuswenYN851Y2+Y4R0PgHhnUDyJ
 KhV/ykq5/gup3+dFCAaM8fAqCJY6nP8YM1rB6FW7q2Vb0fgR5YcWRjaTJP3azaN1ndmN
 aXczdJ6/gDN/+Q9DEKNd/QC0mY1jF5f2MsNaP3cXuMYW5M1Di4rzO5NeJhQhU/YmljvL
 sJUfDn2sp99hsinwObykrAY5JtcWccz0D2uNpUKF8Hd6zZBKuo/vtuI+Qsr7zDsPQ0Ak
 tjqDcOmBQiOIFMYqDLtKIUps5uuMCFEIWGgj4zne6rn1WCLAc99029wRpDM636O7xhWG
 83Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710611110; x=1711215910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GJNewuV/RCfXY7Ye9IxwUjaXSFdbrW2OP2WL5QHwl/E=;
 b=dvlE/nZzY1bVftw3aJmLQhsagM5apUMH+Cf4mLW3/a7RVIW6qrFNNgsLIj29xEZ5YH
 eXv9tA/E9J4RiPgrOR8qtLUQfx2RYJAGcIBi+vIqz9DMnMEJePylE21HJkEPh+ITKLqH
 oURATfsOV7rN7EUpg05W18hSBKyQdkubetbvCjqVCRNhnIAUDFDzgM3qN0fY/Z2i7R8A
 4OGFmEGCrDSLiRh+Yb/3PD5sM0/3Hl1FxJQMXqY1MX70bjQGx2wfiBfFuoq7lg3GXn68
 KQ34L/es0D28BVbVTEbMQtPgkEB2ClyE6i0bDlBRMHo5goWn14ov1lqRxQwnQafCF8kP
 fnwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlxMQuThaQAA7hmP+Ka0x4fN6sjvQVuiN8pbr2nr3d2B7NhjvVHO1otqrTTGim4wkbPjPm3KHuWuEUuTeV/3PRoNN+pVZtfCnN5TQDTBFN
X-Gm-Message-State: AOJu0YwaDsMi7T+Xd13nt3uvtLnW0XVUSRhZbHWJApb7EOAH27fKH0kP
 dKe++Yxc/B6KdZT9/jNJ3RgWgB4Nl0OtmFwSe492XTFkCFzWRJmpHgYWMnvy88G3SjZoVN0yzPE
 yfqhZS1SdWlquyHkbEDOEpTPbokVj5Te0CfM50Q==
X-Google-Smtp-Source: AGHT+IFSqFJCubpH074e+FG4hgh5Ds4kjHPAh6KmyJr9q6e1FJXtc5mgxa74Seojj8WaamTfrsqxnGpW2QsAGZe3tw0=
X-Received: by 2002:a5b:402:0:b0:dc6:aeba:5aaf with SMTP id
 m2-20020a5b0402000000b00dc6aeba5aafmr4918450ybp.19.1710611110284; Sat, 16 Mar
 2024 10:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240316170513.1159724-1-sui.jingfeng@linux.dev>
In-Reply-To: <20240316170513.1159724-1-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Mar 2024 19:44:58 +0200
Message-ID: <CAA8EJppMRKtVRXhZ+QWQbxgS3F2tdeUNnb-d-iFUUp3EnH2xBg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: Switch to of_graph_get_remote_node()
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Sat, 16 Mar 2024 at 19:05, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> To reduce boilerplate, use of_graph_get_remote_node() helper instead of
> the hand-rolling code.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 31 +++--------------------
>  1 file changed, 4 insertions(+), 27 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
