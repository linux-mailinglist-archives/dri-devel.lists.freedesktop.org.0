Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7F9537E5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 18:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1788910E149;
	Thu, 15 Aug 2024 16:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kkormY1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CC210E149;
 Thu, 15 Aug 2024 16:07:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 42C3DCE1C93;
 Thu, 15 Aug 2024 16:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAF3C32786;
 Thu, 15 Aug 2024 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723738022;
 bh=qqxyCTA5TmWr5/A46fa7vWod1K1SOVf9QMKqUeF+GaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kkormY1/pTUeSX2KTR4sj/oWRFGWUu885mMvanjRamSt68is7jAqCFNr0P6+FtEvk
 rGVsSCI8EM+mb+pZrSsp08gy/U8s+gUMEJgPjzrv5bRh0FgfWb+wCuwCRmD61HWxY9
 m2fuuDxyL4ZJN6fmvWhwdqDEU8GVk4Mc6DnIGrA8PvGM0GNT+lfMhqIu2efO8hSWSD
 A7jfF0a7nNwAaGQ9EnxGFenW3Rmlg/DlHSVUCQ4vKW2M/Ua/9UdTgXfvH8jfzHEfwB
 itLzq+3Dkc4W8DQJMg/AQ/NnN3EuU8JBqrTPyGzG1DtCEhkCEXTsWW5VzhaD1oZuI3
 iVRzsccxccwBg==
Date: Thu, 15 Aug 2024 09:07:01 -0700
From: Kees Cook <kees@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 1/2] string: add mem_is_zero() helper to check if
 memory area is all zeros
Message-ID: <202408150906.28A920F62@keescook>
References: <20240814100035.3100852-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814100035.3100852-1-jani.nikula@intel.com>
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

On Wed, Aug 14, 2024 at 01:00:34PM +0300, Jani Nikula wrote:
> Almost two thirds of the memchr_inv() usages check if the memory area is
> all zeros, with no interest in where in the buffer the first non-zero
> byte is located. Checking for !memchr_inv(s, 0, n) is also not very
> intuitive or discoverable. Add an explicit mem_is_zero() helper for this
> use case.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
