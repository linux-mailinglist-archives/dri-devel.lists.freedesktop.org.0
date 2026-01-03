Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F956CF04C9
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 20:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DFB10E038;
	Sat,  3 Jan 2026 19:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XwkdHVZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B82E10E038
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 19:12:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD7564424D
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 19:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7BBC2BCB9
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jan 2026 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767467560;
 bh=T925OkrZcUDgPFL2mYysHSWwXId47m50zcvgTJvCH2c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XwkdHVZV3gQnw/Squqt0WQf2kgDmWCB3uLhB4vNPfLhUYflWMvg0DlOyvLv6lOWkp
 GxueGN/DejHjmBa9Q90itz6LELagfJKXs/snV9U7yJC+iCD9CyzzFUj6qTUop4scjD
 pqQ7yjuP3byWkKSdyd0DCyYJ4TLXzhOM0IP5wXrvb8nbbq5WDjvxt5Xo9fPFPOBSOs
 U85EwkPdKHWSQWmnpVHVj1cmGS9TlzUxF0c0zKJuYHRGeWMrmYAUro96BVlbfXlJaH
 2lzbhsxLlt/0vTNe6dCS1vYhYKKknqgjcV4eVykEomW57WOKnMJ6d0FKBOmXku8BKA
 JIQ6TfoXrZcOA==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-78c66bdf675so112660257b3.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jan 2026 11:12:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXI5UmXGTsQXhXmXqsIcS7jN8PMzCIH37b86kOi9DBRckyJrIlQCZY3sbomJ5llX8CRtcB4thUVEcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwroEMiTvIjyWjTEQARhILlmNmTvjdZJ0K+LxEuI+yEwtaZfbrz
 ar2wlhERiuFYX+uUvEcOhRm5WodHBHFOfxZId/h3Fsvmy1yupgjNUAuhUdDVc7+J5Kc4JWMOg+b
 wBBAZKq8u1gwb6OS1/7DO10KtcRYgung=
X-Google-Smtp-Source: AGHT+IGShwlfB3khNYsriA05VuQGUjyDnWfdgI+OFTb0UW6gPumdUc17cvVkNIGVynpsd6//h1UTyWv7gZLMzA3VXbk=
X-Received: by 2002:a53:bf8e:0:b0:643:833:bf3 with SMTP id
 956f58d0204a3-6466a8598f6mr27408373d50.42.1767467559732; 
 Sat, 03 Jan 2026 11:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <3b13c7a2-f7e6-49fd-b3bb-3e0a1fe9acf3@ideasonboard.com>
 <CAD++jLk8-0Rkh16T+R1dh6=e_f9U1i=AKOk1Y8dLGV4bxzRtFg@mail.gmail.com>
 <817b2358-0920-4b7a-abb1-133103d0f9fe@ideasonboard.com>
 <CAD++jLm_0xweD4tRJ8ZfwmcOe2BBGCsUuL1UWUiNM+Gpbq3Zuw@mail.gmail.com>
 <6be8aaf6-b01d-4444-9850-967f8e316896@ideasonboard.com>
In-Reply-To: <6be8aaf6-b01d-4444-9850-967f8e316896@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 3 Jan 2026 20:12:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkWH8xxT+bTXseuJv+pXeEGy7qqE7Z1Mid2CwRg8O5D7A@mail.gmail.com>
X-Gm-Features: AQt7F2oqzhLbhnApuLunbol1WMXqKAfZVNbTglNtWTgf1-h4HM11uw_w8WHAIqs
Message-ID: <CAD++jLkWH8xxT+bTXseuJv+pXeEGy7qqE7Z1Mid2CwRg8O5D7A@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm: Revert and fix enable/disable sequence
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 23, 2025 at 12:48=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 23/12/2025 01:18, Linus Walleij wrote:
> > On Sun, Dec 14, 2025 at 1:42=E2=80=AFPM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >
> >>>> Should we merge this series as a fix for 6.18 rcs?
> >>>
> >>> Too late now, so let's merge it as a fix for v6.19 rcs!
> >>
> >> Ah, right. Indeed, I meant v6.19 rcs.
> >
> > Are you applying it or should I?
> > Not sure if you want some special timing, like outside of
> > holidays.
>
> Oh. No, I'm not a DRM maintainer, so I was waiting for someone to merge
> this. From my point of view it's ready for merging.

Aha OK, I applied and pushed it now. I added the same Fixes: tag as on
patch 1/4 to all 4 patches in the process.

Yours,
Linus Walleij
