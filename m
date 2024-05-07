Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA58BDA7A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 07:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6879110FDBB;
	Tue,  7 May 2024 05:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="ihPjLBHL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA7C10FDBB;
 Tue,  7 May 2024 05:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=24/H3T0QFclFVrI+hVG7Y+bOQKXkotNmMck/gaj7A74=;
 t=1715058262; x=1715490262; b=ihPjLBHLtPyLpbIAjseLLftWSBQDfnjoBrICgV47Hs59DJE
 9tkPWzj6d25nUQt4nkBDEIezOvYl8BhXK28z77cOllJETgTUE2Fkz/PmfxpJ2tI3PtcMN2mntA3jV
 bBUahAO8qkWEa3rYUad9rCTqbTB39t4HCp1ctjIQAK2sGfRrxAgI4YViPlAiYnHQOOmh4hTNdkhz8
 9HwYmTTp15iu22ditaAQI2JhNmTuh5Ikng/xomloD4hjB+t07KUdcENPSzMmaD/n9n6zmEX1vmnBS
 plMwFQBo9u1or1jMC4nyN1Ds1tPYhtmBhvwkooAfVXtawdr0kZGPYAf0CjQelV6A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1s4Czw-0004Fn-6H; Tue, 07 May 2024 07:04:16 +0200
Message-ID: <ac41c761-27c9-48c3-bd80-d94d4db291e8@leemhuis.info>
Date: Tue, 7 May 2024 07:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] 6.9.0: WARNING: workqueue: WQ_MEM_RECLAIM
 ttm:ttm_bo_delayed_delete [ttm] is flushing !WQ_MEM_RECLAIM
 events:qxl_gc_work [qxl]
To: David Wang <00107082@163.com>
Cc: airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch,
 dreaming.about.electric.sheep@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 regressions@lists.linux.dev, spice-devel@lists.freedesktop.org,
 tzimmermann@suse.de, virtualization@lists.linux.dev
References: <20240430061337.764633-1-00107082@163.com>
 <20240506143003.4855-1-00107082@163.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <20240506143003.4855-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1715058262;
 1dfc21ef; 
X-HE-SMSGID: 1s4Czw-0004Fn-6H
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.05.24 16:30, David Wang wrote:
>> On 30.04.24 08:13, David Wang wrote:

>> And confirmed that the warning is caused by
>> 07ed11afb68d94eadd4ffc082b97c2331307c5ea and reverting it can fix.
>
> The kernel warning still shows up in 6.9.0-rc7.
> (I think 4 high load processes on a 2-Core VM could easily trigger the kernel warning.)

Thx for the report. Linus just reverted the commit 07ed11afb68 you
mentioned in your initial mail (I put that quote in again, see above):

3628e0383dd349 ("Reapply "drm/qxl: simplify qxl_fence_wait"")
https://git.kernel.org/torvalds/c/3628e0383dd349f02f882e612ab6184e4bb3dc10

So this hopefully should be history now.

Ciao, Thorsten
