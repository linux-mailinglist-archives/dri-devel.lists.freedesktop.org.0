Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F17025EF
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5FB10E157;
	Mon, 15 May 2023 07:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE65110E023
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 15:32:26 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-643b60855c8so9888606b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684078346; x=1686670346;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:from:to:cc:subject:date:message-id
 :reply-to; bh=odfI42LfjFjYiGmwpoXU0rW2oYspEJ1vTnNK/Z96H8c=;
 b=OnVJnmY6QHxGZqUdS0J3SREG4B4wqa4mOHwWZf0Cd2ILURG9dy2xYYah2nmv74PlK8
 b10o554L4nfXz06SWtlIIVhNQLmW2dwnDsiBwcjVppTsVA59wUMH6ReeZ066yRtPEtHy
 nsSUMzA/Q8fI1bOpl8l7AxUX5E6J9hqY2N5m0u/TzzjfLznBegcyKVrB9u13PUuSbUkV
 sdBX7NTRZUmj4uy5nE8luQUooFhx+shX1O2f6QvioimTQrqAOVZ/V/Nmgr5jL7E8VvGr
 QrCIdgUaMmDRVkmvHtLesSUyVKdbssBXUxukxnZ9punOcGEiVPiraAFLB1mWLK5J7eWo
 CdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684078346; x=1686670346;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=odfI42LfjFjYiGmwpoXU0rW2oYspEJ1vTnNK/Z96H8c=;
 b=NMNJy3ktnqP7gTaX/2/a9MjnlD8ajuOWCjdR+MiScB6YzNQBIWZllxdTiya/ZhhES3
 9BELDP9Rmt2zfpEKTJXT0gXZDS84j4crBUtwCafDyI/PW3buOVRGljSBZz7hF4c4DGmY
 yQoRdwDGgVIf9/5fswMO3M482EsgvchNJYgI01ZwRf6EUcORk00u1dr8/59saj/NScnF
 x/YDbk5f8gnxS/ysHBg2b5W10IEN75nGI4rReIewYYziZOTa+ynCJkS4oDIS3IEKoPhq
 ES9UqNzt9XB0DvELUVAPD7S32H/hPy6UWSvtGusScnOJM1LRVUVzXK4JakXJSQ87qR9d
 AtgQ==
X-Gm-Message-State: AC+VfDwMRJY4JMN65LRiKkbQZxSO3fUqHjDazr1Ed/Qc0rydxTKCZSs8
 0BleIrYSg+tJpv8z7dS09w==
X-Google-Smtp-Source: ACHHUZ4n2HyH6Ze3g1I+wxRZZDTQyiZB6i+vO6JhaJQwzmorCJl0hsvRi9t7bHVxgYAMXsZjv2SAuA==
X-Received: by 2002:a05:6a21:32a2:b0:ff:6120:e9b9 with SMTP id
 yt34-20020a056a2132a200b000ff6120e9b9mr37183414pzb.39.1684078345683; 
 Sun, 14 May 2023 08:32:25 -0700 (PDT)
Received: from smtpclient.apple ([110.226.25.172])
 by smtp.gmail.com with ESMTPSA id
 c16-20020aa78810000000b0063b7b811ce8sm10135030pfo.205.2023.05.14.08.32.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 May 2023 08:32:25 -0700 (PDT)
From: Swapnil Raicha <raicha21swapnil@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v1 1/4] drm/panel: simple: Add AUO G101EVN010 panel support
Message-Id: <4B9C9FF7-F338-4449-8841-BCC3D423EB76@gmail.com>
Date: Sun, 14 May 2023 21:02:02 +0530
To: alex.gonzalez@digi.com
X-Mailer: Apple Mail (2.3731.500.231)
X-Mailman-Approved-At: Mon, 15 May 2023 07:18:38 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

I am currently working on STM32MP1 based custom board and using the =
auo,g101evn010 panel.

The panel comes up but the colours are not as expected.
One observation is that when I pull down the notification bar on the =
Android Screen on the panel, due to the overlay of the notification, the =
colours in the background seems to be perfect then.

Not getting where to look at for this issue.
Seems to me an issue related to DRM.

Can you please suggest a solution for the same.

Waiting for a reply.

Regards,
Swapnil Raicha.=
