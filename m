Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E392E4F3D5C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 21:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3CE10EE8D;
	Tue,  5 Apr 2022 19:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0785910EE84;
 Tue,  5 Apr 2022 19:33:07 +0000 (UTC)
Date: Tue, 05 Apr 2022 19:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649187184;
 bh=rizVX8SaxkopwG+PgRvZo+RGKMBEJnMwXHtVKUz8fmo=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=wmTleW8zMQpVAVbXE3xUka7RwlsA2DK0Pab6drVgGGVbpHvLfSEvG1ruDB+ninz60
 MwmwlqMTwKrZlJuU1rJFSJv9ojTprWUmeRJ1Ukh7roYxn6CR5riVoqGj76tApG4y1U
 IEaYk6QJFNCtlO4SeoNBA2H+HSibOEyd62Ur/C5VEI94bLsGeYhYHkXwRdia/1/jkg
 Wbm5Ns3QcOgKwMdn5HoPlqtA0te0CEnmUk7dqa1W6IjhFuFr8nqbzgnD0z9lnY7U8q
 VTHNe3cyczDk3H8KFVaCZngeq+bnRvCk1tkeIlZcjjoNZwVnwMuk7oMbTQhtwtt6KV
 PrHwo1QiFHsYw==
To: Melissa Wen <mwen@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/amd/display: don't ignore alpha property on
 pre-multiplied mode
Message-ID: <oPxlwpfhK4TKsOfqVS-hfX4WN9CvusPH8C6rRq_NKYMh_YocjF9eBY13cALFQiqfCH_OgjIcXFkrjPU_bndAItgl31kjkkjmZlIN5vy7lxU=@emersion.fr>
In-Reply-To: <20220329201835.2393141-1-mwen@igalia.com>
References: <20220329201835.2393141-1-mwen@igalia.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: sunpeng.li@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui.Pan@amd.com, Zhan Liu <Zhan.Liu@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Agustin Gutierrez <agustin.gutierrez@amd.com>, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've tested this patch and it fixes my bug [1]. Thanks!

Tested-by: Simon Ser <contact@emersion.fr>

[1]: https://gitlab.freedesktop.org/drm/amd/-/issues/1734
