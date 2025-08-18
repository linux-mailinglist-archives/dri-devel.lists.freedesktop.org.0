Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF373B2B21B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 22:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CA410E4C0;
	Mon, 18 Aug 2025 20:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bOsVI2q4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF5110E4C0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:11:40 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso657505166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 13:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755547896; x=1756152696;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgER9EDMTIBQYEXALGtaORMx9kWQNeO2USv3gouUbwI=;
 b=bOsVI2q4r/RNmyJmYVRHPij0gpRl5mcK4PufPWP/N5UahNIvqE4g9gkRV0Mdz0kUS9
 NmC95SClELIze1qokT3pY7gl1N0CkyQ7WfxJOVPa1YNECAxAaXQI/uJlIG4Do9UZImUH
 utuvMHHvGsvZX0jnyaVLT57tVZKW5z5gAKnZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755547896; x=1756152696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgER9EDMTIBQYEXALGtaORMx9kWQNeO2USv3gouUbwI=;
 b=xQxPEI956H7+IIsBrd7vHsLRh/8xA6h7kbLzr8rm1TB3A8kOWyAwh62WnsigsjMtsK
 Wh1CihC99JoFg0Ge7KL80pvUju4cjNk4oQXVDSXNq8cH6QlwmqYHeeaaTs6Y4+sDFLkr
 t1ygW844PsveXMYd4UsWD8htRTgzY6gnZt5Qapt/VJ8Fiud3HBI/uvWqVgxvzBNbBN1/
 WX+0jSumPDS7+x8hJnJglmNe81HDPmGY7rIbgLPAIbdGPhdwQvQ7W428zCnpmmIyZoY1
 V7OQKMW6hXSyLpliA3QAlaMoVJCPgPtm0iLhjiP/Te/YeT8HU6+bILYmzIk2I9QeUZcb
 Qzag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuyl5mX0JVUL6rugfjO11aW651k7zH+hklmp8a5YXthsYHJG2hKOIXJp+2sjzfKfLkqYl3npcPPn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTyCwzu4nEPMotcccMUU/okylWT5Y70fcyhNFYxQy9jp9Dyx08
 /U1oWP6iKpjR1H9Vner36eruX04gYHLiJKxD+Gv/Hhhx7+cRE2ULc53zSRg+u8UgqrqnBA57oy7
 6LaVK3A==
X-Gm-Gg: ASbGncv+SU4qqjHUO5wAz8vxQQYL+07BUuu4Mck/xcgm6heQpVx69w/YJKb8AUAEvSf
 P6X218TSae6/82D7L/tmU1jNChqBWSqKaUj/EJCjHG7khxi7KQWt/ZaEf+OZXJmzyAtkxALcxBj
 VAkpEc9Al75Nd4SK0zS5bCTmSrp3fKg99d+N7SrMG6DBsOg+a0ACWgNW3U/4e80sIK6hPh0C7Xz
 rfPKBAmBidmwWtGDO1+ML+Nw1pNnhh2RsGJSxyq7v/ncfNE7JCKu5zozFGV9T166AKkLsudnZ+1
 8MkDz/oLQxiix13xrk/NDtaazw0mUxGC/yCX4hxfpnECFM1qicYGO6oMtYQunfiwISHTplFKyW+
 WAq2HDQFAc4IfJUVeArEVSpQiBDxT4tDQPoYflTICEPB6b17gDG7AMXMwU09gPQ==
X-Google-Smtp-Source: AGHT+IEtS+JibtfnjXy1VrnINwcxnmCJEpR0mulzUXdof27Y8OmrxNJztlTGiOXUWLLQjvaJNa6rTA==
X-Received: by 2002:a17:906:c113:b0:af9:5ca0:e4fe with SMTP id
 a640c23a62f3a-afddd200e55mr6555666b.56.1755547895890; 
 Mon, 18 Aug 2025 13:11:35 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdd04fbebsm867057066b.115.2025.08.18.13.11.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 13:11:34 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-afcb7a7bad8so606754466b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 13:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWxyRlGQG8pBsx04L7gxFPaPcy2vD0xoyG3VMnCk4aD4UlClTqGe0OWUmnrzXgBGYFuG1GNI/F9d/8=@lists.freedesktop.org
X-Received: by 2002:a17:907:7ea6:b0:af9:3116:e110 with SMTP id
 a640c23a62f3a-afddd20426dmr6122366b.58.1755547893874; Mon, 18 Aug 2025
 13:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org>
In-Reply-To: <20250818115015.2909525-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 13:11:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
X-Gm-Features: Ac12FXyrfB2_QJdzc3F-AXnavWgZcAA1_jLXyiQVztCZpVvUWjbjdascj2sVMMs
Message-ID: <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org
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

On Mon, Aug 18, 2025 at 4:50=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Some touch controllers have to be powered on after the panel's backlight
> is enabled. To support these controllers, introduce .panel_enabled() and
> .panel_disabling() to panel_follower_funcs and use them to power on the
> device after the panel and its backlight are enabled.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> Changes in v3:
> - Update kernel-docs of drm_panel_add_follower() and drm_panel_remove_fol=
lower()
> - Fix the order of calling .panel_disabling() and .panel_unpreparing()
> - Add a blank line before the goto label
>
> Changes in v2:
> - Replace after_panel_enabled flag with enabled/disabling callbacks
>
>  drivers/gpu/drm/drm_panel.c | 73 +++++++++++++++++++++++++++++++------
>  include/drm/drm_panel.h     | 14 +++++++
>  2 files changed, 76 insertions(+), 11 deletions(-)

Looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If there are no objections, I'll plan to apply patch #1 next week to
give people a little time to speak up. As per discussion in v2 [1],
unless we hear back an "Ack" from HID maintainers then patch #2 will
just need to wait a while before it can land in the HID tree.

Question for Jessica / Neil: what do you think about landing
${SUBJECT} patch in drm-misc-fixes instead of drm-misc-next? This is a
dependency for the next patch which is marked as a "Fix". It'll mean
that the patch can make it into mainline faster so the HID patch could
land faster. The patch is also pretty low risk...

[1] https://lore.kernel.org/r/CAD=3DFV=3DUV8_XGmxC=3D7Z18PEnj6wKz+yZQuV_4h+=
LJh_MNCqszvg@mail.gmail.com/


-Doug
