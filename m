Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFB825DEA
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 03:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAA310E6B5;
	Sat,  6 Jan 2024 02:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18B410E6B5
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 02:29:53 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2866b15b013so48080a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 18:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704508193; x=1705112993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPX7qJSKC7zBGjoAIF3y+hVE3LHYC0FMBRmwWU1yb78=;
 b=g23xmJEEMrNkfLdrvhU72f0CubAs9pha3Lsjer0vvqonUC6KRhb09Ao6EKykGbCtj9
 E0rDA00hipF79h8DtrS0NZFi9FvGECwLc82QDvfvI8UGeBRRdWJSHwL5RsgUdyWHuTZA
 wZRdnVvqNAE0QcRBIBwFg46OFhmVVhVCBnOqG6gksR5XqcTZhAdGbOTxl1VtdrjtAGMc
 /T72BTO3SdrV/XOF7n4axbVXLkDJgC/dm+v9V7WTSEtvkt7t3dg1HTSpusOYad7lTw/j
 6WAbXmewzs/DPIQ43L8XH0WCXrqPNi0/pXJIjdlL6yVDbwDNUN/6QXmbx/vOj27lsF+i
 tscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704508193; x=1705112993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPX7qJSKC7zBGjoAIF3y+hVE3LHYC0FMBRmwWU1yb78=;
 b=jTVDocEnvp070ax8JUP/xOHSF986Gc9eyp9jL5h4Ts8bz01ezKrVTjEa/u/MVpkVKB
 Guauug+rIoQGJwn5H+LvF5v9iP2YUJPfMK1wLF9wh9YNtJlRqiKQd2zKpox7CpDCfCPQ
 Yx3OoQ3+pTjVSz2ESb7tRZP80SYiCfu6alGvrbrgp35zdqzwftruAdk95ZO7rZqlV76m
 hujzQVJ4fVXmycN9AENftbyy27mAJX07H7tjYguOE4QFhb1svBZVboTsTlF4Lj5HOEJq
 y4tGKbZxu2axugENaLsRhr017E4lxlhq0YllSlUznM1NkSkHmEy95LUM0xQkQjj13xOV
 U0Fg==
X-Gm-Message-State: AOJu0YzWhc1MQdM3/okGf4RY1WyoH2b7akFLoaKFF8HsR0xoWkmt6A6P
 fgG9q+b7BwYyoFgprAAxcArrOiIxTb0JhPRKs1w=
X-Google-Smtp-Source: AGHT+IEXDwSaz6j2wlPQbuLx7ykHdUVF2khGx+tE93dmEYsto+uB5HJvfF/6l31SoEAfLfcRScroTs5PvIs9GtN0XGM=
X-Received: by 2002:a17:90a:ab16:b0:28c:fe8c:aa93 with SMTP id
 m22-20020a17090aab1600b0028cfe8caa93mr615127pjq.1.1704508193078; Fri, 05 Jan
 2024 18:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20240106015623.193503-1-aford173@gmail.com>
In-Reply-To: <20240106015623.193503-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 5 Jan 2024 23:29:41 -0300
Message-ID: <CAOMZO5D6RrTy6e=1gEUKxxR3T5VmqDZmcmR7945qBbnPhihi+A@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PVI
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

Thanks for moving this forward.

On Fri, Jan 5, 2024 at 10:56=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> From: Lucas Stach <l.stach@pengutronix.de>
>
> Add binding for the i.MX8MP HDMI parallel video interface block.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

You missed your own Signed-off-by tag.
