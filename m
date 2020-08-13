Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6870B243C46
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 17:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBBB6EA0B;
	Thu, 13 Aug 2020 15:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C616E20B;
 Thu, 13 Aug 2020 15:13:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BA67ACF9;
 Thu, 13 Aug 2020 15:13:50 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20200813062113.11030-1-andr2000@gmail.com>
 <366f5998-4346-6140-b133-23c9abef6589@suse.com>
 <5a71bca8-df90-a239-6a5e-cbc9af30771e@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2b7568cd-a3e6-a672-e9c4-3e58eecde43b@suse.com>
Date: Thu, 13 Aug 2020 17:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5a71bca8-df90-a239-6a5e-cbc9af30771e@epam.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMuMDguMjAgMTc6MTAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+IAo+IE9u
IDgvMTMvMjAgNjowMiBQTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMTMuMDguMjAgMDg6
MjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4gRnJvbTogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pgo+PiBTZXJp
ZXMgcHVzaGVkIHRvOgo+Pgo+PiB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS45Cj4+Cj4gVGhlIHRv
cCBwYXRjaCBoYXMgc3RyYW5nZSB0aXRsZSB0aG91Z2g6Cj4gCj4gIlN1YmplY3Q6IFtQQVRDSCB2
MiA1LzVdIGRybS94ZW4tZnJvbnQ6IFBhc3MgZHVtYiBidWZmZXIgZGF0YSBvZmZzZXQgdG8gdGhl
IGJhY2tlbmQiCgpPaCwgaW5kZWVkLiBJIGhhZCB0byByZXBhaXIgaXQgbWFudWFsbHkgYXMgaXQg
c2VlbXMgc29tZSBtYWlsIHN5c3RlbQoocHJvYmFibHkgb24gbXkgZW5kKSBtYW5nbGVkIGl0IGEg
bGl0dGxlIGJpdC4KCldpbGwgcmVwYWlyIGl0LgoKCkp1ZXJnZW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
