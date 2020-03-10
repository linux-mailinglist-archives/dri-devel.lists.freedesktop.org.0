Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF094180342
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 17:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C2D6E8B1;
	Tue, 10 Mar 2020 16:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D9A6E8B1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 16:28:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o10so8136678ljc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fbz1jLXCinvzVrC5KDou7DJqMCgpr/1HIggat1uzgfM=;
 b=roktgoAHqMWDP4LIaA7o9627aDJpAknErh6GEWkDifCemz3ip8RPqvmJkeuJhIb1OJ
 rumDVmd8ieJK1V1hVCCG3JQMDzG/FKuZ+Fro2WOjK8clbbMYJ4y7c6gaKOckDyptMnuX
 dUr0f+MZNBojdFB/peidvWTyjOn+QdNOlJw2b5Zvp1ViRfwTdQcRG5g+rmHZ5I//IFZB
 Kai1qsoqCj5BtnWeOYHiRS32a8A1YJ+IsUDRJKeExLpPsCJxqBNJy3BTqL0Bm9oNaUlv
 IBw66oDEm8VmaHzl9TUAJ99c3OESvJSWmKwawTE4NSjZ9Wb0v41xMG0VBMUUmWToLqFe
 CAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fbz1jLXCinvzVrC5KDou7DJqMCgpr/1HIggat1uzgfM=;
 b=AkXN3Tg8Kiq98eur/eUUsDFOUGcgpSzqJfSti84MLfIEmm+ZbjcYbRTT143RJ/2YFe
 ue8cf2WGglE+Z4lTk5z6K/CwAQo/w3JJ2Ja/uA3yFkYIO4UCs9s+nfuoRB4ZW/F0LXcJ
 A48xyQonyh6RnTD7YTVeR32Z3wSQON9tT9xVQCV2eeOMdrLZ9yvFWzyORX07SzxsMZgq
 rDbmdAOZioouzdiwqmWWxyIs831sRmj8lDtG9vQtTGQJhx5AgRjGWq5eR0crECmyj3N6
 0Ml9oFxadpIWfYJ22MpnPdMUdypQoxcoKA2ZQ16el1Jtm7NGPmzLjInZ/4IQ0+sTpD1Y
 kKuQ==
X-Gm-Message-State: ANhLgQ30l7c126uRmdKeva7eveE0YQoxRO4qi0P+Sgxjj6aCCELeUkMc
 8fXjCAdobZbha6Y5WrDabEdpmHBpva5qx2y/X/w=
X-Google-Smtp-Source: ADFU+vvIqOVhSbQxNUbHM1/6O6kiK13FKiBQir62iDdvZtgYqoFIjnoZoL/mrBin/Jpfh+Rd0H5iTbIm2OpXKcg4D04=
X-Received: by 2002:a2e:240e:: with SMTP id k14mr13724381ljk.178.1583857724001; 
 Tue, 10 Mar 2020 09:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-17-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20200309195216.31042-17-laurent.pinchart@ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Mar 2020 13:28:35 -0300
Message-ID: <CAOMZO5DmVXjhFpHYp9MoRK2BaazYikJ9R27Sa_S9614e1tNitQ@mail.gmail.com>
Subject: Re: [PATCH 16/21] drm: mxsfb: Add i.MX7 to the list of supported SoCs
 in Kconfig
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Mar 9, 2020 at 4:53 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

>  config DRM_MXSFB
> -       tristate "i.MX23/i.MX28/i.MX6SX MXSFB LCD controller"
> +       tristate "i.MX23/i.MX28/i.MX6SX/i.MX7 MXSFB LCD controller"

Can't we just make it simpler and write: tristate "i.MX eLCDIF
controller" instead?

Otherwise this list will get longer each time a new SoC is supported:

tristate "i.MX23/i.MX28/i.MX6SX/i.MX6SL/i.MX7/i.MX7ULP/i.MX8M/i.MX8MM/i.MX8QXP/i.MX8M
MXSFB LCD controller"

and probably more :-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
