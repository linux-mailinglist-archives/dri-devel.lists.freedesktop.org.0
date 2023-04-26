Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41BE6EEE7F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 08:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F52B10E2FD;
	Wed, 26 Apr 2023 06:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F8B10E2FD;
 Wed, 26 Apr 2023 06:42:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9892662E4B;
 Wed, 26 Apr 2023 06:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE9EC433EF;
 Wed, 26 Apr 2023 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1682491374;
 bh=BbD0U7ebbi3qqSF7uHQF72OPJWuCMl7jaAsF2SMWrRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=luXqmbPJZ5rMrScH7ZMstT27C7ziFsdr//ltLEmE02Hd4C8t+vyQ0rAtcoVbDuiO+
 2Jd8Ky5NlXit+psANPgmBkID/pJQx5kIoqiWP9RRyc30Zkf3eJ+OGv/aPw7AZwqmri
 8pU0LDSIE0217MnBKdc6P5WSK7fBF8QyN7aIlGjQ=
Date: Wed, 26 Apr 2023 08:42:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: add a missing lock for AMDGPU_SCHED
Message-ID: <2023042627-hypnosis-unlovely-d679@gregkh>
References: <20230426061718.755586-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426061718.755586-1-olvaffe@gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 11:17:14PM -0700, Chia-I Wu wrote:
> mgr->ctx_handles should be protected by mgr->lock.
> 
> v2: improve commit message
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: stable@vger.kernel.org

What commit id does this fix?  How far back in stable kernels should
this go?

thanks,

greg k-h
