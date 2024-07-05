Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20A92893E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 15:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD96C10E264;
	Fri,  5 Jul 2024 13:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="RYIHpHiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 522 seconds by postgrey-1.36 at gabe;
 Fri, 05 Jul 2024 13:06:17 UTC
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB5210E264
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 13:06:17 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id 7336E1F9C8;
 Fri,  5 Jul 2024 14:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1720184251;
 bh=WmEhNgDAEyTZUHGmtQezCo9iVLbCkSzU0LJjSId6A9s=; h=From:To:Subject;
 b=RYIHpHiA0QZ3wLmsP1vKyCuRUc0DKvv0COFTjmBHm5fEDEzKdHIo0SaP1OpdqR1t0
 j60Xw390URTSJKHFVKtq+BuPOGSqeEanvkYkq0S2zrscWacY1AAboZXhKP76DQwnJs
 9OW2pDuBbg+mo8La7WBFzpCXb+pUghVvvMkZFFeg/t/ktEcriC8Dg9r5pw39Xm6fJw
 cvKkLrL/MPY77iVjnESuq+rDCLI2OscATmE7XIEPpMaUJB0N49+KswB3R1Om9sywrw
 SJvSNDGUY1kEpzvSkqJCajvgb68V57wwKMRBytzidogpZtLlAJ+j4oJeKOKa4rREdh
 4tPdlXxijpk2Q==
Date: Fri, 5 Jul 2024 14:57:26 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, tglx@linutronix.de
Subject: Re: [PATCH 00/10] Add Freescale i.MX8qxp Display Controller support
Message-ID: <20240705125708.GA73712@francesco-nb>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705090932.1880496-1-victor.liu@nxp.com>
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

Hello Liu,

On Fri, Jul 05, 2024 at 05:09:22PM +0800, Liu Ying wrote:
> This patch series aims to add Freescale i.MX8qxp Display Controller support.

I really appreciate your work here, I am looking forward for a better
support in mainline Linux for both i.MX8QXP and i.MX8QP.

With that said, would be possible to add to this patch series also the
required changes on the DTSI/DTS file to facilitate testing this?
Worst case you can just add those as RFC / DO NOT MERGE at the end of
this series when you'll send a v2.

Francesco

