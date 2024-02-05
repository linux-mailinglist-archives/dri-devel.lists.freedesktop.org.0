Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C451C84A182
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422310FAF3;
	Mon,  5 Feb 2024 17:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="P38ZXGtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F0810FAF3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:56:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-40f0218476aso6895e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707155767; x=1707760567;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1+OGpgO63h+CoyrYHJeBkVHIfjV8yHeOKcX7588wxQ=;
 b=P38ZXGtB2/PF4FFDxGoFlqs6mkVM0ZDNthgZaS/BS3uU1iAV6txWdWwTzfe3PKiJSr
 HOcNAlh87xKkSWZFPFMVvdPlHZB/RW6OkI6DZL3B2itfpKP30kpsywqd8WT9KG1kVW6x
 LdUOTqL1vAPbrbOz8XNn6fzl6g27WtJYEeoIiiIOxX11dlYRkXRDAVbkfjGJ0VJjLWfr
 BdcnOv+cbMgR627R8D9he6TtmpZH4ZAbTqJLr2q2VYXsUt4hx7fNVvr0LPcRJyanZY1h
 rS4XOHCVZFJi4eK5iefi/Q0kmOpnG121SNaD8n095HQvXByPctnQLydRU9ZMqRwneTXg
 KC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155767; x=1707760567;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1+OGpgO63h+CoyrYHJeBkVHIfjV8yHeOKcX7588wxQ=;
 b=MwP4x3nHeL1qjqrOoT4vxTDPYluMK3Uv2B5QMXm+jUvnp6vgjGhwODshR9aiwb6gWQ
 v+cDuWPOS22iuprOJ9pDX5tH+GaZPZGPvv5DxVpV/m4VSsrYs+nUMGGdnEkHS+OzsMOE
 JNPOgfA5QHrsLqtWSzDM/lDcQHvXP0KF+r8QJ+i52Bh90gmMMCpn2cVvvRLXV94G++Od
 wGKqj1ivBupQLt1fpbuivdGclIMSOOOGKnEcPJFnCyNSYYQehHyJqpftq7KXVIuiIhyE
 QKNv+Z8WgwhSz+sc2+4H8EPEsnua8K0FqoqaeWKYGNofv6A+EtZcg7RwI7yXIPcfICPW
 2kmg==
X-Gm-Message-State: AOJu0YxT1A10ThFyTfmXF72q1DoaBAzYbGj6nnHwBUw87gcn6pghi9CE
 j56UM7TX9JDsvyFvg7JkxiQNAkeunV5h/9k5AeVmmVc9Wi2FIcxNs2AVpE2wnUfwpqjfzlqKkSG
 vRXQpCwez7jCwBcELcBljg3+3qTM/X+8a/Rw=
X-Google-Smtp-Source: AGHT+IEnaDiX/OcCRASvTFKqqbb/i//uiR4yKUJvHKwFX4zPwyfbM9Aww/8xHpm2xtrafzPUXoU0/HaRQHki1N+jtes=
X-Received: by 2002:a05:600c:1e07:b0:40f:df29:9abf with SMTP id
 ay7-20020a05600c1e0700b0040fdf299abfmr18729wmb.2.1707155767456; Mon, 05 Feb
 2024 09:56:07 -0800 (PST)
MIME-Version: 1.0
References: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
In-Reply-To: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
From: John Stultz <jstultz@google.com>
Date: Mon, 5 Feb 2024 09:55:53 -0800
Message-ID: <CANDhNCpZZ9k-7h4VWNq_=56v1fRehKJcHobZ=mfu3MP9Rzno+w@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Use
 devm_platform_get_and_ioremap_resource() in dsi_parse_dt()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Yongqin Liu <yongqin.liu@linaro.org>, LKML <linux-kernel@vger.kernel.org>
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

On Mon, Feb 5, 2024 at 12:13=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 5 Feb 2024 08:58:21 +0100
>
> A wrapper function is available since the commit 890cc39a879906b63912482d=
fc41944579df2dc6
> ("drivers: provide devm_platform_get_and_ioremap_resource()").
> Thus reuse existing functionality instead of keeping duplicate source cod=
e.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I no longer have hardware to test with this, but this looks reasonable to m=
e.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
