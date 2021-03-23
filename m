Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8393462C4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CA96E85B;
	Tue, 23 Mar 2021 15:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D656E85B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:27:22 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id i22so517012pgl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+q4ajk+mvriJOj6DX/n/ZppGdC7koRzzrZpC32hPb3Q=;
 b=umzKhAGs1TMWIaaMArXgz4HWGd/SlOHR91fZHJqErP1IZAqWCknAXyfkhvQwxr+CFG
 uUeWBmfrmfypfND2jZZwXWZ8VfRDj2gbxvZB9hz52yWYdB+Brv5QUT8jUwm9erPKgGzy
 RZ76bM+1XpE5J6QARiRt1AtJCh4fyTZF9d6mVMqB94sIPYX6eGMHmq/xQYIKkMAjKNZK
 GnZX3oUX+Md3fAWSpfkoLrxkBiVpxvumEWTeSo0QxPFknlF3BMG7S7zOZngEoBSRPhvK
 WN2/jLF3Mi0LI6LMU0sFpi5NLhV6Yk/hIlnQKaULLT2i5BRYgORqCT84wMbigyKf4J8R
 50wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+q4ajk+mvriJOj6DX/n/ZppGdC7koRzzrZpC32hPb3Q=;
 b=aNL0lBdg8XulpItdIqB9svswhl4wTM6kHFkUZ5WNF0r1I8/OFHKO8UnM05yHDGFFzZ
 IRkP8nZ3X5oKT3+IsQhUubdtLhTFtD8UyFn1NBS5JdB2pKSWEI0SWgEetH2ly+bJpPAq
 oe+U/225yG59F+Hg4YRZdHB180qIeY8I2Qn4tS31g9aGMf4nv7vSDgewKB2JYAAdduAc
 E//Sd8c4EYX56OfqJKwb0AmO/nLdvZ/fcAImEsfZSdlH5TvK7i0KsCXjV1GWR5vvGraC
 haFh8t+TL5ype1KefpbAbfwv0o5sV1LiEuyU3UKrfAwnMyaZ0Mw3it2vLhVpyf8OZRU5
 o+Og==
X-Gm-Message-State: AOAM531cyWVC9AokL9lvunVLPXaBPxBpMjKPBiWFumo+rH4KOO0ZyYHs
 XsTZcKmS5v2XinkDXkdjeiHp9JqVNi80TZg9e+FdZg==
X-Google-Smtp-Source: ABdhPJx2bftmnq7RHCX1El68uj6CuWJqbapCMo07V7M2E2AXoSLaInK7xzowbUr30s36j58NS2yVvPTVFaZebu6Z4cs=
X-Received: by 2002:aa7:980a:0:b029:20c:5402:5de9 with SMTP id
 e10-20020aa7980a0000b029020c54025de9mr5130024pfl.18.1616513242364; Tue, 23
 Mar 2021 08:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210308120555.252524-1-adrien.grassein@gmail.com>
 <20210308120555.252524-3-adrien.grassein@gmail.com>
 <CAG3jFytoE9hWvq2e2Caqn4qP_RuEOnm4r9VQ85ffbAcguSLf+w@mail.gmail.com>
 <CABkfQAGvPy3DzXQnDJqm1q_rOLWR7BQTXb8z05iML3s3Mc8LJw@mail.gmail.com>
 <CAG3jFytmJSjvWp0Bu7MaJ7EVuJov8gbs6cguatoOtTJpXTGVLA@mail.gmail.com>
 <CABkfQAGcSsQ74FtvAK4_awHRXswgBrThKww_xhpmTzordZ5X8w@mail.gmail.com>
 <CAG3jFyvQt=Bv2_Hi8UdOhgznp1gVZwAw8gZv6FnLwHJV4WD6Kw@mail.gmail.com>
 <CABkfQAGS24AM90veQhGA+=V4S50y7JwzqLMspMaEFptcYpmdMQ@mail.gmail.com>
 <CAG3jFytY26tdktwE+iorKjM1EDsdAFxo9MBhxsJHoCNLSRsM_g@mail.gmail.com>
In-Reply-To: <CAG3jFytY26tdktwE+iorKjM1EDsdAFxo9MBhxsJHoCNLSRsM_g@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 23 Mar 2021 16:27:11 +0100
Message-ID: <CAG3jFyvMpO9YNCB=qZgHovU9=zT0s1S3jNoeYoj0YkpQAjh5Rg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: Introduce LT8912B DSI to HDMI bridge
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alright, I think the best way forward is to remove the polled HPD support.
Don't forget to update flags and function pointers.

With that, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
