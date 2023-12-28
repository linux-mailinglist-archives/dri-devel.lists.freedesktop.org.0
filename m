Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E1381FBFF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 00:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22BD10E273;
	Thu, 28 Dec 2023 23:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D516A10E273;
 Thu, 28 Dec 2023 23:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=NiIPkFQqmlg8hHDXK0BoSCEzG13ttdB9oJvpLZV4XXY=; b=CaN1ztGHFmMWAdI2GUCOEzjnqd
 zJ2bpWsSL7n+0TG2J5WB0N3+Pwru274Kz+GFN4us0JC6R17IRIr3QkhS+8dwbTJVAIRRwTFo5WKY0
 y0LdLJm9QnlAaNeg97IQlajFXcPlKV+o6LxfV317aMsnaEUc7fESfVRJnrxPdXqSZjcsj9ieWtPIL
 hjhkYWua53xF/emoEinS/LQ/AL7G7Ksi+S38m8Kiz7xjPODXAfYT8PiWAJO+LwFIvv49QpFfmoeyt
 eviwSeAyQsetdQHGJguegsDNI6EwANdGPoFbKkuFCk2GvEsHnCA2pvIJdS10I4uyWzcVqb1IOf2z9
 etvPUYCQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rIzw1-00HXc3-1h; Thu, 28 Dec 2023 23:37:05 +0000
Message-ID: <799b2484-9103-466b-ab86-483beadaad87@infradead.org>
Date: Thu, 28 Dec 2023 15:37:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/i915/guc: reconcile Excess struct member
 kernel-doc warnings
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231226195432.10891-1-rdunlap@infradead.org>
 <20231226195432.10891-3-rdunlap@infradead.org>
 <ZY2lDJ4BkwO1AZGj@ashyti-mobl2.lan>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZY2lDJ4BkwO1AZGj@ashyti-mobl2.lan>
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


On 12/28/23 08:40, Andi Shyti wrote:
> Hi Randy,
> 
> [...]
> 
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -105,61 +105,67 @@ struct intel_guc {
>>  	 */
> 
> 
> struct { } interrupts is missing here.
> 
>>  	struct {
>>  		/**
>> -		 * @lock: protects everything in submission_state,
>> -		 * ce->guc_id.id, and ce->guc_id.ref when transitioning in and
> 
> [...]
> 
>> +		 * we start bypassing the schedule disable delay
>>  		 */
>>  		unsigned int sched_disable_gucid_threshold;
>>  	} submission_state;
> 
> Here struct { } send_regs is missing

scripts/kernel-doc didn't report any problems with those, but it does
appear (to me) to be a kernel-doc bug.  :(

Thanks.

> But as for this patch:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks,
> Andi
> 
>>  	struct {
>>  		/**
>> -		 * @lock: Lock protecting the below fields and the engine stats.
>> +		 * @timestamp.lock: Lock protecting the below fields and
> 
> [...]

-- 
#Randy
