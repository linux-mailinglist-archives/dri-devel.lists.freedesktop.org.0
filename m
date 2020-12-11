Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01AA2D740C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C656E06B;
	Fri, 11 Dec 2020 10:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A91B6E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:39:03 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607683141;
 bh=Bz+m0LA3efiYruNMshJsmt9IOFPisnU8BoNnfrqstZA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Lyt11K1meZBJ7yknImr5toNje6XvruwAcQfvIco5VFR+7Mclk7yKdMDhf/ffTxvEy
 vWH99foDUhlYc5kdzvhIdBzgjAHJhZzFBHAsRbf1He3CWq7W2S3FF89NBcZ3xVy+mu
 z2IQWju8HfKjGXRtb2SJP134oFASxLCFmLhFaPljt/OSGr3Tl27MQ0rctZLvIqWKC1
 pDsCZPhBBMNGovRm4CR12YVcUlji7niX8EoP5xiimU4AuhleEP868kALElzUyp1It7
 n2k3Yf29rsu9mXD0/QVp74PY9uATmyWxiO+xF3CS5scAH1DMNK0iZjngYxNdkv7j9n
 7id6yjFB6AppA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 0/4] drm: add more primary/cursor plane checks
Message-ID: <Z7YI8UYS6vuol52vDpUtRsydjU0rXlIHobScCJuqTA@cp4-web-031.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the same series as v1, but with a new patch appended. I've tried
coming up with a wording that isn't too confusing, while still accepting
configurations like amdgpu's.

Each patch changes the docs and the drm_mode_config_validate at the same
time, so that we can easily revert a patch if needed.

Simon Ser (4):
  drm: rework description of primary and cursor planes
  drm: validate possible_crtcs for primary and cursor planes
  drm: require a non_NULL drm_crtc.primary
  drm: require each CRTC to have a unique primary plane

 drivers/gpu/drm/drm_crtc.c        |  3 +++
 drivers/gpu/drm/drm_mode_config.c | 40 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c       | 22 +++++++++++------
 3 files changed, 58 insertions(+), 7 deletions(-)

-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
