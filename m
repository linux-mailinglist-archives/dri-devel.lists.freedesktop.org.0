Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04647A0853F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 03:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5334010EF72;
	Fri, 10 Jan 2025 02:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ymScgQ4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF5E10EF72
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:14:40 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so1692079e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 18:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736475219; x=1737080019; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t8KPjbyifDvDKbKMYEfAkENYg9SQ3/Y9IcyMqzOO7K0=;
 b=ymScgQ4FRw85easgIQut3DwYbPx9QJvo1sqFgGVmjef+MWF4TJ1hooc9DXrAJaSs3t
 wv8EJCy5TArapMXU2iYusQyuxswt+Q/LKXQnGVjU05OJH2Jb3AJPbsr+p+uz/w+/IOxj
 8Sso9P1IakCa7qrsI3Hh1315mq+GYR+IqXMapB+w/cTf4H6sR5RG+K5JQ+tLnoVMxSiK
 VeonQcHUKuJzO/AZCD/2CEIQcWOGoQzuCi6z5I+jfSU6Xa0tpbMzz+zAserl6IZt1Mko
 xkJ73Fi+5NN+cF8lSjomGwrnromxOxKog76CKE8LDIMcXTSuUzvisv8jo5VxbehHAx8b
 vnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736475219; x=1737080019;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t8KPjbyifDvDKbKMYEfAkENYg9SQ3/Y9IcyMqzOO7K0=;
 b=nBZzvMJ2+YF7j37UKnSWaZFflc4OPZxPOfJGUdnDHg1UF6+vCn4tGm0Wypy/PttuI3
 VN9/q9m9wX7Q1j4DfC+D+mf+bkxrPcneM1Y6FnyM5Vh1J3XY6Uzx7NSZEfoKf9Oy2ImL
 Cuub19ii2OA8Vhr/V7RtMX19PuS9gp1cDWjx6ODsB25Yue5Xj2QmEK1/Dj04Xe7EHlTE
 IMkrzbGY6gC7+xY6o/BseCij8Mt/I6YYWdRS59+2A9oJX1iwV+3K458BPf9ceG+pqKrp
 WH7it5QQsQtQBgVA28dDKH62ZdEIqNOlJCCNOX6Nw3+yJ2vW4p//RpYl6qEnK3ASGkNB
 CeGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpwfn/Tngg2Ssqu7SDJqeOJ+TBlto8yTF5x8cXdfeO6tcKQxQsjwlyhg8LTYB0rrvnFc63m2OsIjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk6qLhIPc6lDZP3ppdhAQPcelCzdDYw889h5PzRDorvDqAq1iU
 44Aelvn6l8tnOxopLjvXC086q4mCq0doSNAUkZaXa36KB5u5XwNCs5Q5avnKt/I=
X-Gm-Gg: ASbGncvoAXQ9O4Ity68R7tkI2Rz/f9SsWIQ3Z5W/BYsCDmN+xxoTkiII/W04FJN8oTc
 ra6bpCEzZ+8wyWi01v0s7Faxl08rXs/nFBBnr1QkKqUXjJCfAkhc6CxpEqlQnDprtZTTKa0+R6u
 8L0K+soYxxAt3Df9RHMbLFyYLiAhnaxmHpqohXgYFhJw2vgkDxwfpCNhyMhY5kcE4pgpNkzQ99q
 CkUFzRiZSn/1ijy7q/GYvC2RqWTIJBCuqItmrBKrJdwsILgXOUIfWqJPxeu9d07UbgD04IiKZs8
 7OAQJ2odYub6Lo8OpqpOuTNJGJzv8mIZYMMn
X-Google-Smtp-Source: AGHT+IHJpq1ke3MZ+3ZV34/mQVln/7Ae9AgP50GplGmUo8NLVGDnk1v0+gf5P8ERr2h7wnT27mdZgA==
X-Received: by 2002:a05:6512:31c9:b0:542:7217:361a with SMTP id
 2adb3069b0e04-542845af299mr2767121e87.10.1736475218708; 
 Thu, 09 Jan 2025 18:13:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0659sm368077e87.185.2025.01.09.18.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 18:13:37 -0800 (PST)
Date: Fri, 10 Jan 2025 04:13:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.Wu@ite.com.tw
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org
Subject: Re: [PATCH v3] drm/bridge: it6505: fix HDCP V match check is not
 performed correctly
Message-ID: <o5g7js2ysodvev2bcmeqndq656qhauu5tgdrkwrwv3go2wf7z4@y3ae3routohb>
References: <20250109-fix-hdcp-v-comp-v3-1-1258edb249ab@ite.com.tw>
 <ofpb7annntdpa7lwdscozaftvmuuat47juwn55x3p2osjsei52@bjitidem3g7d>
 <71b5a3243edc4765a4529d1254d7b7bc@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71b5a3243edc4765a4529d1254d7b7bc@ite.com.tw>
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

On Fri, Jan 10, 2025 at 02:00:35AM +0000, Hermes.Wu@ite.com.tw wrote:
> hi
> 
> 
> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 
> Sent: Thursday, January 9, 2025 9:09 PM
> To: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Pet Weng (翁玉芬) <Pet.Weng@ite.com.tw>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>; treapking@chromium.org
> Subject: Re: [PATCH v3] drm/bridge: it6505: fix HDCP V match check is not performed correctly
> 
> On Thu, Jan 09, 2025 at 02:40:08PM +0800, Hermes Wu via B4 Relay wrote:
> > From: Hermes Wu <Hermes.wu@ite.com.tw>
> > 
> > The loop of V compare is expected to iterate for 5 times which compare 
> > V array form av[0][] to av[4][].
> > It should check loop counter reach the last statement "i == 5"
> > before return true
> > 
> > Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V 
> > matching")
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >Excuse me, where did you get that from?? I didn't r-b it (yet).
> 
> Sorry,
> 
> I think I just missing understanding about this tag.
> I thought it should add if someone give advice to a path.
> 
> So I add it before you r-b it,

Okay. Please don't add extra tags in future.

The patch itself is:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> > Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> > ---
> > Changes in v3:
> > - The V value compare loop from i = 0 to i = 4 and shall exit with i == 5 
> >   if all V element matches
> > - Link to v2: 
> > https://lore.kernel.org/r/20250109-fix-hdcp-v-comp-v2-1-7dce0a59523f@i
> > te.com.tw
> > 
> > Changes in v2:
> > - pull the check of statment "i" out of V value check loop
> > - Link to v1: 
> > https://lore.kernel.org/r/20250108-fix-hdcp-v-comp-v1-1-9404811825cd@i
> > te.com.tw
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> >--
> >With best wishes
> >Dmitry
> 
> Br.
> Hermes

-- 
With best wishes
Dmitry
