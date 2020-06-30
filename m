Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C536B210488
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343D6E7D1;
	Wed,  1 Jul 2020 07:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDA46E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:56:29 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t9so12214581lfl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QzaiVWwjs11/Aggt7h4kjnpjmNK+rjlPN0n7owMC96g=;
 b=XK/DySsF4kqNHqlJGocfpYds8BJ+M3BZgmgJlHlyFJPh1xZ7Ya+mWYyuNbda+crVgZ
 yffPNZwxO61hSAvEatKROXpAlB9p767vdM9gS8eRENQt5/xbXHa3U2ahtk9zPrqsGEUh
 8ogkQz7Fk4F0h1ALajoWkEKgMXIUUXQkILmdAUnITKwZrxpe0Nod/biDgECWbr0Mxjoc
 vIGp9IjZVqbtDv9SCh06Q6jFxCFPngpSzkZyJEAvBfkmBNsPNcyySxZO5UZ5gEGkXef4
 5POOM8nD4Je+I+bT7i6WU+UYSs4FBmHiujyO+VqoWffM8vGY+r+9tvjwkJukNKfjMhzN
 vBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QzaiVWwjs11/Aggt7h4kjnpjmNK+rjlPN0n7owMC96g=;
 b=jQYxx93J6NoIq5+BOQHJ6Su84BxENj6jqwfopOq/g8yLzqJ1rqIuz9a3nz/3H0MsC3
 kGJb21j+lU4Izm38A7eP1v5tUueGmBvhZjC4WvMNMAJtFMyPyEfN5ECvONIeh3FBjBgf
 lWRRlGbf2dklK/lMYh6aCLywyCnE+KIYIpXCjJI0BF8wpMturwj7k9F0ZK54umVAKp2v
 z/uEKsShi6yrZgO6K8Fax6dKQ/Xt/zm5GjAo0sgOEUii0maTJ7SRFLcx+xeUPN4TZFYP
 xs1qMB//7Xqzt6EOJ0ZjNwTSDTsjHToHuytPzLoIEum7egYKRZPshag4cE1WtNaUEwQD
 woyg==
X-Gm-Message-State: AOAM532lopL7IpTFK9G96GpOmEX/i8OvxeOeR6GEoitknJ0asPILV86g
 s7wpbhqK2irmbNsqLL90fFMl1Q==
X-Google-Smtp-Source: ABdhPJwNezK5/TIL/don+i1EEMPhpSmOIpoTVKFTYakrYGfHI8jjQEg+57LZ/Gwe6CKx0zDMde95YQ==
X-Received: by 2002:a19:4805:: with SMTP id v5mr13072165lfa.75.1593550585811; 
 Tue, 30 Jun 2020 13:56:25 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id u19sm1219185lju.63.2020.06.30.13.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:56:25 -0700 (PDT)
Date: Tue, 30 Jun 2020 22:56:24 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: media: renesas,fdp1: Make
 power-domains mandatory
Message-ID: <20200630205624.GE2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank for your patch.

On 2020-06-21 03:47:31 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> =

> - Fix typo in comment message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/=
Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> index f4db96a1f53c..39184bd21a27 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> @@ -43,6 +43,7 @@ required:
>    - reg
>    - interrupts
>    - clocks
> +  - power-domains
>  =

>  additionalProperties: false
>  =

> -- =

> Regards,
> =

> Laurent Pinchart
> =


-- =

Regards,
Niklas S=F6derlund
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
