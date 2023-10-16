Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036687CA2F3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D510E147;
	Mon, 16 Oct 2023 08:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42310E147
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:58:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DFF7160DFA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C80C4339A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697446711;
 bh=FVlzKdkhbVh9N/JYCCY5N9wSb/ETjh4QaFHnI885+mE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jvjTiB583yaaJab0KTp70GgVD5MN2PYGRxy+Q2EjjKpdqr+gHtM8SpuiiYP9eZJB6
 65KbZwU40hgdQbNG8VZsccHwJg3kzLv4YUHsRB4DPanNv90VlqUMvMdiDIybB6OflA
 DBJpgeT1hOGeSNF9ra5j1JUYPCSXIPhk7U6m++kcPrGr/dfhZL9oNNiS54WrOsqBjg
 HvWHDZ/XbKuD+PrnbANbT8d6BQRF17LvRDCt0Ng+Po102ZX2qj3/Ymmc6wFUdeVnV+
 sb+sSxAN87+JtgBJ2/BXHLguej+LckJQ1fWo5+1DYlXyEdY2IQqdz+EdVqH0WKQ0BP
 fPAo4P3lSqDzw==
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-5a1d89ff4b9so2236079a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 01:58:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YyvZIJ1CCjhQPW+bHpg/jqYU/6yqqUpMruuFLeBTJ12R38G8U6N
 NY7dJPWMS2J9rJ4FGIUx2qjWf5W31/KnH6HA6nLfxQ==
X-Google-Smtp-Source: AGHT+IF0dH+E4iRL1ATyZdgOpqAKjDow1ZApMe7Grdp4tpvczPCF0AuTrdebh7+8LKPOx98vXrgZTIq2piUVcOiJTR4=
X-Received: by 2002:a17:90a:8404:b0:27d:1d1f:1551 with SMTP id
 j4-20020a17090a840400b0027d1d1f1551mr8979649pjn.29.1697446710582; Mon, 16 Oct
 2023 01:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com>
 <20230830142358.275459-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-6-biju.das.jz@bp.renesas.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 16 Oct 2023 10:58:19 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7P4ooXeD_EGmMbGu-wtGaZjpbZ6N-Lkan+Q5GE4z-dQw@mail.gmail.com>
Message-ID: <CAN6tsi7P4ooXeD_EGmMbGu-wtGaZjpbZ6N-Lkan+Q5GE4z-dQw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm: adv7511: Add reg_cec_offset variable to
 struct adv7511_chip_info
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 4:24=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7533 and ADV7535 have an offset(0x70) for the CEC register map
> compared to ADV7511. Add the reg_cec_offset variable to struct
> adv7511_chip_info to handle this difference and drop the reg_cec_offset
> variable from struct adv7511.
>
> This will avoid assigning reg_cec_offset based on chip type and also
> testing for multiple chip types for calling adv7533_patch_cec_registers()=
.

s/for calling/by calling/ ?

Reviewed-by: Robert Foss <rfoss@kernel.org>
