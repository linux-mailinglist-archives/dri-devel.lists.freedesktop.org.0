Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A2B40BFF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 19:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFC310E7FD;
	Tue,  2 Sep 2025 17:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aK1aXbeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD3A10E7FD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 17:27:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b4ee87cc81eso2595945a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1756834022; x=1757438822;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+vzI8/XRAisFFEKfXyULKg1mw6j6BVTtSv7WOtjwOo=;
 b=aK1aXbeog3Gy32ev52VPoKqHEwjB5llDh0xUL3984UtEjkl6IDdFRP5Dz0Q/afFKpW
 fclaOuiARA6UMlu7tzS8ihk0I5mLgyYSrbvVhrSAt4mTbHQolVsgdTt3mcY4Bk7HgmOn
 e5X9Jaq3qob+F6cJ/D8BDlbQwsy8I8f8au94c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756834022; x=1757438822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+vzI8/XRAisFFEKfXyULKg1mw6j6BVTtSv7WOtjwOo=;
 b=r1/wCIAuFSd+GQTdUrqd4fX5CTYWFcb0cBmIH/1P7Fnp//5tbp0oYCfc6M1HF9i+N5
 gnva2/tIrPPVB1WvCCQv53BOuJGhAzcj1Ai6lsZhA3tUBn/HcpqPTIm0C16tHO6bDXBq
 ybqAg/zTYGTbgDDhZnZdwGGWKZhFbiYjCNKJVRToXMtWKKMSK2e8bSulpnQNVljdQOko
 4kCFcgwBDAVWyGQ8GwZ0NvWESBA1yCJHKa7xD9wFJbJs/54CDZaWzRMK7dydxe8GbQfs
 pCkVwd2XfH2JIrGC00S1V1JMYuykjU5Im9fegc+N8eB5j8RTwuDCJsfWodmn/FFJnuVV
 0E6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4QHi0AgYFcAIGatr7Sg0MOe9X5KkA575ErKcyqMHYBnDV33qvGPlovZGTC18qeRYoGE7iBDAHrgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8uYuVZd55IlCe/zTkZOUAThiwys1c5jDZZc5TDm4aa2c1OfTr
 LkwfWTzB8jNOMS2pJCVuA49GJRq9kn174Q97dG5mXZTNqX4r9ejTw9STM+N/YgP7DzZTis8Oubw
 gO/4=
X-Gm-Gg: ASbGncutTeuFeHMNr7o/9bbdWwoYZgGh12q9OLSBvAInBbXZOkcUXQnyNamqskga2NS
 wDm5ypeRwAElFoFoGUrCj/pc/G7cyi3WpSGcC1pDNQpWb7zjchCEsoayCUHhP+auUG1C3eZP3Q2
 kirml6upz2dZAOs3YtZ0ZLqKrFcR201EOCBRgbfzp2nzNcUxB+35htP+Qm3Nj1RbMNi3vuwNnCI
 nQCtUlmdQkYsJGhidlqcJ+L/naXdmGesNfM6OVyBEINB5cIf249ykwhtWhkd4SDLSrso5ofgwlY
 BcrUX9+CP3W16DtMO0Au+ZV0nRdVwewyvJ+xiPUq89sDx7dfIcltduc/7bE+VmpGy1Gve3pDZrC
 Ld4tzHObqSBaryQETtBuJUHW+v8mJJgOFOMpdsIYVOL3EsWOCDkxZKjbgZwP7ajdwstiMytsRF5
 Vs
X-Google-Smtp-Source: AGHT+IGbDF+Cf3lXhtcmmfCEms/9NFf9XgRlGsRG+g6xDGBdPIQje0j5WlnkfuwKdlKe2tH1LexIqQ==
X-Received: by 2002:a17:902:f546:b0:24a:b0cf:5f97 with SMTP id
 d9443c01a7336-24ab0cf62acmr127054525ad.40.1756834022277; 
 Tue, 02 Sep 2025 10:27:02 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24906594319sm135134485ad.114.2025.09.02.10.27.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 10:27:01 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b4d5886f825so3384634a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:27:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV3djRf1v6oNSw2xtwsQrKrVaIpejJzpqT0jToIk5RLKjsKwR7ABJffQBVyDSdeliAMAFG8RhHJpSc=@lists.freedesktop.org
