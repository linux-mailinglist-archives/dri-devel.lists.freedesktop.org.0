Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF48470EB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 14:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5A610E785;
	Fri,  2 Feb 2024 13:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EKjQNBvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9D810E733
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 13:15:19 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6dfebd129a1so1006678b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706879719; x=1707484519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWWxDbFc1s0H43msZb3R2yZAbYlHwiF4o6Dt1xNyb5c=;
 b=EKjQNBvHNSxm43rcm2yBi2gqJRD9NpRDyLAlnIvoSGvG5TeNlx4Qhe2DE7Gk/j/a/c
 NaL54KJZOIsSeBXUHTLJClOXwZMI426G1jklPz5zKvMHxztLo8gJnBl0DJBcxsTshPT8
 YGfv7f6gzTqX/jz0hLjQn2O2ef0oi3Se5/sORcOY6X8a7xFPsavXe2P9C1+v0Rp4R7ht
 mxwsPYcUDbxRBx6xWW2TUz1wdr5ZUCmltr8Z7CFlJxJu3iM+iFD8Zm3pb4ZOq+7+TEpp
 fEDmYuMbKl71mLHxzcHLEQQR62N3NVU9PihU6rN/HyyVLuCpS3J0+esQkYVV3BaRjzPQ
 0M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706879719; x=1707484519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWWxDbFc1s0H43msZb3R2yZAbYlHwiF4o6Dt1xNyb5c=;
 b=q7KH+csPp9JkzXAJR0Z+Lo3jdBIVtjBFrBM7akbjiTTDWwCjwacrmySoeEArstvuaC
 PK9KjZbREwDtLyO/jaUwAxnyiycbHT1j+Qxp9IAnqbF/7RUEgq+42heTvvxx2hAzKcJW
 gVmv1YE4wTfuUp6N+GpLPNxCxMn55wiCdl1pY8A1rtqSFCd67JDGHPMcjwqqZgi1iHYp
 cGCGYvhyIRzUQC1z2xYvyYdyH/bdGQsPpMBVKhwNwupAxnk2V8UKwDDTnB6ziF31oW00
 Uu9N5QYGg5gjt0eX/NK8gxxZunTw/LR1eA0HtRrDNCgPhpporNMcjp2VVMvaMN/AMW0d
 AmRA==
X-Gm-Message-State: AOJu0Yw330+JQ11Hr0pbAzRNony6oE57BNPk1HoDIFSEop12N/t+Xh/R
 mW2KNST57XychS8ADSLwqCT3ntQ7ev/+UmLjxoOnccJra9aHKafBQIu5j7YKYGVDd65t5owdlWL
 /tWfXoIC9yq01Y/bZyx7Ib8blpqmjtBgtRrY=
X-Google-Smtp-Source: AGHT+IEEv/kGQPLAUBTIrzRoVfYRzZUzQ0pExjTA1QXrHHzOYJs3MVy1uMEAGhNsUBAO1SU8mvJcclAlTx41fWfFVN0=
X-Received: by 2002:a05:6a20:3149:b0:19c:9c77:853c with SMTP id
 9-20020a056a20314900b0019c9c77853cmr1606806pzk.33.1706879718762; Fri, 02 Feb
 2024 05:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20240106221907.325127-1-aford173@gmail.com>
 <20240106221907.325127-2-aford173@gmail.com>
 <20240202122036.7aa66d9d@booty>
In-Reply-To: <20240202122036.7aa66d9d@booty>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 2 Feb 2024 07:15:07 -0600
Message-ID: <CAHCN7x+Fyy76_Qo0757fx3bjg5RWUHU=NQHJu+WenSi9PQrwOg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] phy: freescale: add Samsung HDMI PHY
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, 
 Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 2, 2024 at 5:20=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> Hello Adam,
>
> On Sat,  6 Jan 2024 16:19:05 -0600
> Adam Ford <aford173@gmail.com> wrote:
>
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > This adds the driver for the Samsung HDMI PHY found on the
> > i.MX8MP SoC.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> I had already tested the v2 from Lucas, however I also tested this
> version which works as well, on v6.8-rc1, custom hardware based on the
> Avnet i.MX8MP SMARC SoM.
>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
Thanks for testing.

> Generally speaking, as there are several small patch series around which
> together implement HDMI on iMX8MP and similar, I think it would be much
> easier fore reviewing and testing if they were grouped into a unique
> series.

That will happen for my next attempt to push this series.  It was a
headache for me to gather them all.  I have a github repo setup with
my latest edits here if you're interested:

https://github.com/aford173/linux/tree/for-6.9-imx8mp-hdmi


adam
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
