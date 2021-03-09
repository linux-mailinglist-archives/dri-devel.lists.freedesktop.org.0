Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE13332151
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 09:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156506E8B3;
	Tue,  9 Mar 2021 08:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA096E8B3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 08:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=m1ySQThwTqktk5pDTj/PB3KoGJ3+/G2QSnHKkn6zu4I=; b=kgi82zMtcJ/J1JDoBz/wvZ7F7L
 c34PbfwE2GfjeMr66NLGf9naAaDA0abPmsePtQrCdcg3G4MdCff4BdtBU/POATwYMLxUbpEkbRvSg
 ISqcvZCYCWRHszLCQVsQ2aRazcgsZtqIz2kvUsXnFBUjSQfNTIvr4FB8jcuti8Q3jhUiVnB/1BAYc
 xdUlwI8xLHMKtIWS4s+Gmj7oO3ySUYwfllzDF1QLzVvbQAlL4ngASeB+T45CVUr4tNgqXKSlDKzlu
 6e02FzekhGY7p6LO1H64FI6LX20pJptyoyX0BRFVp5AYFtReoThMvyI3G9MEbnBptAblKkesTgfk3
 C9/4F8EQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJY3s-0045fg-IL; Tue, 09 Mar 2021 08:49:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D2D2F301A32;
 Tue,  9 Mar 2021 09:49:51 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BB6F22351CF0E; Tue,  9 Mar 2021 09:49:51 +0100 (CET)
Date: Tue, 9 Mar 2021 09:49:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 1/2] locking/rwsem: Add down_write_interruptible
Message-ID: <YEc2ry1h1qC3N2m9@hirez.programming.kicks-ass.net>
References: <20210308205456.1317366-1-zackr@vmware.com>
 <20210308205456.1317366-2-zackr@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308205456.1317366-2-zackr@vmware.com>
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
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 08, 2021 at 03:54:55PM -0500, Zack Rusin wrote:
> Add an interruptible version of down_write. It's the other
> side of the already implemented down_read_interruptible.
> It allows drivers which used custom locking code to
> support interruptible rw semaphores to switch over
> to rwsem.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

No SoB!

Assuning you actually wrote and and simply forgot to add it, the patch
does look ok, so:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
