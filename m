Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3BA746A1A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69EF10E104;
	Tue,  4 Jul 2023 06:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AFD10E104
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688453442; x=1719989442;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kkO3SUliu/2RNgJwCU0h/P3pCxyPNPOlH9cgd0AY36Y=;
 b=jJNne1SHyHXd5qIiqsSjEZwC1evw2j5DvU3VKKffjFSj93BqrIpB3qHN
 6h61wbk+0uxLUa/tXgcd2xLZVTxWqz8h4uVH6uARJPsV3jPdDVTEFkxgg
 iuIY8POlEKm5DxtitmCqU5jaDdafrLIWakrNPwCcxyQuwwRjlwBZFdYLH
 p+6PnjRElBSi7WrXI7dhDtqPX3xqYZ/HH3BR4o1zToljSkotPnWok0MjI
 3iSvQaFPiLhh748+CjXBk4O1fjYfLPyUL8mJuDoiDzk6xT+BGbMeg4lTk
 N3U41esiYiwLT37jaPy+x7zjGlTxqSN5KMoIlac3Tu7FjinaRZRd5jF0r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342642008"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="342642008"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 23:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712789829"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="712789829"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 03 Jul 2023 23:50:40 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 825A6580AB3;
 Mon,  3 Jul 2023 23:50:38 -0700 (PDT)
Date: Tue, 4 Jul 2023 08:50:35 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC v3 3/3] drm/ttm/tests: Add tests for ttm_pool
Message-ID: <20230704085035.7a4ec164@maurocar-mobl2>
In-Reply-To: <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
References: <cover.1688131205.git.karolina.stolarek@intel.com>
 <1726d758b3f7e5ee10b168102d5e207479324442.1688131205.git.karolina.stolarek@intel.com>
 <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Jul 2023 13:21:43 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> > +	/* We don't need this BO later, release it */
> > +	ttm_bo_put(bo); =20
>=20
> That won't work. A BO must always outlive the TT object allocated for it.
>=20
> Otherwise you can get crashes during TT release.

Just my two cents: shouldn't the TT object be increasing Kobj refcount then,
in order to properly manage the BO object lifetime?

Regards,
Mauro
