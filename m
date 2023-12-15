Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35728150E0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 21:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B8210EA8B;
	Fri, 15 Dec 2023 20:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9989310EA8B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 20:09:54 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28b24c3def1so218264a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 12:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702670994; x=1703275794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C+VJ0FqQo5AdQg2VzGJ+KH4fOPDcPDhTzbSo5s9hBao=;
 b=Jc3/vj550+lwJHMOGmayfcCCQPYsGk4u7mASxXB54dpE4eavRgGgf+0lmAjALn8p1B
 cAV/fROhFrACWbY8FU/XaOLnNCm2zwX9FHQdFm5i2DZ46MDOg2t5S3lHCCwJzymualK2
 6zPLlrJV9KZY9/Kfa9UTnsFXbBXLrEZQiXcP4PLfXwNoGmXTl+2pujIvtDIoLjJ00bWv
 GJ6Cop16fgSfj0Z2mjSzLhbyRb9GDAVSUYHlBYP9kwV6pZchurqwPhVvPNzsEwJePDoC
 ttSklrg1yh3HHiAmYOZorvGwKkVfX0+Us7Tmtbena7Ly0vsvp+PWzFS8hxu5odM3/IKD
 WOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702670994; x=1703275794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C+VJ0FqQo5AdQg2VzGJ+KH4fOPDcPDhTzbSo5s9hBao=;
 b=d879muorNVfyPCF7NLK9CJTVDinrQHbrBMpnZxIdPk0kHzQ2WarG941zcEXI0asHK0
 oG4wmLm8z/IHPzO7PvSlZe0/FG0lIOmuH5OiiZIAy3U+oB466+h6MxorRVVoKcQSvPsh
 CauYRXO9q0lThMj4w7t6VhPSBZDMA1lKrOlCx2uoqWkqaOauPHHo2m7JJgzOwYdgOFG4
 THwesXfsTnThZxNr4KLVM2uQ6XGWnnJgWbavPHrecopuzqFVp9d47SJxqglYoSpgv9pn
 hqpzBILiKqe+Ijco2JlnS2D8e/ULMrcRCe1rivXHH9UIgT+NuNwotTq6B9aW6r5JBsCR
 zwgQ==
X-Gm-Message-State: AOJu0YxWttH2oqydLlL3a+ujPRMLThBgMk9R92KCR908DnfFnyvo06Yn
 mRTd/HKrInoTdpZjBspb9o7hnNPI/oJKBKVg0DM=
X-Google-Smtp-Source: AGHT+IH0DXnC8KtSTlCfY3zBgia7xIKVCPq2dsDSXxN0++zrX2TSX0wTvnY12iw3YyDWDu8qyD912bXhS1F9P8+/IFU=
X-Received: by 2002:a17:90b:3a82:b0:283:5405:9e90 with SMTP id
 om2-20020a17090b3a8200b0028354059e90mr20790095pjb.3.1702670994085; Fri, 15
 Dec 2023 12:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
 <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
 <CAOMZO5C7_Rj-Ja0BO0D0Po+gy+XbvyMdQf-wH5YNyhAdMof2vg@mail.gmail.com>
 <20231215142308.GL21146@pendragon.ideasonboard.com>
 <CAHCN7xJPg_Nk=o9fKwkZfVTNSB-YL0m7vY6p1O7+i=PHShp7hg@mail.gmail.com>
 <CAOMZO5AGAkPpds=5H-iQj53djcQtW5GsRQrzdC_JOOrcENhvvw@mail.gmail.com>
 <CAHCN7xLHMGcS2-QTneqqpHYU66JwuEG4TyR0j0riFGqO6RC8ug@mail.gmail.com>
In-Reply-To: <CAHCN7xLHMGcS2-QTneqqpHYU66JwuEG4TyR0j0riFGqO6RC8ug@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 15 Dec 2023 17:09:41 -0300
Message-ID: <CAOMZO5B2bWVciDEwSh+YQWu6b_Hp5ijk6Jq-bMePPTDRJ-vHFA@mail.gmail.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 4:01=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:

> Thanks for the list.  I was able to successfully build the stable 6.6
> branch with those patches applied and I have the HDMI working.
> Unfortunately, I get build errors on the linux-next, so it's going to
> take me a little time to sort through all of this.

If you need help to figure this problem out, please let me know.

I haven't tried it against linux-next.

> I am thinking that it would be better to consolidate all these
> together into one series instead of piecemealing it.  However, there
> are some items that can be submitted right away without significantly
> reworking them against linux-next.  Do people have a preference?

I think it makes sense to re-submit the "easy ones" right away.
