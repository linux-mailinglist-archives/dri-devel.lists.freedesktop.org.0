Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D623B442B7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 18:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA50310EAB6;
	Thu,  4 Sep 2025 16:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IASTFfbe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DFE10EA97;
 Thu,  4 Sep 2025 16:27:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB9C943605;
 Thu,  4 Sep 2025 16:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A5EC4CEF0;
 Thu,  4 Sep 2025 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757003270;
 bh=P+wVfpodom1uA9pmTbOEoXVmpJnSH0vCG+IZWf3uVHc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IASTFfbeyei4PtKr8lAOptE2IvgxStUhs/N2PDRJTB980jj/baN9bi/M8fg1/gicM
 KodQ90/N1nwsj3dQIaIVB2Hh9oXwRcXCMi5OnWEQU/IHuq5f+sRBcRZEtNtxvJjCG6
 XIthoG9yL0QB3fUTOBGldnKRUgdE44VdN32dJm9NQm4XLUsebl3UZYBu5oEilrpZua
 XDEZvkDwl9fK4uLPH5NdRRJbuAfd7rOpPHnWeXQ/R4sx45dEFrSpV4A+oaam9sEZhC
 yduDUbfipB1NFPy8vKF/wPtMuzsfjjJW8W6lnTlOrWZ/S2zX+T8OEOL7nFxZGAnzbh
 jV/J8CAT0rK+Q==
Date: Thu, 4 Sep 2025 09:27:50 -0700
From: Kees Cook <kees@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/3] overflow: add range_overflows() and
 range_end_overflows()
Message-ID: <202509040927.30BEE17@keescook>
References: <20250829174601.2163064-1-jani.nikula@intel.com>
 <20250829174601.2163064-3-jani.nikula@intel.com>
 <202509031942.A1669D10F@keescook>
 <eb4a61f86330afe95e232cc515f117ed602e108d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb4a61f86330afe95e232cc515f117ed602e108d@intel.com>
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

On Thu, Sep 04, 2025 at 10:34:04AM +0300, Jani Nikula wrote:
> On Wed, 03 Sep 2025, Kees Cook <kees@kernel.org> wrote:
> > On Fri, Aug 29, 2025 at 08:46:01PM +0300, Jani Nikula wrote:
> >> Move the range_overflows() and range_end_overflows() along with the _t
> >> variants over from drm/i915 and drm/buddy to overflow.h.
> >> 
> >> Cc: Kees Cook <kees@kernel.org>
> >> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> >> Cc: linux-hardening@vger.kernel.org
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > Looks good to me! :)
> >
> > Reviewed-by: Kees Cook <kees@kernel.org>
> 
> Cool, thanks! How do you want to handle merging this?

Since it's touching drm, feel free to take it there. I'm not worried
about conflict resolution in overflow.h.

-- 
Kees Cook
