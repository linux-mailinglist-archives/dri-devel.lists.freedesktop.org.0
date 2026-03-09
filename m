Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMGSJmuirmk9HAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:35:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AB237302
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 11:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E721F10E00A;
	Mon,  9 Mar 2026 10:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbjUct+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3E610E00A;
 Mon,  9 Mar 2026 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773052519; x=1804588519;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=H5k17/f2MLN4x7ocaee4PFxuLWcOy17TiF4ninqHGQw=;
 b=gbjUct+BVZK8jpafePFupeAtP7tVruK1KD8oeJMfQpAIxmn6ElbZ9zNR
 bAtkjtvATxDTpWn2kfxm558uEaC2nuWSdYR5kDE6b2iLDMxJSEmE2MwVs
 UJFAgnj8hBu4vmWNcGqkPT6LCABhhbSGskY8G/up5XGZVpuzWx+5fjuRP
 66RcBVVQ5mPfhxc6A4iCeVe/K5CLc0m4MuhCPkWvi0eVwDlGpsUZRv+gK
 5tXy3X2XGtCVd0S1sXBSDyR2rjITwIygPx32C48nwNUv0WJPQriqwDHSj
 I2myjl5xbwWZZeGMxtbw4EqAqDzfHSA1Hy+cITj9809MAMUhlWTJcVlAY A==;
X-CSE-ConnectionGUID: 5KDDRlxGQwWcFLSDIaTT2w==
X-CSE-MsgGUID: 6FzFlE3fRt6wKWlAlwqqGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91458064"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="91458064"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:35:18 -0700
X-CSE-ConnectionGUID: Csk/u4cIRxa+3Nb4jmgRqw==
X-CSE-MsgGUID: uL9Ox0hASTG0x9wDStKXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250177817"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:35:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] iopoll: fix function parameter names in
 read_poll_timeout_atomic()
In-Reply-To: <20260306221033.2357305-1-rdunlap@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260306221033.2357305-1-rdunlap@infradead.org>
Date: Mon, 09 Mar 2026 12:35:11 +0200
Message-ID: <d1ea41327832c2e4447429d6fc0030b71491ca44@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 842AB237302
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,infradead.org:email,lists.freedesktop.org:email]
X-Rspamd-Action: no action

On Fri, 06 Mar 2026, Randy Dunlap <rdunlap@infradead.org> wrote:
> Correct the function parameter names to avoid kernel-doc warnings
> and to emphasize this function is atomic (non-sleeping).
>
> Warning: include/linux/iopoll.h:169 function parameter 'sleep_us' not
>  described in 'read_poll_timeout_atomic'
> Warning: ../include/linux/iopoll.h:169 function parameter
>  'sleep_before_read' not described in 'read_poll_timeout_atomic'
>
> Fixes: 9df8043a546d ("iopoll: Generalize read_poll_timeout() into poll_ti=
meout_us()")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Please let me know how you want this merged. I don't think iopoll.h has
an active maintainer.

> ---
> v2: change the function parameter names, not the kernel-doc comments (Jan=
i)
>
>  include/linux/iopoll.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- linux-next-20260304.orig/include/linux/iopoll.h
> +++ linux-next-20260304/include/linux/iopoll.h
> @@ -159,7 +159,7 @@
>   *
>   * This macro does not rely on timekeeping.  Hence it is safe to call ev=
en when
>   * timekeeping is suspended, at the expense of an underestimation of wal=
l clock
> - * time, which is rather minimal with a non-zero delay_us.
> + * time, which is rather minimal with a non-zero @delay_us.
>   *
>   * When available, you'll probably want to use one of the specialized
>   * macros defined below rather than this macro directly.
> @@ -167,9 +167,9 @@
>   * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
>   * case, the last read value at @args is stored in @val.
>   */
> -#define read_poll_timeout_atomic(op, val, cond, sleep_us, timeout_us, \
> -				 sleep_before_read, args...) \
> -	poll_timeout_us_atomic((val) =3D op(args), cond, sleep_us, timeout_us, =
sleep_before_read)
> +#define read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, \
> +				 delay_before_read, args...) \
> +	poll_timeout_us_atomic((val) =3D op(args), cond, delay_us, timeout_us, =
delay_before_read)
>=20=20
>  /**
>   * readx_poll_timeout - Periodically poll an address until a condition i=
s met or a timeout occurs
>
>
> ---
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org

--=20
Jani Nikula, Intel
