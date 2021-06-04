Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C539B9DD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 15:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6F96E47A;
	Fri,  4 Jun 2021 13:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740116E47A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 13:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MavlaHcrXTsmTGjPtJGrWFVh4N2RPwLd0U0sgZUv9NQ=; b=KUeV773P7iwXExqW/c26s06Ek8
 26hm/T8cUdtDD3W1aKekCy61rT98aZ3LRe9dDcFV5bHZUPydNUGwwA8MXWCMwdBurq/vt06n+FJME
 feuZL6fz5haQmLawDIeCflpcuMwbEx8ZkeJoEp5ltBGr3FGCTtvqXgU/J0PHjkP15TYnj2z+qddeU
 2MK/9NLqGh6bcbrB+YJRZBB4I1Iy7ay5Nmkj8+tntWoOr16GTwnzOg5pqlKETVeVBAZzvAu57EmEF
 Kl80ntw4SySpF/RhPLCkydEV+fxj5batZqw3urPePQV/kSymibGmEUgV7akUSXYrnLctdfkgW42oF
 tHALoQCg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lp9vP-00DCTA-FW; Fri, 04 Jun 2021 13:31:52 +0000
Date: Fri, 4 Jun 2021 14:31:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Message-ID: <YLorQ3r4EH7aEvIV@casper.infradead.org>
References: <87v96tzujm.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v96tzujm.fsf@vitty.brq.redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, wei.liu@kernel.org,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 02:25:01PM +0200, Vitaly Kuznetsov wrote:
> Commit ccf953d8f3d6 ("fb_defio: Remove custom address_space_operations")
> seems to be breaking Hyper-V framebuffer

https://lore.kernel.org/linux-mm/YLZUrEjVJWBGGMxf@phenom.ffwll.local/
