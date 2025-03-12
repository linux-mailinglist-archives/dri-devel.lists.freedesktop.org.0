Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7095A5E880
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 00:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9F910E343;
	Wed, 12 Mar 2025 23:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kn53lUeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E1F10E343
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 23:40:32 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5e5cd420781so629084a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 16:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741822830; x=1742427630;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jas8knot96toCrbIGWSDIcYpL+AdR9dGKrMNFDxG4LI=;
 b=kn53lUeZVfJcfoA4TkcCTqXpoBaDVJOoSDav1NIEHfhWtsqcQKQC907dVZN9CuAUAL
 CFe6ZQGYbw9L5PoBCIjo7vq1Rdppcy95fKIMx2Dqq4tuSEV6HcazaBSbbs9IzBy9V6L3
 PzSpbrVnwtCwFC40tBlNAqhtMDmVu0qYuJ6L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741822830; x=1742427630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jas8knot96toCrbIGWSDIcYpL+AdR9dGKrMNFDxG4LI=;
 b=Fa8YYwiRJqAq3eFi/QJiQqrZBrw3yKeszIkbqAbywP9sJQW2KvBcAjIjPJTcEImzza
 1X7pM61OfJaAjQKB/8USzMaQuJA6NGRvRvyAYUwgDRwkuW6gAzh/6FZOmyy27BjZaf5Z
 ztZNs87oOJSug4VJFdI/L3aPSPyU/Klg4Aft3a0qekMC6PWmcYNztDc0D685x+QrZpmA
 CxfbEG2bh2iu12Edd3Yh9NLjIaSiWeq1+2FgPXIMIUkv979bY5e/whylEbGYI0nk/5M2
 i6OEhsLvSSOH3TI6vm5NwL9CvDXMqFYiMr9E9kO31yD4oK0RowMmEzH52UaSrR0ju/Zk
 kmdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk9cbYhPpBXuSlmlqAyATcC1PcW+KaiD0dANjF5WyCiKQ/MjZ2o5lxUYtBFEw4L08tmHkn7z4nAH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa4M78nkY1WNY17eEocJK2SqH70V12jNfYan8K+l37kY8ap75r
 OX9xLlVdWWatBqH5TXF2tqV9HHbyGQG9l8n1B/mmvA3T0m83uQvcrnVcYTPlJb9L691H2a6TmKx
 D91p6
X-Gm-Gg: ASbGncuWHpfnquI1pcOQisDXgcwdeMzw9wF4n+tpb9kbaFQ0O/95YYEw+28TE1gRsCT
 tdXGVKbOUv95Q2xb9yOrzZaphud6gLELS9mnGfQeyP9gylrsoQV9ZsHdb22TAcMys2tFU4y93GO
 SZ7YWZ1z4pAmY+iDxTYoHhvRRer7+pO1lxmnAAmASivce5EgOjXkfTj1lWqykd8bFW+Q1c3qcWH
 vdomyI5DwMhGQX3zN2BxuRZY/c5riiTmI3dRq/BH1ukBiZ6HhT091oczhWNANEQ00eo9pkjf53s
 AdbZkorY6aWfpiM1RCuR+2bczr9vPHwaGsTRJ8uyi1fswOTkGq3r3Fhr6FBuU+km/qrhXwsbF8g
 X9MnGlSvl
X-Google-Smtp-Source: AGHT+IFg/GdUSx5IvMeA6JAcyIpff3QF7hcTcX9rXEpzfrHTXuUetYmEpM9bQ1y23tfuOWOHYrMzaQ==
X-Received: by 2002:a17:907:1c1f:b0:ac1:e53c:d13f with SMTP id
 a640c23a62f3a-ac252ff844dmr3172699666b.50.1741822830398; 
 Wed, 12 Mar 2025 16:40:30 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f0cd3sm6049466b.70.2025.03.12.16.40.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 16:40:30 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so591847a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 16:40:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSi6bUaGqYuajztMkoIofX/l0p3k7HQDIDcKZlvhF0AoDEG9OMY09XE9xhiYxuxdObEZd0XMHcmYg=@lists.freedesktop.org
X-Received: by 2002:a19:641c:0:b0:549:916b:e665 with SMTP id
 2adb3069b0e04-549916be6d9mr5425219e87.1.1741822523482; Wed, 12 Mar 2025
 16:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250312090132.1624445-1-nichen@iscas.ac.cn>
In-Reply-To: <20250312090132.1624445-1-nichen@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Mar 2025 16:35:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9eOSWxuR02WenYxD-rTLdTAxpdo9b2fjbpU=hA4nP4g@mail.gmail.com>
X-Gm-Features: AQ5f1JqpW1Y2ec186etHxO7OaCmaGkbtJ2Rci2hirhhSerJiADteqbCBM3klWQY
Message-ID: <CAD=FV=X9eOSWxuR02WenYxD-rTLdTAxpdo9b2fjbpU=hA4nP4g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Remove redundant 'flush_workqueue()'
 calls
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, yuanhsinte@chromium.org, 
 jani.nikula@intel.com, xji@analogixsemi.com, robh@kernel.org, 
 sui.jingfeng@linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Wed, Mar 12, 2025 at 2:02=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> This was generated with coccinelle:
>
> @@
> expression E;
> @@
> - flush_workqueue(E);
>   destroy_workqueue(E);
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
