Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D669833C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 19:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3530810E292;
	Wed, 15 Feb 2023 18:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7FA10E292
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 18:24:30 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 e12-20020a0568301e4c00b0068bc93e7e34so5947209otj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 10:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=croNtBtFGFvFdMAY84BMyPQyb+LWlr8w5m6GQUs4i5I=;
 b=hnqyWRCu88nevRztjuXIFMr/OtOJg6mSnAdFOSP/s8t/j0FIXUQkKsfk8+1XTH5YLV
 e8hx8rERmCwbYmTAGJVejyyqKtqXWHcwO1iIpX5TKQAgreJRUS/551MVJBaZQsy2Es26
 3JVwtipJkyBQxneRFELX6vm087ERRfcpL3HNuT1YZX8NSZzEV8N+EOFWyZHO5uuAGF2V
 KABATzCuXhhMUyNwQaiMFx4tmxAOv/toEm7/BTuGseaGdnaSaE7sI3XrlEtq5JjbIEr1
 2NmNmjy3bkhTTYxLKU/pbjc4vqulaO2I8TtOZI8UaaHVnbeo0SQuQ5cdF9p6Iaj7qFKG
 1HfA==
X-Gm-Message-State: AO0yUKUJ4MsPcu4K8ksyYeEvPWi1mq2en7UxN4MOgw0jscDW12jE+AQO
 GzvtkoYHj25eGkLqEHzmmQ==
X-Google-Smtp-Source: AK7set8zlWRgo6R3dEb7rgRht7PM6KhWOHnrSq+VzjIm07U2/4liXTsawcI1ipRrKnjsL5m4ut8lcQ==
X-Received: by 2002:a9d:7312:0:b0:690:b1b5:8d76 with SMTP id
 e18-20020a9d7312000000b00690b1b58d76mr1212853otk.15.1676485469744; 
 Wed, 15 Feb 2023 10:24:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 di14-20020a0568303a0e00b0068bd922a244sm7838254otb.20.2023.02.15.10.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:24:29 -0800 (PST)
Received: (nullmailer pid 367716 invoked by uid 1000);
 Wed, 15 Feb 2023 18:24:28 -0000
Date: Wed, 15 Feb 2023 12:24:28 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v5 1/2] dt-bindings: display: imx: Describe drm binding
 for fsl,imx-lcdc
Message-ID: <167648546792.367649.2888565409489725256.robh@kernel.org>
References: <20230210180014.173379-1-u.kleine-koenig@pengutronix.de>
 <20230210180014.173379-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210180014.173379-2-u.kleine-koenig@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 10 Feb 2023 19:00:13 +0100, Uwe Kleine-König wrote:
> Modify the existing (fb-like) binding to support the drm-like binding in
> parallel.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  .../bindings/display/imx/fsl,imx-lcdc.yaml    | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

