Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A001E68C0
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 19:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418516E5AB;
	Thu, 28 May 2020 17:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B596E5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 17:37:58 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id r2so1051438ila.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 10:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GiD0oyk/KKQdbg44fIYbxmFQPOLIBFzL4LRBCx2gE2E=;
 b=rXQtvC0BfbNRsxn5kEWOCxyl6Tu4HKuYVHZF3dqxbyp5ytizZ+iAMtjuQ5K7FphgoX
 X3jWuOW1MFR2V6aTRfTarHkZUIah2MhUSXlc80cKJK1C4NT5OkAxRJUxxE76LM61u1UK
 oCzKQ6FEHsmkRF/iPWTFdapfZ27A4utshyyNysQm7kIJIh/p2JPenF3rWNFgnJjgUooX
 ni9kq+JzXgMhHVwMemaNH7lSJmtLSvmbzOXYE07qZ4gMuO6lFntOjV7YSwlNEPhGP12S
 BIvsgCxaP4hInhHFqxB7LZx5pi/CiDAVIUsPzX7BpkRUfkSK3PV9yegBfupC3NH/YQ/X
 ngQA==
X-Gm-Message-State: AOAM533Ne/E48NPrvHKZzCU9vhbg11iTZW8qgVVZMNn+ZlYNAtVhWN+J
 TqsGpVIWiDgobN+RAwB3zyLgHbQ=
X-Google-Smtp-Source: ABdhPJz6XG8IeR1Wf7SDceVEEvWMzunefbyvqCnZoj/YTWnEQp5dGohnm7sv7KyHZntAzHxF6L2Szw==
X-Received: by 2002:a92:155b:: with SMTP id v88mr3691249ilk.274.1590687477415; 
 Thu, 28 May 2020 10:37:57 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d16sm3567690ilg.71.2020.05.28.10.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 10:37:56 -0700 (PDT)
Received: (nullmailer pid 360225 invoked by uid 1000);
 Thu, 28 May 2020 17:37:55 -0000
Date: Thu, 28 May 2020 11:37:55 -0600
From: Rob Herring <robh@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: dove: Make the DT compliant with the
 ti,tfp410 binding
Message-ID: <20200528173755.GA113289@bogus>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-2-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514143612.2094-2-ricardo.canuelo@collabora.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 Laurent.pinchart@ideasonboard.com, kernel@collabora.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:36:09PM +0200, Ricardo Ca=F1uelo wrote:
> Define a 'ports' node for 'dvi: video@39' and use the proper naming for
> the powerdown-gpios property to make it compliant with the ti,tfp410
> binding.
> =

> This fills the minimum requirements to meet the binding requirements,
> port endpoints are not defined.

Just make 'ports' optional. This isn't really any better unless you add =

endpoints too.

> =

> Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>
> ---
>  arch/arm/boot/dts/dove-sbc-a510.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> =

> diff --git a/arch/arm/boot/dts/dove-sbc-a510.dts b/arch/arm/boot/dts/dove=
-sbc-a510.dts
> index 2bb85a9b7614..32804c981625 100644
> --- a/arch/arm/boot/dts/dove-sbc-a510.dts
> +++ b/arch/arm/boot/dts/dove-sbc-a510.dts
> @@ -132,7 +132,18 @@
>  	dvi: video@39 {
>  		compatible =3D "ti,tfp410";
>  		reg =3D <0x39>;
> -		powerdown-gpio =3D <&gpio_ext 3 GPIO_ACTIVE_LOW>;
> +		powerdown-gpios =3D <&gpio_ext 3 GPIO_ACTIVE_LOW>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			port@0 {
> +				reg =3D <0>;
> +			};
> +			port@1 {
> +				reg =3D <1>;
> +			};
> +		};
>  	};
>  };
>  =

> -- =

> 2.18.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
