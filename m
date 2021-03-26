Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A7D34AA53
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AC46E210;
	Fri, 26 Mar 2021 14:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9306F6E210
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:42:37 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2572777pjv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UFMq5oGqK9i1mDSf60y5PEUGhIBG7pRAYbpbnOiZny8=;
 b=mv55z1PJnHOdzF+Razme2uGyDMAKDIds0+fVKvLTeYihRej0U/HhvFheWkOyEW46lQ
 p/FQv3oZw1iOT9kemojIsWacZNZM17IMOOcrZ3aFKcJp3iVbq2Wwrc+JCTbiHP4wDWRV
 ZJPXUndXDpIXRtpiBWQA23dRkPpyuvglb4olx7fs9YxqFcesoMgnuuQErBef1NUHs4Qn
 G8A6rKGU3jYTlRnixV+NF8HtQ9Fbn4S6sAR1dr5IM8VP1KiE+1tlI7yEprtg+Td0Btl9
 imuDP3zGuOHhDcJZ7p8rd1pMVs6DbhrNskSr51H5jc7MUT3OBWhNulA2m4f9fiZUXUkR
 6RXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFMq5oGqK9i1mDSf60y5PEUGhIBG7pRAYbpbnOiZny8=;
 b=NKKeM42LS5WRPQhlRCo0NuLOPk3sVV2k8zA9v8Kqr6ZX1XLAccJXXd1xcQSEZ/EZTT
 xxquKDzKogLPa4R6vGb4rm8ZbNIlSM+KzfBAQIEqeZc8IIj0bMIcZoIFGIikH2KvuVi/
 SKeB6P12DDbxAvDU/d7DOZeClejUflK5BhcANKe19+ztS8YNBk1qfoxpdImaKokfswSL
 4iq8h8/yUhrPPSwsvtletc2jiMeoMqvguqb6lLc5eFWjInEk8Sdva1f6OOldTQHkF8rV
 OjPQcqWxmTEiFaLI0nnUJFSH8UOYPCmhLR4pxzJd93gf+nxSvF2JKa2/38CecJi9Zcd+
 sK2Q==
X-Gm-Message-State: AOAM5319MuHjXYPoNsjcY7fTFEoTZft/51AmP1qmadInD15q7vFO0o9B
 VcKt/uJmkC6tq8NgaqdSYrgcl/qSJcQ4mF3vKh17DQ==
X-Google-Smtp-Source: ABdhPJx47matal3VQ/+kh7d6hGrS8XwLC35YL0FwaAQVm4zRCOmCmdKu76eThs8vq4vrD+9j40M7EHNSMF06k5yz6gY=
X-Received: by 2002:a17:902:e752:b029:e6:822c:355c with SMTP id
 p18-20020a170902e752b02900e6822c355cmr15437871plf.69.1616769757181; Fri, 26
 Mar 2021 07:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210326121955.1266230-1-adrien.grassein@gmail.com>
In-Reply-To: <20210326121955.1266230-1-adrien.grassein@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 26 Mar 2021 15:42:26 +0100
Message-ID: <CAG3jFyv1kvr1rGok5WB4HL5yRH0f26ZrrmQzSv6uC9kQqSxF3Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3aa6031deefa9a2c056af2182af02d3dc5df1067

On Fri, 26 Mar 2021 at 13:20, Adrien Grassein <adrien.grassein@gmail.com> wrote:
>
> Hi,
> this patch set adds the support of the Lontium lt8912 MIPI to HDMI
> bridge in the kernel.
>
> It's only support the video part, not the audio part yet
> since I don't have the datasheet of this component.
> I get the current i2c configuration from Digi and
> Boundary drivers.
> Developed using the DB_DSIHD board from BoundaryDevices.
>
> Update in v2
>   - Use standard data-lanes instead of a custom prop;
>   - Use hdmi-connector node.
>
> Update in v3
>   - Fix indentation;
>   - Implement missing bridge functions;
>   - Add some comments.
>
> Update in v4
>   - Fix bridge ops;
>   - Fix i2c error detection.
>
> Update in v5
>   - Fix lt8912 name (lt8912b instead of lt8912);
>   - Implement HPD via a workaround. In fact I don't have the datasheet
>     of this component yet so I can't say if the configuration of the
> registers is correct or if I have an HW issue on my board. So, I choose
> to implement a fake version of HPD using a workqueue and polling the
> status regularly.
>
> Update in v6
>   - Fix a warning found by "kernel test robot"
>
> Update in v7
>   - Fix HPD logic (via an HW emulation);
>   - HPD from chip is still not working.
>
> Update in v8
>   - Remove HPD logic (will be added later when HW bug qill be fixed).
>
> Update in v9
>   - Fix errors found in scripts/checkpatch.pl --strict
>
> Thanks,
>
> Adrien Grassein (2):
>   dt-bindings: display: bridge: Add documentation for LT8912B
>   drm/bridge: Introduce LT8912B DSI to HDMI bridge
>
>  .../display/bridge/lontium,lt8912b.yaml       | 102 +++
>  MAINTAINERS                                   |   6 +
>  drivers/gpu/drm/bridge/Kconfig                |  14 +
>  drivers/gpu/drm/bridge/Makefile               |   1 +
>  drivers/gpu/drm/bridge/lontium-lt8912b.c      | 765 ++++++++++++++++++
>  5 files changed, 888 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
>  create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912b.c
>
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
