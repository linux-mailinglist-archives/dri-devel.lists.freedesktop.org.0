Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3246ABEBE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B7D10E2D1;
	Mon,  6 Mar 2023 11:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E37310E29F;
 Mon,  6 Mar 2023 11:51:59 +0000 (UTC)
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.169])
 by gnuweeb.org (Postfix) with ESMTPSA id 93F598314F;
 Mon,  6 Mar 2023 11:51:52 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
 s=default; t=1678103518;
 bh=7mp2IVJ+mYOWVTN/6Ljscq5f7jZl+nO1fDzxD+/mR7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0xJQah7pjDgMM/+kwBLX8mlew7B9eLbWu8sc7emjX1hXKrNhB3TkrduSJID4sB42
 AIW/ZVP9N8RtpJi0a/8v6yDhwTjbX6T4dWHOwwPPVv9SZyHyJJMrnDkgVtmzRDCcn2
 HqqoD/MI5raOfTvTC6WUaq/VH/GlhgeW6p0Tc4LT8d84vIJFFKOMARe4Ahb3ywN9IB
 mRCXfKfG29XOoTYwkCSoXuRGzGqikswnXIAJJjQFLQ/R7BH5a99RtxX1znauRvAuBi
 8t7U4A6XaF1lhGMRZ3hPx8ChNpfhhbP+kigP7HDaYlhL+Psv45wzc0jSheNIZUY+mr
 rx2NDiKNG9xcg==
Date: Mon, 6 Mar 2023 18:51:48 +0700
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Linux 6.2.1 hits a display driver bug (list_del corruption,
 ffff88811b4af298->next is NULL)
Message-ID: <ZAXT1B1GTlmA78Ld@biznet-home.integral.gnuweeb.org>
References: <6feae796-db3f-1135-a607-cfefb0259788@gnuweeb.org>
 <ZAGqet3U8AMm4Uf1@debian.me>
 <ZAOTU5CRwdEC1lGH@biznet-home.integral.gnuweeb.org>
 <87v8jetaik.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8jetaik.fsf@intel.com>
X-Bpl: hUx9VaHkTWcLO7S8CQCslj6OzqBx2hfLChRz45nPESx5VSB/xuJQVOKOB1zSXE3yc9ntP27bV1M1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel GFX Mailing List <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 linaro-mm-sig@lists.linaro.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 12:54:59PM +0200, Jani Nikula wrote:
> Please file a bug at fdo gitlab:
> 
> https://gitlab.freedesktop.org/drm/intel/wikis/How-to-file-i915-bugs

OK, I posted it here https://gitlab.freedesktop.org/drm/intel/-/issues/8274

Thanks,

-- 
Ammar Faizi

P.S:
I had to create a new account because I forgot my previous freedesktop
GitLab account password. I tried to use the forgot password feature but
didn't get any email to reset my password. My old GitLab email address
is ammarfaizi2@gmail.com.

Just in case someone can tell what goes wrong with the forgot password
feature on there...

