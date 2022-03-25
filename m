Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4804E73B7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8A010E207;
	Fri, 25 Mar 2022 12:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978F510E207
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 12:48:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C5235C00DD;
 Fri, 25 Mar 2022 08:48:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 25 Mar 2022 08:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=/JazTPugUwI/qpTRkQsn+/nggbMwyhwSMkZ+GM
 NjrTk=; b=mqihpl8VAVROek7BaCTRTRQ0qfDDyMfx5Px0GTBaWrEU0X+9S1zyqZ
 PtQqI3KtDlDjqhLkmGux+qrKUOVXnCJzhum/OCP5BZmiKYxcyxQYI1bwmPOHYBmE
 i8weXTyd0BWxtmmN9rFwExtr+AebtxhAF6nEfqYYAgjpPWrbVCXM5LPC+UAvWln9
 d3aDa8D3Rr3G+UL1V+53x4KPTsRJlusM+knfBkV8BWp2EOUF5X5pdyL/vRI19XxG
 1KPofLWW6jjPi1094ZaLGIMhNmrMDhfWLPthlORrEBXg3eGq/QXBnCHdYd/L1vUJ
 nvFpFx6Mi0QnYEpc9EcmhH8LNWrIdVTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/JazTP
 ugUwI/qpTRkQsn+/nggbMwyhwSMkZ+GMNjrTk=; b=J8LIy1cXAmHPT0t6LySKDi
 LiLum1fa66VDxhzGcn+7NwA6buSUKNtBe27aeGz6j9i+Zxai1aS6Cy98ostSbdAL
 TqjxeWKhD7YWUKzls+1wfzwqOcARp4UjLv9QJQsfdCM4DB/fVtlxDRtY09/xR0tP
 lfZlC4TsAOuTIhvs4RhtgmRgPG6ezmsQ97xOb9tF2FUCcqkfQAUlOR7gpDDixOUc
 kf7M11rYriQrOwrrt/u9woD3wCQZCn4TL3xqd0i0godh61Vp9iDE7zsNHR0EzgTs
 ni+/DGB7rOiOVGKi/Mp3BDpAxMQRvaUZpjYpcQ9Ku5LoEyWD1IZCfwPu0aIO3ULw
 ==
X-ME-Sender: <xms:GLo9Ykj7TTUgaZAK1IgG5be0wfFxQIjXbbGzFvIhukPbW0d0UQj3RQ>
 <xme:GLo9YtDJTCA76dtWjf-O6kdeJLEUSqQjZXtO1wmIDursvi7qf7Y5yaClFEjQl5kBI
 Po_im2Tqhcn0eZOIYU>
X-ME-Received: <xmr:GLo9YsElIyFCbMVFJlE9uW3xGtxoadzakbf--r445vLFZChQCUQ5PxgnTFeRvKAJsHFKEw_f_2aorTEFnzDL0lwt_Lghk3FYD8ZoNhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GLo9YlTlsSD2Nuw7rzkLG_CL32K7s9-6UbjYUlROdqIoOJyHvZeRCw>
 <xmx:GLo9Yhzhez0lWOqOzLp5sIT0njQPExZcJuVYfWuQGkiRT2k60nSshQ>
 <xmx:GLo9Yj6dtMibski3F3Uk4g09ZB9YwgVvE1IfPTzcffM17BToy6JuEQ>
 <xmx:Gbo9YonC0Ky0VywTaT29vcVJ1rS63EsOC9krZOcA_j5bbNd4Mxrd5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 08:48:24 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/atomic: Atomic Private State debugging
Date: Fri, 25 Mar 2022 13:48:18 +0100
Message-Id: <20220325124822.1785070-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This series adds an atomic_print_state hook for drm_private_obj to ease the=
=0D
debugging of driver-specific sub-classes, and adds one for vc4.=0D
=0D
It also changes the call site of drm_atomic_print_new_state to make it more=
=0D
consistent.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Added Daniel tags=0D
  - Added drm_private_state documentation=0D
  - Fixed unused variable warning=0D
  - Removed the drm_atomic_nonblocking_commit() logging=0D
=0D
Maxime Ripard (4):=0D
  drm/atomic: Print the state every commit=0D
  drm/atomic: Add atomic_print_state to private objects=0D
  drm/vc4: Constify private state accessors=0D
  drm/vc4: Implement atomic_print_state for HVS channel state=0D
=0D
 drivers/gpu/drm/drm_atomic.c      | 20 ++++++++++++++++++++=0D
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ----=0D
 drivers/gpu/drm/vc4/vc4_kms.c     | 24 +++++++++++++++++++++---=0D
 include/drm/drm_atomic.h          | 27 +++++++++++++++++++++++----=0D
 4 files changed, 64 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
