Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8E4D2122
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484AF6EA9A;
	Thu, 10 Oct 2019 06:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB036E994
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 21:33:23 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.116]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGhyc-1iMBCX2fVS-00DmkC; Wed, 09
 Oct 2019 23:33:11 +0200
Subject: Re: [PATCH] Revert "ARM: bcm283x: Switch V3D over to using the PM
 driver instead of firmware."
To: Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 boris.brezillon@bootlin.com
References: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
 <26e101ad-8b5b-edef-4437-778bc57ae81f@gmail.com>
From: Stefan Wahren <wahrenst@gmx.net>
Message-ID: <077547f9-e0ec-29a6-6264-0281dac6b8c8@gmx.net>
Date: Wed, 9 Oct 2019 23:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <26e101ad-8b5b-edef-4437-778bc57ae81f@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:govPV+znmuOpD6OdXdLpDlZkMHQS/50KdDZvWzHbC5pNOX9Oytu
 L+lJFeLj1LA262nWfNlI/xYOdnB2S77+oBBkeOLzS0w1FVZsYBc+GwMJxVJZt4DdOuSDqJf
 Exni2pWqSTubW46kw2lwGjRIu4rcp9ObgL1HVfhdlgf7Q6dBeJYHXwKg8ZQAxacyJNYpD9I
 AFm2ipzALuW2J/FgxuXGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BUhUngg8Tm8=:Q6+z5pKzRcXVpe420A6dwf
 9kNjKti++ZMv/uviufVwOXvkl/po7it5pdR8xNA6R1Tp8m1tQfHx0grSEHeMm71DS7WpjJyzw
 LRStrUU59wSWwEdfZ3IRbSEPmqsYIjt1BVRFlV0ADWyQmVUptysh2iyjPHhtA0M1XVZ8a6FIs
 BsJ0pa0qwySGei1AQw9c/67FrKW7ir/N0h7/gKngawYhv8hoTpSDEmIkJL9BEHph1GZFHOT95
 jT4X+Ff1ItCRwu4fK1mQXoC+16MpHNHMbW/6kd8dieKQXPVy66nQjJ66W1gWZNPCIjhOhMdrA
 dRf7KSHsvxZU3o+gTewBrxx+lHV9PDQdwj379MRsRE5WNY8L5OgDPe9Kk6V1zwJjSvLXinifx
 MllszqpIhkGY0KIlKJit07107OqPy0gcobEb+J1yxUGM7sZBJ0bpc8jOiHEApqffwLrJFMkvZ
 OIRkhK634F0jMM+++OFU/PTjdM8upZL+ldl5M4pUWTBRx1DN6Qp/+RNJVbrwdFgAIsZiFAPz5
 puup0fVWnFfW0S746zRJg74oZ3FtRPNqKYjZaL2BAn6yXFk51K9IXtBGP9NnVY3/2ggl+l4o2
 1HIkFLfvSDG8UN2+14qwoTo2urRmfdMXeIhJHmlHabW8gfK24FcOVMbylcrKfOmBGf9zH851u
 DsJzvhs+LqYUjAaRMcKQB0ltCmfGFpARIjiMPuOb4Eit1sfRnmQNqoG4Yn8ACQo+Tacon2pDh
 vaQ5YhHG+Gx/Hrj9uY/zhe3TNg1tp7ev8EPKfshKzw3Ik69p7NyEdTey4i4+g3uExCaM53q7G
 uibZNf/fruMx3ILGJ6EJY5X6pRN9rPBlk7i4dXLyeiJRMLuDJXOsMg+tw2K5oMWY0OQLk3Fha
 2EHcvP9jvnvLfefPB/nf7hoIsScROxmOvGLgd972b59ibxafaMuyvK3PihTIigEjW+DlT9fc8
 +22PWRaEx/y4DOjj5SEhSiDYk9bZSQf8SzMiAg/nLXMhHBJF2On3Qw7YwV6dO5aDEUlKpuwpC
 45XdjN3b8a95y30nsz9sQWvXcsTv5RfMMvnL0jATNzi7KJEY1bXgmtOCiBBXqdMOKGfXkAz/n
 U7IYEV1cPXIWCUqknDvIBwKQE3ipdAIJ4uNPiHrj0FRaaFdnvkhiSVnu1ost4TY8ZLf2b5N1E
 2LwA5sB7/EuTvC1CGe/3AJjXzd2RwL9bnHmWBeTdxnDUmIKKAPAklCUaOIb6Te9qk74RMU55Y
 OQQPRsukBhSz6DTujKZusbY7EiskSwF2qErGMwP9bhANv5siDAfFgB8Zobbg=
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1570656791;
 bh=N6lgOy6mySWA02l0xeVs/vxnnGNoWkpNhTKBfor5tx4=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=PAjqOAGgdNSfmbwL4CpATg3VcDexGgoC666Qs4blwm0yhN3YfmCtnwxnwqWKkyWSD
 aOyhUV75+7JuJuatB4WmDYAWLhf0xIy/15gnKWQYfYbj5Www64AhGO7FwNrb37v/iN
 Aq3g1IHFxOPkSJRdqGxiKrMAO4ptl65zF4HCpjjg=
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
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmxvcmlhbiwKCkFtIDIzLjA5LjE5IHVtIDIwOjU2IHNjaHJpZWIgRmxvcmlhbiBGYWluZWxs
aToKPgo+IE9uIDkvOC8yMDE5IDg6NDQgQU0sIFN0ZWZhbiBXYWhyZW4gd3JvdGU6Cj4+IFNpbmNl
IHJlbGVhc2Ugb2YgdGhlIG5ldyBCQ00yODM1IFBNIGRyaXZlciB0aGVyZSBoYXMgYmVlbiBzZXZl
cmFsIHJlcG9ydHMKPj4gb2YgVjNEIHByb2JpbmcgaXNzdWVzLiBUaGlzIGlzIGNhdXNlZCBieSB0
aW1lb3V0cyBkdXJpbmcgcG93ZXJpbmctdXAgdGhlCj4+IEdSQUZYIFBNIGRvbWFpbjoKPj4KPj4g
ICBiY20yODM1LXBvd2VyOiBUaW1lb3V0IHdhaXRpbmcgZm9yIGdyYWZ4IHBvd2VyIE9LCj4+Cj4+
IEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgcmVsaWFibGUgb24gbXkgUmFzcGJlcnJ5IFBp
IDNCKyBhZnRlciBzZXR0aW5nCj4+IGZvcmNlX3R1cmJvPTEgaW4gdGhlIGZpcm13YXJlIGNvbmZp
Z3VyYXRpb24uIFNpbmNlIHRoZXJlIGFyZSBubyBpc3N1ZXMKPj4gdXNpbmcgdGhlIGZpcm13YXJl
IFBNIGRyaXZlciB3aXRoIHRoZSBzYW1lIHNldHVwLCB0aGVyZSBtdXN0IGJlIGFuIGlzc3VlCj4+
IGluIHRoZSBCQ00yODM1IFBNIGRyaXZlci4KPj4KPj4gVW5mb3J0dW5hdGVseSB0aGVyZSBoYXNu
J3QgYmVlbiBtdWNoIHByb2dyZXNzIGluIGlkZW50aWZ5aW5nIHRoZSByb290IGNhdXNlCj4+IHNp
bmNlIEp1bmUgKG1vc3RseSBpbiB0aGUgbGFjayBvZiBkb2N1bWVudGF0aW9uKSwgc28gaSBkZWNp
ZGVkIHRvIHN3aXRjaAo+PiBiYWNrIHVudGlsIHRoZSBpc3N1ZSBpbiB0aGUgQkNNMjgzNSBQTSBk
cml2ZXIgaXMgZml4ZWQuCj4+Cj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlw
aS9saW51eC9pc3N1ZXMvMzA0Ngo+PiBGaXhlczogZTFkYzJiMmUxYmVmICgiIEFSTTogYmNtMjgz
eDogU3dpdGNoIFYzRCBvdmVyIHRvIHVzaW5nIHRoZSBQTSBkcml2ZXIgaW5zdGVhZCBvZiBmaXJt
d2FyZS4iKQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW4gV2FocmVuIDx3YWhyZW5zdEBnbXgubmV0Pgo+IEFwcGxpZWQgdG8gZGV2aWNldHJlZS9m
aXhlcywgdGhhbmtzIQoKaSBub3RpY2VkIHRoYXQgWCBoYW5ncyB3aXRoIHJlY2VudCBSYXNwYmlh
biBhbmQgTGludXggNS40LXJjMiBhZnRlciB0aGlzCnJldmVydCBoYXMgYmVlbiBhcHBsaWVkLgoK
SXMgdGhlcmUgYSBjaGFuY2UgdG8gZHJvcCB0aGUgcmV2ZXJ0PwoKU3RlZmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
