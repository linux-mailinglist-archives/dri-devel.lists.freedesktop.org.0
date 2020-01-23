Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BA146AFE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 15:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6A16E0AD;
	Thu, 23 Jan 2020 14:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8948A6E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 14:17:39 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FDC320718;
 Thu, 23 Jan 2020 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579789058;
 bh=aBxSUr/gjynePT84F3DyY+Db2ohisB0vJNv4FgKtc7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w63LnevdSdZAkY4eBt+Wa2NXfG7LtIuPnDdxzREo7fPXI6REGhdaIQN5/SX4bzgII
 /j3MDnlDjlQhWWAJChsYrKoxruEBWmKdgD1tOikU5vlWe3mkmQyBPO83hdrmUkmGCY
 Z8CtCXqK/xF3EfSDl+iOy/oVMDLLyov1ls7KrLBQ=
Date: Thu, 23 Jan 2020 09:17:37 -0500
From: Sasha Levin <sashal@kernel.org>
To: Iago Toral <itoral@igalia.com>
Subject: Re: [PATCH AUTOSEL 5.4 003/205] drm/v3d: don't leak bin job if
 v3d_job_init fails.
Message-ID: <20200123141737.GC1706@sasha-vm>
References: <20200116164300.6705-1-sashal@kernel.org>
 <20200116164300.6705-3-sashal@kernel.org>
 <cb93a21557216d1b389390c556f421132aac88f0.camel@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb93a21557216d1b389390c556f421132aac88f0.camel@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 08:25:30AM +0100, Iago Toral wrote:
>Hi Sasha,
>
>
>please notice that there were two separate patches that addressed the
>same issue and applying both simultaneously leads to a double free
>(which is what I see is happening with this patch: see the second call
>to kfree(bin) right below the one added here). This issue was raised
>previously here:
>
>https://lists.freedesktop.org/archives/dri-devel/2019-October/241425.html

I'll drop this patch for now. Any idea why upstream didn't pick up the
fix yet? I see the problem still exists there.

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
