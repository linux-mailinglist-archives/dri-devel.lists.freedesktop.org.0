Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B57445A7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 02:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65910E508;
	Sat,  1 Jul 2023 00:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp124.iad3a.emailsrvr.com (smtp124.iad3a.emailsrvr.com
 [173.203.187.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CAF10E507;
 Sat,  1 Jul 2023 00:41:24 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp32.relay.iad3a.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 7BB8942C9; 
 Fri, 30 Jun 2023 20:41:22 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 0/7] Fix ctx workarounds for non-masked regs
Date: Fri, 30 Jun 2023 17:41:21 -0700
Message-ID: <4528180.ln3aigfREe@mizzik>
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4398531.drPFRKK7ZK";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Classification-ID: 1fa81cee-14d6-4c29-9550-021d720e19b1-1-1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart4398531.drPFRKK7ZK
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Kenneth Graunke <kenneth@whitecape.org>
Subject: Re: [PATCH v3 0/7] Fix ctx workarounds for non-masked regs
Date: Fri, 30 Jun 2023 17:41:21 -0700
Message-ID: <4528180.ln3aigfREe@mizzik>
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
MIME-Version: 1.0

On Friday, June 30, 2023 1:35:02 PM PDT Lucas De Marchi wrote:
> v3 of https://patchwork.freedesktop.org/series/119766/
> 
> Changes from v2:
> 
> 	- Do not rmw if (clr | set) covers all bits
> 	- Add patch to make sure the set bits are also checked on
> 	  wa_*_clr_set() when clr is not a superset.
> 
> Tested on DG2 with intel_reg reading 0xb158 with a busy render engine.
> Now it's not losing the upper bit anymore.
> 
> Lucas De Marchi (7):
>   drm/i915/gt: Move wal_get_fw_for_rmw()
>   drm/i915/gt: Clear all bits from GEN12_FF_MODE2
>   drm/i915/gt: Fix context workarounds with non-masked regs
>   drm/i915/gt: Drop read from GEN8_L3CNTLREG in ICL workaround
>   drm/i915/gt: Enable read back on XEHP_FF_MODE2
>   drm/i915/gt: Remove bogus comment on IVB_FBC_RT_BASE_UPPER
>   drm/i915/gt: Also check set bits in clr_set()
> 
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 129 ++++++++++----------
>  1 file changed, 66 insertions(+), 63 deletions(-)

Whole series is now:

Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>

Thanks a lot for fixing this, Lucas!

--nextPart4398531.drPFRKK7ZK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE6OtbNAgc4e6ibv4ZW1vaBx1JzDgFAmSfdjEACgkQW1vaBx1J
zDjLVQ//YD0m545PTQHThep2KFqbjgf5CH9WcH1zmUzoRmkCfjNYRKzaINxsL/Zi
FeJNRPwqwhgq3pdMIo1WGEGw1oxKXLIwsbqjyHvvJwnHSh4dc95X0Zrl+ezoquYh
Nx6b6pi7GPFklzKfC+A/DfzWy+5cQdJxFon/uLzP4sfTJIB9ZhKQfcdJMk3lglXh
gKvcOFSxuEMTja26PbLsUS3fN7hzc6QkAUvcAYiSn3bH8xwmK8NSqw6MO6NvHn2x
y11w8dA8jRnIus++qP1oH0YiQn0b1FCMEzuZuIgtS2RikEAI/xtInl9VTx5xtIAa
52tZxDtjbDAmgU2hx0jyhUm5VYfsDVL+rddH+vYP9Hd7iCh4jeFYTYFdMA2vksu7
WQsduysIxVnp6wvwdvQmU5XcSUjl1PqFae3ynSjHqMXULbEghuhcoucOuE1EaOd1
DvHmKWAI5bsB/akVKTGjseif6pw2kcl1W+WSFDwhYr9o/xEa3qJOD9WpbMPpfT+X
BozD4s2AOjUjtIHPLFunNfzlF5i7VNy8Hca1Zh6Hthg7hyJohc4/IfMzc/5fTvvY
B/dj2oRGfIMcTcCOtiRR5+z8RWwNChlbMItKkDT3uSRjvIHlUxUNmoDCbLdJKFFz
vqeBwhq2JUAVjZLaqVrFv+vEyCb86eoDazMyGqxx4QLHJglr47c=
=vEVi
-----END PGP SIGNATURE-----

--nextPart4398531.drPFRKK7ZK--



