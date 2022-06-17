Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4FE54EF2F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 04:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5610E51D;
	Fri, 17 Jun 2022 02:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5135E10E51D;
 Fri, 17 Jun 2022 02:19:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 206BDB823E0;
 Fri, 17 Jun 2022 02:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B77C3411A;
 Fri, 17 Jun 2022 02:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1655432368;
 bh=Yki0vBzHWKtp6dJbGwH7gUmRk173I5HAJLFYlBbmLtI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U9nPBXKmGgZZ77OA8gwHRrq5HaWuWMnXvA4xx6OL7Qe5Q6WWAkLhRNj5c2JUuTOqP
 fC5Sfz1KP6igFDmHzTkyDdxVCfXz+BEUxESyFl0RvL9jo3cHVy1jIy83e+BVWZ/Bg5
 Ri0ktWlcrRmiQmPMePGTfamFHNmIEHqZQXsclOsA=
Date: Thu, 16 Jun 2022 19:19:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v5 00/13] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Message-Id: <20220616191927.b4500e2f73500b9241009788@linux-foundation.org>
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 15:00:28 -0500 Alex Sierra <alex.sierra@amd.com> wrote:

> This is our MEMORY_DEVICE_COHERENT patch series rebased and updated
> for current 5.18.0

I plan to move this series into the non-rebasing mm-stable branch in a
few days.  Unless sternly told not to do so!
