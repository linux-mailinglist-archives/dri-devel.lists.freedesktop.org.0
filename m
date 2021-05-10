Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7593784BA
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 13:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AAD6E44A;
	Mon, 10 May 2021 11:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C46E12A;
 Mon, 10 May 2021 11:16:17 +0000 (UTC)
IronPort-SDR: YBaxCwEz2bORs6FfpsoYMKkQA2RqIgng/uimljtKcEojFvQYvi+czqQD3I3QPDXIAWabLSwN8H
 Yf+8oB8MRFJQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9979"; a="197184663"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="197184663"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 04:16:16 -0700
IronPort-SDR: 6f7483hNhBYZ6quW3AIAvXtqyjGE63Mhhqh6TMeYQme1IdnqDs+NRHcY9ZfhmJJcCXLHx3iMr+
 r0uzfvmVKEPg==
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="436099598"
Received: from solender-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 04:16:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 44/53] docs: gpu: avoid using UTF-8 chars
In-Reply-To: <36bc1118467da645a57515743c9f6c1cd86abe8c.1620641727.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <36bc1118467da645a57515743c9f6c1cd86abe8c.1620641727.git.mchehab+huawei@kernel.org>
Date: Mon, 10 May 2021 14:16:08 +0300
Message-ID: <87sg2uvnyf.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 intel-gfx@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 May 2021, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrot=
e:
> While UTF-8 characters can be used at the Linux documentation,
> the best is to use them only when ASCII doesn't offer a good replacement.
> So, replace the occurences of the following UTF-8 characters:
>
> 	- U+2019 ('=E2=80=99'): RIGHT SINGLE QUOTATION MARK
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  Documentation/gpu/i915.rst       | 2 +-
>  Documentation/gpu/komeda-kms.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 486c720f3890..2cbf54460b48 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -361,7 +361,7 @@ Locking Guidelines
>  	  real bad.
>=20=20
>  #. Do not nest different lru/memory manager locks within each other.
> -   Take them in turn to update memory allocations, relying on the object=
=E2=80=99s
> +   Take them in turn to update memory allocations, relying on the object=
's
>     dma_resv ww_mutex to serialize against other operations.
>=20=20
>  #. The suggestion for lru/memory managers locks is that they are small
> diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-=
kms.rst
> index eb693c857e2d..c2067678e92c 100644
> --- a/Documentation/gpu/komeda-kms.rst
> +++ b/Documentation/gpu/komeda-kms.rst
> @@ -324,7 +324,7 @@ the control-abilites of device.
>=20=20
>  We have &komeda_dev, &komeda_pipeline, &komeda_component. Now fill devic=
es with
>  pipelines. Since komeda is not for D71 only but also intended for later =
products,
> -of course we=E2=80=99d better share as much as possible between differen=
t products. To
> +of course we'd better share as much as possible between different produc=
ts. To
>  achieve this, split the komeda device into two layers: CORE and CHIP.
>=20=20
>  -   CORE: for common features and capabilities handling.

--=20
Jani Nikula, Intel Open Source Graphics Center
