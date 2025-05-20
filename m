Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5029ABDE11
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 17:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1498F10E606;
	Tue, 20 May 2025 15:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRQjx1oV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A9510E5FC;
 Tue, 20 May 2025 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747753279; x=1779289279;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=A0fPgotI3HW28kJ/L+KMDYDKmRLgtpvg3MtXO5K9tIo=;
 b=PRQjx1oVSBH4JEfQxd05tIdjNcft7CTiBkYo756W6cy2jMMEcWE5b5lq
 bpo7wSnZEEW3J026vJUyRxfZNowrOh2FZm9yd2gilgtl9j/zClfs4LKrr
 zynUwzfGtcY6T6No+gfdmXWBUEL5UFF5trtd0C88TRxK1fojOFmfWsVcx
 kP+Z6mnTOMpBv2XWPS4wca+hae4ruUBOeYjbmBu57oFuNiO0L/ME4hn3o
 bDd+tBhlhCID+I3r2PkCrRAY2Q+PcMjpZj8VSL+FbCb5c8fmW1EMbHeOS
 3+98gOoirS32SROFcL+DnFtSGm1IiXAiSF407W8Js53GATybPfeHlCgG2 A==;
X-CSE-ConnectionGUID: DxhxCp+MQzul3YE3YoDZ1g==
X-CSE-MsgGUID: hyANYBNsTgSLGWpcYEnvcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67101688"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="67101688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 08:01:19 -0700
X-CSE-ConnectionGUID: vuZ0H/pARPCEcEGhR6Utmg==
X-CSE-MsgGUID: DNTG2NPtRkSWmtZ0S47/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="176851517"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.165])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 08:01:15 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Tue, 20 May 2025 18:01:12 +0300
Message-ID: <174775327260.81385.8059929394366685323@jlahtine-mobl>
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

(+ Tvrtko, Rodrigo and Jani)

Quoting Krzysztof Niemiec (2025-05-19 18:34:14)
> Hi,
>=20
> This series introduces a way for applications to read local memory
> information via files in the sysfs. So far the only way to do this was
> via i915_query ioctl. This is slightly less handy than sysfs for
> external users. Additionally, the ioctl has a capability check which
> limits which users of a system might use it to get information.
>=20
> The goals of this series are:
>=20
>         1) Introduce a simpler interface to access lmem information,
>         2) Lift the CAP_PERFMON check on that information, OR provide
>            the administrator with a way to optionally lift it.
>=20
> The first patch introduces the general mechanism without protections.
> This will effectively lift a capability check on obtaining the memory
> information. The second patch introduces that check back inside the
> _show() functions, but also adds a sysctl parameter allowing to override
> the checks, if an administrator so decides.
>=20
> I'm sending this as RFC because I have a feeling that there's no
> consensus whether memory information exposed in the patch should be
> protected or not. Showing it to any user is strictly speaking an info
> leak, but the severity thereof might be considered not that high, so I'd
> rather leave it up to discussion first.
>=20
> If we decide for lifting the check, the first patch is sufficient.

Nack on that.

CPU memory footprint and GPU memory footprint have a very different
nature. This was discussed to quite a length, please refer to mailing
list archives.

> If we
> decide against it, the second patch protects the information by default,
> but with a way to expose it as a conscious decision of the admin. I find
> it a decent compromise.

No need for the added complexity if we were to add a sysfs.

If a sysfs is added, it can be made root readable by default but system
admin is free to chown or chmod the file for more relaxed access. Back
in the original discussion time, this was omitted for lack of users.

Even now, userspace/sysadmin could already essentially use setuid helper
process that will only report the memory statistics.

So I'm not really fully convinced this is needed at all.

And if it is to be added for the convenience of usersppace, it should
probably then be considered to be a standard interface across DRM drivers
ala fdinfo or cgroups.

Regards, Joonas

>=20
> This change has been requested in these parallel issues for i915 and Xe:
>=20
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
>=20
> Thanks
> Krzysztof
>=20
> Krzysztof Niemiec (2):
>   drm/i915: Expose local memory information via sysfs
>   drm/i915: Add protections to sysfs local memory information
>=20
>  drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
>  drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
>  drivers/gpu/drm/i915/intel_memory_region.h |   3 +
>  3 files changed, 145 insertions(+)
>=20
> --=20
> 2.45.2
> _
