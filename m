Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D48F8023A7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 13:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BD610E180;
	Sun,  3 Dec 2023 12:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254910E180;
 Sun,  3 Dec 2023 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1701605741; x=1701864941;
 bh=zeJoJaDEd/VJIzT04Xj0cuJGWNQ8PVAG6G1sblS0Nyw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=gzlNXqtxmiGejNIfLz4esavOMLl5pQMwwYqxpB6F06RkVWa7dI3Ipy7d5+RH1d3Xu
 5tHOtT5oO7Ya+pH2qxH/nmZVE21DQhJWuc+smqr0GtBdMh5vfwZF1kkCIJYevA4WAY
 E+7wVJ2bhKk06PAGYgHLlxZZ9tB7WmkOm7/67+KFbFiFJvKf78OY44GmVi7aSN0dMS
 cbpjNrEc+mzbir0n63jbEcTrwlSPqay9EB4jgT3epqZdb3+zplMiWXjE6Maq940gqC
 l4wIW6+AQa3MiBMwS/e7tOvEJ5n5+qJq06i9FDwK3FtHWBQq/wS5GYJlUuGcA4z3ff
 dDupDPAFHgLIg==
Date: Sun, 03 Dec 2023 12:15:32 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Message-ID: <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
In-Reply-To: <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
Feedback-ID: 1358184:user:proton
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
Cc: dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>, sebastian.wick@redhat.com,
 wayland-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, ppaalanen@gmail.com,
 Sean Paul <sean@poorly.run>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, December 2nd, 2023 at 22:41, Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:

> On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
>=20
> > Some drivers support hardware that have optimizations for solid fill
> > planes. This series aims to expose these capabilities to userspace as
> > some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > hardware composer HAL) that can be set by apps like the Android Gears
> > test app.
> >=20
> > In order to expose this capability to userspace, this series will:
> >=20
> > [...]
>=20
>=20
> Applied to drm-misc-next, thanks!

Where are the IGT and userspace for this uAPI addition? 
