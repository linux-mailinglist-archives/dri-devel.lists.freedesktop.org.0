Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FD2D4709
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 17:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF506EACE;
	Wed,  9 Dec 2020 16:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410186EACE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 16:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 92C743F53D;
 Wed,  9 Dec 2020 17:46:52 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=XRYM6GB9; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-lEucVEQ_UX; Wed,  9 Dec 2020 17:46:49 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 0DAE23F514;
 Wed,  9 Dec 2020 17:46:48 +0100 (CET)
Received: from [192.168.0.110] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7145D360128;
 Wed,  9 Dec 2020 17:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1607532408; bh=HbexbG86OkBvvGmbEdfHYmr8XP8iGgoMFLqDO2zgbyk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XRYM6GB9y5/cT0HRue4ypuwXMTRuFuCLiyRT6/IUtljPKHclvahqtiRZzvvfKaCEA
 izP/rtQtP05FIXDGQVEpbUag13fuVhjPDT7S4BTC5tiAOA43HezcTYdJuxJ9NBL9qj
 3fSDvqiB/BHE9J1lkBe5V+qt5wEDBdQ8C261v55A=
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
To: Jason Gunthorpe <jgg@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
Date: Wed, 9 Dec 2020 17:46:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201209163731.GU552508@nvidia.com>
Content-Language: en-US
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzkvMjAgNTozNyBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFdlZCwgRGVj
IDA5LCAyMDIwIGF0IDA1OjM2OjE2UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IEphc29uLCBDaHJpc3RpYW4KPj4KPj4gSW4gbW9zdCBpbXBsZW1lbnRhdGlvbnMg
b2YgdGhlIGNhbGxiYWNrIG1lbnRpb25lZCBpbiB0aGUgc3ViamVjdCB0aGVyZSdzIGEKPj4gZmVu
Y2Ugd2FpdC4KPj4gV2hhdCBleGFjdGx5IGlzIGl0IG5lZWRlZCBmb3I/Cj4gSW52YWxpZGF0ZSBt
dXN0IHN0b3AgRE1BIGJlZm9yZSByZXR1cm5pbmcsIHNvIHByZXN1bWFibHkgZHJpdmVycyB1c2lu
Zwo+IGEgZG1hIGZlbmNlIGFyZSByZWx5aW5nIG9uIGEgZG1hIGZlbmNlIG1lY2hhbmlzbSB0byBz
dG9wIERNQS4KClllcywgc28gZmFyIEkgZm9sbG93LCBidXQgd2hhdCdzIHRoZSByZWFzb24gZHJp
dmVycyBuZWVkIHRvIHN0b3AgRE1BPwoKSXMgaXQgZm9yIGludmxpZGF0aW9uIGJlZm9yZSBicmVh
a2luZyBDT1cgYWZ0ZXIgZm9yayBvciBzb21ldGhpbmcgcmVsYXRlZD8KClRoYW5rcywKClRob21h
cwoKPgo+IEphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
