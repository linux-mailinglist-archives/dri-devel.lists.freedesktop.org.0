Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B4822E0E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFA010E293;
	Wed,  3 Jan 2024 13:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1511510E22F;
 Wed,  3 Jan 2024 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704287524; x=1735823524;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VlJTA9kn9qE7nS9SkLOmO5VdHSU4SFs95W2IcezjeJA=;
 b=JaaMuVv9pXg6ggWfbhvI11wOVjJUnGDh+ZLacnBx4r50F43MwtMOtE8O
 nMo+F7UUEaNzzCPBiu4LuvJ2+StON6OptxkILacgGQiWgOcFkRmMrkC7Z
 I0fvXBEw3RlotfpHyFvmqn5d4sHTTaqhpgamJkC5A3M6SXNzWM9UKYAv3
 iqbFbFFvGb9IOA/sjV2LMZYA6sJevEC8hT+Zl3NsyS80v3xO7ZaiPNBDa
 0nZYAVyJ9tEw0ROTDv7kah2DuqNuwndeM/NhIj6PJDV6kkMC4Ucs+j2IO
 CDxtt5Bu++CpDGxm4+UlzZTViYZe7giTPn/jwsRyyMWRVf0/rzEpy9Ph9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3807467"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3807467"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="729781338"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="729781338"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.243])
 ([10.249.254.243])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:12:00 -0800
Message-ID: <1f5633526f6f2d39382fa638adc0e5c0b3cb61ab.camel@linux.intel.com>
Subject: Re: [PATCH -next] drm/xe: Remove unneeded semicolon
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>, daniel@ffwll.ch,
 airlied@gmail.com,  mripard@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com
Date: Wed, 03 Jan 2024 14:11:57 +0100
In-Reply-To: <20240103011515.56529-1-yang.lee@linux.alibaba.com>
References: <20240103011515.56529-1-yang.lee@linux.alibaba.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yang,

On Wed, 2024-01-03 at 09:15 +0800, Yang Li wrote:
> ./drivers/gpu/drm/xe/xe_rtp.c:168:2-3: Unneeded semicolon
>=20

Could you please reformulate using imperative "Remove..." rather than
citing a style alert?

With that,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_rtp.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c
> b/drivers/gpu/drm/xe/xe_rtp.c
> index fb44cc7521d8..316ed2f6d1f0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -165,7 +165,7 @@ static void rtp_get_context(struct
> xe_rtp_process_ctx *ctx,
> =C2=A0		*gt =3D (*hwe)->gt;
> =C2=A0		*xe =3D gt_to_xe(*gt);
> =C2=A0		break;
> -	};
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0/**

