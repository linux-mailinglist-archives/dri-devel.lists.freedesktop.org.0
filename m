Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CEC7E84CD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD9B10E29F;
	Fri, 10 Nov 2023 20:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB9910E29F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:57:18 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3b4145e887bso1309702b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699649838; x=1700254638;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nm5zX5sql3IowmYolUuWYQdm2nSrl6pQAH5NV0J1g1c=;
 b=xRMY+hB+cZOj3guiRuLuT5AGMvHp4Uuf4IDDGI+yJqLW0fDLeVBOIChxpXIdJAG/SU
 5jKNyNm4zBJeNmCV1TAzYN9QysJNqj6Fm9nwA0fr4paNZtptdPn9QO+RDL6F++/T/B0x
 XisiXU0ps2qgzgdRbrZ4tREvjQVgs9Pu42tzR1qKVGMc5xBDoIv4GQBtAsxdPB8BS6tk
 lCuSiSVHlO2kY1ntupmsIrWxnyh/v7RmwmuflasubfQLgmr1hPeNQmaxiZWuj5c9Bd4f
 KMQInCq0HT6Usla4AypIR5REbzHJlEm7RME7HbWnliNYd1ohivZ6ZCVhFSg1Wof4a43m
 yFIA==
X-Gm-Message-State: AOJu0YxwqChNby93DFPoIDkaXD47152AixU07IC/DAYOOogZ0b3QVKI4
 SqA2yuRlWiT9jN1gHEBiYg==
X-Google-Smtp-Source: AGHT+IHtZtVlwtJPvoY4OrZnDnqXkONweOm+3JHkApZQBHo5IGHFFFxQ0l5z/Eo218CP8JWWycngxQ==
X-Received: by 2002:a05:6808:640c:b0:3a8:75f8:540a with SMTP id
 fg12-20020a056808640c00b003a875f8540amr497862oib.44.1699649837752; 
 Fri, 10 Nov 2023 12:57:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j7-20020aca1707000000b003af6eeed9b6sm48245oii.27.2023.11.10.12.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 12:57:17 -0800 (PST)
Received: (nullmailer pid 418039 invoked by uid 1000);
 Fri, 10 Nov 2023 20:57:16 -0000
Date: Fri, 10 Nov 2023 14:57:16 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <20231110205716.GA413638-robh@kernel.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-4-81e4aeeda193@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Nicolas Belin <nbelin@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 10:00:05AM +0100, Neil Armstrong wrote:
> Now this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml and is
> documented as a subnode of a simple-mfd, drop the invalid reg property.

Why is it invalid? It's preferred to have 'reg' in MFDs even if Linux 
doesn't use them. If there's a chunk of registers you can define, then 
do so. If it's all register bit soup, then fine, omit it.

Rob
