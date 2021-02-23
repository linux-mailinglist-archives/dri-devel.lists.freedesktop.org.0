Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10532230E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 01:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7CB6E216;
	Tue, 23 Feb 2021 00:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5379C6E216
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 00:15:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E562E64DB1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614039325;
 bh=yuNOWr6epIq3Wlud5uP8xIKIBMjJK2yn5SDZKLuyorc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nrrOAOWhfAxrqBqW6zdUQ9AYIhXMj3+rx9v9TXWmfsANW/laPnDNqyAGxGTEZ98RN
 +AnwrVg8CwGgPxmGewY3V00oZ6sagoiACyRiUTbAKleHSpewk104VyuffC91Gx3KI+
 InO2coU3mvrT+Vb9pt+FMJuYz+TXXuTZ4IxvTiprbhlbHAf9VdjhSZ71muJhOg49x+
 KW1qwApz6TQAf7yId7JjVQdwgOFUURqz3JgkNQmBYODVCAIZhyR2DaoJ/xULqHaHDc
 FSaK/55HNWEbzWeCgQU8lXn0D72Htt62P/h7TWn/pqHr2/junFYpgUUl9+GE+31M0S
 H5ymCZqDOdQkQ==
Received: by mail-ed1-f54.google.com with SMTP id s11so24085151edd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 16:15:24 -0800 (PST)
X-Gm-Message-State: AOAM532LssTMRMsvPxEv6XmP2K0MjGi+BIUc/TZbHjNi1d7iG2z4Inyb
 7zLgk3hl+h2roMbjZgFVbdO03T8lVQ9hrIqfmw==
X-Google-Smtp-Source: ABdhPJxC1NKoxwxD2oa+gmcOFlIXozbx4BR9iOXurfi4O1cDdre+NLJfpRIzrex8warqlYx35YmdXAQJQ76fqo/y0Jc=
X-Received: by 2002:a05:6402:164e:: with SMTP id
 s14mr12469239edx.62.1614039323392; 
 Mon, 22 Feb 2021 16:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-6-sebastian.reichel@collabora.com>
In-Reply-To: <20210222171247.97609-6-sebastian.reichel@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 22 Feb 2021 18:15:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
Message-ID: <CAL_JsqLmcRqFW5ufy-zY9dfqpiwACxfOHrrGphTx2UGMBVj-7w@mail.gmail.com>
Subject: Re: [PATCHv1 5/6] dt-bindings: mtd: jedec,spi-nor: add sst25vf032b
To: Sebastian Reichel <sebastian.reichel@collabora.com>
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
Cc: "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 11:13 AM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> The binding is already used by the driver. Update documentation
> accordingly.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  1 file changed, 1 insertion(+)

This is now DT schema format. Landed in Linus' tree today.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
