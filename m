Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 844C07D07D6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 07:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1910E580;
	Fri, 20 Oct 2023 05:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2502 seconds by postgrey-1.36 at gabe;
 Thu, 19 Oct 2023 10:54:49 UTC
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A221F10E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=FZ2wLAmbsoxzhZt475ZmnVNLNU8vs3pxdLVPs7AlSqE=; 
 t=1697712889;x=1697802889; 
 b=SUSpxXNI6ATGr6sdyX4CAyI8Ekq/LSsZ0+TtOhuMIITVcOqnndExIymLEbYNP6nXc62kPVXOycgAvG7xmsP3nBSp+aF+h3Li/zNwRPnBfTWGrogR5M3LG5WtvV7d14OrtDAiwyww4Andw2xW+JuXAohz5+PFkoYdf7eF3R3Fh57NNPxjW+0JVElYcyz/TzQ8hyUGTN5YZVujHUWNjth63cwA4TPN+/S6ZmJypRP6wQSru6AvKvc05xCx/GZSSQdOkVZBcyz4Hz+C38MzWQOe71EKegp8wgs6LND3aFOKLN5AWCudqQ29jbRH0Ri5smA9wDmifHn9ohhcmxz3t0O2nQ==;
Received: from [10.161.100.15] (port=33406 helo=smtpng3.i.mail.ru)
 by fallback16.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qtQ1Y-006NBm-Pd; Thu, 19 Oct 2023 13:13:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=FZ2wLAmbsoxzhZt475ZmnVNLNU8vs3pxdLVPs7AlSqE=; 
 t=1697710384;x=1697800384; 
 b=cQcj9EEEduh0BMXw9xGQgQJlt01H9+9dDQVcnnThP37qITi9JY+c6SbStKz8fkFp12PwthjfMsCdQjtTZMnelH31BV7cDWBiacvmUV4JvjFIb0yCFzFOpg9uWYNYWVEyjQny7pxx8UXkHO8tJGY9dKJxB4DjPTIi2l1M+RL7JECXlAJD6gMwP3EIlt35MBjsd1Y/mL1dPY9x7S4A9atYxTm5PyVQc0+tHfQQA80VbV6l3v1hSRduioN7ch4eHNwr7lIbLoT6ssnBjEdMVg0hbHtWuEgg+fAGzSsxyj1y9SEU/c09bwJuSDJKFp9xa92HKNdt/AfN/tnEgI6jA61F6g==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qtQ1J-0004wp-2q; Thu, 19 Oct 2023 13:12:50 +0300
Message-ID: <cafc11b1-93d1-468d-88c7-b8b6f8b27547@inbox.ru>
Date: Thu, 19 Oct 2023 13:12:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/20] Imagination Technologies PowerVR DRM driver
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20231010133738.35274-1-sarah.walker@imgtec.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20231010133738.35274-1-sarah.walker@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD978AFEFB3096932CF067259BE5129BC25732DC641AEA930A1182A05F538085040C2605E2AA15CDF10C8211401740B4A1042FA361644404DB74B3DF5AEA29833D3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F9D3BE5B596754B8C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE77BF46084C0059042EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BE5CCB53A13BC8DBA2A091836E1F265D70D9CA0D510A8EFC420879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0DCF4F0DC832992758941B15DA834481FA18204E546F3947CC2B5EEE3591E0D35F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063793270F7220657A0A389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC47272755C61AA17BE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8B08F9A42B2210255C75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A565C7086EBC9D473415F279ACDF478F5F36B452A93AEDFACFF87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA588CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE4DF0D63EE383A79F6A7B273E03F895FE821FCB66D0705176AA8BBBFD371D3C1F33D08354E2B7C925BB39EF8E370AEADE6846D863085C6BD9C8927945BE056F997B0E0F2C360C7964C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojI+3ahDCNcVZh0S32k8UNjA==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986BEF3E50AE3CB2F22C9B48DA2DDD9459B498CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4DEDBBC46D76EB2520ED4F58DABF9B69510FDFA31A9459BA5049FFFDB7839CE9E7E8A997835E85111036EDD732F8361FA021E1609F3BBD6F772F92D7DB10D2B09
X-7FA49CB5: 0D63561A33F958A59E62A8CF8988D5AAB01B3FA4BD27B0D0E9EE173060FDDE11CACD7DF95DA8FC8BD5E8D9A59859A8B6C9FB9FFC76A8E93C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdVi+mls5yutoGB9YG2MJkzg==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Approved-At: Fri, 20 Oct 2023 05:52:28 +0000
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, faith.ekstrand@collabora.com, linux-kernel@vger.kernel.org,
 afd@ti.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.10.2023 16:37, Sarah Walker wrote:
> This patch series adds the initial DRM driver for Imagination Technologies PowerVR
> GPUs, starting with those based on our Rogue architecture. It's worth pointing
> out that this is a new driver, written from the ground up, rather than a
> refactored version of our existing downstream driver (pvrsrvkm).
> 
> This new DRM driver supports:
> - GEM shmem allocations
> - dma-buf / PRIME
> - Per-context userspace managed virtual address space
> - DRM sync objects (binary and timeline)
> - Power management suspend / resume
> - GPU job submission (geometry, fragment, compute, transfer)
> - META firmware processor
> - MIPS firmware processor
> - GPU hang detection and recovery
> 
> Currently our main focus is on the AXE-1-16M GPU. Testing so far has been done
> using a TI SK-AM62 board (AXE-1-16M GPU). Firmware for the AXE-1-16M can be
> found here:
> https://gitlab.freedesktop.org/frankbinns/linux-firmware/-/tree/powervr

And what about another PowerVR (rogue-based) GPU? There are a lot of 
different models of rogue GPU in existed SoCs. New driver uses v3 
firmware, but vendors uses v1/v2 firmwares. Who will provide 
firmware/source code v3 for all the others models?
