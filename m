Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C47C9AE83
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30D410E5CA;
	Tue,  2 Dec 2025 09:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pgxalzxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEE110E5CA
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 09:42:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLG5D1PRBz9tYG;
 Tue,  2 Dec 2025 10:42:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764668528; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nml6aidyLAUTKS+9IwH1T9+BnWn8mVKKNNSv+ivqmHI=;
 b=pgxalzxCwUTbiU3EiZagPm+kzV6Z7YR5ohIkZqei+ENi+hWO+4Ia9trV3jgPFpqALbCUZ3
 N2suGWGtwnBcT/QglZh7sT2ThDEs+KNxlrMQuVva7s+vjI62VKE9lFLjlkKtkBdC0DJfr5
 qNDV082Os163WYmLQwXsk0YqI8lqR6QHduzwTkXEMmXpbSxCwHsORpEcog6o8WcnfXZV3q
 E3sR4NrwHu3ATFnCCkvGI78ote9QmRppMLH+/EvRmYvXgvCshf5tF+U18n4T+HjeZTxf0T
 k0ZQozwVI3Kt6guzUEZYKjBIYFeNMcECQB+PTg8DfvR7E67MzKMK1+ASdo3Mdw==
Message-ID: <84fa6d8a05c0227c33f904c2b88e309963226b8d.camel@mailbox.org>
Subject: Re: [PATCH v2 0/2] drm/todo: Add section for GPU Scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: Dave Airlie <airlied@gmail.com>, phasta@kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simona
 Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 02 Dec 2025 10:42:01 +0100
In-Reply-To: <CAPM=9twe+Q0pP3KiWy7ZTYxRs_yN1bHEto6Mptqb3ub7vimgtw@mail.gmail.com>
References: <20251107135701.244659-2-phasta@kernel.org>
 <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
 <CAPM=9twe+Q0pP3KiWy7ZTYxRs_yN1bHEto6Mptqb3ub7vimgtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: efa47a7497b131966f1
X-MBO-RS-META: yyqaxhgakntqqu66gzg19q83dn1une71
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

On Tue, 2025-12-02 at 17:37 +1000, Dave Airlie wrote:
> Acked-by: Dave Airlie <airlied@redhat.com>
>=20
> On Thu, 27 Nov 2025 at 22:50, Philipp Stanner <phasta@mailbox.org> wrote:
> >=20
> > +Cc Matthew, Tvrtko, Christian
> >=20
> > On Fri, 2025-11-07 at 14:56 +0100, Philipp Stanner wrote:
> > > Changes in v2:
> > > =C2=A0 - Fix wrong list item index in patch 1.
> > >=20
> > > The GPU Scheduler has enough problems to be covered by the drm todo
> > > list. Let's add an entry.
> > >=20
> > > This series is the succesor of [1].
> > >=20
> > > [1] https://lore.kernel.org/dri-devel/20251023143031.149496-2-phasta@=
kernel.org/
> > >=20
> > > Philipp Stanner (2):
> > > =C2=A0 drm/todo: Add section with task for GPU scheduler
> > > =C2=A0 drm/todo: Add entry for unlocked drm/sched rq readers

Pushed to drm-misc-next

P.
