Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3885E69579E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 04:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EAE10E099;
	Tue, 14 Feb 2023 03:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7696410E099;
 Tue, 14 Feb 2023 03:52:51 +0000 (UTC)
Date: Tue, 14 Feb 2023 03:51:47 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="QCqSa/pM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1676346718; x=1676605918;
 bh=0Om9daH+srbk1Ex/nmyUaiTIs6i2DWm1NO4B9XgAcyY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=QCqSa/pMmKl1ay1aobbYEyGECEStKkRwFgCn1Zg9Srvv0ADhfNSXrEAXEM6ff+L0s
 5OEaYgf+G458WSp0jHGTETKoGpGQBOcJgpQqr4f9KSO4s6JyfruycXkKcupJFOQZ+d
 gSCaQsPkASYWcV0Hv3/2GhXsaV80ZyiST44YNHSoxYhW/5nfNq8D6QkMicu7VAfd6p
 QbMORxWvEFlRSZveKY30PdDfauIQN13hAeCkiiyKspG00RgbeDuboJwsXXAgwpTScy
 Dl9B9YBEDbqEbWGJgLnIR3H4wS66XaL/idGJ0cQrq/MqZiuC8LJgiH0TWYGMnbotS1
 1TEZw3unvTxzA==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 0/4] drm/msm/a5xx: make it work with the latest Mesa
Message-ID: <Y8RflDlhcu8n8TdSUK96ddC4DWbEDkGMcVEPfYYB2QiGB84R1-KDaERr26P7SOmBrxowVqP75m6dC2r_30-Wx5mSxgS3ytWnvQhhsB4C1DU=@protonmail.com>
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 6882736:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 14th, 2023 at 6:09 AM, Dmitry Baryshkov <dmitry.barysh=
kov@linaro.org> wrote:

> Mesa 22.3.x changed the priorities used for the GPU contexts, making
> kernel switch between different ring buffers. This uncovered several
> issues in the A5xx preemption code, which are now being resolved by this
> patchset.
>=20
> Dmitry Baryshkov (4):
> drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
> drm/msm/a5xx: fix highest bank bit for a530
> drm/msm/a5xx: fix the emptyness check in the preempt code
> drm/msm/a5xx: fix context faults during ring switch
>=20
> drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 +++---
> drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 4 ++--
> 2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> --
> 2.30.2

Thanks for the fix!

For the whole series, on MSM8996:

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>

