Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7DC8E559
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 13:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1595310E07B;
	Thu, 27 Nov 2025 12:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="e4tlfV11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E314510E07B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 12:50:02 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dHGVG4vJWz9sq6;
 Thu, 27 Nov 2025 13:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764247798; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKqVoDFnQJXMwq/ZGtZvgxrR4iEc5s3a2rE4Kl1qBdo=;
 b=e4tlfV11JuSEoMY/H+3ZP17l4N6KzzpwiEcams+d1W2dYXpht5yzezMV0sFxME6wGjRf16
 qIDE0y4DPGVfE4RuBDWQZRvKWNzLKO+2wsbhvaZ5SYfk092wmJmXkg6X0VkTJ9Hby/zwox
 ZW9ogmZPOKKX5LLLPEZllCpo0mQxX4mN809xqCuXml1zKD7FZXpG445nh0joOLhhDgRHJy
 EAJHjPjaeYoErLhrhQYYjmzL2lKDS0gL8P87pMz69i9Z0LB4EO013tkuIkipfeIzT9MGFp
 i7yllI4U1k6lIDw/w6X80RnxJzFR2iIDAPxPslp8H8xeYnXzXBtaKYh+ajN+Ww==
Message-ID: <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
Subject: Re: [PATCH v2 0/2] drm/todo: Add section for GPU Scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 27 Nov 2025 13:49:53 +0100
In-Reply-To: <20251107135701.244659-2-phasta@kernel.org>
References: <20251107135701.244659-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: a3cd0126dafb4a24107
X-MBO-RS-META: a6r1ffo9oceai1r4yqi5oaifc83skfct
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc Matthew, Tvrtko, Christian

On Fri, 2025-11-07 at 14:56 +0100, Philipp Stanner wrote:
> Changes in v2:
> =C2=A0 - Fix wrong list item index in patch 1.
>=20
> The GPU Scheduler has enough problems to be covered by the drm todo
> list. Let's add an entry.
>=20
> This series is the succesor of [1].
>=20
> [1] https://lore.kernel.org/dri-devel/20251023143031.149496-2-phasta@kern=
el.org/
>=20
> Philipp Stanner (2):
> =C2=A0 drm/todo: Add section with task for GPU scheduler
> =C2=A0 drm/todo: Add entry for unlocked drm/sched rq readers

Can someone give this series a review please?

Thx,
P.
