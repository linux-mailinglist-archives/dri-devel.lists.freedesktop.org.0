Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050C6811F2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 15:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E44F10E25C;
	Mon, 30 Jan 2023 14:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3199D10E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 14:17:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D5AC8C99D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 14:09:44 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 003BA1C0018;
 Mon, 30 Jan 2023 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675087780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KD4t6AFD7zWRuav/9wfKI/33NlxRT+vOROmFd5NS47E=;
 b=ldhsz/T6pvQk9zJ+osMNoqfhUEntk27/80Ft3G6zKe2Roz+Zgcx4HSuwH9VWfGvcYwxyJu
 2Uf43LiYczJZQDCWMzegUMOZTV2SIdik3qb64ONTophqff7ObdB4h6ExKbvomDlI6ThUTA
 67TCnClen+rBEHirq2hf333lEG1G25vOO/tx0S0Us51dcnGGQD77xjbdnrtL5p9ucchTtQ
 qc8TMEF7BBdhaJ5chrEB/qgkpr3PgIIqcFQgYrHmqCKpbW1oBB6+kmGxZxByQLiSnuYWni
 T8NziJRpHdFAgJl620jTp42QKKDTrxvonvf1DLsGah582qWwPbbNtshBXE9XYA==
Date: Mon, 30 Jan 2023 15:09:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v3 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Message-ID: <20230130150936.381f4008@booty>
In-Reply-To: <e426497b-0421-1bc1-2a72-871b0e2d48a4@collabora.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
 <20221229133205.981397-2-luca.ceresoli@bootlin.com>
 <e426497b-0421-1bc1-2a72-871b0e2d48a4@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Wed, 25 Jan 2023 01:15:22 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 12/29/22 16:31, Luca Ceresoli wrote:
> > VIP is the parallel video capture component within the video input
> > subsystem of Tegra20 (and other Tegra chips, apparently).
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Please feel free to add my r-b to the rest of the patches. I looked
> though them and haven't noticed anything suspicious.

Thanks you very much, I have applied your r-b tag to all patches except
patch 2 where you spotted a mistake. v4 coming soon.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
