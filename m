Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC234D314E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 15:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A6910EF39;
	Wed,  9 Mar 2022 14:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9FD10EF39
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 14:55:36 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id t187so2175785pgb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 06:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dxj4frE2eCuqonVDS5bQZcQRra2ODtuFVo9Dvr2UfAM=;
 b=Lx64DbIQRSA61d6Xh4UQh+hEzAkwZEmkFFvrSkKyC5q8t/Q5VPDpuUjZRJpI9PhvLH
 /NV3lFRxEMOeVk9DjRpY1YX2aPqvkmwDcMJHK8b63Xu5WptxcvmCXhJ5RVo/+vv6LoTk
 jXlChGgEExi3ofGacl2IKyjejnMfj2gTfSHSNCE1k9uXQOacQRQynU6K20iuNYe1k7mJ
 grZ8CdQL0vNoPtDghRHKJye07qiRQVRmxFGEIljRz4WR1PvSNHi6KjbAQKNczko9P4pM
 CsjuvNUFf3ZNvwcKeBSzY9mnHT91BzyH2grKbBGkDACc6ar7T37veEu5njOjDzZjaWzk
 YJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dxj4frE2eCuqonVDS5bQZcQRra2ODtuFVo9Dvr2UfAM=;
 b=qq58u2C3314qme5TuqyqU+060g39tkbp4cYzT6skfC5DtKwI2BDJNOZmQd+O3HSnd7
 BLRYhsw0in4x75y2YJgKG6KrIcjYkhCliBoTEjTeXOGkd4gbjJ2xw1u9XQ10O7DJe8iA
 YF1oV1SgJdWt5RItocBujt7RI0TIbr4S3XgwwEpMNTLNR6m2y6wMRXSm1jKr21ZkkPcJ
 Br0bO8MCkDVUTw/0bZkmXne1yCa0Qw8ab4KiRTgU9BUJQa95p7FKkGnWiJFHe8jUKL4W
 zaeZzndNgatXjpxFYPQKt0I3aapxMiatz5/EAsNBbEc4hqs1RUSNMlen6F7gFKaj4ka2
 8MAA==
X-Gm-Message-State: AOAM530Hd3GTG2ssZNDtuFsjAggLgY+TywOOu3DX1WJxk3FQ1i8cIDa3
 q3mHPc0xVZzmfy/fs8LLTvAqoBAGW1jDvW/bBUfQkw==
X-Google-Smtp-Source: ABdhPJzK9dlHuNBGU9ukp9ZvpYdg3LfIvQ/WqY63hqVDNchAfC7PzmtrJJ1LPB1EWTXUUKE7JO7WKWsjNPkMDZm28u4=
X-Received: by 2002:a05:6a00:889:b0:4e0:dcc3:5e06 with SMTP id
 q9-20020a056a00088900b004e0dcc35e06mr24123462pfj.29.1646837736094; Wed, 09
 Mar 2022 06:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20220221072835.10032-1-jose.exposito89@gmail.com>
 <20220221085509.fies6j3hjsiz55rz@houat>
In-Reply-To: <20220221085509.fies6j3hjsiz55rz@houat>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 15:55:24 +0100
Message-ID: <CAG3jFyuFH2PX2shWZHS90Dsv-2H1OLdNYnvdN+R-d67T3E4APA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: switch to devm_drm_of_get_bridge
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 at 09:55, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Feb 21, 2022 at 08:28:35AM +0100, Jos=C3=A9 Exp=C3=B3sito wrote:
> > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > favor of "devm_drm_of_get_bridge".
> >
> > Switch to the new function and reduce boilerplate.
> >
> > Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
>
> Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Applied to drm-misc-next
