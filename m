Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE4717785
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 09:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F2D10E489;
	Wed, 31 May 2023 07:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2654 seconds by postgrey-1.36 at gabe;
 Tue, 30 May 2023 22:16:50 UTC
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [217.182.43.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3584B10E430
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 22:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=misterjones.org; s=dkim20211231; h=Content-Transfer-Encoding:Content-Type:
 Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FBurYPzx/P+7K1ew3kZobFLL4iaIkaDFy2j8U6Qpz1k=; b=PrFh6GN2xQH9skp71JIvMYYZaa
 LIncg4/qmMiMllhKjO0lm7V+jeUI82BEwQLByUUAghydE1/mNpBjPAFZxF/yFfbyTn8nsMdQeUSbR
 OEr1HsLJqZTQHAmq56LqgMRFdTxnKVGD0y76WBVYNFE4D2oZXvth2yJnWyst2zD+NHUnTgfrQ1N6U
 WaLi50qb9DwIS2HyDgVmbqvJ4obeEl5evjdhTYneYt9QNWwVwe9b+TNkygw4wGNt3zdrZSp2l7nAW
 jOl3suEKcaOT7lfI/++mLLo3alWHhHY5LB9GyOfqDPMxchXKDcGQDouye+89sfLH1hmIK1F27HgFX
 t1m/q0pA==;
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@misterjones.org>) id 1q46x5-001SHy-2X;
 Tue, 30 May 2023 22:32:23 +0100
MIME-Version: 1.0
Date: Tue, 30 May 2023 22:32:22 +0100
From: Marc Zyngier <maz@misterjones.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8c33787278ca8db73ad7d23f932c8c39b9f6e543
In-Reply-To: <20230530182123.UilBt%lkp@intel.com>
References: <20230530182123.UilBt%lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d65700431ed60877d3ec8e88e1211a97@misterjones.org>
X-Sender: maz@misterjones.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: lkp@intel.com, akpm@linux-foundation.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 samba-technical@lists.samba.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Mailman-Approved-At: Wed, 31 May 2023 07:06:45 +0000
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-30 19:21, kernel test robot wrote:
> tree/branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master
> branch HEAD: 8c33787278ca8db73ad7d23f932c8c39b9f6e543  Add linux-next
> specific files for 20230530
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/oe-kbuild-all/202305070840.X0G3ofjl-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> include/drm/drm_print.h:456:39: error: format '%ld' expects argument
> of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned
> int'} [-Werror=format=]
> 
> Unverified Error/Warning (likely false positive, please contact us if
> interested):
> 
> arch/arm64/kvm/mmu.c:147:3-9: preceding lock on line 140

This warning looks wrong. The "issue" seems that we acquire the lock
before exiting the function, but the the whole point is that the
lock is supposed to be held all along (it is dropped and then acquired
again).

I guess the coccinelle checker doesn't spot this construct?

         M.
-- 
Who you jivin' with that Cosmik Debris?
