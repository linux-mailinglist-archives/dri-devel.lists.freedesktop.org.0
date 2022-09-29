Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A85EFF71
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 23:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D7210EB10;
	Thu, 29 Sep 2022 21:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DD110EAFA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 21:54:58 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso1032825ooq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 14:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=5Kyru7V54n+mm3GNMmsYoggBJulCetHhfXOSWSvF6ds=;
 b=fPD5LJY6r9VU+xRirnQZJdTHwQK+23Pn8j6/czHraLVGy+7S5UX5nDkUFpiOYXXczh
 b22em6hxc3d/aj5iqaEYaf8Z/ASfxRmzIs60v5cnEP4ES0YQzrTympq8TAQZNwaNtfSl
 G1F7vMMj2S9ueUfwfA07mXD6YGAHodZcPXa+GtxLggNVvs83Ys68VDVdVXiG3KFoIWpd
 eC1tkUDgvfMNakCQX2s+jtGGvHooDqhBZ8J7oiW6eTMU9WTEEgrR9jiUVa5tWE1qdjl8
 ZsAv52tUj5QxIKNXwAMumcjmvuZh33fbl3ZQD+z1obey34gtuwemeY0rJbLnClOwvVAZ
 gc+g==
X-Gm-Message-State: ACrzQf3SenzlUuc8PRZbzLfdyxFTulwQFScJQV858hRZ0yPnlrDYWIev
 Nwt3Zu9PiRhG6tqjmyiQZxP7w04DGQ==
X-Google-Smtp-Source: AMsMyM4RsoCX7i8UL7T/BCVT9aXOd7mqR5mKU8ppEaLEDfC5SAPc4o0vtRmxjp5vFNCCdaZGPj8CXw==
X-Received: by 2002:a05:6830:1d3:b0:65a:659:20c1 with SMTP id
 r19-20020a05683001d300b0065a065920c1mr2272500ota.113.1664488497211; 
 Thu, 29 Sep 2022 14:54:57 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h94-20020a9d2f67000000b0065932853f5esm188787otb.61.2022.09.29.14.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 14:54:56 -0700 (PDT)
Received: (nullmailer pid 2772578 invoked by uid 1000);
 Thu, 29 Sep 2022 21:54:55 -0000
Date: Thu, 29 Sep 2022 16:54:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH V3 2/3] dt-bindings: display: panel: Add NewVision
 NV3051D bindings
Message-ID: <166448849482.2772533.411373228159837365.robh@kernel.org>
References: <20220926191428.4801-1-macroalpha82@gmail.com>
 <20220926191428.4801-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926191428.4801-3-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, sam@ravnborg.org,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Sep 2022 14:14:27 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for the NewVision NV3051D panel bindings.
> Note that for the two expected consumers of this panel binding
> the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
> is used because the hardware itself is known as "anbernic,rg353p".
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../display/panel/newvision,nv3051d.yaml      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
