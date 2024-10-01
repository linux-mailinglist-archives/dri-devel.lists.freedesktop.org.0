Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8444A98B840
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 11:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE10C10E042;
	Tue,  1 Oct 2024 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiftIwu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3181A10E042
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727774776; x=1759310776;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/zTxW2Q4rdr/1ja5lFCscVDf0DCutjtKqBZkiH6uLoc=;
 b=aiftIwu6wJyksF/ovdqFztgPWuuys22S1rF36uIcjBoB2FynhtBmk/xk
 2jF/eEmfY2OABFqea/Rz9XXu2ljNGysStqTvYEpytRl717HR90t9p3Ucl
 R7ICBOahdrWWf+tzTYqf7L1Vk+aMfKacRfQlLrIbuzsYud/1afrW4WRly
 qPfNF8GqorTPH5f0lvfp34apGKEkKNjZPYzFMqBTmCWdoXR6XsDypjheT
 mbTQTqGfTNqtPMzzDc3/1SyvrfZ0/ERjELVYlaM+c/8EjoU2RqnOSUz5Q
 qDIE0L6ONKbUddoudzzMZQBunUYOkrq7L1MjqXO/PFuTXjJa60fN5g3/e g==;
X-CSE-ConnectionGUID: vp6HUqUxRiKJ8nAVK4oW3g==
X-CSE-MsgGUID: PtynfnTRRxWJ3x3BFnqgZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30781573"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="30781573"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:26:15 -0700
X-CSE-ConnectionGUID: 76G6BrhES1ChPPJWS/k47A==
X-CSE-MsgGUID: K4Tt8maWQkG40hKqSfKtgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="104390946"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:26:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@redhat.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [WIP RFC v2 01/35] WIP: rust/drm: Add fourcc bindings
In-Reply-To: <20240930233257.1189730-2-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-2-lyude@redhat.com>
Date: Tue, 01 Oct 2024 12:25:54 +0300
Message-ID: <87wmisuqcd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 30 Sep 2024, Lyude Paul <lyude@redhat.com> wrote:
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index b2e05f8c2ee7d..04898f70ef1b8 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_ioctl.h>

Unrelated to the patch, sorry, but... what's the idea with putting all
the bindings in the same file? Does it mean every time any of the files
or their dependencies get changed, *all* the rust bindings get
regenerated? Should there be more granularity?

BR,
Jani.

-- 
Jani Nikula, Intel
