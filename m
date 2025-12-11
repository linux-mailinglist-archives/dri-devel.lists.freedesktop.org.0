Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF04CB68BB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E7410E077;
	Thu, 11 Dec 2025 16:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="tKUrmg/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 11 Dec 2025 16:47:31 UTC
Received: from mail-106109.protonmail.ch (mail-106109.protonmail.ch
 [79.135.106.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC90D10E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1765471219; x=1765730419;
 bh=HfYGMq/eC8FJidMtkQ8oj3FKImNrKd5wnRrpAfmbGf4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=tKUrmg/AxFBnSzzdok+YzybYUdRyEGDqGowWLPYfiTl0b0AWXbnRdLVC4GQUcBcuZ
 6mlzCap5q9rRYzGMFyHPhrhyQM5aag+Tq3WLyl3vwKMP3SXaWIabH2yQeeZbFNQWxq
 SSDseSxG7FmboorbxynA36a7B4kVMtIwj1dawb3pnFjsKXSgqDxZH+Y1Ic+DC4TYaO
 BF62uIuBIjEpvMrsQQvU6vu6qM00t9jjitJKDFjhWamlYZbdTw0WoT7MlqnAsdIEHl
 gwqVf1SSw+KxqLPUIZtykZLQxiwuQv3rAc7YaDTo010vxfTmlGujFLw/XETYtTQ4lv
 dMCJORdrPrIpw==
Date: Thu, 11 Dec 2025 16:40:15 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, Sebastian Wick <sebastian.wick@redhat.com>,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
 drm_plane_create_color_pipeline_property()
Message-ID: <JgyhoN6h3UMhM6E3z1092ZDRNRDlyrrQnpUsMb_ldKowPZ4kvmeTm_VmzkrJLJw67DUW6R9r8L53hThH5DCdqwVW2ggQnRoA3Jm84bN2iEI=@emersion.fr>
In-Reply-To: <CN7gZcz0WnfFN-FgfhFlSwX9naLEVoV-H6FCniOPp3glGzIEFRK1-SXlVbb5S_B34TxYnCOBQZj4ldqZNCl-Igw2zyPeUnaruX2ngu__loE=@emersion.fr>
References: <aTK9ZR0sMgqSACow@stanley.mountain>
 <CN7gZcz0WnfFN-FgfhFlSwX9naLEVoV-H6FCniOPp3glGzIEFRK1-SXlVbb5S_B34TxYnCOBQZj4ldqZNCl-Igw2zyPeUnaruX2ngu__loE=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 41222457666ef806f0cc23ef76f7ca273fb936d7
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed, thanks for the fix!
