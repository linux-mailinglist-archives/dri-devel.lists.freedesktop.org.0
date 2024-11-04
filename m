Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B49BB439
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 13:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EA910E3DF;
	Mon,  4 Nov 2024 12:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SjLppf90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B456010E3DE;
 Mon,  4 Nov 2024 12:09:59 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so663703766b.1; 
 Mon, 04 Nov 2024 04:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730722198; x=1731326998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aEHlPRrC4NOUdPPFxjLWKRbXGK7QkMpo0vxXSBf3dw=;
 b=SjLppf90QWRaR4Rxm6MIXpC5yseDBnVL4gttBmhc4Ub3+KnQQHx8bG1cRGQ4Ypc7YL
 zjpelf4FdhIW/gsnPnfbosLfepRkjXOQzm0gzvvintfUYt7QeM5qXdfRBLCZkU4spQAY
 RlQ6g13xOKNIn9X5o/9mJEOSc20aNz743e00MhVk0WwE6fY+RCLMI2AeBoPUkAO8PYee
 7Nu4C5b44CgMxV3W1njTV60/k8NZUeNSkYGPtLbxAvOCcu7hVvjePK4cLJscS6OI7bJw
 VuoUhgGWN7vL0uKkbHJ5VDsNrKxPUKwNUVvdyHkpBTWpEm6QG/U2OBb/qXXpTOpC4swn
 ASFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730722198; x=1731326998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7aEHlPRrC4NOUdPPFxjLWKRbXGK7QkMpo0vxXSBf3dw=;
 b=Inr5gZ7Aow7+hU5+UD53PcEsnvPqNkQLRX7XivUdFsUlS/aUPGdIUhYWfLo6MS0h/v
 /Vs/zOntTPBMssZPMUaQfDFZQIEOK3Rqb9CJO1Q2EdtPq+D6Qh8ltJ4VC8UOQ+2X2wg4
 +toal+zlvW9iWf5IwR187GfKtf8/R63JIWeBEoTfDG+QUhYS3wVTruFVX2bOS8BbCHDd
 kZ15sy3fjzVuAinugXeRPSlQ8r5L4vxp5xcqjNefYgVXBWIpQZxTvZ1BqG6Ii7cS2+E7
 KcI6VWfVxQtlJEHVBwXvTQVCv/EAIrfGxnc+z2w4J4UBnoKBMwe7Ofxh9p+mn0gTF04h
 S80w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX60lUgZBbXo/jBDu1ld4aMd07yFsg7EIcHXfYn5+Rb4BgnetPpa3NFB+o7HKKXlMhStSGTlwUhZ3pH@lists.freedesktop.org,
 AJvYcCXCGjQpmFhm7KG0M4+uTBRiT5k80GBHbkUiAvSURaUUD+jHWuoNsM5oakqlmwtrOmDs9QxWDRZWJpc=@lists.freedesktop.org,
 AJvYcCXinCB77ZSGMwLwtuQO4GI4Qrc3pdZyIhUejV3oKIwX81+HkmcHvSHeqR/CulxXjHeTJ/fb3LZ6QvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0u5bk8PKH9kUBYNgtDQNbN8citeHU99oWNV0ERWdUXkigJI4f
 Q57wbIsClUsiR8tG/oWxYPSXfDGLpiSqm/WjiKoUmklMzFZneSclrRE97XnegnBr+JPhayblrk/
 DyVXo4V08FbA5Y7wJuWpe7EKQnP4kLUAE1Ew=
X-Google-Smtp-Source: AGHT+IEGMIh4+c4YieOvHOR42Mov1UsihiQ3LsJ7TD25F5Pb01l8fHd5tbR8/l7Kzokrt89RSrjZfi57fW5XXOgI0Rs=
X-Received: by 2002:a17:907:724d:b0:a9a:bbcc:5092 with SMTP id
 a640c23a62f3a-a9e50978806mr951428566b.39.1730722197690; Mon, 04 Nov 2024
 04:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20241017075725.207384-1-giedriuswork@gmail.com>
In-Reply-To: <20241017075725.207384-1-giedriuswork@gmail.com>
From: =?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
Date: Mon, 4 Nov 2024 14:09:46 +0200
Message-ID: <CALt+6nqxMZjuZuOKaj8Cx4dcNZx0n-0F9aa97d-vZoMWeN=bOw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/lspcon: do not hardcode settle timeout
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello,

Kind ping.


On Thu, 17 Oct 2024 at 10:57, Giedrius Statkevi=C4=8Dius
<giedriuswork@gmail.com> wrote:
>
> Avoid hardcoding the LSPCON settle timeout because it takes a longer
> time on certain chips made by certain vendors. Use the function that
> already exists to determine the timeout.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
