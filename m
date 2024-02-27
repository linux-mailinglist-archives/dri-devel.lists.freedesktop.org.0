Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FB86857D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 02:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98EE10F0ED;
	Tue, 27 Feb 2024 01:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="W3B52p5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1210E070;
 Tue, 27 Feb 2024 01:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=RVftSLZVJrorIFus3RabCSPKATUQtwl5EIiqBrEipvw=; b=W3B52p5rkWx27A4Lch5cd/W3XE
 CQzIIB0ZeiYi3nNcKYxtf7lSJz75VbIih+2o2567cQH38ClJ82qNVUhPaiqInGBX3FSogPuWcHDoz
 yTCc70jLDRXyxHPghUARld7Eampuhrruh5ZlEsZkO9KJ+DDYYXHsND0hN6vl992YJdvzOS+NZhcQr
 e2HFkWFyZGf2hgGB+MTcBy9K14+qB0zxLQKn34kmdnSedR0jXmjTT66z+9B1In8Ky0pCorJxYDy2C
 McNS5v/m+hqQigS5j2uQNlyCdr30L16vVbAJwbEIkpzTnaHGctBOi4qFdcXSfiR7pjJOt9vkE8aHY
 Bnxcn6qw==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1relt6-00000003CmL-1pZM; Tue, 27 Feb 2024 01:04:04 +0000
Message-ID: <ca59236d-4f5c-4605-b443-8f62d71da643@infradead.org>
Date: Mon, 26 Feb 2024 17:04:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Feb 26 (drivers/gpu/drm/xe)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240226175509.37fa57da@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240226175509.37fa57da@canb.auug.org.au>
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



On 2/25/24 22:55, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20240223:
> 

on powerpc32 or i386:

../drivers/gpu/drm/xe/xe_ggtt.c: In function 'xe_ggtt_set_pte':
../drivers/gpu/drm/xe/xe_ggtt.c:78:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
   78 |         writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
      |         ^~~~~~
      |         writel


-- 
#Randy
