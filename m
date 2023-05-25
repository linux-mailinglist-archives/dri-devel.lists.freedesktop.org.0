Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023ED710284
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 03:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7D810E0F8;
	Thu, 25 May 2023 01:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D4410E0F8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 01:45:50 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ae5dc9eac4so6773135ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 18:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684979150; x=1687571150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmRyEnm3o0xt10apdc5Jzi2N4nwke7v1h2bvJhvh2Sc=;
 b=Y3VYsLdjT+hFAlWXNNJMthzUBHpsDCRFb820qXsc/dYqkVtHF46gI3sr9FoFAWpmPK
 1hlm+mf5z3p6ji9v+ZKTzT9Ud/5rOifiPxtctTEXhN/mYcTdQDJly13O6L6po9HumSPt
 THtVdpIFaAlFFnWJP/r+vRUM6dx7pcP0G5kqLTY7VncJnXGG/IlTurL00mcU0BLpVez4
 1FPwZH9pfW3M5K0pTI8n8cv+3DPKkIVse8MWf5a9U1riTKyYlrT7RS+lxNyIaWodR6cA
 vjNT7BIHOh03PBjTMTHZB+XLZwnCixe75ykabWmwnB1jykyjo1V9XHYq98mHN9qcn0tc
 BfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684979150; x=1687571150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmRyEnm3o0xt10apdc5Jzi2N4nwke7v1h2bvJhvh2Sc=;
 b=OssgZSOdMMWqnL8p6P1SCybfAsQXRwsapsN1hIB9PLxr1UvVsRarnR32bVg5kPljAB
 OPqUCRFDXcdE4xQG/ewBwSGpeiVOKlASClYWeP+ngIKJXZ+SCYWRrfJeFt03I9piEhGz
 2tQIr+iKPDCK4VeqDXZ4b7uPxYVUVfPYjo3uRDYwHaYdS2S7ASC6gvt7R9pF6CcPdAaQ
 Nj2Tgz4ukOTiHqrCuW+LSE92ZLn9POFfLVsnQJbi4wE/pOqOqdSm6xlgz3gUWcTezo2x
 /Y8QWpbgXWpHmjewCHBwS0rDLK/O+TXnym3nHAsvo7oeSrZY3ZubaYa82qk5CV2uXTmH
 ineg==
X-Gm-Message-State: AC+VfDw9DRPYGbRWlcI/uY9ujjkwjJXtXC0iETGjPSkoHv/rVWZUReWz
 kaOZnrGduRZB5bAlU/g0CYPzeO/ccwL73B1Ju53nDB7+LWXqkg==
X-Google-Smtp-Source: ACHHUZ78QaeXfyuMyHbp1vFmQ3jeRKwF3Gmim01XYIEsSc0edamhG/qunwujuPjAZzNnq5Sg+oLZgjp0A8WtgT9nkf4=
X-Received: by 2002:a17:902:e848:b0:1a8:ce:afd1 with SMTP id
 t8-20020a170902e84800b001a800ceafd1mr23489423plg.20.1684979149595; Wed, 24
 May 2023 18:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230510092450.4024730-1-victor.liu@nxp.com>
 <20230510092450.4024730-6-victor.liu@nxp.com>
 <b3b77a65-5109-0e29-99c5-6cefaba0492c@denx.de>
In-Reply-To: <b3b77a65-5109-0e29-99c5-6cefaba0492c@denx.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Thu, 25 May 2023 09:45:38 +0800
Message-ID: <CAOcKUNXTFr-uyEeKkos1m0VwoB76SMdkrAuT4zHC9c8D03Apcw@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] drm: lcdif: Add multiple encoders and first
 bridges support
To: Marek Vasut <marex@denx.de>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 Liu Ying <victor.liu@nxp.com>, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexander.stein@ew.tq-group.com, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, May 11, 2023 at 12:24=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
> On 5/10/23 11:24, Liu Ying wrote:
> > The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> > simultaneously.  Look at LCDIF output port's remote port parents to
> > find all enabled first bridges.  Add an encoder for each found bridge
> > and attach the bridge to the encoder.  This is a preparation for
> > adding i.MX93 LCDIF support.
> >
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v5->v6:
> > * Drop MAX_DISPLAYS macro. (Marek)
> > * Drop the encoder member in struct lcdif_drm_private.
> > * Drop endpoint id check.
>
> It might be nice to check (based on driver data for each IP variant) the
> encoder count, but that can be a separate patch.
>
> Reviewed-by: Marek Vasut <marex@denx.de>
>
> Thanks !
>
> btw if this doesn't get picked by someone in like a week or two, let me
> know and I'll apply this via drm-misc .

Thanks for your review.  I don't see any more comments in two weeks.
Can you please go ahead to apply this series?

Regards,
Liu Ying
