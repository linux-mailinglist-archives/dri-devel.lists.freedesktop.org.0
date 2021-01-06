Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9670D2EBBCE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 10:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB7489CF9;
	Wed,  6 Jan 2021 09:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA37389CF9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 09:47:33 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ce23so4187576ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jan 2021 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BkCCsh4gMOjo/AEllVdOt08zLRkTEYDX13jd8VQoyfM=;
 b=JazHcfOklVp6oR2Mx22vR82cebwsjMmUriXCRkUmcqM58SfpOUKHRlfSmqjOEr68Ut
 thByJQfNJGMTyLtDFLsF2kwEAst2JW180MHHYZwkhZpoSZL9y1GVOqpebSHC+drwcaGj
 9QW8pWXEtIHNrb/aK84HQnG3bJ5Eh1AAo3TME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BkCCsh4gMOjo/AEllVdOt08zLRkTEYDX13jd8VQoyfM=;
 b=YIn3/bym/SkTQLyviH1Jw2aYt5076Jc7b8LTVTf1LOWM7A4b1bfQjTR0pPaNt69uy8
 tWUSn42a8ySAiDc8QsHBCBjXoLL8LxknJK9+gTmbLy2dtDKVgFzPuk7VLFytMglqZ1Lu
 k+yPKOn2H2+pvL1TDLcEpe+Ps6JtN9xRxvZqWEozk/8Tfx1ufJDLJIFCaIjQCXx8LLQV
 tAwG7WUdeFzZNhZKnRaaIflbbH9cVNIqSvSqlOubqzNHH6mua0qDLJekSh5/fhGevVXf
 EZFlBJcTope0TtzdnIAdwsdJjgEHPiWxvYIaQpT+XCMqK2EAA8KEHcS/xkd0/sMjadPc
 m7Kg==
X-Gm-Message-State: AOAM532Wq2d+nBnTT3FNQ2TIcgb0HJQETOu523T4Ldw8bVbgEuW1ukxE
 NVUjAreFiWwxmdP74DGmUodb8z6MtmC2aSpfYQov2Q==
X-Google-Smtp-Source: ABdhPJwRsLUHwjPiTZh6TI27HBF3OVWMoQ9t8GUS/t5MOc2+BGz+Y1B6Cwt47SyKc4vT/sQ7/OcL3Ib2Eh9c0b+eYcc=
X-Received: by 2002:a17:906:4ec7:: with SMTP id
 i7mr2386067ejv.252.1609926452552; 
 Wed, 06 Jan 2021 01:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20201128125257.1626588-1-icenowy@aosc.io>
In-Reply-To: <20201128125257.1626588-1-icenowy@aosc.io>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 6 Jan 2021 15:17:20 +0530
Message-ID: <CAMty3ZCkEb9g5t6Hs5DN5yHXYvDhymriYqqV+6DZiC+Qb645ww@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: feiyang-fy07024di26a30d: cleanup if panel
 attaching failed
To: Icenowy Zheng <icenowy@aosc.io>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 28, 2020 at 6:23 PM Icenowy Zheng <icenowy@aosc.io> wrote:
>
> Attaching the panel can fail, so cleanup work is necessary, otherwise
> a pointer to freed struct drm_panel* will remain in drm_panel code.
>
> Do the cleanup if panel attaching failed.
>
> Fixes: 69dc678abc2b ("drm/panel: Add Feiyang FY07024DI26A30-D MIPI-DSI LCD panel")

The fact that this has failed to probe due to recent changes in
sun6i_mipi_dsi.c I don't know how to put that into the commit message.
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
