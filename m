Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318FA6EB76
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FF910E11F;
	Tue, 25 Mar 2025 08:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3kPTqvO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDBA10E11F;
 Tue, 25 Mar 2025 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742891088; x=1774427088;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=ZDUTTtL2N3qQem90imTwh22vJ99+NynPixYPLGBHxM4=;
 b=R3kPTqvOIQ4MNZt8ateA6959usrKHLitHu4qmH2cRT/Q/OkCHKVA0V0K
 G15Avgn/TimrUELmya+AGSaq2RtcI48jMHvf+Vq/qZbTth7QdjfOKtaCG
 qQTwidMU9z69F+F0bp1vOqPcVnMgzow/HPdRIdyh9ejSMg00iQC1eUjfC
 j/g0RHILsKWxOpZVd8qjeEK13HHcAod+js5OxuQhk5mNPHj85Sh3xuPoT
 N78MrEAIh/YlSJddb18K4DInHHaucyDCJwbEOoFY5zoleDE4gbUUOup/5
 tTo6OCAHImB/tUf0fu/3/DtppDE9rz+KhfveBAeuO6J+asD+R5XokzUjq Q==;
X-CSE-ConnectionGUID: jeUh8Vz2SbOaQa3pGATjrw==
X-CSE-MsgGUID: jGvNTU/XTaCRcR0Ah7SUpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47998319"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47998319"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 01:24:48 -0700
X-CSE-ConnectionGUID: eoxzRIilQ5OyDIwtsCNLQg==
X-CSE-MsgGUID: kHPKiw5+Rd29b/JPE3uIWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124763748"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.87])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 01:24:45 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 00/15] CCS static load balance
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Date: Tue, 25 Mar 2025 10:24:42 +0200
Message-ID: <174289108243.28532.3277935060267794468@jlahtine-mobl>
User-Agent: alot/0.12.dev7+g16b50e5f
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

Quoting Andi Shyti (2025-03-24 15:29:36)
> Hi,
>=20
> Back in v3, this patch series was turned down due to community
> policies regarding i915 GEM development. Since then, I have
> received several requests from userspace developers, which I
> initially declined in order to respect those policies.
>=20
> However, with the latest request from UMD users, I decided to
> give this series another chance. I believe that when a feature
> is genuinely needed, our goal should be to support it, not to
> dismiss user and customer needs blindly.

We had plenty of community bug reports when the move to fixed CCS mode
was initially implemented with some bugs.

After those bugs were fixed, nobody was reporting impactful performance
regressions.

Do you have a reference to some GitLab issues or maybe some external
project issues where regressions around here are discussed?

Regards, Joonas
