Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783842FD23
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 22:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05156EDFF;
	Fri, 15 Oct 2021 20:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB5F6EDFD;
 Fri, 15 Oct 2021 20:58:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70B8D611C8;
 Fri, 15 Oct 2021 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634331519;
 bh=dnhU3wtRX7bT2bq9tiHUtMnhaK6NX1drdYaHmI6czC0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ewbBplKerg8taL0KlCahYh9/akFDTqPSg8vTR4ISXNdghQktA/zMYhJvetI3SSTiR
 nRFx/RgiIqr5mEs0S4NMswOamMCkK1Xrw4y6ItMFpbm3ndUUtpYYsTYg7Tj2GtZuLk
 gQjuPc8tHPyxZp+r3aeyIVgLkxuMHWS1I0vyUIBsEPxsIuxshpUrjymKaaCvcNQdDZ
 NHCAv25DiuKpbGyhu3vnxzmU8pBYJ86WnvzKRNPwGajeSQLLm9EEd8ytO0SY+wS/YS
 GhtCeXHRng3Ce+b9n2pPCkvFqjfVWpCexuBypvwU7zkL01Bd/lV8pQbeS91oxsEArz
 RrOqzqfRfNtTw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
References: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom-apq8064: stop using legacy clock names for
 HDMI
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date: Fri, 15 Oct 2021 13:58:38 -0700
Message-ID: <163433151821.1688384.7720591539857708126@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Dmitry Baryshkov (2021-10-14 14:42:21)
> Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
> device tree nodes.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
