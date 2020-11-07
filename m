Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CC2AA619
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 16:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6106E0C2;
	Sat,  7 Nov 2020 15:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F4F6E0C2
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 15:07:31 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id o11so5170883ioo.11
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Nov 2020 07:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kx47WtaQ7WMa9LVtSdFy9W14nJBrLgdMQNIJm3qYLSc=;
 b=UiaG9MkCCu9LY8D5CjnR2038+tnnSIDjmVdZ1bHC/qG0u8uriWxKmbcr7XuQd3di/l
 D+uxux2qejbKsJ5TxLpRqx0P5iH7sfalNyTop4Kk7t4TKuJpBmDgBskhhc12SD5okBi8
 cvv9zpNP1Km9VPxdNoaXdrXu+0iW9fZC/FdeztqO8Mv/OaYl5FmqpWGTNbvJ4MykUHrJ
 ooEIIawdi0lzLWE9jPOqqAsJ9RWdiiOClKBWqXzKYpXHnvqM7Urr+s8Afeb/ytUg7ifH
 LNGJ10+m6Trcjl4Vrm4ncXu/e52URQIOPb5EwNIkbE/BGsx4gd6unjeh7kbG8iW5AcVh
 tdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kx47WtaQ7WMa9LVtSdFy9W14nJBrLgdMQNIJm3qYLSc=;
 b=B5va4RYDIlqgoBP+nf+5IhWTrDSNHPQkvTVTs31kUFi8NqyfemclV64AgyK37F8dCQ
 e53EpCBNjEx5d+h0OTz3mdpo9/nwzUhZBf6KYsGjEFMFcY+5Lt51Y3GIlvkqhshPFYmg
 k290v2ALrPi+x5EzjYaA++qtht4ISfpU7Dqd/tKV3Y/LaYEA+pzEo0B2Ki6PvWOFkxNE
 UH63PRBvRrG4VR4YudUeHSbscGbb8bSr8oKfK1ocms01pBO4nNHsfR0tKcMoocMcobke
 t0eASput9r7oXijZLkm4+iE1qEZby7DkwJIzyQEHenyHv0/D6TrjOj2Tvnz+2niGoeOa
 jDTg==
X-Gm-Message-State: AOAM5319qweIE1LG6um6u7p04VDJlRtPO6ASW63KAlMWwSBlRGlRyHhF
 WgdaegRDDjNo2Y31iwixgsQ9bt0WgiolK4hD5NU=
X-Google-Smtp-Source: ABdhPJxcVFJfnIwNIdKPVZY+opxPhNqa/evtovhSadn6b7zDc0zmiXU7HJLpIvaAZCXbeDlFo7UteerVH719gLk2tQE=
X-Received: by 2002:a6b:d00c:: with SMTP id x12mr5039748ioa.10.1604761650411; 
 Sat, 07 Nov 2020 07:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-2-m.tretter@pengutronix.de>
In-Reply-To: <20200911135413.3654800-2-m.tretter@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 7 Nov 2020 09:07:19 -0600
Message-ID: <CAHCN7xKAHm0cvh+7rb1wxF+UqE2Fs48nYF7=rWm7E9ipy2Jtmw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] drm/encoder: remove obsolete documentation of
 bridge
To: Michael Tretter <m.tretter@pengutronix.de>
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, sw0312.kim@samsung.com,
 dri-devel <dri-devel@lists.freedesktop.org>, a.hajda@samsung.com,
 Krzysztof Kozlowski <krzk@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 sylvester.nawrocki@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 11, 2020 at 8:54 AM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> In commit 05193dc38197 ("drm/bridge: Make the bridge chain a
> double-linked list") the bridge has been removed and replaced by a
> private field. Remove the leftover documentation of the removed field.
>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

What is the status of this series?  I know of at least one other patch
series depending on this.

adam

> ---
> v2: none
> ---
>  include/drm/drm_encoder.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index a60f5f1555ac..5dfa5f7a80a7 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -89,7 +89,6 @@ struct drm_encoder_funcs {
>   * @head: list management
>   * @base: base KMS object
>   * @name: human readable name, can be overwritten by the driver
> - * @bridge: bridge associated to the encoder
>   * @funcs: control functions
>   * @helper_private: mid-layer private data
>   *
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
