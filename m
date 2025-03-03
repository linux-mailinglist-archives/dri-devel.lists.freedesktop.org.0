Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C4A4BB16
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045C210E3AA;
	Mon,  3 Mar 2025 09:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+8CshSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFB710E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740995175; x=1772531175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sjUNmsBoxg1lTuhhmLZRfysPKGMMkrAdGhjiE+alWPA=;
 b=T+8CshSq4ywt3fqTuKxHmgROnmgiB6kdvEXLkV8CvAN4tMaJz6/vSLLF
 NIsSR6a/jNPy1XOJSH0hde7owfZF4w8sV+eYZ5SC/9OeQfmifb0jDEQ95
 QNAnTr+z3VXeYLLdaYbr272LwynnyHgE7NIui85z4KJ0dH0YIzolUdhjU
 A9bB+4FRTsCnYyRQITj1u2eAa/gWCE5IgM7r+t582fse7FD8EL3huFuSc
 uAhaD0Ww7iTmQkn6p9xGu/us75z38vUl/OpE6dw2CMzNnm1yP/Y2W1vxA
 OlWENqVdSthFGWoA+fwIqqPMHgA1UsMBKKd8V1UGzNMyU6JE/HUxNULOh Q==;
X-CSE-ConnectionGUID: ii8Nm8fiTyavjZbmzJFAIg==
X-CSE-MsgGUID: 0BOFLwgNQr2fPOsde2siEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41774530"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41774530"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:46:15 -0800
X-CSE-ConnectionGUID: RWWDyvIoQLmvqfjgWcNLpA==
X-CSE-MsgGUID: 15D++kOTS7Sq6gqbKzvO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="118435744"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:46:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tp2NB-0000000GlrM-3yzh; Mon, 03 Mar 2025 11:46:05 +0200
Date: Mon, 3 Mar 2025 11:46:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] print: use new #[export] macro for
 rust_fmt_argument
Message-ID: <Z8V6XafrTyrB4z8D@smile.fi.intel.com>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-4-41fbad85a27f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-export-macro-v3-4-41fbad85a27f@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Mar 03, 2025 at 08:45:15AM +0000, Alice Ryhl wrote:
> This moves the rust_fmt_argument function over to use the new #[export]
> macro, which will verify at compile-time that the function signature
> matches what is in the header file.

...

>  extern bool no_hash_pointers;
>  int no_hash_pointers_enable(char *str);
>  
> +/* Used for Rust formatting ('%pA'). */

In case you need a new version, please drop a period at the end as this is the
style used in the sprintf.h already.

> +char *rust_fmt_argument(char *buf, char *end, const void *ptr);

-- 
With Best Regards,
Andy Shevchenko


