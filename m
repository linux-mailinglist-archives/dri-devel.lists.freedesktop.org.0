Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9BC40EB17
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 21:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2288C6E883;
	Thu, 16 Sep 2021 19:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946336E883
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 19:49:16 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 n2-20020a9d6f02000000b0054455dae485so4527776otq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 12:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0KsoWtKkhaXMiBJDC0/XxZwnXXQWFGw8B4mYJMIPHr0=;
 b=zib41Hea0CSmgeLRlQUSq0QSATKSwpkb7WHnml0FIhsNlf7EjoqWnc9WhE1kBjCowP
 tT1l121hXFiwfM+JKUuud/kxev7aJTJ1VVr5XB0xHZOLSqAHhV4N9ntfigBRSn8qA+ou
 LhxXDLBCMoqZf/K5wq4a1YH0QE30MgEKmQEMs1GjaTzUbHmd8z+cwjL3DTX9asSmo4No
 0s2WfWBAOMpUw+vGbw+OPNbg3fvysemanAG4L+EE2vpNytR+3eBtWronzYHz0VyUwGpK
 F95NTyLiDfXHlMuPpeuTMNqgchfj0TnB56llBNF/yXaDLyGJCzK+qCWZUBuMtuUHTT3H
 k8dQ==
X-Gm-Message-State: AOAM5318QZKORmRO+0Fu94pF7P8W+n7X/hjqJn6P3kwN5RQ/nM8GMZ0X
 /HPVyAbQxSoYbedcN1M0mg==
X-Google-Smtp-Source: ABdhPJxEEp/Qsw3alHt8zhmxwHRpVnbr0IilY/Bi03MDyZNTmeQPJrTz7p+nPBP14eKxCi6oX/vdRA==
X-Received: by 2002:a9d:70cc:: with SMTP id w12mr6143201otj.306.1631821755916; 
 Thu, 16 Sep 2021 12:49:15 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id z7sm948074oti.65.2021.09.16.12.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 12:49:15 -0700 (PDT)
Received: (nullmailer pid 1377102 invoked by uid 1000);
 Thu, 16 Sep 2021 19:49:11 -0000
Date: Thu, 16 Sep 2021 14:49:11 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Lucas Stach <dev@lynxeye.de>,
 linux-mmc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Nishanth Menon <nm@ti.com>,
 linux-pwm@vger.kernel.org, 
 Lee Jones <lee.jones@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
 linux-tegra@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-mtd@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
 devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 linux-spi@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-pm@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 08/34] dt-bindings: host1x: Document Memory Client
 resets of Host1x, GR2D and GR3D
Message-ID: <YUOftwuVt7EqtA5I@robh.at.kernel.org>
References: <20210912200832.12312-1-digetx@gmail.com>
 <20210912200832.12312-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210912200832.12312-9-digetx@gmail.com>
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

On Sun, 12 Sep 2021 23:08:06 +0300, Dmitry Osipenko wrote:
> Memory Client should be blocked before hardware reset is asserted in order
> to prevent memory corruption and hanging of memory controller.
> 
> Document Memory Client resets of Host1x, GR2D and GR3D hardware units.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
