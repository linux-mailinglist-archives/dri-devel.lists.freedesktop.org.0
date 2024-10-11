Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C199A2D6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 13:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD0110EAD1;
	Fri, 11 Oct 2024 11:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxCiDLlE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700D10EAD0;
 Fri, 11 Oct 2024 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728646768; x=1760182768;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=peSkodnoQMmIoyTwiY450n5cYpMnMRhYK4NEyq7b9lQ=;
 b=lxCiDLlELyX71C+Jys92f3Jyg68iM25JBMNracSO8MnK86hUgzCfkfsg
 95AnD4jUBWxbwDm2ii9Dms0ZI1ulgyfrze0/0GajnfWLEem/6oGbuP78O
 402D0EFY9KlRRnYQKVvE+OSSJmvLlYiqCvcAF+rFOF87TmZfdOfHC249F
 pei6s1HthBhUvLEuhlIvLHeHqi8vRsgGyXwJbA48a4TD2BkDwLA+YhIA4
 RrwSi7mfFYmPRHKthVXI0wzAUwyQ/NOk9TI6HDNCTKPHdLlynIsc2REia
 Kqw1qzMrGHc2J/kgljZxsJmnR6NzQNnpcvOwk+laJTvhfEDKsoGN2JBWn Q==;
X-CSE-ConnectionGUID: 6pd/CLprSOKQgi5nMg+FhA==
X-CSE-MsgGUID: sU/sejoUS5uHoVJ9XMnuEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="53448872"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="53448872"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 04:39:28 -0700
X-CSE-ConnectionGUID: nxgzbRJ+RD2HVlepOwvYgw==
X-CSE-MsgGUID: Q3JOT9ukTxmfuR5dc5h8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76892892"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.121])
 ([10.245.245.121])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 04:39:27 -0700
Message-ID: <f9a0ddb2db72558565069784ffded6836a5afc60.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: Fix incorrect use of kernel-doc format
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Oct 2024 13:39:24 +0200
In-Reply-To: <2dc60e45-7a9d-4fcf-acc1-43e5dcd7ce04@linux.intel.com>
References: <20241010124545.82023-1-thomas.hellstrom@linux.intel.com>
 <2dc60e45-7a9d-4fcf-acc1-43e5dcd7ce04@linux.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Thu, 2024-10-10 at 16:26 +0200, Nirmoy Das wrote:
>=20
> On 10/10/2024 2:45 PM, Thomas Hellstr=C3=B6m wrote:
> > Add a missing colon.
> >=20
> > Cc: dri-devel@lists.freedesktop.org
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes:
> > https://lore.kernel.org/linux-next/20241010160942.192caf60@canb.auug.or=
g.au/
> > Fixes: fc5d96670eb2 ("drm/ttm: Move swapped objects off the
> > manager's LRU list")
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks, Nirmoy!
/Thomas


> > ---
> > =C2=A0include/drm/ttm/ttm_device.h | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/include/drm/ttm/ttm_device.h
> > b/include/drm/ttm/ttm_device.h
> > index 438358f72716..39b8636b1845 100644
> > --- a/include/drm/ttm/ttm_device.h
> > +++ b/include/drm/ttm/ttm_device.h
> > @@ -252,7 +252,7 @@ struct ttm_device {
> > =C2=A0	spinlock_t lru_lock;
> > =C2=A0
> > =C2=A0	/**
> > -	 * @unevictable Buffer objects which are pinned or swapped
> > and as such
> > +	 * @unevictable: Buffer objects which are pinned or
> > swapped and as such
> > =C2=A0	 * not on an LRU list.
> > =C2=A0	 */
> > =C2=A0	struct list_head unevictable;

