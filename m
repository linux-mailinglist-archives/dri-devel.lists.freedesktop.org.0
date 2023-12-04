Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91650803C1E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F0010E3B9;
	Mon,  4 Dec 2023 17:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D7E10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1701712629; x=1701971829;
 bh=LY3sP/4sTj7mqHdOLHk+rwzWiUGUqHRhO85z7iFff1c=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=od5Zv7fk1lUnMdsQ9YNRFDSYIiGp12yPJns9zw/CKixtj7cTlkw7hG7Wl5rZnyHLH
 LuzkkF3P4GUzfwySyCTkTyaJ6AjBrjgPPw2aKpkd/tdndVCjKH7BeIKBHiNbvotEGF
 FB8/LAR2Io0b15T0sfHnEe7MX38cS/us/+ITNU4AOn4hygW24FGR0IIi8iM0rY95kM
 k6cxQgYK5RHb6cwl4YsJQZUxZiQ1CLmEVkXf5iH0obFIujihrOYMnWp4ETxpPFxhJd
 k7c2wk0Wy9sFKL8q8aOJgb0iTN89DqUp2bqtbdY+dz/0bmCXVNrvJKVAhG4GwY7O6n
 uAwCDVsGcXHsg==
Date: Mon, 04 Dec 2023 17:57:02 +0000
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Message-ID: <jLtQnAu4g7zRJxEwwoX5HhVfleNLflhi9mUGTQAVKV4QaZt_D7NIOov31MKHu3zdEls3ULzYEiQNGeL4gKRpjjU1VDbl4DDhEBldXXrYzNA=@emersion.fr>
In-Reply-To: <44a3fbd4-44fb-0a39-65be-e680e03b1b6e@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
 <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
 <44a3fbd4-44fb-0a39-65be-e680e03b1b6e@quicinc.com>
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
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 ppaalanen@gmail.com, Sean Paul <sean@poorly.run>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, December 4th, 2023 at 18:51, Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:

> > Where are the IGT and userspace for this uAPI addition?
>=20
> Yes, we made IGT changes to test and validate this. We will post them on
> the IGT dev list shortly and CC you.
>=20
> We do not have a compositor change yet for this as we primarily used IGT
> to validate this.

Yes, please post the IGT.

> Can we re-try to land this once IGT changes are accepted?

There will need to be a user-space implementation as well, since this is
a hard requirement for new uAPI [1]. Maybe I'll give this a go if I have
time.

[1]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-use=
rspace-requirements
