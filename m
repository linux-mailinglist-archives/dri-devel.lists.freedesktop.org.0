Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4FE437F60
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 22:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B66E529;
	Fri, 22 Oct 2021 20:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DAA6E027;
 Fri, 22 Oct 2021 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=+lVnXP4L/xjopCY7F+iPyZIxE9scXC9YT+WrXjVhLK8=; b=IlPh6IKUYOtRL3+sWnXyOLoPp7
 DFp0B4GxlovDXICqHVZd3s4/OnjqPJ0n1GuFAYDmf0ei7EZUR+BTWxebXOXscBpuo8WJCLyvXayxY
 OllTK7++fyC6OW+g2sPD29BLyKrgJQBC+ia3pIBPKXELu/fyex2MxszfedVcjYC2SALyLW2QH9l5L
 k27VVJecaQi9DvxwO9IoeCmrAQUEwBrtkq8CNXk+r9YSPaRT8oSJu6NW6aJ6y3SsaiaJKJjT5TxrN
 h1bJdoXiBF7y+Em9k/s5Qjj6j2R8hmv7/7oy56Vd7KpM955DB3Jb8zBk1oZA5MF3Lr3PNTdwAXeqW
 Ybe6WInQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me1De-00Bwwj-Mk; Fri, 22 Oct 2021 20:32:50 +0000
Subject: Re: linux-next: Tree for Oct 22
 (drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>
References: <20211022201533.6085b17f@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2cef7eff-e594-db38-176a-c017c8610b6a@infradead.org>
Date: Fri, 22 Oct 2021 13:32:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022201533.6085b17f@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10/22/21 2:15 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20211021:
> 

on x86_64:

../drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c: In function ‘i915_gem_object_get_pages_dmabuf’:
../drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:248:3: error: implicit declaration of function ‘wbinvd_on_all_cpus’; did you mean ‘wrmsr_on_cpus’? [-Werror=implicit-function-declaration]
    wbinvd_on_all_cpus();
    ^~~~~~~~~~~~~~~~~~
    wrmsr_on_cpus


-- 
~Randy
