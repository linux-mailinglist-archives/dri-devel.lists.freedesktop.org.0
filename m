Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8899BDE14
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 05:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9718010E0B8;
	Wed,  6 Nov 2024 04:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hJJeS0n7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8036610E0B8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 04:56:35 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6e35bf59cf6so5100947b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 20:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730868994; x=1731473794; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d5qvQbf3xPfusXeRD6I1cDYnZ2oSjvAwRrc5MI/rpTs=;
 b=hJJeS0n7yaVh7bx7pg0wVmpsbd3TfKkgSGcEiIWh+BZHJuMQSQlcqo/EJ0H7XNpFCY
 AEFg2Cw2vlWXqQ+LJa7aButeiTCWRF68IIp/in6Q+ziIX2Eb3xY6ut5y+T8qFBDaGz21
 1gOU/8Jw6bvYAr5vU8Qr6plWvIMf1UbrBAsOZVoINcNmHa5KWiJDBmJEFmAbF5JLgxVB
 Cgy4vTTZpixJH4ncj0sE4zgRoHvZAzJWU9CEIoiqFx4MthJlSRm9+jvn2FTdh2Y4SjKK
 vBiRo0R9nQD9JZ0LEmxCqUYB8IGvq4n6j5SMy1hnvZx0iDWora/If92ptihDjQ6d1Rx1
 oAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730868994; x=1731473794;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5qvQbf3xPfusXeRD6I1cDYnZ2oSjvAwRrc5MI/rpTs=;
 b=VCQD7XzOY0H9IdEKoGnMvWRyoKyGk3eC3ZUXiDvMECSB8CpTuUTksK3WpNAb8mF5Jn
 STkErCETVed/BT4Y9StH5UEXTK4pjd9igOhAKoJHmFnZAktqMUzat5+xli19CGMp9biq
 1ow8o46SGE1H42jpw9Bkq5vcSJb4VBMb1WI5bWlQFY18Yuym+yyth4BQN7f8Jl+0foZU
 fZmCKhW1jpzfeOIaZ48SqAL8oR8IuqWS/TqCqzeaRI9fI+xnUK+6jr4M1iMy1LXNTa+7
 e8oD2HDxRCXwfPrIf/zWFdicsr3dvwj3kkHD5HwiiZ2uTPDMrp7ydl7GEHGCQ31XjhzL
 uUHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUExh8oh3+t6fc82ArgnQB8mdwhatGv3ciHOhWr4bv46X2verOv8zp+AHcYavco3zYaRP56lM8xFoE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgwz5sPmi6H1W2UBBXPfT2/LYxhcSsqUYTCyO7sxm2FPg441zp
 LusQcDsCjdNeBQFHqT+7A195556RYCoL/xp8Ia/+xZSJQgaMgSeVLprEW8OMnnTC2cyaeGkSzYl
 xj0M7EYDvzQmWL4dTmG74zNHsGzA=
X-Google-Smtp-Source: AGHT+IHDQewC/9UHNPuTm3N6V8SZny5GWJevf4+pGonbGA8tZKTmQUMHHTlebD4R05O7PzVo55lexmdMVhWHGpUx9Mc=
X-Received: by 2002:a05:690c:7006:b0:6db:dee9:f6fb with SMTP id
 00721157ae682-6eabeecea81mr8473477b3.11.1730868994542; Tue, 05 Nov 2024
 20:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20241105055239.1577275-1-kikuchan98@gmail.com>
 <20241105055239.1577275-2-kikuchan98@gmail.com>
 <20241105141900.GA3110982-robh@kernel.org>
 <20241105-maybe-chamomile-7505214f737e@spud>
In-Reply-To: <20241105-maybe-chamomile-7505214f737e@spud>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Wed, 6 Nov 2024 13:56:25 +0900
Message-ID: <CAG40kxGhaY_i9_zX_tM4MtCGwUUC2hwpJBAT7XF4Oe6STzA1hw@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: panel: Rename rg35xx-plus-panel
 back to WL-355608-A8
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Walklin <ryan@testtoast.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000929907062637572b"
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

--000000000000929907062637572b
Content-Type: text/plain; charset="UTF-8"

Ok, Thank you guys.

Could you help me how to name the new panel YLM-LBV0345001H-V2 for the
recent RG35XX Plus please?
- Use `anbernic,rg35xx-plus-panel-v2`
- Use `anbernic,rg35xx-plus-panel-new`
- Use `anbernic,ylm-lbv0345001h-v2`
- Share `anbernic,rg35xx-plus-panel`

For the last option, I need to use another GPIO to detecting a panel within
a driver, but I it isn't robust (depends on the board and circuits).

Also, there is another panel YLM-LBV0400001X-V1 for RG40XX H/V:
- `anbernic,rg40xx-panel`
- `anbernic,ylm-lbv0400001x-v1`

Any suggestion?

Regards,
kikuchan

--000000000000929907062637572b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, Thank you guys.<br><br>Could you help me how to name t=
he new panel YLM-LBV0345001H-V2 for the recent RG35XX Plus please?<br>- Use=
 `anbernic,rg35xx-plus-panel-v2`<br>- Use `anbernic,rg35xx-plus-panel-new`<=
br>- Use `anbernic,ylm-lbv0345001h-v2`<br>- Share `anbernic,rg35xx-plus-pan=
el`<br><br>For the last option, I need to use another GPIO to detecting a p=
anel within a driver, but I it isn&#39;t robust (depends on the board and c=
ircuits).<br><br>Also, there is another panel YLM-LBV0400001X-V1 for RG40XX=
 H/V:<br>- `anbernic,rg40xx-panel`<br>- `anbernic,ylm-lbv0400001x-v1`<br><b=
r>Any suggestion?<br><br>Regards,<br>kikuchan</div>

--000000000000929907062637572b--
