Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E053D71FBB0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 10:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF9E10E630;
	Fri,  2 Jun 2023 08:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DB910E630
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 08:16:39 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-3f83114e0c6so18646101cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685693798; x=1688285798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zN7Ctl+cnl/AhSGVOLrzVyjmA1e4awl0YjlvvjjGpnE=;
 b=Q1/tD9poJtzIUenOvyQS66uEmrzvps8P64PmTxNYe397lRE7Sb7qAil3hU+gcl8Cff
 nhtmoB4KYgI+TSIv6LpwscMf6ut+LNR4dRgGQl4P5RR3LOQfsotY0madPphZ9KLwQt/W
 w3Pdn6b7jlSMe6a5SwXcyT09L//W3O7A5Eh1pWOMHM6898dQN6IaH2GL8KY1ijYXpiVG
 j1irUpLA4BRpQWCcYscyjyqAshfi6SsF9vZxhaexsa1qjwu2vN3hb+M7m0VtKCLfeGID
 kAGpzUw92ccuYQj17FPHbMQ9LsCFH8Kx+n9HfG67ZnSxKAlCZ+X/XlBGus391IuSCDzE
 zz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685693798; x=1688285798;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zN7Ctl+cnl/AhSGVOLrzVyjmA1e4awl0YjlvvjjGpnE=;
 b=dJVExI3pd9RYehzRrGC54MOOIXbGKTtmhLu68gnCrdUowF+LHI7B0/3j0fwCflUBmL
 /xLkaxKN98pfy+MTVt6kYP61rUlc2gu6GGvrjNcorgdXhA1KqFr9J1WVBvb/Gt1JqFC8
 /GZpL/mprb9NlrkwIfl7puULM3wfSmnQv3TUWkAbQZ+kD2otVN1Xx3ymHD3AHMGmNSpd
 kNzs8S6npYRc9SUq/8owaQ0aoUoskjP1rmIi22u4OaMfrc7TBUihk9Hget0LlLKs1Cx5
 BVoehKCEftgloHldsGmP53bGedhApan9d2FMHXiQvTd6HAKDiqCVyWP+6mvlf/AOx0k9
 wCoQ==
X-Gm-Message-State: AC+VfDxqFDBBWhGM4dECObBgbzAfcf3lwexUA19k42hrlb5C7/vvV8xU
 wbBauTAoXkR0xyYXh/x4Unk9085jcTe1k391GHY=
X-Google-Smtp-Source: ACHHUZ4PnJLw/FTrDa7qzyigJ8xCy7vGc58UrpDDWdTXyv+mmBA9Ce1ZvGN3Z4OjDFwE1Ose2rFuQtUlK2KLBGSsNLQ=
X-Received: by 2002:a05:622a:1445:b0:3f5:589:6a2e with SMTP id
 v5-20020a05622a144500b003f505896a2emr13825694qtx.48.1685693797871; Fri, 02
 Jun 2023 01:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230531184527.1220305-1-l.stach@pengutronix.de>
 <20230531184527.1220305-2-l.stach@pengutronix.de>
In-Reply-To: <20230531184527.1220305-2-l.stach@pengutronix.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Fri, 2 Jun 2023 16:16:26 +0800
Message-ID: <CAOcKUNUxv6O__QbpdfrnmwrsvJA+CfG=ynOYWvmTpkCGedJTFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: lcdif: force modeset when FB format changes
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
Cc: Marek Vasut <marex@denx.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 1, 2023 at 2:45=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> Force a modeset if the new FB has a different format than the
> currently active one. While it might be possible to change between
> compatible formats without a full modeset as the format control is
> also supposed to be double buffered, the colorspace conversion is
> not, so when the CSC changes we need a modeset.
>
> For now just always force a modeset when the FB format changes to
> properly reconfigure all parts of the device for the new format.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
