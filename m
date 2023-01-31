Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9EC682E51
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 14:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8945410E34D;
	Tue, 31 Jan 2023 13:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EABC10E2BF
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 13:48:03 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id e15so18096647ybn.10
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cSXpJOa9iEfg0k5fDlS7y4qL3SedBz+BCWAw9qFTuQQ=;
 b=nP3CdyfPD+RVr+WbuyLRr3gd7peTtFCrRMvrXM+G4KFp3YBknchXXIRkvwa4jkcPDa
 4PXe+KFvCIw1nAC/tN7Tzh4Xgr7yCZYmz20gpAwf78MIV1NJi3PPU9+ic+3OY9g7ya/T
 IJZ3y8Mb1f21o+YWF/KMxZKaQsFA09f6EdLIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cSXpJOa9iEfg0k5fDlS7y4qL3SedBz+BCWAw9qFTuQQ=;
 b=iVCbZpL+FyjV+WNbj7LhopHBKqG+EhqakWRM9m3kimcuHbGrTD70XSxANW+GXg9r1n
 zkVSkf6BSouJDSFDxxr/kScZ4A3oPfHCB+VaEikk2c3l+rh/NQJgQBlsezAIkaj3dCVF
 SGdXwFQQ1ElSbQRUWo0wGvUDcNE0jfpVXtwkrOyuwFZ0jeAt5HCwvaJuQJ2k19Rehm6k
 y6Ag0441W6o7qk7LdR/bR1WheAWhmspyH2DIzFl9Z6wQ/Vv1xfd578p0rOTV6369nK90
 /pQQlxdPd04R30RLfIC2Y0H6f2FvsK6iPCLqxWIUIcbsnOS6rVy8l/VHAXdTxXfazlt9
 WiKQ==
X-Gm-Message-State: AO0yUKVbfhSXOYrrDF5Z6u6wWh9OE1KkUluFrbfL9J3n2Tgqy4PBhomf
 Pyboq/axoplaumj9nZJQgJD51PknA6lWGCRNzQHYEQ==
X-Google-Smtp-Source: AK7set/dJ2/j0hNK/iwX7WOu/h0ISBKCdvYDjoi8Gvq4HzXHHv67o+G4XdbXKpJ0y1LC0o5hai8NYJAmCy/qxchkEn4=
X-Received: by 2002:a25:3c5:0:b0:835:560e:ab15 with SMTP id
 188-20020a2503c5000000b00835560eab15mr348969ybd.84.1675172882378; Tue, 31 Jan
 2023 05:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-3-jagan@amarulasolutions.com>
 <20230126121227.qcnftqvgiz44egpg@houat>
 <CAMty3ZB6QiqgQN_zWEXULHiipQWU_VaWxDWf9W8OTVQvkACu5A@mail.gmail.com>
 <CAMty3ZDTuvYKQYpVnoUU_-b3znJiyR0yBADO-5_5+86KgwYv3Q@mail.gmail.com>
 <20230130125648.mlrtubymeooejvhg@houat>
 <CAMty3ZANxwUp8yOjo+EWHNngi7SoMYhm1FchM38v_EUDpLY7UQ@mail.gmail.com>
 <20230131124550.6oalx43vz26gi5wt@houat>
In-Reply-To: <20230131124550.6oalx43vz26gi5wt@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 31 Jan 2023 19:17:50 +0530
Message-ID: <CAMty3ZAtOV-jzpoJHdctEES-Mf3eNSKyuuCSgR5V2R+=K2W1aw@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 6:16 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jan 30, 2023 at 06:54:54PM +0530, Jagan Teki wrote:
> > On Mon, Jan 30, 2023 at 6:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Fri, Jan 27, 2023 at 11:09:26PM +0530, Jagan Teki wrote:
> > > > Hi,
> > > >
> > > > On Thu, Jan 26, 2023 at 8:48 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > > > >
> > > > > On Thu, Jan 26, 2023 at 5:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Jan 23, 2023 at 08:41:56PM +0530, Jagan Teki wrote:
> > > > > > > Add devm OF helper to return the next DSI bridge in the chain.
> > > > > > >
> > > > > > > Unlike general bridge return helper devm_drm_of_get_bridge, this
> > > > > > > helper uses the dsi specific panel_or_bridge helper to find the
> > > > > > > next DSI device in the pipeline.
> > > > > > >
> > > > > > > Helper lookup a given child DSI node or a DT node's port and
> > > > > > > endpoint number, find the connected node and return either
> > > > > > > the associated struct drm_panel or drm_bridge device.
> > > > > >
> > > > > > I'm not sure that using a device managed helper is the right choice
> > > > > > here. The bridge will stay longer than the backing device so it will
> > > > > > create a use-after-free. You should probably use a DRM-managed action
> > > > > > here instead.
> > > > >
> > > > > Thanks for the comments. If I understand correctly we can use
> > > > > drmm_panel_bridge_add instead devm_drm_panel_bridge_add once we found
> > > > > the panel or bridge - am I correct?
> > > >
> > > > Look like it is not possible to use DRM-managed action helper here as
> > > > devm_drm_of_dsi_get_bridge is calling from the DSI host attach hook in
> > > > which we cannot find drm_device pointer (as drm_device pointer is
> > > > mandatory for using DRM-managed action).
> > > > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1545
> > > >
> > > > Please check and correct me if I mentioned any incorrect details.
> > >
> > > You shouldn't call that function from attach anyway:
> > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#special-care-with-mipi-dsi-bridges
> >
> > True, If I remember we have bridges earlier to find the downstream
> > bridge/panels from the bridge ops and attach the hook, if that is the
> > case maybe we can use this DRM-managed action as we can get the
> > drm_device pointer from the bridge pointer.
>
> I'm not quite sure what you mean. You shouldn't retrieve the bridge from
> the attach hook but from the probe / bind ones. If that's not working
> for you, this is a bug in the documentation we should address.

Something like this, afterward the design has updated to move the
panel or bridge found to be in host attach.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/bridge/nwl-dsi.c?h=v5.10#n911

>
> > So, what is the best we can do here, add any TODO comment to follow up
> > the same in the future or something else, please let me know?
>
> Make it work in a safe way, as described in the documentation?

Yeah, it is a clear deadlock. It is not possible to use DM-managed
action helper in host attach as there is no drm_device pointer and we
cannot move panel or bridge finding out of host attach as per design
documentation. I'm thinking of go-ahead with adding TODO for adding
the safe way with an existing patch. Please let me know.

Thanks,
Jagan.
