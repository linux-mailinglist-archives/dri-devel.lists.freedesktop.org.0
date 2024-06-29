Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C991CDE6
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 17:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C26510E116;
	Sat, 29 Jun 2024 15:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="fIveWBJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D2110E116
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1719675146; x=1719934346;
 bh=ARk1CN4SNcrfhu3AqT6RA6aL1fK6aSQsAxE+h/7vxhs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=fIveWBJkSHRuccK8cvS5m9EEIOm7OhJ7/rp9IPhhkZjWp0WSdqOExdFE+mGuPkHxP
 cDBCGiR0XfY7FeY5UNf0VG2msGpfX/4bJcw3JAemv4hFre+JtpXjqk66x6mbxAINIG
 YtCb39zRvqmZTFMNcC3ko3NNGtvvLMawB+DyLvvH9NOh+l9+271W9CVR6+bOFBREho
 FdRso2Eg4Q8fA2PjhPnFni1RodWQ7zDN+ehoB4FUZpCwAqh6D3jNo4slCK+rs2wVeK
 YS68CZVR+6wz5fg8T9/alry7xsyYtXBkL/fY+J1vZgoAYwRazqsUt4kxHja+RQ37HI
 2t0pJJOyRBVQA==
Date: Sat, 29 Jun 2024 15:32:20 +0000
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/1] drm/atomic: Allow userspace to use explicit sync with
 atomic async flips
Message-ID: <E2TvhjtSDwH2ewf7fHTKGQChRCccKteo-t-FYLisImD7vCllDyV4_hcl8LsfKyY28mc5D7_zYSIJ5Qjac8QnENcI12RQHsDj5O3JyPzhiIg=@emersion.fr>
In-Reply-To: <20240622170951.738735-1-andrealmeid@igalia.com>
References: <20240622170951.738735-1-andrealmeid@igalia.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: eb194cda8e85e2e446f855a2521d5ab3ca4f3c8d
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

On Saturday, June 22nd, 2024 at 19:09, Andr=C3=A9 Almeida <andrealmeid@igal=
ia.com> wrote:

> Allow userspace to use explicit synchronization with atomic async flips.
> That means that the flip will wait for some hardware fence, and then
> will flip as soon as possible (async) in regard of the vblank.

LGTM.

Would you mind sending a patch for FB_DAMAGE_CLIPS as well?

Reviewed-by: Simon Ser <contact@emersion.fr>
