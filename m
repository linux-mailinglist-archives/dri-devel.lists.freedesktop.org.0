Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C492777ADF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89710E536;
	Thu, 10 Aug 2023 14:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EB710E536
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:38:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A58765386;
 Thu, 10 Aug 2023 14:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E421C433C7;
 Thu, 10 Aug 2023 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691678291;
 bh=pb1Mpk6gHTiUNUX5UXjt9QQaJarDzRUuvVrX52gFOWw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdU+jwiYBr/65i8kypKIoFPTX82qUusg8Am5Ss4kgFLmevUrjTTPGY+WZ3CC/vV5q
 bx+pBYz26PwfvOdqGESBv/4Wh5wuIJtvpnWk9/xTflfDwbBTc47XbK9dU1MlonZb5A
 ZNiICH+tuUzx53p7anw2/HnYAxrWArjzTrt7A91GT1QCEF3K+4uu+f5cBGeP/vEXku
 w2UAQuh54NhyYwOQ81125np9ViKGyQs2ZJtvcxvE8XqKydNtAznbtPFwEtj0bdTpk7
 BvOM1zH6v0XdQAFuwvBDqpi75TRdIH3QtifVslR2L6MoXmnMLGY0+7mMMWm4jeQ4Uy
 P/CoRhNIpZhyA==
Date: Thu, 10 Aug 2023 07:38:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
Message-ID: <20230810143809.GC1549244@dev-arch.thelio-3990X>
References: <20230731123625.3766-1-christian.koenig@amd.com>
 <20230809153755.GA832145@dev-arch.thelio-3990X>
 <20230810084002.636cc827@collabora.com>
 <7a09909a-4c94-2e4b-dd9a-4bd019b67585@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a09909a-4c94-2e4b-dd9a-4bd019b67585@amd.com>
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
Cc: ndesaulniers@google.com, naresh.kamboju@linaro.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, trix@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 08:48:05AM +0200, Christian König wrote:
> Am 10.08.23 um 08:40 schrieb Boris Brezillon:
> > On Wed, 9 Aug 2023 08:37:55 -0700
> > Nathan Chancellor <nathan@kernel.org> wrote:
> > 
> > > Hi Christian,
> > > 
> > > Can this be applied to drm-misc? Other drivers are starting to make use
> > > of this API and our builds with clang-17 and clang-18 have been broken
> > > for some time due to this.
> > Queued to drm-misc-next.
> 
> Sorry for the delay I have been on vacation last week and haven't yet
> catched up to this point in my mails.

No worries, 'tis the season :) hope it was a good time and thank you
both for getting this fixed!

Cheers,
Nathan
