Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A97812E4F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 12:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCEF10E2D9;
	Thu, 14 Dec 2023 11:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 70055 seconds by postgrey-1.36 at gabe;
 Thu, 14 Dec 2023 11:14:13 UTC
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2577610E2CF;
 Thu, 14 Dec 2023 11:14:12 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SrV9F3bHXz9sbf;
 Thu, 14 Dec 2023 12:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1702552449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jePK21pd5fRVIKqpdeda/RVt0zvWt6juLXVybTGbkl4=;
 b=RHVo5sqGO7bQO9OQa2V6NehL7+V+FuP1FG1KCy42ICfEcbOO6AZFI1kkgkJRAKKxT6Q+z+
 I0AcYPwu4j1lyG3qiE35kZi0RyynhdU68ZyMrhlE/pjEOH9dqJ78t4lSvm5viU1xUdmdw8
 zK6Z5gs7ljPUjjp99biCFG7yRvcGqQJadHa5Bgo8TQTLwsJ8MwhIVsanc7NV/sYuqMB1RO
 Fm180zsmiJF0++yvRNdw0267a4eNPHlhTM6woAzQcbbv1CgJjh0pKquW5uCem0PM6eYImW
 3CoJpYWvf0glsFeNhhJsRMOmNlTrI/jxaCLYvxEjMfUG3Zlqmsu/lIoReeKVBQ==
Message-ID: <542b0362-90c2-46b2-aec4-1dd511d61c08@mailbox.org>
Date: Thu, 14 Dec 2023 12:14:06 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
 <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
 <473652dd-8ca1-436b-aa52-eb85eb0e98df@gmail.com>
 <381345a6-64bc-4cda-b787-fc431827b289@amd.com>
 <86b95faa-fda4-4354-97bd-a1c15fed0771@amd.com>
 <8316182c-1b28-49cf-97ef-23c683c1140b@amd.com>
 <1aeaa28b-1929-4c35-9225-fade0a25987f@mailbox.org>
 <b2db43bf-d89e-49ab-8cc3-588de5db5c1d@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <b2db43bf-d89e-49ab-8cc3-588de5db5c1d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 68jwquwe381qfpkbdj7woepb7t436hky
X-MBO-RS-ID: 7d3d9195329c10cd6b9
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-12-14 11:31, Christian König wrote:
> Am 13.12.23 um 16:46 schrieb Michel Dänzer:
>> From a security PoV, the kernel should never return uncleared memory to (at least unprivileged) user space. This series seems like a big step in that direction.
> 
> Well please take a look at the MAP_UNINITIALIZED flag for mmap().

       MAP_UNINITIALIZED (since Linux 2.6.33)
              Don't  clear  anonymous pages.  This flag is intended to improve
              performance on embedded devices.  This flag is honored  only  if
              the  kernel was configured with the CONFIG_MMAP_ALLOW_UNINITIAL‐
              IZED option.  Because of the security implications, that  option
              is  normally  enabled  only  on  embedded devices (i.e., devices
              where one has complete control of the contents of user memory).


> We even have the functionality to return uninitialized system memory when the kernel compile option for this is set

From mm/Kconfig:

config MMAP_ALLOW_UNINITIALIZED 
        bool "Allow mmapped anonymous memory to be uninitialized"
        depends on EXPERT && !MMU
        default n
        help
          Normally, and according to the Linux spec, anonymous memory obtained
          from mmap() has its contents cleared before it is passed to
          userspace.  Enabling this config option allows you to request that
          mmap() skip that if it is given an MAP_UNINITIALIZED flag, thus
          providing a huge performance boost.  If this option is not enabled,
          then the flag will be ignored.
          
          This is taken advantage of by uClibc's malloc(), and also by
          ELF-FDPIC binfmt's brk and stack allocator.
          
          Because of the obvious security issues, this option should only be
          enabled on embedded devices where you control what is run in
          userspace.  Since that isn't generally a problem on no-MMU systems,
          it is normally safe to say Y here.
        
          See Documentation/admin-guide/mm/nommu-mmap.rst for more information.


Both looks consistent with what I wrote.


> since this is an important optimization for many use cases.

Per above, it's available only on platforms without MMU.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

