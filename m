Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2059568B9E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B98D10F911;
	Wed,  6 Jul 2022 14:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1284F10F911
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:48:32 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id z3so4069758ilz.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wrq2JNxdSNjz+AtYT/VK5cdxeQSjmsW3VIzTuH5qvso=;
 b=y/A0EIoAPKQhb5RYOZxzfNfjeRD+8wMcXVrdfEf9KS3zViswHebnMTZ0hDnP2+f1CO
 UfjpWU/rGW12ocGYsYd3d2sskpl6TtC9Zl/PUyQAZKY3W2bcgQHluHPBgNAeI7lKOb8l
 G3m6uqunROoEk9o9YnaV0iyCipyYKDVV78hFTGHt7Lt5nT8jaJ5ny8R4b60dAUrqEinT
 Nd8Sn4gRWjiX5GmzXoMOAqOsI0wjoi19tYsy7Hu79yzf6wCBjZYGJ/Zd/hUi+PgHD8yB
 Ac7yUwifS/8u2VVDGGqxrJKvGN2eUv5ZXXLxz7NO1quikIeCXV740hSsFIMUtR763uIH
 Wg+w==
X-Gm-Message-State: AJIora9uZbfKTZUEvdBc2qOK5NsnbQsSaLKkAChlv3x8KhKJqE4tVWn/
 uCSzIu6Bnh3CzKRf1O4yAg==
X-Google-Smtp-Source: AGRyM1sb5HmhX0XgK9jcKFeRefRiVrF9p1b4SQg8YeeZGNu7klKkXRLtLFt3S05zijGKW8PJyzkj/Q==
X-Received: by 2002:a92:d946:0:b0:2d8:e271:79c2 with SMTP id
 l6-20020a92d946000000b002d8e27179c2mr24307561ilq.240.1657118911231; 
 Wed, 06 Jul 2022 07:48:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a027355000000b0033ebd47834fsm5173779jae.128.2022.07.06.07.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:48:30 -0700 (PDT)
Received: (nullmailer pid 21846 invoked by uid 1000);
 Wed, 06 Jul 2022 14:48:28 -0000
Date: Wed, 6 Jul 2022 08:48:28 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Message-ID: <20220706144828.GA21787-robh@kernel.org>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220705215213.1802496-5-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dillon Min <dillon.minfei@gmail.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Jul 2022 22:52:05 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
