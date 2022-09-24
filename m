Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5BF5E8CF1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 15:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2CD10E2B0;
	Sat, 24 Sep 2022 13:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14E10E295;
 Sat, 24 Sep 2022 13:02:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F9CDB80D6F;
 Sat, 24 Sep 2022 13:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5B9C433C1;
 Sat, 24 Sep 2022 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664024557;
 bh=f9TI+zLW1k/oFp4jM/JMZaUsym4/RFdsc3oPkp8gl1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vITOSzQTGC/YMameL61MhoY34yQPY9hA/15BiGXn3DaQb0P/4ieDqrLxOzgFJD/EC
 OaJ5R8dLDwURtAdRo2n3a07T27JXSXU6D94vXm+uPBGbELv+Mk6Qeh0ckggaTKWgi3
 NCAIw6POslOurSMVto1kITZtI4YmGXRMz+l4pFeQ=
Date: Sat, 24 Sep 2022 15:02:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v7 0/9] dyndbg: drm.debug adaptation
Message-ID: <Yy7/6oTBW2lqVSK1@kroah.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
> hi Greg, Dan, Jason, DRM-folk,
> 
> heres follow-up to V6:
>   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
> 
> It excludes:
>   nouveau parts (immature)
>   tracefs parts (I missed --to=Steve on v6)
>   split _ddebug_site and de-duplicate experiment (way unready)
> 
> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
> 
> If these are good to apply, I'll rebase and repost the rest separately.

All now queued up, thanks.

greg k-h
