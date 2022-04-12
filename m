Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56794FD298
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DCA88E9D;
	Tue, 12 Apr 2022 07:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0402010FBDA;
 Tue, 12 Apr 2022 07:23:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A814BB81B13;
 Tue, 12 Apr 2022 07:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DDCC385A5;
 Tue, 12 Apr 2022 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649748194;
 bh=IaRG8cJ6G1bj7jdpgFtx8xG226ZWTkMPIWrFR3ksgmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aoFD/56V3XbZh6sbN7HdztblQ6DhKvcBOoDsvw0D3JfbhcYHsOICXLfDWztuuUFXL
 YFcvyMcs6k8J9QL5XsG8yuNIayv/fV1+OFEzLv/0r1wNWwwSwEPTpOJNNMFmdSjl6Z
 FYnX8Xf7RK0KKhnaYuql04Q7wwkqB6HkjPvWcbvs=
Date: Tue, 12 Apr 2022 09:15:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: AMD Display Core (DC) patches (was: [PATCH 13/16]
 drm/amd/display: Revert FEC check in validation)
Message-ID: <YlUm+8ciAGWq2+zg@kroah.com>
References: <20220325225402.469841-1-alex.hung@amd.com>
 <20220325225402.469841-14-alex.hung@amd.com>
 <42d34e82-3c15-c33a-5cd4-a0d2436e44d2@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42d34e82-3c15-c33a-5cd4-a0d2436e44d2@molgen.mpg.de>
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
Cc: stylon.wang@amd.com, solomon.chiu@amd.com, Alex Hung <alex.hung@amd.com>,
 Bhawanpreet.Lakha@amd.com, qingqing.zhuo@amd.com,
 Martin Leung <Martin.Leung@amd.com>, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, amd-gfx@lists.freedesktop.org, Sunpeng.Li@amd.com,
 Aurabindo.Pillai@amd.com, dri-devel@lists.freedesktop.org,
 George Shen <George.Shen@amd.com>, wayne.lin@amd.com,
 Alexander Deucher <Alexander.Deucher@amd.com>, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 08:52:11AM +0200, Paul Menzel wrote:
> > Reviewed-by: George Shen <George.Shen@amd.com>
> > Acked-by: Alex Hung <alex.hung@amd.com>
> > Signed-off-by: Martin Leung <Martin.Leung@amd.com>
> 
> Shouldn’t the Signed-off-by line by the author go first?

No, this is the correct order.

thanks,

greg k-h
