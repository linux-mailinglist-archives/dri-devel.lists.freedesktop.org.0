Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7497F6587
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D8710E2FE;
	Thu, 23 Nov 2023 17:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998210E31C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:35:13 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-27fe16e8e02so216620a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700760913; x=1701365713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38QmMR5qWUUF3d4ez46gu28mY2bkSgtw/0YEKPuilA0=;
 b=IBD8BiV8GhXr4+71o6eVrFOQy4TTSJXMHBvagOSnYFTyfof0qTN9Pe7UNpRcjdLcIx
 e+zJVR5sRT/F2OAA0uTjiC0Qsn4IAgtApLW7fSrqHOzrss6J2+IfRBVnyEorjgc0XjPV
 s3Cn6epGc5VHfPh9WQTl4yI+ZKECoNU5Iu+55HT4/nb/vnOn7bNMLbrz+QAl62OBTrSA
 8jZQaFwFWaJYu/r7bOU/1CpQD6AqymTnFlIYA2spskyZdq4IhaKQJdNAoBlkmOjymDf9
 Jqq1X+TCpTdh9WWwxF3sbF4JNGZ/Vfs1DrEG7tm0rX9nh1qT1ejgXFujZ+VyQtccNCpp
 T98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700760913; x=1701365713;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38QmMR5qWUUF3d4ez46gu28mY2bkSgtw/0YEKPuilA0=;
 b=WDjcb2PKGtlFBsMw1jeXjnqzztfhBYbQ6Ilv7zUV1w6nUZm/DZ0YAulF6AQaFTr3Vi
 jyw9PjPQsoyZpl0CrDWapekiuyslw/kWXKz/b5OK+OIw5RaJNIPnfqie//vXoFWTO+H9
 dXlwQWfmliTN8ZsCiGd54SQsA4Fnz2yvns1gVwZHafNN+t6Ak/dCvf+m6DxiadzCIV5p
 RqupX0J8N4uxeP/HTa1CDU3Kp2aXL39o9PCHLqvJFBwOK9XpvpST1Jaj6B/9d43oXrUU
 9LiHzbRvS4fQFvwy58hA0uFcrcoq+Ee+FtgxdcCUjnq3JgkB+YWHBmehVfDiWbPYw0XI
 BiFw==
X-Gm-Message-State: AOJu0YzX6Ij19YqDY9XzFHX2W87M+VBJu96zIvRxE2jeOLTaHTMeOecQ
 /LZfJOCzBDQD21ueS0VzaV8H04c2AZLb4rVkNF8=
X-Google-Smtp-Source: AGHT+IFGW/2gXJJfrwZoVQS9zLQTzpLwxsQQ8h9r+ECWZJzpIxMh+72P7SUi8H0TFJLCoVsNpbxuqQEjZn/Ptw0QR0Y=
X-Received: by 2002:a17:90b:85:b0:285:8609:4974 with SMTP id
 bb5-20020a17090b008500b0028586094974mr130618pjb.4.1700760912639; Thu, 23 Nov
 2023 09:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20230928125536.1782715-1-l.stach@pengutronix.de>
 <20230928125536.1782715-2-l.stach@pengutronix.de>
In-Reply-To: <20230928125536.1782715-2-l.stach@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 23 Nov 2023 14:34:59 -0300
Message-ID: <CAOMZO5CYX8ihTQ87zi3maARWzz+PmLKYBBJGVn69Xig2nAwqug@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Lucas Stach <l.stach@pengutronix.de>
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
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 patchwork-lst@pengutronix.de, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Thu, Sep 28, 2023 at 9:56=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Marek Vasut <marex@denx.de> (v1)
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v2)
> Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)

Tested-by: Fabio Estevam <festevam@gmail.com>

Could someone apply this series, please?
