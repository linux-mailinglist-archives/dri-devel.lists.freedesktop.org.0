Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673EB27F22
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 13:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954F10E91B;
	Fri, 15 Aug 2025 11:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3590410E91B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 11:25:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A32F1691;
 Fri, 15 Aug 2025 04:24:56 -0700 (PDT)
Received: from [10.1.29.14] (e122027.cambridge.arm.com [10.1.29.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D253D3F63F;
 Fri, 15 Aug 2025 04:25:02 -0700 (PDT)
Message-ID: <3f266ba8-d7a5-4f2d-aef8-a3c5b9b3a601@arm.com>
Date: Fri, 15 Aug 2025 12:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Remove dead code in
 mmu_hw_do_operation_locked
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Karunika Choo <karunika.choo@arm.com>,
 Chia-I Wu <olvaffe@gmail.com>
References: <20250815102539.39711-1-steven.price@arm.com>
 <CAPj87rPSoYe10JqpwYO=-tTX2EqnwB29wrYfhyWwpAyAczRVig@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAPj87rPSoYe10JqpwYO=-tTX2EqnwB29wrYfhyWwpAyAczRVig@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/08/2025 12:17, Daniel Stone wrote:
> Hi Steven,
> 
> On Fri, 15 Aug 2025 at 11:25, Steven Price <steven.price@arm.com> wrote:
>> The only callers to mmu_hw_do_operation_locked() pass an 'op' of either
>> AS_COMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT. So remove the code paths
>> that test for other operations and add a drm_WARN_ON() to catch the
>> posibility of others appearing the future.
> 
> Thanks! I think it would make sense to also inline
> mmu_hw_do_flush_on_gpu_ctrl() here though.

True, I'll have a go at a proper rewrite of that function to make it
more coherent.

Thanks,
Steve

