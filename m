Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C164D7FD2EE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0455910E3F1;
	Wed, 29 Nov 2023 09:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C064910E3F1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701250731; x=1732786731;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AKuXrJt5cSWlwQTjHEOlVJMaFv/ThpR7gpZ8mCu+jiM=;
 b=oEC1EpQo5rf8b6v1akur41tQJRUNUQjy6Bv2QHzwhIehBvQo0kICStJm
 Q9x+di2pNCxRZglfOYp8W61hdpAJxt4KtE9bDcDYbUTBiVkeatdXo1ghS
 KmmBm99laTrCHU8YSurt7L6dDTzWp4hCRO4hODFm5tETqVJCO+F80IDDn
 Vd+D4BL+r9eyui3YMKwlPGGAZzSs23K/jp1baNi4bEFCw8cx4RLuxwyOV
 25nXF/1PmYuRuPbUWpPSxGEC7dR1g5HMj3G6MLPPe4IKgsSU5VXP323x1
 DydywNxTQ7jO7LHKCs4dcaH5cp8RfJPCWYW9i9rVgH2CGkAVD2JKwzIfh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424277740"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="424277740"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 01:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="745194703"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="745194703"
Received: from dstavrak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 01:38:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
In-Reply-To: <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
 <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
 <ZWXv1Oi_sH0BRWao@intel.com>
 <2mnodqvu2oo674vspiy4gxhglu3it5cq47acx5itnbwevgc4cf@c7h2bvnx3m2n>
Date: Wed, 29 Nov 2023 11:38:42 +0200
Message-ID: <8734wo7vbx.fsf@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> Hi Ville,
>
> On Tue, Nov 28, 2023 at 03:49:08PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Tue, Nov 28, 2023 at 02:29:40PM +0100, Maxime Ripard wrote:
>> > On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
>> > > On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
>> > > > All the drm_connector_init variants take at least a pointer to the
>> > > > device, connector and hooks implementation.
>> > > >
>> > > > However, none of them check their value before dereferencing those
>> > > > pointers which can lead to a NULL-pointer dereference if the author
>> > > > isn't careful.
>> > >=20
>> > > Arguably oopsing on the spot is preferrable when this can't be cause=
d by
>> > > user input. It's always a mistake that should be caught early during
>> > > development.
>> > >=20
>> > > Not everyone checks the return value of drm_connector_init and frien=
ds,
>> > > so those cases will lead to more mysterious bugs later. And probably
>> > > oopses as well.
>> >=20
>> > So maybe we can do both then, with something like
>> >=20
>> > if (WARN_ON(!dev))
>> >    return -EINVAL
>> >=20
>> > if (drm_WARN_ON(dev, !connector || !funcs))
>> >    return -EINVAL;
>> >=20
>> > I'd still like to check for this, so we can have proper testing, and we
>> > already check for those pointers in some places (like funcs in
>> > drm_connector_init), so if we don't cover everything we're inconsisten=
t.
>>=20
>> People will invariably cargo-cult this kind of stuff absolutely
>> everywhere and then all your functions will have tons of dead
>> code to check their arguments.
>
> And that's a bad thing because... ?
>
> Also, are you really saying that checking that your arguments make sense
> is cargo-cult?

It's a powerful thing to be able to assume a NULL argument is always a
fatal programming error on the caller's side, and should oops and get
caught immediately. It's an assertion.

We're not talking about user input or anything like that here.

If you start checking for things that can't happen, and return errors
for them, you start gracefully handling things that don't have anything
graceful about them.

Having such checks in place trains people to think they *may* happen.

While it should fail fast and loud at the developer's first smoke test,
and get fixed then and there.


BR,
Jani.


>
> We're already doing it in some parts of KMS, so we have to be
> consistent, and the answer to "most drivers don't check the error"
> cannot be "let's just give on error checking then".
>
>> I'd prefer not to go there usually.
>>=20
>> Should we perhaps start to use the (arguably hideous)
>>  - void f(struct foo *bar)
>>  + void f(struct foo bar[static 1])
>> syntax to tell the compiler we don't accept NULL pointers?
>>=20
>> Hmm. Apparently that has the same problem as using any
>> other kind of array syntax in the prototype. That is,
>> the compiler demands to know the definition of 'struct foo'
>> even though we're passing in effectively a pointer. Sigh.
>
> Honestly, I don't care as long as it's something we can unit-test to
> make sure we make it consistent. We can't unit test a complete kernel
> crash.

--=20
Jani Nikula, Intel
