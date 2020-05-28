Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211B1E6597
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 17:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD26A6E154;
	Thu, 28 May 2020 15:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140C46E154
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 15:13:36 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id l20so443336ilj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 08:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vgkKnqmdXddKK+S+wsut0vxIkGzIa7iZR1isP7Df9rI=;
 b=W/ri3+7z1eLBEbBpllXR14shnY89rSareJjTBcwMMBgKC/oxTqbB9oUwr3N4eCtsR/
 RMbSdm1k/GGir6/ChYtSWzYC4T03kIMY2fCJt8XLkjPvJXIr+YcDqhy4JhPODqBRfreP
 Jj9eQoTghzEhxglL7dy3BHVJVAAhanVdScE7eGMgbHBPqerjWuM9KqgXINLVljUdCOso
 FqstEyKjVK/Sta7TRbvo6yGxG93zfIf20FARjKMo3ue+x4vQ0xCYq1q2xnlhmIVdJcPj
 V6+gHaYK4UC/ueRd7Ay+RXhj/GtHUGg7HSJrZPdz4qSpJRheu0WwqPajd7xiR25ZZKuF
 vSzA==
X-Gm-Message-State: AOAM53245gH0UHBJf/qXSlLGzXgb2yW4em7JGyS3++AbVaXjDPhn+2ak
 PkhsE9aSrKAOWHzjSAg9nA==
X-Google-Smtp-Source: ABdhPJzqqUOlROE6QNgLDNsYLJE7mDKFz+Rj/PCMmRAgmYWBZ0pIHza6Yt12DxC/pBZV9DVcY7uGfA==
X-Received: by 2002:a92:da52:: with SMTP id p18mr3320934ilq.173.1590678814533; 
 Thu, 28 May 2020 08:13:34 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id g4sm3279566ilj.45.2020.05.28.08.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 08:13:33 -0700 (PDT)
Received: (nullmailer pid 80747 invoked by uid 1000);
 Thu, 28 May 2020 15:13:32 -0000
Date: Thu, 28 May 2020 09:13:32 -0600
From: Rob Herring <robh@kernel.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v4] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200528151332.GA80583@bogus>
References: <20200514101235.7290-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514101235.7290-1-ricardo.canuelo@collabora.com>
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
Cc: enric.balletbo@collabora.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 May 2020 12:12:35 +0200, Ricardo Ca=F1uelo wrote:
> This converts the Analogix ANX7814 bridge DT binding to yaml. Port
> definitions and descriptions were expanded, apart from that it's a
> direct translation from the original binding.
> =

> Signed-off-by: Ricardo Ca=F1uelo <ricardo.canuelo@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> Changes in v4:
>   - Make interrupts and gpios optional (Enric Balletbo)
>   - Make hpd-gpios deprecated (Rob Herring)
>   - Remove maxItems from dvdd10-supply
> =

> Changes in v3 (suggested by Sam Ravnborg):
>   - Rename example node i2c0 to i2c.
> =

> Changes in v2 (suggested by Enric Balletbo):
>   - File name change: use full compatible string.
>   - Binding description removed.
>   - #address-cells and #size-cells properties removed from ports node.
>   - Example node renamed: anx7814 -> bridge.
> =

> Tested with:
> make dt_binding_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<.../analogix,anx781=
4.yaml>
> make dtbs_check ARCH=3Darm64 DT_SCHEMA_FILES=3D<.../analogix,anx7814.yaml>
> =

>  .../display/bridge/analogix,anx7814.yaml      | 119 ++++++++++++++++++
>  .../bindings/display/bridge/anx7814.txt       |  42 -------
>  2 files changed, 119 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/anal=
ogix,anx7814.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/anx7=
814.txt
> =


Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
