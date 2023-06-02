Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94F07206C2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 18:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564A610E055;
	Fri,  2 Jun 2023 16:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B486D10E055
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 16:02:47 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 74E30A0C51;
 Fri,  2 Jun 2023 18:02:44 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id 54A59A03C1;
 Fri,  2 Jun 2023 18:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.de;
 s=mailde202009; t=1685721764;
 bh=tv2A1PHmeMa3v3uMaiE4Bc7ZSbcEClP7BcfjrtTbIrs=;
 h=Message-ID:Date:Subject:From:To:Cc:From:To:CC:Subject:Reply-To;
 b=7M2Orn5bsIX//x2yADBJcMDk67bOoOtCGhaG2rOMsFREsZ7zfacnUAdY1Hk3Iyw2r
 YqCEA73F1ySJi13N6ORwIjZvXbkk8oMGEsd2tD0XNvGs1a2jy81Ncp11UAiz990R8f
 lqz4itLVpwCmBYm0ABHlPVFHbBUViBqZC0lqwY8c+EMc0AWiyha2T93gt7QQ+xoo63
 LEk5xEWV0DOV4QO5C8a8L9TOasZHIl4Y420fRtxrt62yWXMfBGx+QaX/5nNF8ZElDG
 M5okAkYUxyvkLt5MsdgJI8vVUfAbz8k9ufTp2Flvs3v5LfaVUdKLdG2NzLkPbTHcP4
 drp7RH8FiBtGQ==
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id 84282A0516;
 Fri,  2 Jun 2023 18:02:43 +0200 (CEST)
Message-ID: <fa05fd05-adea-8652-31fd-b48cc90f84cb@my.mail.de>
Date: Fri, 2 Jun 2023 18:02:43 +0200
MIME-Version: 1.0
Subject: Re: Kernel bug related to drivers/gpu/drm/ttm/ttm_bo.c
From: Christopher Klooz <py0xc3@my.mail.de>
To: christian.koenig@amd.com, ray.huang@amd.com
References: <69d51cd5-732f-9dc5-4e12-d68990132c85@my.mail.de>
Content-Language: en-US
In-Reply-To: <69d51cd5-732f-9dc5-4e12-d68990132c85@my.mail.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1628
X-purgate-ID: 154282::1685721764-3DFFB199-5F9E6132/0/0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

See also (maybe this user experiences the same bug?): 
https://bugzilla.redhat.com/show_bug.cgi?id=2193325

To provide direct links: My original post in "Kernel bug related to 
drivers/gpu/drm/ttm/ttm_bo.c" relates to:

https://gitlab.com/py0xc31/public-tmp-storage/-/blob/main/retry6.3.4/firefoxCrash-noPidof-kernelerror-6.3.4.pstate-passive.CUT.log

https://gitlab.com/py0xc31/public-tmp-storage/-/blob/main/retry6.3.4/firefoxCrash-noPidof-kernelerror-6.3.4.pstate-passive.preHALT.log

Some logs contain issues involving BOTH "amdgpu" and (one or more) 
CPU(s), but a few refer to only one of the two, and some others none of 
the two but only a reference to a kernel BUG. But sometimes logs are 
frozen before any log can be written.

Currently, most logs do no longer contain much about amdgpu; but an 
earlier log with more amdgpu-related entries was 
https://gitlab.com/py0xc31/public-tmp-storage/-/blob/main/2nd/root-journalctl.-r.-b.-1.FirstFirefoxInsideTabFreeze_thenRemainingFirefoxFreeze_thenSystemFreeze.16-31-55screenClockFrozen.kernel6.2.15.amd_pstate-passive.log 
(which is also contained/elaborated in my bug report I referred to in my 
original post). The latter (older) log is widely comparable to the other 
user's bug report and it is also from roughly the same time 
(beginning-mid May). Maybe some Fedora updates in between trigger the 
bug differently, causing different logs.

Another user with potentially the same issue can be found with an 
extract from their logs here: 
https://bodhi.fedoraproject.org/updates/FEDORA-2023-26325e5399 (the post 
of the user "benthaase")

