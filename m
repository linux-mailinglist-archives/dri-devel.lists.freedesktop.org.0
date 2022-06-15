Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E10354CDBC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 18:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AB0112326;
	Wed, 15 Jun 2022 16:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A868112326
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 16:04:51 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso2464323pjh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ePN6l7qq+5+AEApPN8ZIDny0v2CL19RcX8ZdNrMR7lM=;
 b=aqM0+dFn+nn8gN9lgLMZUiyexrJiMRh9URiP1j+pSR5rH9FkZgHYRqWHAGfoOH7H/o
 apqcb2Dt7BbllawEZXVjxmkejglQNMu8/m/ujk9rvIJO/2nl+oTm2L5DVPcLrN1HKfOj
 bHAGlIQLWJssv8v2uPJdpwtXpYuCnhLLi1buEkKltNqWnc3wbTTrjB2zJhfAL11UH+CV
 qbsmGDz4A0Ueag0lhEd2Dr+4z4HJ1BHWv8YWg2vD3pOsABM1ZdIkjDWkeoWUFl9QVlI7
 6S6DAA+GJZm+8R4kiejkyXWgiRXnUGU4gp6fZAMJYI3csPLiA3mgAwppGQ44fA8W5EXb
 O62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ePN6l7qq+5+AEApPN8ZIDny0v2CL19RcX8ZdNrMR7lM=;
 b=CXgZnxHBzGCSaKZPVqqMYl31i/vv6IdIr0/522YSIZ5ennTF65lpGqy+GSU+50+321
 mGubYQFTxB49ptEun5/KfIbYyeGzG2vkz1puzvYMpviO2yNayY2n1wi273R059f6Ui7b
 zubFcyCgKU0pImC4UYL4yt06+1Jl9PphHtG3qJy5A473yUFR+6Ww0RByy/5s09FhdhN8
 sd4Jy+D4srzqDqB0ETiyUdxF29tsMsn1LGQWyoA2uzhV+cKmVCSixr3q9BTPrqzDXquH
 DvGV2l94c0GSJD/bn2Ph0Ub+iapvlozezZ6cGnmSl9Ha1C8o7IozEClokN8mkyLoRiMc
 ioNA==
X-Gm-Message-State: AJIora9P5LNrBIhDYk3PtfvD16pZBMsNAb3lkejPez3cS1z5G6RsrxO/
 Qrp/tyMBZ12kIsf6iOz1GZ0YzQL6kPDePpiqhGg+nw==
X-Google-Smtp-Source: AGRyM1vn/ajc9Zhrglm4j7l6bDUl6hYAdrUf3Sb59Qp8Lv5t13DLZGtXd5FnN6EgUEj2g6o4jDoor9Cr7RKIsPEATO4=
X-Received: by 2002:a17:902:f353:b0:167:7bc1:b1b9 with SMTP id
 q19-20020a170902f35300b001677bc1b1b9mr84680ple.117.1655309090641; Wed, 15 Jun
 2022 09:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220613163705.1531721-1-nfraprado@collabora.com>
 <9c8c712c-75d1-bd0f-0205-be769ce5e83d@collabora.com>
In-Reply-To: <9c8c712c-75d1-bd0f-0205-be769ce5e83d@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 15 Jun 2022 18:04:39 +0200
Message-ID: <CAG3jFysv_LSM2+j5jWmC-zM-jik0WdGjE7Mwm=quAabG_LzB6A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Zero error variable when panel
 bridge not present
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jun 2022 at 09:52, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/06/22 18:37, N=C3=ADcolas F. R. A. Prado ha scritto:
> > While parsing the DT, the anx7625 driver checks for the presence of a
> > panel bridge on endpoint 1. If it is missing, pdata->panel_bridge store=
s
> > the error pointer and the function returns successfully without first
> > cleaning that variable. This is an issue since other functions later
> > check for the presence of a panel bridge by testing the trueness of tha=
t
> > variable.
> >
> > In order to ensure proper behavior, zero out pdata->panel_bridge before
> > returning when no panel bridge is found.
> >
> > Fixes: 9e82ea0fb1df ("drm/bridge: anx7625: switch to devm_drm_of_get_br=
idge")
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >
>
> I would've preferred s/zero out/cleanup/g but it's also fine as you wrote=
 it.
> Besides, good catch!
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>

Applied to drm-misc-next
