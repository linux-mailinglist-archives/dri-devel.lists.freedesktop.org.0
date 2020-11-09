Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF12ABF89
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 16:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE0989A4E;
	Mon,  9 Nov 2020 15:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862C689A4E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 15:16:54 +0000 (UTC)
IronPort-SDR: l4Thv1yIcKANjEsLxalEwomTnRXolYWhjPu/Aek76qSkpkjwuymVUFMhojp89s+f7wbLuiTxPI
 xw4R73hyDYzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="169970062"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="169970062"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 07:16:53 -0800
IronPort-SDR: GKNkFVFjoWbMh62JWkS+DcLYjv/90aPcjSIxENdmeXROzxSexcKbZ/ODc7VZ1iH/bMywCsdHS6
 a0s/fS2n9lpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="365081870"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 09 Nov 2020 07:16:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 17:16:50 +0200
Date: Mon, 9 Nov 2020 17:16:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
Message-ID: <20201109151650.GE6112@intel.com>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 06:13:02PM +0100, Christian K=F6nig wrote:
> Am 09.11.20 um 01:54 schrieb Dave Airlie:
> > @@ -1432,15 +1479,18 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ct=
x)
> >   	if (bo->mem.mem_type !=3D TTM_PL_SYSTEM) {
> >   		struct ttm_operation_ctx ctx =3D { false, false };
> >   		struct ttm_resource evict_mem;
> > +		struct ttm_place hop =3D {};
> =

> Please always use memset() if you want to zero initialize something in =

> the kernel, we had enough trouble with that.

What trouble is that? I've not heard of anything, and we use
=3D{} quite extensively in drm land.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
