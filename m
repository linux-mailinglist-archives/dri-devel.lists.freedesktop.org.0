Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41C06CD4DE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 10:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E74810E504;
	Wed, 29 Mar 2023 08:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB59F10E504
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:39:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 338D6B82103;
 Wed, 29 Mar 2023 08:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFC5C433EF;
 Wed, 29 Mar 2023 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680079191;
 bh=MbbUjNHksY2NgnrDrVZWYsUNCTFADXtE1DM3qUt1vac=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=U3pWhUEsCZdsFHNnsoF8CTUf1dF+whckB1hNS7ZpzHvQnuzTdJpXuX230Yk+jEEAo
 MoJbiQ11NWC0py1mnPzpQ1z+DfWOqeVt7XoPZHwrrVUTHsBLOQ3OnD7rKVHXxYzZpI
 n0J+Mjt//J2WMBMPm+wFhAp+kbMY71sipyK5qsMhqFK0AE0wXXv6xPSWSqNKRGzm1W
 DMXi4rjMs0+2qeK3+Vbf6Gz/eNJ6AJchF1dhfDORCFvrbcB/RKdaSxwj7gTZExpRoS
 cvogxrNNJ4YaG9bMVlkMijUBn9QaIx0FtHsS1VHb5OV7HXZKhxFg/uIUBrm/jJi1L6
 z6guRXp4sjxDA==
From: Kalle Valo <kvalo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: Linux 6.3-rc3
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
 <87pm91uf9c.fsf@kernel.org>
 <20230322163637.GA918620@dev-arch.thelio-3990X>
 <87wn36ctdi.fsf@kernel.org>
 <20230324151150.GC428955@dev-arch.thelio-3990X>
 <87o7oicgwv.fsf@kernel.org>
 <20230328190745.GA375033@dev-arch.thelio-3990X>
Date: Wed, 29 Mar 2023 11:39:45 +0300
In-Reply-To: <20230328190745.GA375033@dev-arch.thelio-3990X> (Nathan
 Chancellor's message of "Tue, 28 Mar 2023 12:07:45 -0700")
Message-ID: <87h6u4t0ha.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nathan Chancellor <nathan@kernel.org> writes:

>> >> And maybe request a similar llvm directory under pub/tools to make it
>> >> more official? :)
>
> We now have https://kernel.org/pub/tools/llvm/, which is about as
> official as we can get I suppose :)

Nice, thanks. Bookmarked and I'll advertise this to wireless devs
whenever we have clang warnings.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
