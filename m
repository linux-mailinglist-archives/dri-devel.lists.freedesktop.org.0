Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B74A6A7FF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 15:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FDF10E60D;
	Thu, 20 Mar 2025 14:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="WqHQWYcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E22010E60F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 14:10:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-549b12ad16eso951400e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742479815; x=1743084615;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9l2NK29FWKMvXALTznvduzAySe6UJPpHquolLsiQd4=;
 b=WqHQWYcjlMrGx7bg4UaKabkDbJCdgBEe8VeFoQB37KMegsL/T7kk0Y/sEej8YBB7z5
 5q0OEuGKed2t3thqhKaWW1C7yvPwnSBFNKMhyLw6LhOikdsTVK5BqHKMPvBEsgrr9YPP
 kSgpDWY/ThbuqRmorintJ5Po5OUTrupJVRySA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742479815; x=1743084615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s9l2NK29FWKMvXALTznvduzAySe6UJPpHquolLsiQd4=;
 b=YUfLOFQsX/UZsYCpUKeUtQV+xRURxalDgPf5VIGSBIZq3YtV5l1+4V58sqqVSFNa5M
 62mPLI2QdcyuI/9A/7o2qh8HsrFXWstAK3PhEUZFqM59Sftc6bOaZL0czJ32s7Kr5nfk
 SVFmNztLXi4G6LqJi9XxIySl2fYgS2Ho/C2Oib/0j9YNMZ8dC74rnkWG7zn/PX4upgEN
 VxT0NmjSZ+HQhwnc/Y5BboQWlMHVL63LyZcYNHxDHpmgveeJplaV/zkhvdmU+V0pTNlF
 rLPHlyAVHZV2MF0yRt2FbX9EaeAAzXhTYU09D5pgcCfTrlV6IE4lx3sKhSCzDCwWXnDm
 ee7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFrHmv14N8t5jIpM6SarobaZjaAlmqhlULhUOkR3ipqIBN6r5uRsJGsgt1BnSecKFDaqwpL+wQfho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRx29DOVPQT8I98OapkneX9iaaZ/MaJ92Nlsh5a4vC9cE8TiaQ
 I7TseTPAQp7gk6dgNpwhe7pczF8JLMMrnXUqNWjCNRwZY0w5HQLI9KKSV3dM89Dr/2a+Ny9tNiA
 8qw==
X-Gm-Gg: ASbGnctrQxett92mZZCnz03FxbyyO+vl8YSW0vh/Nqbvburgyv2jzm1IjKE5vZPENX3
 eHxuACJ7724KorqzIcP+YrYNrTkVnW0hCsgSs3E4vbq/7IJkH6V1PnVEYQe5uN+YZ+q2jPYmDh7
 x/Inxbv/PnhOmkf6dlyb6WWoTAA+uyUYq85Acki5o7YDxG34s4qwcKW5mpehMQA6PbPaRCLRjOX
 ixkOLIoJdVuzQ6uBqmEcgPDxHT9m9nPb+PIXazCA+pg5OMyhJh+fmDXYWvCbjBkGiu3gGSxQXDQ
 CU3fOP6rxLJsNVe8dZHkiOlnF4swEUEfzelXD+eVlnbyV5juCg/PYoDmeUgpZZ1eWVU5a1rv+e/
 VNz4UJSNsywhXR2x2fGQQO9k=
X-Google-Smtp-Source: AGHT+IGu5fdFGvasBJqUwpv7JY13OA7hGoZaUYcyR0bvlYcGPTj6kRqIK8/BT8ThFNttJx5sDdh7sg==
X-Received: by 2002:a05:6512:238f:b0:549:b0f3:439b with SMTP id
 2adb3069b0e04-54ad062afbbmr1443133e87.16.1742479814510; 
 Thu, 20 Mar 2025 07:10:14 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a830dsm2274488e87.37.2025.03.20.07.10.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 07:10:13 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-307325f2436so8938701fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 07:10:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8IfJhtR617BwcoWhXsHVO1g8JS1zS7nTFgw/jx42E+T196hzCFfNqXnecOHrZy4LYyEherAVZ52o=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1312:b0:549:4f0e:8e28 with SMTP id
 2adb3069b0e04-54ad062b20dmr1419150e87.15.1742479811664; Thu, 20 Mar 2025
 07:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
 <zgzivcjcygbi272q3dmkff767cb45uoffwtx37ij23pi2g5ubi@j5bxjdbgqaqz>
In-Reply-To: <zgzivcjcygbi272q3dmkff767cb45uoffwtx37ij23pi2g5ubi@j5bxjdbgqaqz>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Mar 2025 07:10:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqCwIwBUwu1Y1sQAJLBekmg4FIUOmSSxOrj8jLfvkFWDtf9gs7NC20D47E
Message-ID: <CAD=FV=Xn2cEKQ+Uj5Okemo4_RJ-1uJ_SQ5X5TycJs5bYdNpcBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add panel used by T14s Gen6 Snapdragon
 (OLED)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Christopher Obbard <christopher.obbard@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
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

On Thu, Mar 20, 2025 at 6:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Mar 20, 2025 at 12:47:09PM +0000, Christopher Obbard wrote:
> > The Lenovo Thinkpad T14s Gen6 Snapdragon OLED model has a Samsung
> > panel. The kernel currently prints a warning due to not having the
> > correct timings.
> >
> > This panel appears to work with the default conservative timings,
> > so add the OLED panel to the list of supported panels with default
> > timings.
>
> Are you sure that this panel can be handled by panel-edp.c correctly and
> it doesn't require a workaround implemented in
> panel-samsung-atna33xc20.c?

Yeah, I'd agree with Dmitry here. To the last person who wanted to add
a Samsung OLED panel, I replied [1]

It's much more likely that this should use the
`panel-samsung-atna33xc20.c` driver, which gets the timings more
correct for Samsung OLED panels (there's an extra GPIO it needs to
manage). To use that driver, you'll actually just need to need to add
a new compatible and use the existing one as a fallback. See recent
changes to:

Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml

[1] https://lore.kernel.org/r/CAD=3DFV=3DX+WnSKZTFhzdXEFfpKCEqfPDc77h7oG=3D=
ZU6Nqq6XHOmA@mail.gmail.com
