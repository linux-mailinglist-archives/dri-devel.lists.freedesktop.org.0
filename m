Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B080A762
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3110E287;
	Fri,  8 Dec 2023 15:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C289D10E287
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:29:10 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3b9ef61b6b8so270340b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 07:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702049350; x=1702654150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2To1yV3sBlyUIXX2dRxgZLUw8e5tQCWslY62gbS5zc=;
 b=ir1P41SO5ejTnPFtBLWsj+OIYC4E51e9ExNUHinoHRAgyUq2i/vmvVww/8pPgDG28g
 bYu8FOjSWaNemhhqPBkdU4JmfJQIkc5fomeVp87llBb/fYb5jTj9T4wcX+UXYwMLhEkq
 3ZUv8FHK1rpGXNXRgkQUp1FveObsRlnH5iKqS0Fm3H7uXhpOML63NfS8faeqnlTjrdF6
 pE1YdEFWMoVnvaUHVmzpAsIzCMehP+p7Vn5YnvbYVOv2yGW9s0xYhrIaHLRiZglT2Mbi
 //1BfHiCdk8zMnC7cKYHH/+SQhBRjYU4nEVbbbRhbzQUiUKFqL9cgz2UJoUAA8UeB5Fm
 1xeg==
X-Gm-Message-State: AOJu0Yzg78+I0KNn365EvwgvDV78pz/HRynxQp6JUF2MxQ5v/hAFvl7K
 Vocr9V0Wkc5lKgVO9r2Y9w==
X-Google-Smtp-Source: AGHT+IHyKKjladIMN927leaaMAXflSx/bGCGRS95D1nFq54QptT3Wo+QdUF8jxOs29jg+9zj+WWbgg==
X-Received: by 2002:a05:6870:b69d:b0:1fb:75a:6d47 with SMTP id
 cy29-20020a056870b69d00b001fb075a6d47mr273275oab.110.1702049349884; 
 Fri, 08 Dec 2023 07:29:09 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 lv18-20020a056871439200b001fb24a0c23csm434995oab.35.2023.12.08.07.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:29:09 -0800 (PST)
Received: (nullmailer pid 1380806 invoked by uid 1000);
 Fri, 08 Dec 2023 15:29:08 -0000
Date: Fri, 8 Dec 2023 09:29:08 -0600
From: Rob Herring <robh@kernel.org>
To: Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v2 1/5] pmdomain: rockchip: Add missing powerdomains for
 RK3128
Message-ID: <20231208152908.GA1378274-robh@kernel.org>
References: <20231202125144.66052-1-knaerzche@gmail.com>
 <20231202125144.66052-2-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202125144.66052-2-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 02, 2023 at 01:51:40PM +0100, Alex Bee wrote:
> For RK3128 the powerdomains PD_PERI, PD_SYS and PD_CRYPTO are currently
> missing.
> Add them.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  drivers/pmdomain/rockchip/pm-domains.c   | 13 ++++++++-----
>  include/dt-bindings/power/rk3128-power.h |  3 +++

Bindings (and DT headers are bindings) should be separate patch.

Rob
