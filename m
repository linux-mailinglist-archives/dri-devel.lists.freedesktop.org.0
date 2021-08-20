Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038463F2CB0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 15:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F786EA85;
	Fri, 20 Aug 2021 13:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3016EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 13:02:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60A9660F39;
 Fri, 20 Aug 2021 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629464528;
 bh=XmK3LL/kczQ8Z+mWS0jnuPNaTKva71BKQybVqIajn2U=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=aYMABfEHFn+7Kxh2/MCRF/AHSGEXnmm1wwYZV/SiISnuS7QAg8vC8A8gHUcJQHHJU
 jndvWKCbmKREp+Q+csliLWq1xfVo9N1ThE9t9PC3acSXLZUZd8ZV+43etboNIfFSU4
 elTORRr93PV1FUprfZYqHAQtChsRVKZLcib11SGIunO2FEuIUTOfXEmOzVFWIIAfpi
 Gpu4L7iSStDO8sT6ED1OTcs1Qu/7AmVe3IQTNXsGFPhv2pIFnV1eYeNYrTX8r8c+XZ
 KZt7w4RnLsX1Bh7LiMJY7mFit8tljzKmeylhW39zI5+LMFsGOrnGgg9dGOurKa5wA1
 /AbeTWLFaERiQ==
Date: Fri, 20 Aug 2021 15:02:03 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kees Cook <keescook@chromium.org>
cc: linux-kernel@vger.kernel.org, 
 Stefan Achatz <erazor_de@users.sourceforge.net>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 linux-input@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 55/63] HID: roccat: Use struct_group() to zero
 kone_mouse_event
In-Reply-To: <20210818060533.3569517-56-keescook@chromium.org>
Message-ID: <nycvar.YFH.7.76.2108201501510.15313@cbobk.fhfr.pm>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-56-keescook@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 17 Aug 2021, Kees Cook wrote:

> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Add struct_group() to mark region of struct kone_mouse_event that should
> be initialized to zero.
> 
> Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied, thank you Kees.

-- 
Jiri Kosina
SUSE Labs

