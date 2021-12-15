Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B12D4762CF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 21:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CDD10EC35;
	Wed, 15 Dec 2021 20:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A1B10EC35
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 20:11:42 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id bf8so33268412oib.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cmkh2Es9i+8G9hTWcV5pi5vTt+BeIBoGLAmd/MNJvhA=;
 b=wRpgSBNV/WGkX8q/DObe6BZ3ABHwS1LZzw+07SWgpi2NE6s+XeVe9ePS6V0PiX6Pzs
 yZT3cpuQ4ImuOKXGU5D/8SK2+IA4qA4ZKoLU565GgMXzDLwHnhB3bLlnPsC8rACp89vj
 nZsARbpa61Ck4ywHqBMSGIVjj5au7u2cLQOTyFlCe0KvcIKqZ7d5X8PkUWVh0c5CaybT
 ofOy1nzqB8dCh/j8x/eyEGtcyeigZ55ZrYqcS1heaOdSFiLf27pX7DOioBKizEG4kG3T
 9m88cuHdoqFnfnu8uijo8t0JZiZM+vuyjnXQRIdOKhpf0ODUeRBLS2v8rv1vKzXNnTVC
 O75w==
X-Gm-Message-State: AOAM5339ppzboIv2R7ffP7mVs1lYFCYsXs0M/M4Cq/xwZc2koOziwwIE
 bBBI5T0lK/9Ys2dF0XV65w==
X-Google-Smtp-Source: ABdhPJyM1ZMlrf4TO+CVAER9wA5DaXo2npuenGcEbYZYr9u3fHtpFP4yfaVSSVT0qgkXzTvNNTxF8g==
X-Received: by 2002:aca:1c02:: with SMTP id c2mr1417576oic.53.1639599102086;
 Wed, 15 Dec 2021 12:11:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b22sm514322oib.41.2021.12.15.12.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:11:41 -0800 (PST)
Received: (nullmailer pid 1756808 invoked by uid 1000);
 Wed, 15 Dec 2021 20:11:40 -0000
Date: Wed, 15 Dec 2021 14:11:40 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 09/10] dt-bindings: simple-framebuffer: allow standalone
 compatible
Message-ID: <YbpL/MG0xZyVD01B@robh.at.kernel.org>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
 <20211213082614.22651-10-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213082614.22651-10-luca.weiss@fairphone.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021 09:26:10 +0100, Luca Weiss wrote:
> Qualcomm platforms use "simple-framebuffer" without a more specific
> compatible. Allow that in the binding doc.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/display/simple-framebuffer.yaml         | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