X-Received: by 2002:a17:903:19e3:b0:245:f002:d67c with SMTP id
 d9443c01a7336-24944b19dbemr145156225ad.30.1756834020690; Tue, 02 Sep 2025
 10:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VfCWFViDE1a5-_KtH0Pfo2EnCJeo2k8MaWuRHhmMPMMA@mail.gmail.com>
 <20250902162246.4143785-1-john.ripple@keysight.com>
In-Reply-To: <20250902162246.4143785-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Sep 2025 10:26:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XyM0WHB8kpirqfnV2CY2KTrHd14pi5qeS+Sq7mjPphsA@mail.gmail.com>
X-Gm-Features: Ac12FXzoK6a2pOM7UM9T1UG-G9CD1NZjmPlNlNUAg32e3wNBEbg9ufNPfoYnvbs
Message-ID: <CAD=FV=XyM0WHB8kpirqfnV2CY2KTrHd14pi5qeS+Sq7mjPphsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: break probe dependency loop
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org, 
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de
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

On Tue, Sep 2, 2025 at 9:23=E2=80=AFAM John Ripple <john.ripple@keysight.co=
m> wrote:
>
> Hi,
>
> >Which i2c bridge are you talking about? You mean the one created by
> >i2c_add_adapter() in drm_dp_aux_register()? I guess I'm confused about
> >why the DSI probe routine would even be looking for that adapter.
>
> The i2c bridge I was seeing was created by the drm_bridge_add() function
> in the ti_sn_bridge_probe() function. Without moving the ti_sn_attach_hos=
t()
> function out of the ti_sn_bridge_probe() function I kept getting stuck in=
 a
> loop during boot where the bridge would never come up. It's possible this
> could be a unique interaction with the hardware I'm using and the nwl-dsi
> driver.

Sorry, I still don't really know what i2c bridge you're talking about
here. At this point there are a number of different MIPI hosts that
are using ti-sn65dsi86 and they don't seem to run into this, so
probably digging into your MIPI host to see exactly what it's doing
makes sense. Where exactly is the nwl-dsi driver trying to acquire
this bridge and failing?


> >In any case, I don't _think_ your patch is valid. Specifically, if you
> >notice ti_sn_attach_host() can return "-EPROBE_DEFER". That's a valid
> >error code to return from a probe routine but I don't think it's a
> >valid error code to return from a bridge attach function, is it?
>
> What error code would you suggest?

You can't just change the error code. The problem here is that, in
general, there is no guarantee of the order that devices are probed in
Linux. The general solution for this in Linux is for drivers to find
all the devices that they depend on during their probe routine. If any
are missing then they return -EPROBE_DEFER and the system will try
again once more things are loaded. In the case of ti-sn65dsi86 we need
the MIPI host device so we find it at probe time. If it's not there
then we want to try again later.

The whole "try again" logic for -EPROBE_DEFER is only guaranteed in
certain contexts. Generally it's reserved for probe. ...but that logic
_could_ be extended to other contexts. It's possible it could be
extended to bridge attach, but one would have to make sure it actually
is (I haven't checked) and, as Maxime says, it should be documented.

I suppose it's also possible that when ti_sn_bridge_attach() is
called, it's guaranteed that of_find_mipi_dsi_host_by_node() won't
return NULL. If you can prove this by looking through the DRM code
_then_ you could probably make your change and just change the error
code.


To sum it up

1. Ideally you can fix the nwl-dsi driver to work however everyone
else is working.

2. If you can't then your commit message needs to prove that it's safe
to move the code to the "attach" routine. You either need to prove
that it's guaranteed that of_find_mipi_dsi_host_by_node() won't return
NULL when called from ti_sn_bridge_attach() or you need to prove that
returning -EPROBE_DEFER in this case is safe.

3. In either case, updating the docs that Maxime pointed to would be useful=
.


-Doug
