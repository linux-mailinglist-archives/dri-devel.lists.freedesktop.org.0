Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF6814D70
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 17:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6F10E23C;
	Fri, 15 Dec 2023 16:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A00710E23C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 16:47:22 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6cea0ea6817so130068b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 08:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702658842; x=1703263642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEPp7VwVape+PRLcyc7DkdEl3azZDbUT/G2Ugu6awLc=;
 b=H6X5Znbl3HN4G1aiGNHD9dXhOM9r9x84EG+PpwKhRX/HtjfczBSrXhRD79d9nYEqvZ
 eq4/Qc3/17Tkpr8GiLJcWM87Ky3Kvnt+XDExvayYv4FLqaZSGlEN7+pxz37Gas0BU8jn
 BVWlReRUBQlTiVlRDcJi/UG1ObdxJAxsHexhXPAjhvz4TAEs347FllnEoEfEFv4SRQyY
 ezN/wN6h+D62axKwpMvl42tx/ejw5a/RAGJJ1h4ip2LIQv36sy7XeBPiZXsDlJblKNSF
 YYgAK3dP5nSmE0aqbUlqvvzXnFIYBrzdj5yawZ7lVuGTZ8TStXR03I5PUh0t+PGAiWXm
 ribA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702658842; x=1703263642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oEPp7VwVape+PRLcyc7DkdEl3azZDbUT/G2Ugu6awLc=;
 b=BtQDUxQNJ/GqteWF0+kz863pyUeRPjhRFd/r7cvWbAb5TF8TEzq34tQzWyazDsjQXG
 nCz80rxoC44EPBySS9tQqjf3uvtDyBUfDWqXBApDWsHSo6i8ivzfLJPRS4VuJiSRhsum
 2TBtgptDlg61N796w1xZdB3S/p3YO7mzny+v0CnUgvjtvZxxHzUbhTZ/nQNulWUEFhgY
 IJE0jKZiJA5FGB2e6j4v7yLfsrR63JqBzq8smVpZPUodCpktU7fhYCG2Gvp7aSxZ/sKm
 BfYfewYP21HcRvEk0AZfZ5alV1Kh042vNaIe9PWJmNKXTxJdTMJwmKY0uhDFcC/TPCyT
 i5Xg==
X-Gm-Message-State: AOJu0YzhfWDeDu9Ou94esJNzS2cASBR3PenKDR94EuYx7QeE58snbjlS
 eYa/hQKQKHzqrhMIVaJ0dfTx4ZZNkljRHpCzKeM=
X-Google-Smtp-Source: AGHT+IG6XM/cpbPyvUmpGmMVAIiaAGFLNuv+q8LFxY1OkI/0FMeQV7pk1x5j1JLtN7eqshBjH/oZ0QYQ3ZPAjrH5iWo=
X-Received: by 2002:a05:6a00:4601:b0:6ce:72d7:1e74 with SMTP id
 ko1-20020a056a00460100b006ce72d71e74mr25061297pfb.2.1702658841835; Fri, 15
 Dec 2023 08:47:21 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
 <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
 <CAOMZO5C7_Rj-Ja0BO0D0Po+gy+XbvyMdQf-wH5YNyhAdMof2vg@mail.gmail.com>
 <20231215142308.GL21146@pendragon.ideasonboard.com>
 <CAHCN7xJPg_Nk=o9fKwkZfVTNSB-YL0m7vY6p1O7+i=PHShp7hg@mail.gmail.com>
In-Reply-To: <CAHCN7xJPg_Nk=o9fKwkZfVTNSB-YL0m7vY6p1O7+i=PHShp7hg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 15 Dec 2023 13:47:09 -0300
Message-ID: <CAOMZO5AGAkPpds=5H-iQj53djcQtW5GsRQrzdC_JOOrcENhvvw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Adam Ford <aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sandor Yu <sandor.yu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On Fri, Dec 15, 2023 at 1:40=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:

> I started looking into this today, but there appears to be some
> dependencies missing because the PVI is just one small portion of
> this. The PVI needs to interact with the hdmi_blk_ctrl and the hdmi
> transmitter itself.
>
> It looks like there was at least one attempt to push the hdmi driver,
> but we're also missing some hdmi power domain information, and the dri
> patchwork lists a bunch of proposed patches for the lcdif driver.  I
> haven't looked through them all, so I don't know if they are
> necessary.  I found a git repo with Lucas' stuff, but it's based on
> the 6.0 kernel, so it's fairly old.  Either way it seems like there is
> more to the HDMI than just his one series.

Here is the whole patchset that I tested against 6.6:

https://patchwork.freedesktop.org/patch/485391/
https://patchwork.freedesktop.org/patch/485392/
https://patchwork.freedesktop.org/patch/485395/
https://patchwork.freedesktop.org/patch/515299/
https://patchwork.freedesktop.org/patch/515300/
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220406153402.=
1265474-12-l.stach@pengutronix.de/
