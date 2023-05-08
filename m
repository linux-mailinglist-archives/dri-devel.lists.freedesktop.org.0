Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9A96F9DBC
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620C10E0BF;
	Mon,  8 May 2023 02:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599F710E0BF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:27:06 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-42e51230afcso1406789137.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 19:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683512824; x=1686104824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NIGaI7AoRYU4CptNG22N3Xgj/+0h3Xejz8PTM4bg9mY=;
 b=cBA6vAuO8LJez7PdckNifF4buIJQwn0a0dc5Wz/GSw9bSYwmfJvhxb8Idnsp7T6OMy
 hZL/ZPvA2533OMdcL+f1k3MCPucJhefBcGSBwCRbEu6k5WoGxazYFdIP63QhYj5UbVQc
 3DRW/1rCElBfe+wOsslxXnnq7xrnf25wf3GuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683512824; x=1686104824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NIGaI7AoRYU4CptNG22N3Xgj/+0h3Xejz8PTM4bg9mY=;
 b=VUm/G++QeTIIdnZkUP4SedPyu/zwOdGsquGiOzpeMke/zK5hIjgMHFkQcMMwI76lui
 4zKvwMpXtWqRUkui1Btsebc+BNq7Znly8dRwhPCwgGbdTrmjHQSFM1makkpQ+V/geN4J
 KiVUP3z5WIiyuPebMvbZencLblfvhaCHdxo5a35QpXmDa7w/2Ok5XqZWQjdnP7sLV+bX
 90hdOfgZwtakQCEM0VSJn0muRSre0o76v1BF54ZDR6PnyCSyfcrr2CtNlJM8v0/LJ//8
 TiUxBKAzG+vcKEBCpSA3N4d+mxERtliHv2KBxmgj9cSeBqM0Tww7M+UakCQ4cjaNWsIM
 fk1w==
X-Gm-Message-State: AC+VfDyisQWbsE8B+znC8KzXMwvBodH/DqzjvpcVNSzI837/jasx6AQL
 cjv6iAxhN29Mapv43lnUKyB8iCREV3J1v2IbwQiBHA==
X-Google-Smtp-Source: ACHHUZ6TS2ol1t6UooR5qGJfNvnT2PxdKXiffL9hVv+balRGgS96GUFpCOf1xMIUrvIL749QC5ZcR6JGiAD5thV5h7c=
X-Received: by 2002:a67:f8cf:0:b0:426:2a37:4a6b with SMTP id
 c15-20020a67f8cf000000b004262a374a6bmr3098252vsp.25.1683512823989; Sun, 07
 May 2023 19:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230506192453.725621-1-aford173@gmail.com>
 <20230506192453.725621-5-aford173@gmail.com>
In-Reply-To: <20230506192453.725621-5-aford173@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 8 May 2023 10:26:52 +0800
Message-ID: <CAGXv+5Hi=Oh9u6QB8_7h4P2zq9GLSS59g+fJsJfaXuhubuP=VA@mail.gmail.com>
Subject: Re: [PATCH V5 4/6] drm: bridge: samsung-dsim: Select
 GENERIC_PHY_MIPI_DPHY
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 7, 2023 at 3:25=E2=80=AFAM Adam Ford <aford173@gmail.com> wrote=
:
>
> In order to support variable DPHY timings, it's necessary
> to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
> can be used to determine the nominal values for a given resolution
> and refresh rate.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
