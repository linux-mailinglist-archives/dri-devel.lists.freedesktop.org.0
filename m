Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AD55075F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 00:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E1C10E2F0;
	Sat, 18 Jun 2022 22:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B448810E2F0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 22:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :Cc:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=9uVMbhApZ0Mp+uHyuGaV5a384mogiHoFmbvbVDjUQR4=; b=jgnwz6ic5j3QKWJvttvfVbZbe0
 +Pd3auhSnl9cDI6Z8D2ITvZ8QlwcXo+SII4YxFayFDZE4480VKlCW8ZjMkkE6Wefug1UOimdcWKnd
 i24+5ukj7T/ZcxKjBpBWihZUEBm2zuWNaw0QzjjNwX7JFx6bY0H4Uw4Ziw3GW1AledMCWSWgb0C7P
 vWZCed46kdE7UEsjY1ZPcN4/QNiy4+YFVWoqnb3MNCO9pY36IWWNKbGuZp6l33w+nXAZnEGG27Xy/
 Rgr1ZDjqje5grFmRecYtgmUusNtKm3dSEM7vBMl3rD/RPtHvbIK0xPaD8ictJlcKc13dVmbhJ3ZO+
 t+o+GPpA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o2hG6-00930S-Jf; Sat, 18 Jun 2022 22:49:39 +0000
Message-ID: <9a0ed0bb-34c7-bacb-16a8-fdb158535ab2@infradead.org>
Date: Sat, 18 Jun 2022 15:49:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [DRM/hisilicon/hibmc] kernel robot reports build errors, patch(es)
 available but not merged
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, John Stultz <jstultz@google.com>,
 Tian Tao <tiantao6@hisilicon.com>, RongrongZou <zourongrong@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


kernel robot reports today:

* riscv64-linux-ld: ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
  https://lore.kernel.org/lkml/202206190651.smtms3Ay-lkp@intel.com/T/#u

* ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
  https://lore.kernel.org/lkml/202206190523.0Ar6yQF7-lkp@intel.com/T/#u


and earlier:

* ld.lld: error: undefined symbol: vmf_insert_pfn_prot
https://lore.kernel.org/lkml/202203281125.Jp08egXu-lkp@intel.com/

* ttm_bo_vm.c:undefined reference to `vmf_insert_pfn_prot'
https://lore.kernel.org/lkml/202204081648.gV63Gt0t-lkp@intel.com/


I sent a patch for this on 2022-04-08 and again on 2022-05-30 (UTC).

https://lore.kernel.org/all/20220409030504.16089-1-rdunlap@infradead.org/
https://lore.kernel.org/all/20220531025557.29593-1-rdunlap@infradead.org/

Neither one has been applied or even had a comment.  :(

-- 
~Randy
