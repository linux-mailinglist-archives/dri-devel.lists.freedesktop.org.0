Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654A63A244
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F93A10E29E;
	Mon, 28 Nov 2022 07:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E85A10E29D;
 Mon, 28 Nov 2022 07:47:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8AE40B80AF0;
 Mon, 28 Nov 2022 07:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3266EC433D6;
 Mon, 28 Nov 2022 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669621635;
 bh=+WYQFpWUKXr9b62rzVenfF+a3NLG9DBKuJ3zWIaJbFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=trelwF4unhGqqJGOzUJ2U/lkT86Tjnibc09mApQkJO/TZ2q0Mrmah178G0hbKdiyQ
 EQnzDwZrv/ScpfLZ1b2cGjnZC/VPkC8RZuGfdaIoWesbK14u3nv17qMoTv+jQrWDlV
 bCH6iANTSynehLUnJnqJ9iPhELkk3SSyRfaHpLvfnQagMMdYvCs/l5MCHRpmwZJxGZ
 HAr+LxGZms0NZS/glR1N58y53ypXoE2J7TOHso9rc5OOgM9EfTu487WUM1d181ZDd/
 v+cSSAscgZr4odczemM+jp7Xe0ZaV3zqT61Yq1WzKSNuHZC3eRLHm2QF8ngrWgP55g
 dUFTpihSBZcfQ==
Date: Mon, 28 Nov 2022 07:47:06 +0000
From: Lee Jones <lee@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/2] Fix a bunch of allmodconfig errors
Message-ID: <Y4RnesCbA0yOFI8/@google.com>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125161325.bed715211b887d0a298813de@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125161325.bed715211b887d0a298813de@linux-foundation.org>
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
Cc: llvm@lists.linux.dev, arnd@arndb.de, sunpeng.li@amd.com,
 ndesaulniers@google.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, amd-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, trix@redhat.com, alexander.deucher@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Nov 2022, Andrew Morton wrote:

> On Fri, 25 Nov 2022 12:07:48 +0000 Lee Jones <lee@kernel.org> wrote:
> 
> > Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST") WERROR 
> > now defaults to COMPILE_TEST meaning that it's enabled for allmodconfig        
> > builds.  This leads to some interesting failures, each resolved in this set.   
> 
> I'm not sure who this patchset is aimed at, so I'll take my usual
> approach of grabbing it and seeing who complains.
> 
> > With this set applied, I am able to obtain a successful allmodconfig Arm build.
> 
> b339ec9c229aa is a year old and I've been doing arm allmodconfig for
> ever.  What am I missing here?
> 
> A broken arm allmodconfig is pretty irritating - I'm thinking that a
> fix should be backported into -stable kernels.  But I'm clearly missing
> something here.

I will be taking these through all applicable Stable kernels.

-- 
Lee Jones [李琼斯]
