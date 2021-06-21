Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EF13AEBCC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2236E19B;
	Mon, 21 Jun 2021 14:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 32FC76E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:54:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90D7F1042;
 Mon, 21 Jun 2021 07:54:08 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3D6E3F694;
 Mon, 21 Jun 2021 07:54:07 -0700 (PDT)
Subject: Re: [PATCH v2 02/12] drm/panfrost: Get rid of the unused
 JS_STATUS_EVENT_ACTIVE definition
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-3-boris.brezillon@collabora.com>
 <cc766827-fd7c-1127-9ece-f608024656d9@arm.com>
 <20210621164919.760ca377@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <60453a76-58b4-b1e1-b9d4-e7ebbf7e8689@arm.com>
Date: Mon, 21 Jun 2021 15:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621164919.760ca377@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2021 15:49, Boris Brezillon wrote:
> On Mon, 21 Jun 2021 15:34:35 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 21/06/2021 14:38, Boris Brezillon wrote:
>>> Exception types will be defined as an enum in panfrost_drm.h so userspace
>>> and use the same definitions if needed.  
>>
>> s/and/can/ ?
>>
>> While it is (currently) unused in the kernel, this is a hardware value
>> so I'm not sure why it's worth removing this and not the other
>> (currently) unused values here. This is the value returned from the
>> JS_STATUS register when the slot is actively processing a job.
> 
> Hm, what's the point of having the same value defined in 2 places
> (DRM_PANFROST_EXCEPTION_ACTIVE defined in patch 3 vs
> JS_STATUS_EVENT_ACTIVE here)? I mean, values defined in the
> drm_panfrost_exception_type enum apply to the JS_STATUS registers too,
> right?

Thinking about this more I guess I agree with you: this is an oddity and
your following patch adds a (more) complete list. You've convinced me -
with my nit above fixed:

Reviewed-by: Steven Price <steven.price@arm.com>
