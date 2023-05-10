Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D806FE725
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 00:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAEE10E083;
	Wed, 10 May 2023 22:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA59C10E083;
 Wed, 10 May 2023 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683757506; x=1715293506;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=d9Cne20qUitJqz0DFlqDjiYeuKdvqZv7V0Nw+ndWkFo=;
 b=ThoJ8vthgw/41DhdzPemozETuSJB904qHSg/yq5JPvfqFgS5FfjptjMB
 MhRCDjZeO0QtFQTI9+6ithQYNsR7DCNEnIYBAdRkXu6k2NtiOwMtYg0/B
 TBB/U1vE8Xv1ZaGUhhnAt0P37yuhBrrQAmyH48xgsWTXMidUGJxWyuRab
 aZIvMQMuo/yuhyTkf+VPGwLVn/TBp/yPhCYrC2uADbhG6oztrQyp9ruuD
 /ayNXrdI7WKfhg3a/h5vIX+ryqteuLyEgNujQT2U68TgPE40jyW7EhiWO
 viDmRTFWb/FWxCi1JSDr8HrPkiueRfow4X+0C75mmPGsP8BUvG9AdFvYj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353417061"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="353417061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 15:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730090883"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="730090883"
Received: from archanas-mobl24.amr.corp.intel.com (HELO localhost)
 ([10.209.61.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 15:25:00 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <642c1a52bbcc4369c69ec2dbbfd7723c60c1dcb2.camel@intel.com>
References: <20230427234843.2886921-1-alan.previn.teres.alexis@intel.com>
 <20230427234843.2886921-7-alan.previn.teres.alexis@intel.com>
 <8888e3dff8c1c4fd1702ded911850da30330fbfa.camel@intel.com>
 <168327239043.1096084.14316886882692698230@jljusten-skl>
 <e40f2b8750b39facd98f72cda63bc733ca0319d5.camel@intel.com>
 <0a23ff5be69e3d6b6e3b457c2599bc2f018fc71a.camel@intel.com>
 <168375473641.1096084.7149697040639389794@jljusten-skl>
 <168375545081.1096084.10046830335154502443@jljusten-skl>
 <642c1a52bbcc4369c69ec2dbbfd7723c60c1dcb2.camel@intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for
 PXP
From: Jordan Justen <jordan.l.justen@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Wed, 10 May 2023 15:24:59 -0700
Message-ID: <168375749965.1096084.11999881030820310846@jljusten-skl>
User-Agent: alot/0.10
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>, justonli@chromium.org,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, dri-devel@lists.freedesktop.org,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-10 15:00:03, Teres Alexis, Alan Previn wrote:
>=20
> alan:snip
>=20
> > This is why I asked if it was it was "basically certain that in a
> > production environment, then it will eventually return 1 meaning it's
> > ready". Alan's response was a little ambiguous on this point.
> alan: if we get a '2' and never transition to '1' - thats a kernel bug or
> firmware / system issue.
>=20
> > Arguably a transition from 2 to -ENODEV could be considered a kernel
> > bug, but it doesn't sound like Alan would agree. :) Maybe Alan would
> > agree to saying it's either a kernel, or system integration bug.
> alan: agreed - that would be a kernel bug or a system integration bug.
>=20
> I also agreed on the init-flow vs app-usage thoughts Jordan had.
> That said MESA has many ways it can use this UAPI and we can discuss
> that on the MESA patch.
>=20
>=20
> hmmm.. so... ack anyone? [insert big hopeful smiley here]
> apologies if I am asking too often.

Assuming that:

  2 =3D PXP feature is supported but should be ready soon (pending
      initialization of non-i915 system dependencies).

really means, "it'll be ready soon or there is a bug somewhere",

Acked-by: Jordan Justen <jordan.l.justen@intel.com>

If Mesa finds that it can't really rely on that, we may have to decide
on a different approach in how to use that return value.

Is it possible to hold on for another ~12 hours to see if Lionel wants
to Ack as well?

-Jordan
