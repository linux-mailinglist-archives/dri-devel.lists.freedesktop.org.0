Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B955D43357
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6252C892B6;
	Thu, 13 Jun 2019 07:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9648A89262
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 20:47:10 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbA9C-000305-2J; Wed, 12 Jun 2019 20:47:06 +0000
Subject: Re: linux-next: Tree for Jun 12 (amdgpu: dcn10_hw_sequencer)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190612170027.13dbb84b@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9b4f8e15-8f9f-51d9-c355-9c2e453921e3@infradead.org>
Date: Wed, 12 Jun 2019 13:47:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612170027.13dbb84b@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WWENblypPDMsQ59pJNiVEtFrFCNg58U3zxKaLpaFTQ=; b=PsNSMjSfNbFfdWphzo5pEuc16P
 tYmuUhf5z7/LnJHcCERNlRHBS/3tz7afG43iyyTQActU1unUuEQ9u6P6OGfY0ST3gNSD7BvT59hOQ
 YyN3NRp5tKaouLgMGOd1wHIg2HvhKTWy4cF5SYJjGXbt8RqV74RcNHwMBKpKLaf66ZkLHenXOvm8+
 7mIRuZKI97lrkqNh6LO6OSpCfrundVQEPBGV45cmQStWX1C9t+W7v5YTC0CnqY38K9t4SOOePFxxG
 KOlmRIYFAbz6mQcRp4LXOfOqjaryv/Lk+RBVUwf1qXxxE9NiSA3qp5byYyY3hu5zLsv0Z24pOeYrU
 TDGPQ/FQ==;
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMi8xOSAxMjowMCBBTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPiBIaSBhbGwsCj4g
Cj4gQ2hhbmdlcyBzaW5jZSAyMDE5MDYxMToKPiAKCm9uIHg4Nl82NDoKCi4uL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmM6
IEluIGZ1bmN0aW9uIOKAmGRjbjEwX2FwcGx5X2N0eF9mb3Jfc3VyZmFjZeKAmToKLi4vZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5j
ZXIuYzoyMzc4OjM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh1
ZGVsYXnigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgIHVkZWxh
eSh1bmRlcmZsb3dfY2hlY2tfZGVsYXlfdXMpOwogICBeCgoKCi0tIAp+UmFuZHkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
