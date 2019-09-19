Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FEB8BF2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7D16F6E2;
	Fri, 20 Sep 2019 07:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1816F9EA;
 Thu, 19 Sep 2019 19:28:27 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::9a1f]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB26N-0000Nn-4V; Thu, 19 Sep 2019 19:28:27 +0000
Subject: Re: linux-next: Tree for Sep 19 (amdgpu)
To: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190919160641.GR3642@sirena.co.uk>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0323499e-9fbd-a707-9713-cb40cc92b6fc@infradead.org>
Date: Thu, 19 Sep 2019 12:28:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919160641.GR3642@sirena.co.uk>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQQcCpBlQ0ElB9UbM8suQ0So3al3Np/N814ZFWscUMI=; b=Wk3zRWzJ8RSrEtpxScZC+fOOQ
 wM9ZJVFYHrzS5HCyaWPiyW92Z8wxulYuW5oYW+HLcSwXFSWk29PfjOV6LlObtuXgTByozDV4syuUx
 ss+I6585YVxgQ6WDyfX8CUBl5yuK/WbTcJsP1lpcTEOs1TMH2UHwKtNgPZYlS6FxX/PvA10TJYJSQ
 UBGjnriTR04SGwqORjQ404dDdXBzArIbpLEq5I/bStNakkQ7ZuDOGVCG2tf4aYh/VSa+jR7QzgvHv
 7ckvVzCFE54QDQTNxF3nlxYv7KIZJdG5wHptPtiroHguLm5ydXVDrxU6jzutXRCUEkG22hCd01ciV
 2H6HaZTgA==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xOS8xOSA5OjA2IEFNLCBNYXJrIEJyb3duIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBDaGFu
Z2VzIHNpbmNlIDIwMTkwOTE4Ogo+IAoKCi4uL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4u
L2Rpc3BsYXkvZGMvZG1sL01ha2VmaWxlOjcwOiAqKiogbWlzc2luZyAnZW5kaWYnLiAgU3RvcC4K
CgotLSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
