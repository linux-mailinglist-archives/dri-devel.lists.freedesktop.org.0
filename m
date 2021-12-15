Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984DB475933
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2500C10E37A;
	Wed, 15 Dec 2021 12:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96D510E37A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:57:35 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b7so15203900edd.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 04:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NtDzGpDs8sX9MNftYF98+bzY9DkxtCYuBZBtDY3xX44=;
 b=bBVsbSHbpUPxYMmm3siUZn1Qi+gcXn9dIlyezT+ZnZ74n9+FzyqyvLLsi7WAEF/LkX
 YWlkATjju/X1qZGwlyslwsiAUKLDRiB6JgGi6kU4+U54PGur8kIaZooS8bFDmRSebfLO
 tZ9d0IdS0OOLi9J5UL6fkH6ar+5EFL1DPBI+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NtDzGpDs8sX9MNftYF98+bzY9DkxtCYuBZBtDY3xX44=;
 b=P+OiDFQCiJK/jr+Hd0LYyfXD1fbZCQsxQNthNqW3YzjaKQQm54zLq7Wm2sypFmEoqj
 jHEreGjuzOoM6s1RBrTURIsKtxVWb2+QmfBeSQW5rS8CGSP2CcXPPLSoYVWBcAXiRpG3
 I4bxlIoqzVLTlGl7R72jZBzKfjlk30WeQUi136KjTb4JR7vhsjAeLBUqOUvavBZ+48GT
 AmGaCpE5WBfEi6l4FT/RQIsSjFhJkrZv5QQxbq2waPr2AKdw9pPKKO+NOv2eko4aCqvw
 +ga/MotplLKjRxYgxrDWBYWsMTZUC8AgUbEIk+LqW6fMmTA89QCN/J6n0yWtDb05uYgb
 zqFA==
X-Gm-Message-State: AOAM530va+FHLmVpyHNaASXEBop4wDwunSN2IPoWlI74SFSg0fWbBWUb
 SgVCg30a0WB5oHDzVwk640efvOCl9BL8vAox3CXVlw==
X-Google-Smtp-Source: ABdhPJxQ9txAFSxzcE62e9wv6P1hm1LTQhQGjWbxFpol9AhN2Nh/SBsjx6fSQK3xjOwxVrUhAXEEnomD1fmWOCBZL2Q=
X-Received: by 2002:a17:906:390:: with SMTP id
 b16mr10476372eja.123.1639573054396; 
 Wed, 15 Dec 2021 04:57:34 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211215101548eucas1p2a7f4a64ae55364181eec3db3ad5d6ef7@eucas1p2.samsung.com>
 <20211215101534.45003-1-jagan@amarulasolutions.com>
 <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
In-Reply-To: <39f646d7-9d49-045a-2cf5-3cdc12486cb3@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 15 Dec 2021 18:27:23 +0530
Message-ID: <CAMty3ZBmZo3wqzj2Si4Ydm1RtzGs7f89aCktgVvD==appfSCPQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] drm: exynos: dsi: Convert drm bridge
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, Dec 15, 2021 at 5:31 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 15.12.2021 11:15, Jagan Teki wrote:
> > Updated series about drm bridge conversion of exynos dsi.
> > Previous version can be accessible, here [1].
> >
> > Patch 1: connector reset
> >
> > Patch 2: panel_bridge API
> >
> > Patch 3: Bridge conversion
> >
> > Patch 4: Atomic functions
> >
> > Patch 5: atomic_set
> >
> > Patch 6: DSI init in enable
>
> There is a little progress! :)
>
> Devices with a simple display pipeline (only a DSI panel, like
> Trats/Trats2) works till the last patch. Then, after applying ("[PATCH
> v4 6/6] drm: exynos: dsi: Move DSI init in bridge enable"), I get no
> display at all.
>
> A TM2e board with in-bridge (Exynos MIC) stops displaying anything after
> applying patch "[PATCH v4 2/6] drm: exynos: dsi: Use drm panel_bridge API".
>
> In case of the Arndale board with tc358764 bridge, no much progress. The
> display is broken just after applying the "[PATCH v2] drm: bridge:
> tc358764: Use drm panel_bridge API" patch on top of linux-next.
>
> In all cases the I had "drm: of: Lookup if child node has panel or
> bridge" patch applied.

Just skip the 6/6 for now.

Apply
- https://patchwork.amarulasolutions.com/patch/1825/
- https://patchwork.amarulasolutions.com/patch/1823/

Then apply 1/6 to 5/6.  and update the status?

Thanks,
Jagan.
