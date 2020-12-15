Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4422DB424
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 20:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CF289B29;
	Tue, 15 Dec 2020 19:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3AC89207
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 19:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608058813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HE8p4803nr8EEV2Foh/7Cpa0TkBbGGqMwRHap2gZvI=;
 b=KQQDBo65dIuC3kO0zVvEvDasB6HuNQ37IVi1mPP9o5wg+jG2J2K1EOyM+O0Q8uELRZKRlj
 +jbTMCkUPgbBUMGFoWVaD/mFN8IGiiCjoNPdKGzE+/tAaepyhCNtVrsW4TlXAoxV9pwVVz
 nY9qVwtxbq7kHlJEEIuF4tgfSt3MwJg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-rRyIcKRPOkqDjSZ44yd8pg-1; Tue, 15 Dec 2020 14:00:11 -0500
X-MC-Unique: rRyIcKRPOkqDjSZ44yd8pg-1
Received: by mail-qt1-f198.google.com with SMTP id i1so14972744qtw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5HE8p4803nr8EEV2Foh/7Cpa0TkBbGGqMwRHap2gZvI=;
 b=DE0Z7Gi67+5rCFKQJu0NEgXLM1/1zUkk9W7qJLJW1mA5nierFjORtu7jRw0Nz5iFqo
 kj5qdwVhgjns7e7zAZYYMZUGdsWD6bfEQ1zmKHGBxQzztSppHZOv8uX5VP6aUVEFA0Rb
 XnVJzvizcMeqPCmNUVenO1hWm0OWqazeiBLSyxILjS1n83cJmC9r25g38e9oINaMmxHd
 nJddaQ7QiefYc7FZGz9JaWdlfsvFNF8ItEc0zLi2MGfed7+43IV5v+rI2zvPzNJ0bJEA
 JM3R17TZM/0G4BuumBBuUy7JQvFm50OQGIeDqnm70tJBV0CF9dWIPUeJVZaMF0SBT4sE
 MnIQ==
X-Gm-Message-State: AOAM532YoTTAKdsC/flrYE4BK7MK6Wj4DYlq9Y703R9K3F7Hxw3ZR8Hp
 YqMADP+P2Yl4HjPatbimguOyucXUb4Fz/hLzfSd8wmvUvtPokvzQhMIWLfd3KLS+YBSy9GCLxb7
 rSu4jnR8JiWUZYUwZg/Hhj+pd9xly
X-Received: by 2002:a37:8d01:: with SMTP id p1mr20046594qkd.31.1608058809602; 
 Tue, 15 Dec 2020 11:00:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsEMbKSsCB6tRrwkxY7WiocSFllMT54n4GdhwdkEoxTJJmDGKfXjf4l0GrD1Ds/zJlQ5106w==
X-Received: by 2002:a37:8d01:: with SMTP id p1mr20046566qkd.31.1608058809388; 
 Tue, 15 Dec 2020 11:00:09 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id r6sm18260743qkk.127.2020.12.15.11.00.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 11:00:08 -0800 (PST)
Subject: Re: [PATCH] drm/i915: remove h from printk format specifier
To: Chris Wilson <chris@chris-wilson.co.uk>, airlied@linux.ie,
 daniel@ffwll.ch, daniele.ceraolospurio@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 lionel.g.landwerlin@intel.com, rodrigo.vivi@intel.com,
 tejaskumarx.surendrakumar.upadhyay@intel.com, tvrtko.ursulin@intel.com,
 venkata.s.dhanalakota@intel.com
References: <20201215144101.1878719-1-trix@redhat.com>
 <160805599050.14591.5854311082825914383@build.alporthouse.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <12579dc7-603e-2fbe-85c0-0a4110b8992a@redhat.com>
Date: Tue, 15 Dec 2020 11:00:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160805599050.14591.5854311082825914383@build.alporthouse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/15/20 10:13 AM, Chris Wilson wrote:
> Quoting trix@redhat.com (2020-12-15 14:41:01)
>> From: Tom Rix <trix@redhat.com>
>>
>> See Documentation/core-api/printk-formats.rst.
>> h should no longer be used in the format specifier for printk.
> It's understood by format_decode().
> * 'h', 'l', or 'L' for integer fields
>
> At least reference commit cbacb5ab0aa0 ("docs: printk-formats: Stop
> encouraging use of unnecessary %h[xudi] and %hh[xudi]") as to why the
> printk-formats.rst was altered so we know the code is merely in bad
> taste and not using undefined behaviour of printk.

Ok, i will fix this after the first run of patches.

Tom

> -Chris
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
