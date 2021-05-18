Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF843877FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F056EB34;
	Tue, 18 May 2021 11:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD186EB2F;
 Tue, 18 May 2021 11:46:16 +0000 (UTC)
IronPort-SDR: gZmFAYg2jir1wOb6InB11zkGunTAGuCAYfsNmhUbIPJhryFwBLSoDhHfIVr455p/VQwjB5cF5K
 7CGvAnSHR5bA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180966938"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="180966938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 04:46:16 -0700
IronPort-SDR: FKJAbiOFL+d1oczpOWQEILNTRxkU8b578SO0aes3FpphsNaC2x0OiFLzYl9EZrArGVb/rEva+O
 CXKuKjpyGmuQ==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439403725"
Received: from cbackhau-mobl.ger.corp.intel.com (HELO [10.252.37.121])
 ([10.252.37.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 04:46:15 -0700
Subject: Re: [PATCH v2 07/15] drm/ttm: Export ttm_bo_tt_destroy()
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-8-thomas.hellstrom@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <7489281c-c79d-bd13-90d8-7d0aaca42c30@linux.intel.com>
Date: Tue, 18 May 2021 13:46:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210518082701.997251-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 18-05-2021 om 10:26 schreef Thomas Hellström:
> For the upcoming kmapping i915 memcpy_move, export ttm_bo_tt_destroy().
> A future change might be to move the new memcpy_move into ttm, replacing
> the old ioremapping one.
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ca1b098b6a56..4479c55aaa1d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1221,3 +1221,4 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>  	ttm_tt_destroy(bo->bdev, bo->ttm);
>  	bo->ttm = NULL;
>  }
> +EXPORT_SYMBOL(ttm_bo_tt_destroy);

Looks sane, could we reorder the patches to put all ttm changes first?

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

