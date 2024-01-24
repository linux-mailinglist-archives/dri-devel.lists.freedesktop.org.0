Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2483B41B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 22:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C028A10EA6A;
	Wed, 24 Jan 2024 21:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2D10EA6A;
 Wed, 24 Jan 2024 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=AX08+RLbDchsJTFyY1lnz5dLrmtS/OEhzEMoWtz6kyg=; b=iJJytbfpjgwsfOP6lKgV0cHI66
 BGr6bA9cPVV5+u0+oRGd/xH57eMjl/B6M3khMQAL6yvfrlUUJJ7pWJ9ulNl+9NBbLhtwTgASfht2h
 q6l+DLKMx4Ks8QxOcRQ6ObF/grcj0Lmdyy95Av1kIWgoLeDsFDFIEcUfuE8yd2oLb2P6uT0A1BoMt
 Clgs/69OQNzvyLhSzDoXxrglpqa8tbFrHvhHYj3MC0+f9JTCP8Bp5dyZbCeQYqmBh5jMHyCqZjOIC
 UTClGiWfoc9iSrDNmKjdIyNa1fqQDgxj1YdrelkthMkvksqNaald2yKe5gU/MVBlX6g2F7hWwHc0t
 cSn+M5qg==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rSku7-005ALU-0r; Wed, 24 Jan 2024 21:35:27 +0000
Message-ID: <f16366bb-664e-4794-ad41-2c4c669190bd@infradead.org>
Date: Wed, 24 Jan 2024 13:35:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jan 23 (drm/xe/)
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240123132929.7cb6ea4c@canb.auug.org.au>
 <152521f9-119f-4c61-b467-3e91f4aecb1a@infradead.org>
 <87le8fks3r.fsf@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87le8fks3r.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/24/24 01:17, Jani Nikula wrote:
> On Tue, 23 Jan 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 1/22/24 18:29, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> News: there will be no linux-next release on Friday
>>>
>>> Changes since 20240122:
>>>
>>
>> on ARM64, when
>> DRM_I915 is not set
>> DRM_XE=m
>> DEBUG_FS is not set
>>
>> ../drivers/gpu/drm/i915/display/intel_display_debugfs.c:1091:6: error: redefinition of 'intel_display_debugfs_register'
>>  1091 | void intel_display_debugfs_register(struct drm_i915_private *i915)
>>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from ../drivers/gpu/drm/i915/display/intel_display_debugfs.c:19:
> 
> Does [1] fix the issue?

Yes, thanks.

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/20240124090515.3363901-1-jani.nikula@intel.com
> 
> 

-- 
#Randy
