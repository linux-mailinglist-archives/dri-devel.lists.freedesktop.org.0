Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70772D1C1E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FCB6E8C8;
	Mon,  7 Dec 2020 21:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBC96E8C8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 21:32:09 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b62so13957583otc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 13:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0ynb8iLyUqADhkwHS9Qnd7e5/0N0ngWwVvaQV6B/88U=;
 b=O7K/vd08k5Ac3Y0sI6vlpCtPIErGeJDz7xqprRT2AKizYIZJGXkfz1nNitwbnETfhl
 nOzSxO2HtFjLhkY3XFIcRMqV62c/1VKGAzqhrxHG5KB+T0yNmW+6iu1R1Yjsxc35ZHPU
 FcDybnF7DepPAFxfEx2umtHykzn22MhN/laeS97qymdKEiakR9WDvfduicCgdOUY2nlj
 ZPpfwC9IRCeHxIeymCvDKSgX03S4NKgPqEtSZi/6iwEYDmMZPN3ry9Ng6aqDqkUxDkpx
 9ByW6/eJiGMO3VUljrjhiR5hsfrHw1Zm/6JDMjGpPYXxOdlVI0KbyOS4vBl/4G15I8Gd
 rvMw==
X-Gm-Message-State: AOAM531n11HQuXqcTMGCPNXeXcqDqtxHTL0A32X/5XDYtmpJCkcvTt4S
 TiKYuRO4cZ2EJxe3Het2JA==
X-Google-Smtp-Source: ABdhPJwGilcs+3zsB2f6/w9E6wHpMwawQixZFs99uC0mM+0NRsxaeavmnh/Lh9H+XbLxDmBuHdErVA==
X-Received: by 2002:a9d:4d8b:: with SMTP id u11mr4261161otk.13.1607376728681; 
 Mon, 07 Dec 2020 13:32:08 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o82sm3074342oih.5.2020.12.07.13.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:32:07 -0800 (PST)
Received: (nullmailer pid 864264 invoked by uid 1000);
 Mon, 07 Dec 2020 21:32:06 -0000
Date: Mon, 7 Dec 2020 15:32:06 -0600
From: Rob Herring <robh@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 6/6] dt-binding: display: mantix: Add compatible for
 panel from YS
Message-ID: <20201207213206.GA864202@robh.at.kernel.org>
References: <cover.1605688147.git.agx@sigxcpu.org>
 <eb2a0e50cbb8cfebc27d259607e543fedb8c6b27.1605688147.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb2a0e50cbb8cfebc27d259607e543fedb8c6b27.1605688147.git.agx@sigxcpu.org>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 allen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Nov 2020 09:29:53 +0100, Guido G=FCnther wrote:
> This panel from Shenzhen Yashi Changhua Intelligent Technology Co
> uses the same driver IC but a different LCD.
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml  | 1 +
>  1 file changed, 1 insertion(+)
> =


Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
