Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B5735FCA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 00:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D467D10E03B;
	Mon, 19 Jun 2023 22:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ACE10E03B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 22:11:17 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3422161e53bso8158875ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 15:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687212676; x=1689804676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2GzJl3YIufx24rrPPBjiGHwcJLGJVUI+UoKbrhxXg1M=;
 b=Izv3545kbSECkz3V/0m2Wy0EPshohtlZFd2p2DJINTFn17fd1uDFRMtZxwckKDlqJ1
 rY3mvgiAqWJTu2eMuiBf7kXy7nlBDL++FEGru6OHhDi8L2VaeUzUgalw0u7Mw4fQHMB5
 NsYoywkuA9gW3uX9c/6naQ8sKUaDy/t42usTSpeZ7JZdYxns3iWog+MprLhJIEv96RAg
 zVdVzGz7K1RkqX0ISBsJ9j6QEl45i7aU/TRBQdn7Ymi79pbBfInVyXoPYikmsNWGcs2F
 hOIvV2ReObwoitXFHZeXuGr0XwY6gdm70aU7bdhlOKRkhZCg6NDwXk3sf+/PCO4/75Xs
 2hTA==
X-Gm-Message-State: AC+VfDxrNWtdGsh6KhXNUD7ppk8HAWKTKKx/o7eMPNqV6nNgOY+4JRCa
 KyhP5swQ4QAAO10izxIq9A==
X-Google-Smtp-Source: ACHHUZ6YHBtLREVH2RBkLmpN6iF2iPKgeZP7XF9P82sV7Y/BeGqT4CuDM3LoXhiiKoMP9nbsocyEXQ==
X-Received: by 2002:a92:c60a:0:b0:33e:6d37:ce76 with SMTP id
 p10-20020a92c60a000000b0033e6d37ce76mr6318463ilm.12.1687212676512; 
 Mon, 19 Jun 2023 15:11:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a92c6c2000000b0033bc3a3ea39sm170537ilm.70.2023.06.19.15.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 15:11:15 -0700 (PDT)
Received: (nullmailer pid 1611621 invoked by uid 1000);
 Mon, 19 Jun 2023 22:11:13 -0000
Date: Mon, 19 Jun 2023 16:11:13 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 4/6] dt-bindings: display: stm32-ltdc: add optional
 st,fb-bpp property
Message-ID: <20230619221113.GA1608794-robh@kernel.org>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
 <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
 <20230619-ion-decree-c63d2eb11e83@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619-ion-decree-c63d2eb11e83@spud>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, michael@amarulasolutions.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 19, 2023 at 09:18:25PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Mon, Jun 19, 2023 at 06:55:23PM +0200, Dario Binacchi wrote:
> > Boards that use the STM32F{4,7} series have limited amounts of RAM. The
> > added property allows to size, within certain limits, the memory footprint
> > required by the framebuffer.
> 
> Hmm, this sounds quite a lot like "software policy", since the actual
> display doesn't have these limitations. Rob, Krzysztof?

Indeed. This doesn't belong in DT.

Rob

