Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004F485CB5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB35C10E4AB;
	Wed,  5 Jan 2022 23:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389F210E4A2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:57:50 +0000 (UTC)
Date: Wed, 05 Jan 2022 23:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1641427067;
 bh=20o01XlA0KPZSVp+vlUsACYY1X55JbN6UgC7f+UelqM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=KU7HMLxThumPxf7UkHKfua0m3uvjETarY89Q6xNfLsKAupnOUDSGwLh4gFmmjIooM
 PwI6oSoozg8F0sxWHrQbwxLILF6a3gxDkVY5PKJNCv9StTxCxaGLHPVDF/pAqPWuk6
 XJlpuNFfEWZRBr0waV3YyrIUN37BIX7WUVO4cQQU5smtfteLpKX0rkpNCADCWpwX6W
 Y2K6n2MuJRDtnUVWxpoMrVqzp2WaNHMpb7JsacVeM2tMFuqJkcxGIAboKpTyef6XW6
 aw3JYeTsq5ixP+ApGdEAng42e1/xrPs/MiL/DrHZD/I3ebikszo+4uLqm6dZvZLz+6
 y63PAAChf+wvA==
To: Tomohito Esaki <etom@igel.co.jp>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 0/3] Add support modifiers for drivers whose planes
 only support linear layout
Message-ID: <OCRYf0WjHfvIDxKeXD9eR8KiweNqCTcuy5QUapIIYgtas4x2m_nNc6mDZGnhO-y1H_yYh0O8qzzgAWdExGyK-FjUExqXY1CDlCtSDevNmWg=@emersion.fr>
In-Reply-To: <20211222052727.19725-1-etom@igel.co.jp>
References: <20211222052727.19725-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alex Deucher <alexander.deucher@amd.com>, Takanari Hayama <taki@igel.co.jp>,
 Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for working on this! I've pushed a patch [1] to drm-misc-next which
touches the same function, can you rebase your patches on top of it?

[1]: https://patchwork.freedesktop.org/patch/467940/?series=3D98255&rev=3D3
