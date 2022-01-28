Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3649FD41
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 16:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981CE10EEC8;
	Fri, 28 Jan 2022 15:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7835110EEC8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 15:57:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17338B82637
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 15:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C86C340ED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385463;
 bh=IQ8hvyw1pDAvDp94xvG8YbiEIf7ZBPJyDu22r8ISfVw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VNz1du+TBjld4PhPZ+jkdPNJiAVgrFEcCQMeV1IqW4tQxuagjbz750OUKZYNO9Wqe
 5Ramldm2aALYNHOqEtVoUe/KzJ+9j2fGR2FHzVonemL+LT3wGtyfYuZ6CteNb1hqTF
 OXI2GJLwBTYodJGgenkJ6c2FIYeid+gulDzFkbqEcdM9UXwjgYV+Aow9Dm0eumZinc
 Ns4nKSiQ0vomivo5dR6fLv+zTujyFIhazzVts2vMEKKYc+krpOzL8M7yY5gLfh66s4
 7w0URWeLM3EXoEIfmJupi3xQTR4hPuaX1NsYY+SJIt0fUn0KJJJHkR7/jetdjWLdEV
 8j7gPnfuljTGg==
Received: by mail-ej1-f53.google.com with SMTP id j2so17334440ejk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 07:57:43 -0800 (PST)
X-Gm-Message-State: AOAM532dJSuGx4TSAYtSxh4nm9t30+nilk1xzBb01guJTZRS7K2MfH18
 kFKWhHTs/B67jlM6Lt2cXQHfYeooiQc5ss1V3Q==
X-Google-Smtp-Source: ABdhPJyMCW3ZK9Ri660QNZ9AOmvNSPBp9tIK7lI4yHvpk7o6D/w1vWVHsyn828J7qAojrYyUdg5EKyBrHHxW5i1lJ8U=
X-Received: by 2002:a17:907:3ea8:: with SMTP id
 hs40mr7443689ejc.48.1643385461799; 
 Fri, 28 Jan 2022 07:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20220127143623.123025-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__yO6Cq8qt8RSh9AX68mJEv+wWvuhY0_p-PTJ=eJD_7aA@mail.gmail.com>
 <b8911eab-1419-60ad-ef07-25a5de365a52@collabora.com>
 <ddb05e08-f81a-11f9-8091-9af0c57e687d@collabora.com>
In-Reply-To: <ddb05e08-f81a-11f9-8091-9af0c57e687d@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Jan 2022 23:57:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ZPmUEizdVEOWb26FV+3qpndk=t1N2vYyFCd4K2RM0Nw@mail.gmail.com>
Message-ID: <CAAOTY_8ZPmUEizdVEOWb26FV+3qpndk=t1N2vYyFCd4K2RM0Nw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, andrzej.hajda@intel.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2022=E5=B9=B41=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:1=
3=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Il 27/01/22 16:46, AngeloGioacchino Del Regno ha scritto:
> > Il 27/01/22 16:21, Chun-Kuang Hu ha scritto:
> >> Hi, Angelo:
> >>
> >> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
=E6=96=BC
> >> 2022=E5=B9=B41=E6=9C=8827=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=
=8810:36=E5=AF=AB=E9=81=93=EF=BC=9A
> >>>
> >>> DRM bridge drivers are now attaching their DSI device at probe time,
> >>> which requires us to register our DSI host in order to let the bridge
> >>> to probe: this recently started producing an endless -EPROBE_DEFER
> >>> loop on some machines that are using external bridges, like the
> >>> parade-ps8640, found on the ACER Chromebook R13.
> >>>
> >>> Now that the DSI hosts/devices probe sequence is documented, we can
> >>> do adjustments to the mtk_dsi driver as to both fix now and make sure
> >>> to avoid this situation in the future: for this, following what is
> >>> documented in drm_bridge.c, move the mtk_dsi component_add() to the
> >>> mtk_dsi_ops.attach callback and delete it in the detach callback;
> >>> keeping in mind that we are registering a drm_bridge for our DSI,
> >>> which is only used/attached if the DSI Host is bound, it wouldn't
> >>> make sense to keep adding our bridge at probe time (as it would
> >>> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
> >>> that one to the dsi host attach function (and remove it in detach).
> >>>
> >>> Fixes: 209264a85707 ("drm/bridge: Document the probe issue with MIPI-=
DSI bridges")
> >>
> >> The fixed tag should indicate the patch which cause the bug, but why a
> >> patch just adding document would cause bug?
> >> So no any patch cause bug? This patch just want to prevent a possible =
bug?
> >>
> >
> > I think you've missed my previous message on v2, so I will paste it her=
e:
> >
> > unfortunately I couldn't find a valid commit for a Fixes tag. This
> > started being an issue at some point, when the DRM was changed to
> > adhere to the documented probe sequence: the MediaTek DSI driver was
> > not the only one that got broken/affected by these changes.
> >
> > If you have any advice on which commit should be tagged, I'm open for
> > any kind of suggestion.
> >
> >
> > I tried to check on other drivers which got fixed for the same behavior=
,
> > for example drm/msm, but none of them had a Fixes tag.
> > When the DRM got changed to adhere to this sequence, some drm/bridge
> > drivers were also changed; this has created some incompatibilities with
> > some drm drivers, including drm/msm and drm/mediatek.
> >
> > This commit is not fixing a latent bug that was introduced in drm/media=
tek
> > but rather one that was induced by the new, fixed, probe flow that got
> > recently documented - and to which drivers should adhere; failing to ad=
here
> > to that will produce an endless -EPROBE_DEFER loop, due to other driver=
s
> > (as mentioned, for example drm/bridge drivers) having been changed to u=
se
> > that probe sequence.
> >
> >
> > Regards,
> > Angelo
> >
>
> I've been thinking about another solution to this issue.
>
> Would it be fine if I send a v4 that removes the Fixes tag, but adds the =
following?
>
> Cc: stable@kernel.org # v5.15+

It's ok to me. According to the documented format [1], I think this should =
be

Cc: <stable@vger.kernel.org> # 5.15.x

[1] https://www.kernel.org/doc/html/v5.16/process/stable-kernel-rules.html

Regards,
Chun-Kuang.

>
> >> Regards,
> >> Chun-Kuang.
> >>
> >>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> >>> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>
> >>> ---
> >>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++-----------=
---
> >>>   1 file changed, 84 insertions(+), 83 deletions(-)
> >>>
>
>
> --
> AngeloGioacchino Del Regno
> Software Engineer
>
> Collabora Ltd.
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales, no. 5513718
