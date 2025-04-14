Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D1AA883E7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EBB10E5F1;
	Mon, 14 Apr 2025 14:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="qx9o+qWg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F2410E5F0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:07:51 +0000 (UTC)
Date: Mon, 14 Apr 2025 10:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744639669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WG8Ya8Fve9d6OMW+BMmc5Uir//SNWkLbvkXAiaSTZoQ=;
 b=qx9o+qWgsrX6DxR65VjWusDFSiD7lFgXlMpghVQhsD+jcol8bZ8/eQzAZAdILMJvwLZuE9
 SwROBBC8XNaPp0516UlKxj0gHjNF4LeFFDGWbkKPqTayjCF1+mARWqSqbfHLNtdIHyitOp
 yUciKi5vq6dO3C8H5dtUN8NB1irftQpCAN1o+VyPnYX1sSNu90Gnj3iCzbyPMbdd+Q+ur6
 k6SArWOMmsaitsoZUDKlbzyn3sXx7ECpmiHQdtRq20eSEQYYc9E2XVC6pm18AODr1bAjgV
 QsHffCsgkwzxS6ihVz882db4bVBl2jfb9Kr1yNBJL0xTMt7VtXUjnr8fAhufMg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/8] rust: drm: add device abstraction
Message-ID: <Z_0Wr_e6_gprfmlF@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-5-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-5-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT
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

> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid poiner to a `struct device` embedded in `Self`.

pointer

With that fixed, 

    Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

