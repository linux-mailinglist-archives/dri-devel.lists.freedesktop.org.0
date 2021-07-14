Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3323C88C6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 18:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490336E429;
	Wed, 14 Jul 2021 16:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381F56E429
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 16:37:15 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k16so2876344ios.10
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 09:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E4AvJhetNwASZem5dl8Fp/vANmJkc1r/xjwo+QbtJNI=;
 b=ly+kcOLDajsngxIwVbkcQZvDt5ezIZYBFaKax5EKDHNSw/lHAsa/tGPB/NDXUtsNVA
 VVxM8ZHGcD4WznB4vgUCxtFJh4IRYc1tq0APxjyfeafuoXVTj575sPDCFzKln/MNiF/x
 svSon1PnW/JUz6wr1wnf2R1vA1xpAC/IYwCksyIKRgSwh4j0egBeiKyFFDM7wiwVxePA
 qsWTyB70jgj0gBvNWjsHb/cdnWz1vBmXyAriwV5E7yhIygXXwLyQSXsQXnBJChGrwpWc
 +ackyEnYWEqUKm/iKI5h/ZNASX5+d4ZEwdKxjnJpUb3B/0mCtoxy6ci9g45eaCpP5Fnt
 dOzA==
X-Gm-Message-State: AOAM533awMmlpGDb+KZiCsi5SBNr3AaLrwvsbJXBwN4CCHwm7ScZuuOY
 SDjEzX7kMs5nL2VobMl7ew==
X-Google-Smtp-Source: ABdhPJyyqzjI4orQEKBGudclxA6i5CqYo1oBoYaIfnzXMXkj0ILABCTs+SeLuzpf8Is17w4C3VeFtg==
X-Received: by 2002:a02:ad08:: with SMTP id s8mr9861761jan.40.1626280634475;
 Wed, 14 Jul 2021 09:37:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r1sm1078472ilt.37.2021.07.14.09.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 09:37:13 -0700 (PDT)
Received: (nullmailer pid 2719225 invoked by uid 1000);
 Wed, 14 Jul 2021 16:37:10 -0000
Date: Wed, 14 Jul 2021 10:37:10 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <20210714163710.GA2718995@robh.at.kernel.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210714045349.10963-2-o.rempel@pengutronix.de>
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
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jul 2021 06:53:46 +0200, Oleksij Rempel wrote:
> Add Logictechno and Multi-Inno panels:
> - Logic Technologies LTTD800x480 L2RT 7" 800x480 TFT Resistive Touch Module
> - Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
> - Multi-Inno Technology Co.,Ltd MI1010AIT-1CP 10.1" 1280x800 LVDS IPS Cap Touch Mod.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

