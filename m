Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C813A2DE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5944A6E314;
	Tue, 14 Jan 2020 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7755B89C46;
 Mon, 13 Jan 2020 13:17:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c9so8517702wrw.8;
 Mon, 13 Jan 2020 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=tLJdz8uHGTwFRe/HfbeIyswyOes5Ps1w2SyZzjK0TNI=;
 b=oJ30OfnCy02mfkWDYfM6xJM6U4Ab0kvMs5beVhw0Sqr61CvOixDWeh8PqjtINQwt0d
 A867CVEQp98L5jJ1b2/31cz6mXrjuWnk5GF4jIfjSqYN1cQBkWuRe2RltVQrUwNvdqPB
 XGf1fUv+QJXpdfnxcNt29RsAgRM3QVOVij+9WBaIxSHOOh+uPGvZxG0Ef9ftujiYJqMW
 14sGUu3FksxgHoT0X9xHSxhOGYp/yPH0v4ouRv0yK6hMh2yiysnDuHibM4s94DSDTj+j
 +v3cGQ5D3qRo3o5NCtX0FDeN15dRuGewPgYuAZB5DvuHtLuN17Nr4fjC/2aDFfMO2W9j
 wWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=tLJdz8uHGTwFRe/HfbeIyswyOes5Ps1w2SyZzjK0TNI=;
 b=YYoKRghBiFB4AM/lw9c+BWVHe9c+EWRbQfh2B+k3nJ+L0y3Ufl1bnLMzsMpnNzCZla
 wvZVw0gPJ6sDdn/0rBNfZqQULBWJYouM0xQj/JhfgD4wyYe9bXO7m9msvps6gOCbryn+
 munq3Z2MPweBN1O//FiXye+DMyLmAjis0Ugn72j8sKEaWAE2aGN+87zT2qPGqoMBy3JG
 byi1G9dqLuaq+EzJGMpOoKTmRkF3him6GUwNbDeDJlyTnmkD+L9Q5MYUYMg/CJZqPc43
 RzMSui9q6Qmd4rkNb6DqO2iv7J2O8QLUJmx96oP4TICR8KdBU8DQ3u9QKtZIyO0M3oBB
 igzA==
X-Gm-Message-State: APjAAAVwkDUsXVLvXy4Eu8jsXqf7kbownn0xIalDKE9f9N26vQ30/j55
 vmF+cCFQYI5PH/AaqE8zjrE=
X-Google-Smtp-Source: APXvYqypgXFDN3UkdfYGIXJRIf4nrTfjdzE2wUiuGM7IrbMrIloOZZE987luKGr5Shnf5Cgg4xzGCw==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr18004142wrn.386.1578921465172; 
 Mon, 13 Jan 2020 05:17:45 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id b18sm15054407wru.50.2020.01.13.05.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 05:17:44 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Mon, 13 Jan 2020 16:17:11 +0300 (EAT)
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: convert to new logging macros based on struct
 intel_engine_cs.
In-Reply-To: <87lfqbmudl.fsf@intel.com>
Message-ID: <alpine.LNX.2.21.99999.375.2001131616050.10470@wambui>
References: <20200113111025.2048-1-wambui.karugax@gmail.com>
 <157891427231.27314.12398974277241668021@skylake-alporthouse-com>
 <87lfqbmudl.fsf@intel.com>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, sean@poorly.run,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Mon, 13 Jan 2020, Jani Nikula wrote:

> On Mon, 13 Jan 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>> Quoting Wambui Karuga (2020-01-13 11:10:25)
>>> fn(...) {
>>> ...
>>> struct intel_engine_cs *E = ...;
>>> +struct drm_i915_private *dev_priv = E->i915;
>>
>> No new dev_priv.
>
> Wambui, we're gradually converting all dev_priv variable and parameter
> names to i915.
>
Okay, I can change to that - dev_priv seemed more used in the files I 
changed.

Thanks,
wambui
>> There should be no reason for drm_dbg here, as the rest of the debug is
>> behind ENGINE_TRACE and so the vestigial debug should be moved over, or
>> deleted as not being useful.
>>
>> The error messages look unhelpful.
>
> I don't think you can expect any meaninful improvements on the debug
> message contents from Wambui without detailed help at this point.
>
>>
>>>                 if ((batch_end - cmd) < length) {
>>> -                       DRM_DEBUG("CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
>>> -                                 *cmd,
>>> -                                 length,
>>> -                                 batch_end - cmd);
>>> +                       drm_dbg(&dev_priv->drm,
>>> +                               "CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
>>
>> No. This is not driver debug. If anything this should be pr_debug, or
>> some over user centric channel.
>
> I'm sorry, I still don't understand your reasoning here.
>
> BR,
> Jani.
>
> -- 
> Jani Nikula, Intel Open Source Graphics Center
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
