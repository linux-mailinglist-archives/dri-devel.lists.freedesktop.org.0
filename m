Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE012E81CC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 20:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5374089B95;
	Thu, 31 Dec 2020 19:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F002889B95
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 19:19:21 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id v3so18063555ilo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 11:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Z2xI8lRFtXgUuANWqeMfptI1eTIpO7AT0AspslO1UA8=;
 b=quDJUp3N58uf++CFv0VpLk8t036sH8pVEyY+VYTF67UtltGbgcQRoZ8bvbo2QehApZ
 mYW5lpMWQMqdJ07xwMbw6TdtnoimcdHrj+Q1b4TVhB2PRPIzwwBvMCeIm2/dTqzypGwH
 hbbZxj9aadjGwPV3uTiWrsTT08WiQs5gV0Ix/MbVrHyArIGpj88vNeqRTa/99EZRoLR9
 SfCg7wlb7fVKdeOR7aNC06rOb7iHeLV5VKatpI77YsjvBC0/Q73CFsXFNgTIuxKKZa7+
 V1V9Kwr0ftL4T/PLWC2aeapKLBgE+ZzgHkIy0HLMgVqTF5nSsfCFKCpCi67FVry6b1Jj
 uhoQ==
X-Gm-Message-State: AOAM5331Z8N9DVZTrjzA++AJSpXUc4HSZyEyc+UR1tXY9UPG/hOodzNR
 HXlKIkvQ7Znmw/VhRHj31Q==
X-Google-Smtp-Source: ABdhPJxIXgn4WILo/4bkwjAZlJy3+pHbkT+PCgIMDqt4hnb+1h5cI34oMz3nEVSjFMXtTqvmQtPIuw==
X-Received: by 2002:a92:dcc4:: with SMTP id b4mr56780430ilr.164.1609442361369; 
 Thu, 31 Dec 2020 11:19:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id d18sm34083838ilo.49.2020.12.31.11.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 11:19:20 -0800 (PST)
Received: (nullmailer pid 2202140 invoked by uid 1000);
 Thu, 31 Dec 2020 19:19:19 -0000
Date: Thu, 31 Dec 2020 12:19:19 -0700
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH 3/3] dt-bindings: mxsfb: add compatible for
 i.MX6UL/i.MX6ULL
Message-ID: <20201231191919.GA2200237@robh.at.kernel.org>
References: <20201218141035.28038-1-sebastien.szymanski@armadeus.com>
 <20201218141035.28038-3-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218141035.28038-3-sebastien.szymanski@armadeus.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 03:10:35PM +0100, S=E9bastien Szymanski wrote:
> i.MX6UL/i.MX6ULL have eLCDIF controller, too.
> =

> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  Documentation/devicetree/bindings/display/mxsfb.txt | 1 +
>  1 file changed, 1 insertion(+)

This will need to be rebased on this:

https://lore.kernel.org/dri-devel/20201007012438.27970-2-laurent.pinchart@i=
deasonboard.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
