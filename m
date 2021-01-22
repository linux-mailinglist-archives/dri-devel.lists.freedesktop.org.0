Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A31301449
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071076EADC;
	Sat, 23 Jan 2021 09:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3412689F49;
 Fri, 22 Jan 2021 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=9NCYCn2uu0Groq7HNmcJIKyI4plVDNVRCWewLnn9RN8=; b=cXJUHCxcSZmb3WBbTCOSR35MIH
 SKSZ/AI9tzSgOHhz++Q5LuNVk/ofOefgqfOGpcSMlZwWBvgsKoeC1nEyEVjBVv3ZS6oB2/lECoM+s
 Zv5elCywH+h7Nmoy/IN2QsQCb1IraI5aaHYbGpWAoLx6TqwwJD1DaCPhX+yrN3IJWyrjE5wDWB7Zp
 3xny6jzWKrsozJ6vFU+CStctgeG0CmgnZfCzrajZAcPc1rvIU4rAgpTNufmzG17Q2jvk2AzSezD5u
 6yh3gAOHP6dzU+/9IjeChfFqrTewesgwEUZIEb03HkrEcTX3wimImj/NLUduZmdqclatfa940PiJX
 YC8/qVBw==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l30l4-0007me-0q; Fri, 22 Jan 2021 18:02:06 +0000
Subject: Re: linux-next: Tree for Jan 22 (amdgpu)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210122180643.7039571c@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <64dd3a50-a836-c1b7-738e-6b6b5433117a@infradead.org>
Date: Fri, 22 Jan 2021 10:02:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122180643.7039571c@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/21 11:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210121:
> 

on i386:

ERROR: modpost: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "__divdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!



-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
