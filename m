Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C903E7F638F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 17:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8EC10E071;
	Thu, 23 Nov 2023 16:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE14A10E071
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 16:07:00 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-db4422fff15so514316276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700755620; x=1701360420; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gECdDvL3zdjhM1uOEUZS/mAxmnQq5h/GZkoU/9Sdfs0=;
 b=qLSYrBri8CrAxZtezRqbK+aFhpzuLxLVN7wUAJM39n0o2PUnfmbGt31JL+z28zILrp
 zFJu2A1TR//9AGVaD7PUJzbk0FIPOiMXvwoct1iIe5T+flaV/vYAVJkaM1WKkryI8Izm
 ieZQPnqKQtshjLE254as1i1DG+jnFU+IQQ+o6YeQynOE33M/uATdxBk1WyS5blrm4ubX
 KYV4w4Dhbf7Bs08MC1JIVBF8naZYJmLjIPJBL1/4M29ISbCUBZKOMhJQGMVNZZsSZa8Y
 Q7S5Z5R6BVHtDyRY/uhpwyoI404EIMVMI0D2UPU/7Wy4mAAfqgx8dbNM/ZNWcmj/utVV
 34HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700755620; x=1701360420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gECdDvL3zdjhM1uOEUZS/mAxmnQq5h/GZkoU/9Sdfs0=;
 b=LXg1fvEyQihCbahCINx7KgjSJnj4lm2zzv7+IKUY5Kl/acqQmxbl9F+SJjh7ph5Dk9
 BVlXB3ECOHzDvGj2Hu6HsXvI1svzIxrKtklqVq5JuTii/1esorCh0LAhCDCvAmq4qIEZ
 YlMYDYozkWkQ0R8ltCw98Rq7KGANms9+AE8T9Tl2BaLsUQRzoCPIJS0NucU5D/4IzBrq
 RNulvTDddmYe70nCU9b6nVIKUzB47OIuX6Jjw8RaKoYmbtP9NilAw1kWWneKepnGPFkQ
 jesaaxfkImByZfpS4wnFASREq9cFNLss+kIwhN/GUCur04CuFySLlG/lgCtZJ2GKbRX8
 QV9w==
X-Gm-Message-State: AOJu0YyVtrjOQoTH2ts65DXJQFzX3PnfJ5N22R7I9ovNcgNeY5j2ILEA
 DSoX4XdNwzzrQn+haYZu1oGQJxjySs4DahQW5w4TBQ==
X-Google-Smtp-Source: AGHT+IG6rRchvB3o7IDoWGjkljYi/LHm1aTYwpKg5U+Xqyfaq7bFXS/QLI2PhPRLvXpmv8+CX2s4KbvZozP8qky2+KM=
X-Received: by 2002:a25:9c44:0:b0:db4:25b7:5f8b with SMTP id
 x4-20020a259c44000000b00db425b75f8bmr3554529ybo.63.1700755620065; Thu, 23 Nov
 2023 08:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
 <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
 <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
 <963d7722-738f-4e46-bfb7-131027ca5341@linux.dev>
In-Reply-To: <963d7722-738f-4e46-bfb7-131027ca5341@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Nov 2023 18:06:48 +0200
Message-ID: <CAA8EJpoTWoSYjyZL7ARQiAeWabcXymy6f-tAzPM3YO=C_GOOZw@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Nov 2023 at 17:41, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/23 16:08, Dmitry Baryshkov wrote:
> >> The semantics of DRM_BRIDGE_ATTACH_NO_CONNECTOR flag are implement-defined,
> > No, they are not. Semantics are pretty simple: do not create the
> > drm_connector instance. Pass the flag to the next bridge in the chain.
>
>
> Then, my problem is that do we allow create a drm_connector instance in drm bridge
> driver nowadays?

Yes, if there is no DRM_BRIDGE_ATTACH_NO_CONNECTOR. But that's deprecated IMO.

-- 
With best wishes
Dmitry
