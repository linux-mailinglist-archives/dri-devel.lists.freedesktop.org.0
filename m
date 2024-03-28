Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A188908AB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 19:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DC1112357;
	Thu, 28 Mar 2024 18:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="5bMzjLzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3153112357
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1711652058; x=1711911258;
 bh=8JJ9p6lY9P8w8IbBioVbNGfdfLpZkqX+ZuL2awuKSIM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=5bMzjLzWWcja+ZA1U8Sd4z+g+N8734Qk+FmP8GfAmatOwHanX6qEioeHz+S7kaV6F
 HIo2tInlvJg/uWInypz7H2Iudeh661OPc/YU0E+q/5tRyT3i07tTdz+Xybnp7Q4S5B
 g5WFOYvC/49xjm6nPtp42MXmsHb+YVKWne/CQZ0gltKn/P4Y41P/e2as+Rb00fkxLo
 UxJQtAobRaXfKaqBWW41lb4NYL/DSEuD48HimbrlIz+yAbTpibpzHUjO3A5duwnoDP
 0Dc4NF0zLx4qGJsMqAfIENmVPw06BXWNGhRY14OOFEA9fIFxwHylSLdf2ohGdZUX6H
 yhGezeSAIhDlQ==
Date: Thu, 28 Mar 2024 18:54:10 +0000
To: Rob Clark <robdclark@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Dominik Behr <dbehr@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
Message-ID: <y5mjLoUp9fKwSNrAEOQJtfqfDZ5cYtsf_KcbNCWQieZE-uJXQJE6bQhC6oLfS6aBZRimZSarDjUmeakjwYZmtQZWPM_3lAENdY17K-VyGsc=@emersion.fr>
In-Reply-To: <CAF6AEGvUsP7fjqFH9Co1vE0ZGRmMXmFBCrNc3hCQwxky3mME3A@mail.gmail.com>
References: <20240322214801.319975-1-robdclark@gmail.com>
 <1Wwj_q3RYer6np0Orz0wJd9dlF82iBSX-PIVSlhCgJbpfVBMHF_CF04gHojkvqnvz9NXH6kACZGXQG9yXwtkbjIzLmdi-GNDkO5Nz2E-J9Y=@emersion.fr>
 <CAF6AEGvUsP7fjqFH9Co1vE0ZGRmMXmFBCrNc3hCQwxky3mME3A@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 28th, 2024 at 19:47, Rob Clark <robdclark@gmail.com> wro=
te:

> any chance I could talk you into pushing to drm-misc-fixes?

Oh sorry, I thought you had access=E2=80=A6 Pushed with a minor edit to rem=
ove
unnecessary parentheses to make checkpatch happy!
