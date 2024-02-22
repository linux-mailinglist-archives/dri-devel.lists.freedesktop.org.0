Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF41A85F5CF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 11:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76B810E8E8;
	Thu, 22 Feb 2024 10:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="xb8wMV+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2125B10E8E8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1708597958; x=1708857158;
 bh=rpswYnKM3+tQYWrZKHQfucE72LYUDcYNMCKNj8Fps2M=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=xb8wMV+BSz3BxfsRPAf2yliIthRP9a4V+pG10ZgxgD++dgT+vHP8BR2v7ijPQfopI
 aA6r+FvCRn9yFI70IF+NTAJ/2Fd+nHzddvAfpm8mvOs21O8qwmJHS3uv4j30H3uPs/
 Ezd/KsLj1t+ojq9H2hOqflyKwiFw/4XdxmoNqWUO4MeNtVlZkPsT+kCOYbv5UqeN8O
 3TDu6HKAIa/I7KhKN/oiLsGQaOj5EoEModTTDyWTpSCuDBb9AA/y+5B8Oh+i97IyOo
 C6sdp8yszw56ui7X0mFhMk1OhS8nHDIZKk3LqSSlsmzYwnj1fNM5+dhlJSGJKdcYaR
 nxGcpDUdIhsOA==
Date: Thu, 22 Feb 2024 10:32:18 +0000
To: Dave Airlie <airlied@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Erik Kurzinger <ekurzinger@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 david1.zhou@amd.com, ashafer@nvidia.com, jajones@nvidia.com,
 kbrenneman@nvidia.com
Subject: Re: [PATCH v2 1/3] drm/syncobj: call drm_syncobj_fence_add_wait when
 WAIT_AVAILABLE flag is set
Message-ID: <xhFNe5iTIrtv6DeYlgWrwDdU2jxTR3nxMIeEzqRpizETQnuKY-xvTg5ovEY7p-Zee8L2FwRaLdg5lSyEIksbFCOKJHVvndJFeZ-iMMXlyL4=@emersion.fr>
In-Reply-To: <CAPM=9txvnaUukNgA80E2+-JuK3SkjVmGm=3S5ZCHauSg0D1Smw@mail.gmail.com>
References: <20240119163208.3723457-1-ekurzinger@nvidia.com>
 <ZbKkfKHwYriYtSDY@phenom.ffwll.local>
 <31d1599c-e3ba-469d-b4bc-0548ef961247@nvidia.com>
 <CAPM=9txvnaUukNgA80E2+-JuK3SkjVmGm=3S5ZCHauSg0D1Smw@mail.gmail.com>
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

Sorry for the delay. The first patch is also Reviewed-by me, the rest
is Acked-by because I only skimmed through them.

Thanks, pushed to drm-misc-next! Please do ping about patches when they
slip through the cracks.
