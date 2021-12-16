Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE394766F9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 01:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C23810E2DB;
	Thu, 16 Dec 2021 00:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8290D10E2DB;
 Thu, 16 Dec 2021 00:43:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3030961B65;
 Thu, 16 Dec 2021 00:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77383C36AE1;
 Thu, 16 Dec 2021 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639615426;
 bh=0a0+jjKb223PJQa3TiWBP7QgKr5ZKDUK1W5ZPLWni6Q=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=Rapx9OBhWmNGrOE6j9ZULoqvZo1LX2XmHvIcYR9DUGdb8iP7pxyPZTXZu7XvwRJjm
 gmyRgheUUr8YCeUyhrOphJfp4xlfjED3phY/27+yNsptx45EMnQbdF7A+CftEiW1QK
 QRTlGGU70Cuu59De/0AoZEjvNCQXD1AdbaN42roDp/J9SHNIoKygReTZp7c3ThnLH5
 uBBOmTpQxzbXecoCegGbwHoVxD/+2o3JUKrzmorVUXRAxxTNynqmEX9uOyVy/ShTjt
 uv1oTa1oAavVJ3INQaZsueIfWNT7ZQPTTMF9dMivWByM4E3kNZ3gM4bZoFLWFm6BU9
 sWuVKBeI+M26g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <69e44191-201f-8714-8a83-1a65a7026b54@linaro.org>
References: <20210911131922.387964-1-marijn.suijten@somainline.org>
 <163165584152.763609.4056232270079096475@swboyd.mtv.corp.google.com>
 <20210918144038.6q352hzqopx7vvdu@SoMainline.org>
 <20211214194656.mayiy4xhcshjluwf@SoMainline.org>
 <69e44191-201f-8714-8a83-1a65a7026b54@linaro.org>
Subject: Re: [PATCH v3 0/2] Use "ref" clocks from firmware for DSI PLL VCO
 parent
From: Stephen Boyd <sboyd@kernel.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, Andy Gross <agross@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date: Wed, 15 Dec 2021 16:43:45 -0800
User-Agent: alot/0.9.1
Message-Id: <20211216004346.77383C36AE1@smtp.kernel.org>
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

Quoting Dmitry Baryshkov (2021-12-15 12:02:37)
> On 14/12/2021 22:46, Marijn Suijten wrote:
> > Hi all,
> >=20
> > On 2021-09-18 16:40:38, Marijn Suijten wrote:
> >> On 2021-09-14 14:44:01, Stephen Boyd wrote:
> >>> Quoting Marijn Suijten (2021-09-11 06:19:19)
> >>>> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> >>>> global name, most of which don't exist or have been renamed.  These
> >>>> clock drivers seem to function fine without that except the 14nm dri=
ver
> >>>> for sdm6xx [1].
> >>>>
> >>>> At the same time all DTs provide a "ref" clock as per the requiremen=
ts
> >>>> of dsi-phy-common.yaml, but the clock is never used.  This patchset =
puts
> >>>> that clock to use without relying on a global clock name, so that all
> >>>> dependencies are explicitly defined in DT (the firmware) in the end.
> >>>
> >>> I can take this through clk tree if it helps avoid conflicts. There a=
re
> >>> some other patches to sdm660.c in the clk tree already.
> >>
> >> Might be useful to maintain proper ordering of these dependent patches
> >> but it's up to Dmitry and Rob to decide, whom I'm sending this mail
> >> directly to so that they can chime in.
> >=20
> > Dependent patch [3] landed in 5.15 and [2] made it into 5.16 rc's - is
> > it time to pick this series up and if so through what tree?
>=20
> I'd also second the idea of merging these two patches into 5.17.
> Most probably it'd be easier to merge both of them through the clk tree. =

> Or we can take the first patch into drm-msm (but then we'd have a=20
> dependency between msm-next and clk-qcom-next).
>=20
> Bjorn, Stephen?
>=20

Sounds fine to take through clk tree.
