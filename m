Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B293C268CA0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 15:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF7E6E4AA;
	Mon, 14 Sep 2020 13:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039AC6E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:57:23 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id r24so18787009ljm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 06:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTU4sEoIqahgtbRxtGwCPyux8yYX9tvbUrrPAePL4bg=;
 b=iHwXY4tOLVLKCZW7BTgZH/zOhbxtFp4jdWNWKlB8/aLx07URa31Dui7FAnWK/waMK2
 Tb/p0Ca8q1O2S98xqV9PlunQy3NjepROAJelEDGT2Z9jrpOJYXIZQMs6wBMD4QvnrcrJ
 wcrsUUIm3icd96NXAA7VGGXti4OnEGDFNyrMz5VSDVu4tYVlsnsPjv2EGGrgB7493Rxy
 z4dZnYLvHqj8F8g5mv640QqEdGNO3qUzgEE84VM7bT/yl7dYLX8g1GwS3QYK1xBu4pet
 jW/Li2IizYoe1UNL9j+l4EJJ8JWz2+QsCjJU5bzqcAqbZk6yCoBuw0JII1Wjs6c5wqvO
 55Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTU4sEoIqahgtbRxtGwCPyux8yYX9tvbUrrPAePL4bg=;
 b=NC5QPBSJOfTp4o5ydzEZ8rmHzwlU8kqtgNomjcsqk318vBOymgSXwmOoXTGqAOD/Dd
 dYsZyIA+1sD8kjywXRnAd6RNw3TGsQ2RlNewtAcvO51++e0hWPAGfCLC2r6SByP8L017
 UDZH+2GOmODN3P0n5dLIaQWCZEQXeOdq6f8E8/oOF/K42GXps6VVEYlhRU48bVfQSIuN
 25m6J2PYDdI33ojhf+6GZTiQS3nv3024SllnV5DiUBHEsiQlnLdjPuNwxGpqEsZJwnfG
 kLoGha+PovWEUI5PifKM+0ra3gFLoH2NM6bmJmW4J5ih6aYWbenC3EhtwVWeuR9GwP8n
 QvHA==
X-Gm-Message-State: AOAM531d4pz2INbn5tTZ6jQTzfugjTHX8KJHP6wIhaYXIdbj1OI1liI3
 xinm1/qCeHXD6BUtdae7ISxNrvXg5i4SDW0OMmhBT7N/fw0=
X-Google-Smtp-Source: ABdhPJyHwRsyhB13QTlosYmLpLl27UUpJF4urKsj6GPSDq7rGMSp5OY/abgUqi8YR8nydzVaUSyr8k8KMzlGZt3OAQc=
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr5640374ljh.44.1600091842334;
 Mon, 14 Sep 2020 06:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B-gDH93SakoGOYmKCLwh-JPuiePm53nru-zvx8MPd9tA@mail.gmail.com>
In-Reply-To: <CAOMZO5B-gDH93SakoGOYmKCLwh-JPuiePm53nru-zvx8MPd9tA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Sep 2020 10:57:10 -0300
Message-ID: <CAOMZO5Bq5kfk5TsH8ZGzB46Bts0PUoD2ARRd=N+t7a6hYPp+Ow@mail.gmail.com>
Subject: Re: imx8m: Failed to attach bridge
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>
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
Cc: Robert Chiras <robert.chiras@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 10:52 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Martin and Guido,
>
> I am trying to get MIPI DSI panel to work on an imx8mq-evk board.
>
> Here are the changes I did against linux-next 20200914 following what
> was done on imx8mq-librem5-devkit.dts:
> https://pastebin.com/raw/GXazRyNx
>
> The config I am using is this one:
> https://pastebin.com/raw/UGAjTQyg
>
> This is what I see in dmesg:
>
> [    1.666974] mxsfb 30320000.lcd-controller: [drm:mxsfb_probe]
> *ERROR* failed to attach bridge: -517
> [    1.667309] sdhci-esdhc-imx 30b50000.mmc: Got CD GPIO
> [    1.675977] mxsfb 30320000.lcd-controller: Cannot connect bridge: -517
> [    1.689620] mxsfb 30320000.lcd-controller: [drm:mxsfb_probe]
> *ERROR* failed to attach bridge: -517
> [    1.692019] mmc0: SDHCI controller on 30b40000.mmc [30b40000.mmc] using ADMA
> [    1.698606] mxsfb 30320000.lcd-controller: Cannot connect bridge: -517
> [    1.711321] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA
> [    1.721418] mxsfb 30320000.lcd-controller: [drm:mxsfb_probe]
> *ERROR* failed to attach bridge: -517
> [    1.730422] mxsfb 30320000.lcd-controller: Cannot connect bridge: -517
>
> Any ideas as to what I am missing?

Nevermind. I got it to work. The 'dsi-lanes' property for the panel was missing.

I will submit a patch later.

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
