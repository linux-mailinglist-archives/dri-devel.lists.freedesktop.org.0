Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A148E6D2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E7110E1E2;
	Fri, 14 Jan 2022 08:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6997410E1DB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=Ts8mzKwk5/uK6yCg9POuKH1Z+Ior51UZ/pOjZ1ex42E=; b=vV6oww0+UedLx1UdMHCHGpwcJ/
 Lv3kbhOiD0lFOP/drjoBFQPGhi2Ko3SjYBEqsj9/G3Gg4WrypIS6EGxoxtfPc47igYQWw7I6ust7u
 9nxp9fBnS0/2S/0/cKgzgKLzYTTF1TGWepMyWym8mIDY6iJZGqVrYKaDsju9VFVfSk8Kho2kKRiPT
 Gylyg3BgaS+Q4bz2omd3r0gKb7tq7Nb/Q2Z6E8rujgR0ZtGB0xeWAGxAvJVq1MBWWwmzTw+0WZk5X
 DRb47jaR3EZOsSmq/SYg7fYlOvrKHiiRCvKP+vINqN3wjsqxPa4QNJvzFw5WSO9EVQ/NSH096MnhG
 Sce35y9A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8IGO-005f1A-8o; Fri, 14 Jan 2022 08:48:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B916C3001E1;
 Fri, 14 Jan 2022 09:48:46 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A79DF266305C3; Fri, 14 Jan 2022 09:48:46 +0100 (CET)
Date: Fri, 14 Jan 2022 09:48:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] locking/rwsem: drop redundant semicolon of
 down_write_nest_lock
Message-ID: <YeE47hmP5xDZIYOl@hirez.programming.kicks-ass.net>
References: <20220114083742.6219-1-guchun.chen@amd.com>
 <33e93f72-0d5a-b624-f58e-c35155bbda1e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33e93f72-0d5a-b624-f58e-c35155bbda1e@amd.com>
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
Cc: Guchun Chen <guchun.chen@amd.com>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 mingo@redhat.com, longman@redhat.com, will@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 14, 2022 at 09:40:54AM +0100, Christian König wrote:
> Am 14.01.22 um 09:37 schrieb Guchun Chen:
> > Otherwise, braces are needed when using it.
> > 
> > Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>
> 
> Peter any objections that we push this upstream through the drm subsystem?

Nah, take it.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
