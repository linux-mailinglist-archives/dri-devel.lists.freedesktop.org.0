Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DCC21048A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1476E7D5;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4957D6E121
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:50:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u25so12236250lfm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=p/Otl91mPpjMSzsKhcaF4uSY/2JX4DNOyaQowX9LZdY=;
 b=ygubjHAPA2xihW55H/lrsfxhJ7YRK+8V2z95+KKu23NmjT3r2C2ytcRIPxJCHV8vIV
 5EXZT2UMg41NZbHmJu/gu9o4UwlZQKtqE+1pr1uqr6XV8Bs9b68R+pCob0T+x+8ooIak
 hQ48b+wmyrx/DWhySyDYw9YqkbcWnwi2ZDehMnLWLyOSPSW1odzw4VHD6LfHytYjYicM
 guYmRaLhxZuEUU2sMI+jZJAprGcdQd0zhCa+2m8ablHEy1e0K9yjaSI1baAWjIjQcNa+
 vGvMjrPDDToArlSE86kxZg7RmxlkFywYtS+46fZ2U2WRuo/YmeIRQpVpDExjxu0ggUJX
 lESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=p/Otl91mPpjMSzsKhcaF4uSY/2JX4DNOyaQowX9LZdY=;
 b=eYWeqFC4PgLzFhlEoSXs6/Y+ZjEyEsQByZx28+QSTqmO+7KaZcdr3/e89O6lckhesZ
 /OO/oweRHWrnjESXmplxPbPxXbCjrMV+VHBxemQQA6PWvQGJY4xR+tII0CUhWr7eBe0v
 O0bhvxzF+DHyy6v8yjjtWGe5Ca2kKGg7nB7w3ZJEKYIW5MdjUpWAZSYIX73keHE2RjnD
 omJ2lJydoAOj3W5YybR2zNbeL/5CIBBQr+hpDefOO8FPhKMIHwi589slBN7znZ7Xbgue
 5S5RPr+wYPXhyxqYpiVywOu15uH5lIwCMLpXEDSKlbGrq5n1BUmGcrE69fklQNkLwQ6b
 tTGw==
X-Gm-Message-State: AOAM532TXuO8Xa9NH37pcEzvgx83s9Rn19RhYc70LkKpBmEOuedx0y0x
 gq3aGzjE1r0Rma9RzWg6+QcOHe3RPMM=
X-Google-Smtp-Source: ABdhPJzECkfv/Dr04bhv1EGQNZ89O+WfwWATDN2K2b2mRDhSKfE+HFv2STbKXGDJdhAX+HsKGj3nhg==
X-Received: by 2002:a05:6512:10ca:: with SMTP id
 k10mr2279919lfg.177.1593550254384; 
 Tue, 30 Jun 2020 13:50:54 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id g2sm1222424ljj.90.2020.06.30.13.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:50:53 -0700 (PDT)
Date: Tue, 30 Jun 2020 22:50:53 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: media: renesas,fcp: Add resets and
 iommus properties
Message-ID: <20200630205053.GC2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-4-laurent.pinchart+renesas@ideasonboard.com>
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

Thanks for your patch.

On 2020-06-21 03:47:29 +0300, Laurent Pinchart wrote:
> The resets and iommus properties are used in DT sources in the kernel
> tree. Document them, and make resets mandatory. The iommus property is
> optional as not all platforms wire the FCP to a functional IOMMU.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/D=
ocumentation/devicetree/bindings/media/renesas,fcp.yaml
> index eeca7e255420..b6cf2958e6c9 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -31,14 +31,21 @@ properties:
>    clocks:
>      maxItems: 1
>  =

> +  iommus:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
>  =

> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - power-domains
> +  - resets
>  =

>  additionalProperties: false
>  =

> @@ -53,5 +60,7 @@ examples:
>          reg =3D <0xfea2f000 0x200>;
>          clocks =3D <&cpg CPG_MOD 602>;
>          power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> +        resets =3D <&cpg 602>;
> +        iommus =3D <&ipmmu_vi0 9>;
>      };
>  ...
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
