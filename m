Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928ED5171C6
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0C10F001;
	Mon,  2 May 2022 14:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D69710F004
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:40:04 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so16308643pjq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UpUy8a2LGTGKAB1XvqmqE3EV2zftEVageSYqcaWSjV4=;
 b=BnVlJ/lPIQXcYp3dPFroPdhD3nvyMU/t7gqwe4fNv8tUug+20DPAlBv6FqPEL2/HF+
 d3iCEXSUksKjESBER9VK3AumPu4O3Eork+FwgQJiDF/NWTt9X5h1UF84wB1B5ptTFsGg
 g9I4AHrkIIv0zTrgRzi0b7RFGovc7RsCYtm4qpU40pXo6nZBfw0ssQqxMiAXw4p1VAuV
 /ZQNyi5JzTXvBR63pgp8OInR8mNRgchcZjH7HTsGY5wOIIxf3+bPhVbjy/qP4hqC/ls5
 /QRY+GnFlUT7G3cbub4jlh3v1QtFZEqMvkPXsCQgZUgTIXmUNnXkYF8uiN0Mp3WG9Mqg
 1uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UpUy8a2LGTGKAB1XvqmqE3EV2zftEVageSYqcaWSjV4=;
 b=ukygGU5H046mB8ioANoi8so5QEo3LD+h9enQzWr+mOzpHTXpjo/SimeuOqYsjwO/Ht
 6pnxV6K5aWxC6Qwtn8QU9q/wzoz52yc0XGSSC2+rrOb3MZDvoXwPFxkQ4M+7JipOFlTQ
 xsQ+/QdDYfwZxa85J3dD4D6mWbyRnyvuhzr8SJfjXcuFVpuENkY2fe2k8Zmpr+pbTD2e
 yitU4mmPnx7CARBRUaL7+wk7+G41pOTDptMaMi8x2K2sdQrfdpA/ujsFXVPatAQzNn/e
 i953VyyCW958hPRDlIi/uFfRYj/BEdxCx03hyxfvrMbzegt4hIodzSdMCeacqsOkOCrz
 FpzQ==
X-Gm-Message-State: AOAM532/wQrxtMBEZ6mzkcP4mRVOtevE6/71Qp9U+ueX873ikvLy70Tz
 q24MMaIosFMhL88nPi9NgZhZU9ZzgipiWfOB9LZopjY8RxU=
X-Google-Smtp-Source: ABdhPJyGk1Y+Z0yzBRpwaavA333ksRfujeF06Ys8IMOVOBLnFOU3i4i1W2PpwI7FUNle3WRDM6tEKM4cl6XzkFydyWk=
X-Received: by 2002:a17:903:2350:b0:15e:93de:763a with SMTP id
 c16-20020a170903235000b0015e93de763amr9336775plh.117.1651502403846; Mon, 02
 May 2022 07:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220423120854.1503163-1-alvin@pqrs.dk>
In-Reply-To: <20220423120854.1503163-1-alvin@pqrs.dk>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 2 May 2022 16:39:53 +0200
Message-ID: <CAG3jFysm2haeZ9jVkK96n1_vVjVkwRtLqOvM-r-F5qmQ7YDQpg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm: bridge: adv7511: CEC support for ADV7535
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 23 Apr 2022 at 14:09, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> Changes:
>
> v1->v2:
>   - add Robert's r-b
>   - fix up 'case XXX...YYY+14' statements to read nicer in the 2nd patch
>
>
> We have an ADV7535 which is nominally supported by this driver. These
> two patches fix up the driver to get CEC working too.
>
> The first adds the basic support by correcting some register offsets.
>
> The second addresses an issue we saw with CEC RX on the ADV7535. It
> hasn't been tested with the other chips (e.g. ADV7533), although it
> should be compatible. I'm sending it against drm-misc-next because the
> issue wasn't reported for other chips, and ADV7535 didn't have CEC
> support before. But feel free to take it into -fixes instead.
>
>
> Alvin =C5=A0ipraga (2):
>   drm: bridge: adv7511: enable CEC support for ADV7535
>   drm: bridge: adv7511: use non-legacy mode for CEC RX
>
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  27 ++++-
>  drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 116 +++++++++++++------
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  19 ++-
>  3 files changed, 116 insertions(+), 46 deletions(-)

Applied to drm-misc-next.
