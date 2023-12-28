Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938981FC0B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 00:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFA010E163;
	Thu, 28 Dec 2023 23:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A29D10E163;
 Thu, 28 Dec 2023 23:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Cir4Ai1HJt1uqv+CIRyVLG6p3Arja93tLqzyTKip4Ao=; b=Mp8U4I/kh7I1X4Pd86LbC7JwUp
 DFvugv5t1X9wk98e0M59WLLMux5IdWabDSNxhxYw7eUC6+EXKSAT2joZy8DrDQU6UYhpHf5P1htaC
 xt2AoLquZLAMwknCh73KkRORKt6lSTZ7AEiB9vobnSfr0pg07jcb+NX7ohpuSNso3I7wkibq6MrzL
 /PPAHl7v2UJ3y46zCmTlTmG3NuX/uZ5WSSuyhnDs46aifTcQaKsVmUjC0u0l3BMdMwFN/DsZcivX3
 KBcSH6BUOfeV4JT2AV8UJD7fYM7sUIICy3kS+VZBAuTXl1OzwPoezpmATAjn2moMLaVfVAkahc/ly
 g2Ok8PSQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rJ01c-00HY25-1i; Thu, 28 Dec 2023 23:42:52 +0000
Message-ID: <ff236270-8c8c-483f-bae2-f90f94b41d4a@infradead.org>
Date: Thu, 28 Dec 2023 15:42:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/i915/gt: reconcile Excess struct member
 kernel-doc warnings
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231226195432.10891-1-rdunlap@infradead.org>
 <20231226195432.10891-2-rdunlap@infradead.org>
 <ZY2hl-8-iucCogQP@ashyti-mobl2.lan>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZY2hl-8-iucCogQP@ashyti-mobl2.lan>
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 12/28/23 08:25, Andi Shyti wrote:
> Hi Randy,
> 
> ...
> 
>>  /**
>>   * struct intel_gsc - graphics security controller
>>   *
>> - * @gem_obj: scratch memory GSC operations
>> - * @intf : gsc interface
>> + * @intf :	gsc interface
>> + * @intf.adev :	MEI aux. device for this @intf
>> + * @intf.gem_obj : scratch memory GSC operations
>> + * @intf.irq :	IRQ for this device (%-1 for no IRQ)
>> + * @intf.id :	this interface's id number/index
>>   */
> 
> I don't really like the tabs here and the space before the ':',
> which makes it a bit harder to read. Besides it doesn't look
> consistent with the rest of the documentation.
> 
> Otherwise, looks good.

Yes, one existing line had " : " and somehow I managed to use that on
all of the new lines. Not good. I'll redo patch 2/4.

Thanks.

-- 
#Randy
