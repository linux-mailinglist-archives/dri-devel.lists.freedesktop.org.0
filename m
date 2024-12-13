Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21FC9F08BB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B42710EF88;
	Fri, 13 Dec 2024 09:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OmN2LB8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B82410EF85
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:56:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so18404925e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734083784; x=1734688584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FYSMFonAtajsalSyV6s6zrr5Tp5ZtyTuddWbfCnVYjA=;
 b=OmN2LB8mIAD0u8RumhoaNQ7rJW6dgqn2a7G0718F6/d7/CzTJpTutPPzXpa97tHd6V
 m7gRZTopO3GI2H4XfD7H9Jap/17nVyw4OOyFD2AueL64KMDtDrW68Z7vydNV7hp8jtGL
 FFy1EQnS8Ymoy2VWm1Lwe1UL1v/CZBfLc4ESiw/fY+JnTDY3p9rdQgBOFlhte7Mb3Pvx
 yiZX29Bl+wN1GKLyL4yrhXnWHW09eY2vwaShBhtghAkdk3ASZFeCdViLRTUe/4dhcVlx
 t21wMLoTjYrZSgCUJLaK/aL1KVL5YdqJiQ22HoQm3NA9z55NmWfcGsJGm4UWo1RguXYL
 ARgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734083784; x=1734688584;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FYSMFonAtajsalSyV6s6zrr5Tp5ZtyTuddWbfCnVYjA=;
 b=Fosi3Ywl9JYsTOt48lXEbGlPpYPJXDA48FTHcy7U2kMNLloyOZ5GtgSeXOdCb3P5BS
 GFmZ742gLRNtiZ7RajosubRgd3Rg/hi/eIYfdZml71Tx8RMRPNUkEFeU+kY3DvJZBvWo
 tKK+hsVH6YybqunxKKcnKqX7jDNRF53QcT+g+rRSwAtssefnSWVRx/Sly+LYUPUYX0WJ
 zyJJLtECGL5KXNaGsaE88XVcQHefHP0+MniDS4LDN4tYZEHArEa8VoHIOyyzjFV9dbfC
 Mk2b9zrbHTavkEVp2oyDPPxMwk6a9UrjXxbbkjLgk+G9Nqof3nn2KQRn+IuORxvPtjcr
 o1+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUcrjmDGvOrEoPtmXOHHNwTzNK/kR+o3aIWkxxbG6VF4JF4nkTr4wQO+EzI05nsbCUv+SFW3ANodg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvHS2Z7Ep83UZxalbryn1FKbJ8fbmGpxSZ+Kwmt2Pz5iL5epQs
 1ngSWP5+26T1Ue2QrZzuxjBBbLUpOLvMwlJ95BzQut2hW0DiLK1zBK4cOHRSoX0=
X-Gm-Gg: ASbGncvMIWP/yIp0nGZy2crZF5EudV6pNDAvD6bin0YONCOtI3CsJESJcuY+ZB5RX03
 zUmRDptkstwpZxRg6rfyitiOgk28yWMBDbBV96cj/XcLV7LbocYbCmgFtumTCN25mlXZGF1s0XY
 KAUQBtqUZHBV8AhS6O2+sunGWz/B+ugNzxmOwfAvJL9v7vh91i6FLc3rJ2IibN8yqRuZd0H49f/
 sO5Y3h0kvVKCbHyng57pfaowwkiXI2dInZg2BQXzpjw6ouVcpM5hlMQuxQ03+bVdtZUQsgo9tBB
 FQ==
X-Google-Smtp-Source: AGHT+IF4q9KTXGC2ijxvIDb1UZYnzpmUqKTg5Up3xtoFrYO7Wu+InKzncW4uk4hdu0lbQIMGdI9WRg==
X-Received: by 2002:a05:600c:1e19:b0:434:a734:d279 with SMTP id
 5b1f17b1804b1-4362aa5005fmr17219605e9.16.1734083784100; 
 Fri, 13 Dec 2024 01:56:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706c77sm43616845e9.34.2024.12.13.01.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 01:56:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
In-Reply-To: <20241205163002.1804784-1-dario.binacchi@amarulasolutions.com>
References: <20241205163002.1804784-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [RESEND PATCH v2] drm/panel: synaptics-r63353: Fix regulator
 unbalance
Message-Id: <173408378262.189325.11770535962921437927.b4-ty@linaro.org>
Date: Fri, 13 Dec 2024 10:56:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Thu, 05 Dec 2024 17:29:58 +0100, Dario Binacchi wrote:
> The shutdown function can be called when the display is already
> unprepared. For example during reboot this trigger a kernel
> backlog. Calling the drm_panel_unprepare, allow us to avoid
> to trigger the kernel warning.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: synaptics-r63353: Fix regulator unbalance
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d2bd3fcb825725a59c8880070b1206b1710922bd

-- 
Neil

