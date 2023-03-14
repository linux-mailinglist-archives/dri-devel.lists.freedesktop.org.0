Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445626B86EC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 01:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD0510E6A8;
	Tue, 14 Mar 2023 00:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE3F10E6A8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 00:31:44 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id b20so8725773pfo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 17:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678753904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTki4dq5GO7SRaR6dQWVXUZKBjk5cuLTvV6wXNGOXZI=;
 b=kG9SDioQdfpzSQqbDMldHb4Yp9/tE/B0C7md2nApwBu2DmrxG++UGk/9Pvut12KT7W
 FJF2qQTQn3pYC+w80lV4oUJhCaRt1pT4sz1V6e19kg7MtuPK8M+/wnyJbV4FRm06gai7
 fNLIRfzB8tvxfITyklM0JYygh4mCZGW499fUSnQSWfNIprNob7oeCNC8i8/yfOZF86xp
 1B7mW+oS5Oi/BHZwDS8MylzsbelLSf3wj64wyUwrtRo7HsQT1uTqCE08XFM+RGYueRF9
 XZ86GkPxEhmdJuhPtdaD1d5Hg5Cd60Bmdvdth7CheviariDJpZvaZWdAg1GFqu78VSH9
 hDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678753904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTki4dq5GO7SRaR6dQWVXUZKBjk5cuLTvV6wXNGOXZI=;
 b=7BDziIadvj+BtTFF6mBGuaKrxMko6Hf/LB5w1F1fq/BtZJMEyi73mDdO4QYduI3MkJ
 Da7zEYItdo+1cwYNvsIGmIIGjsOtYIxwu5x2UgDpEgqpGuUxwFsdW5tlebVIWtXO7t4k
 ditN4MHp0O0XQHByWeOC5Kz5gZvnVWvx1a3oZN4pTM8+yeQ9m/tpzZDaAZxjibiaR8rm
 2JTm8MZtW1BfJMQqQELCX0kzDsL7diFCpsPFKUPXSNBO+7yIKbUMTo873ivyEoEqMRX2
 S5P5hVDQMxoex5vpflC3CW+1xb/pReO/y+GosxXCrB393inQmRQ8Xwfc4Yt3Nd6zXvc4
 yvdg==
X-Gm-Message-State: AO0yUKXSyghdbGESXk8sz14F24unJToTwy0+O18gYR1WBebIIgbcw45O
 kTCWjuW8/OdD39sAhppU+vVy4n5KPK0Ze/pGb+8=
X-Google-Smtp-Source: AK7set8Vv87JbVevNVFuCmJU7DZp3vlkh+pkO9cJwwzGyhMTFMNrcFLcN653o0pHhYKr8woQJeggOfYoA+tDUWzjTow=
X-Received: by 2002:a63:4d07:0:b0:507:46cb:f45b with SMTP id
 a7-20020a634d07000000b0050746cbf45bmr4300161pgb.1.1678753904383; Mon, 13 Mar
 2023 17:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
In-Reply-To: <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Mar 2023 21:31:33 -0300
Message-ID: <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki,

On Mon, Mar 6, 2023 at 2:24=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen Pl=
atform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:

> Seems some issue Marek found on testing. If fixed then I will try to pick=
 this
> patch series up.

Marek has successfully tested v16.

Could you please apply v16?

Thanks
