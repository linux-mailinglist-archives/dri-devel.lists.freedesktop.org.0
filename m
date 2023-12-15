Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C8881494B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D99410EA18;
	Fri, 15 Dec 2023 13:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E69B10E22E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:31:40 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d350ee90b6so466515ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702647100; x=1703251900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4Ih0UOvEfVG+nQnrdqB5s4Pz+XjqfiR8vjpvigLk7g=;
 b=FEElCzY/jans55FoOYxuNABeKB3KFpHfN2JXCBONsVwY17Dxrro7R1NLESmqdzZdYA
 fDPsIZ7MQTKkWZ1EfNfNUpAiEG7rZAfi/ov2V8LL4vHBW071z0fF1q7Bn7lhhfCHET+P
 NvaJIMWoEuSLvjYeIb2pE9Gh4Y4Cy3YnTsAXyduE61f2sLWi1L0iaNv0x6hPL3oEJ01r
 KFQwRdyGJpKJL6IDU8RBIVl0oODIFEvqlNoLHQBwxT7VfSJuTT8LrKImXPVmx3UDBrhc
 fymyuTz3iL1/D892gGNaeiw37fEitBBOb+o51i6mLMCtkmXCPOX1U2RSz1zMSv2SP+gv
 K5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702647100; x=1703251900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4Ih0UOvEfVG+nQnrdqB5s4Pz+XjqfiR8vjpvigLk7g=;
 b=i36KQ2QhQfzuggavmU4jbIFn3up63q0H8Sqv/Xz6noRH+QWhSduAC1YZ0Z5PdeKLWm
 fx/CfTqNnVUxLjWb2Dl8ROVMHkmkBFy4t6I4DPmFQW+3AF172PU8SVembgQIxKwAqo3l
 aO3Po2KL9PGVMYHz6Jj3fVjpcx9dvdwshFmEq1gl0ydBHL+5ZfrViQl6sXmwJuDEc3AE
 TFtXtiE8A0AjIUGIeoMGEfu4GxSOkhPJaasIWCIRjtqGcJSZC8T9gTTsguPDvOqvd4fS
 mCE+Pu/Tdm3PgYyFapFxdUzfpVAT2ZoyGZI/MmTafp35kiC4jk5NRZKjbHqzc/coOQnm
 ifzA==
X-Gm-Message-State: AOJu0YwMXxTN9V5BsjmNoP80NOWLhb6Or4foK9Chm2xfKhlnpQK1+ybl
 WyAvR4MXilAj72l70VrU7gd89R5XNRbXea5zcGs=
X-Google-Smtp-Source: AGHT+IE1Zbjx1R+YVsNqjRq6pVvRVavL3UDWZKL0eLF1pVVkJ5KeF4jWQ+looR0346nXz6xgnUYtTjqD6aUmJhNhg1k=
X-Received: by 2002:a17:90a:9905:b0:286:7cc2:4c15 with SMTP id
 b5-20020a17090a990500b002867cc24c15mr19727984pjp.0.1702647099690; Fri, 15 Dec
 2023 05:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20230920171009.3193296-1-l.stach@pengutronix.de>
 <20230920171009.3193296-2-l.stach@pengutronix.de>
 <20230920205736.GB7723@pendragon.ideasonboard.com>
 <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
In-Reply-To: <CAHCN7xJz=rEH_8wHaBCVOUzP0kO6cM_c=zLf6ocjW8bt1FaCBw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 15 Dec 2023 10:31:27 -0300
Message-ID: <CAOMZO5C7_Rj-Ja0BO0D0Po+gy+XbvyMdQf-wH5YNyhAdMof2vg@mail.gmail.com>
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

On Sun, Dec 10, 2023 at 2:35=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:

> Lucas,
>
> It's been a few months since there has been any action.  If you want,
> I can help apply the suggestions that Laurent has and re-submit with
> both of our names if you want.  It would be nice to get this
> integrated.

It would be nice if you could re-submit the series.

Thanks
