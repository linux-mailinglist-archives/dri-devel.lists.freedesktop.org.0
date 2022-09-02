Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DB5AB257
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59FE10E5A1;
	Fri,  2 Sep 2022 13:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437F410E858
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 13:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662127007; x=1693663007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0C4Mrc8p7r2/pndSczNhemjcNNdk967OJeL9PozTUO8=;
 b=I7qnQz2hmBlQA08T7qylaNvtzYO1wGF6Z4PI9lV6d3exfjSpGnHS1Xf3
 qefTRUnN8jcJPaLsBYDU7KWezIVohPLabdq2dwNuBl/mG2BDIGxZ3NYOJ
 mqkquJQKfxVvBKkfd21XkEloJMAEgSojLh2g4tDNwaepo6cOoVtakXUJT
 t/3Jz3FDhMjL1+WSRnXktJSmjfPSF6wCrJ30MX4jwAgkH1kSUOuEShEkD
 Qh1kO/R7bBJ8EUVD7JvM9jbkSn1sv/JQqxeEK6rX7S4Is5G7KqXZqH7Zq
 lCYQklzItDc0X3dy9N/JYdkLAIHHgXYjQz23Uq9MPTeTdmYfgG+VvyQsY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="276385857"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="276385857"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:56:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674362317"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:56:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
In-Reply-To: <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
 <87h71qfbi9.fsf@intel.com> <20220902123400.5ljgc7z6zw34d64m@houat>
 <87mtbidj3b.fsf@intel.com>
 <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
Date: Fri, 02 Sep 2022 16:56:30 +0300
Message-ID: <87bkrxev75.fsf@intel.com>
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
Cc: David Gow <davidgow@google.com>, siqueirajordao@riseup.net,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 tales.aparecida@gmail.com, Arthur Grillo <arthur.grillo@usp.br>,
 brendanhiggins@google.com, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, mwen@igalia.com,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Maxime Ripard <maxime@cerno.tech>, kunit-dev@googlegroups.com,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Sep 2022, Micha=C5=82 Winiarski <michal.winiarski@intel.com> wro=
te:
> Having said that - I do believe that igt_* prefix don't belong here
> (which is why I'm progressively trying to get rid of in the patches
> that refactor some of the tests).

Just clarifying that I'm not trying to defend igt_ prefix at all, and I
agree we should get rid of it.

BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
