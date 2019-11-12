Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13266F95EF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 17:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8196EB74;
	Tue, 12 Nov 2019 16:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D4CA6EB74;
 Tue, 12 Nov 2019 16:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id E45422A6046;
 Tue, 12 Nov 2019 17:45:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id IU3ZG7YC6ovU; Tue, 12 Nov 2019 17:45:17 +0100 (CET)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id DF2832A6045;
 Tue, 12 Nov 2019 17:45:16 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93-RC1)
 (envelope-from <michel@daenzer.net>)
 id 1iUZI3-0007oQ-QX; Tue, 12 Nov 2019 17:45:15 +0100
Subject: Re: [PATCH 1/2] drm: replace incorrect Compliance/Margin magic
 numbers with PCI_EXP_LNKCTL2 definitions
To: Bjorn Helgaas <helgaas@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20191111192932.36048-1-helgaas@kernel.org>
 <20191111192932.36048-2-helgaas@kernel.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <6d86246e-504a-b762-aff8-0449dd6f3d31@daenzer.net>
Date: Tue, 12 Nov 2019 17:45:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191111192932.36048-2-helgaas@kernel.org>
Content-Language: en-CA
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
Cc: Frederick Lawler <fred@fredlawl.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0xMSA4OjI5IHAubS4sIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4gRnJvbTogQmpv
cm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiAKPiBBZGQgZGVmaW5pdGlvbnMgZm9y
IHRoZXNlIFBDSWUgTGluayBDb250cm9sIDIgcmVnaXN0ZXIgZmllbGRzOgo+IAo+ICAgRW50ZXIg
Q29tcGxpYW5jZQo+ICAgVHJhbnNtaXQgTWFyZ2luCj4gCj4gYW5kIHVzZSB0aGVtIGluIGFtZGdw
dSBhbmQgcmFkZW9uLgo+IAo+IE5PVEU6IFRoaXMgaXMgYSBmdW5jdGlvbmFsIGNoYW5nZSBiZWNh
dXNlICI3IDw8IDkiIHdhcyBhcHBhcmVudGx5IGEgdHlwby4KPiBUaGF0IG1hc2sgaW5jbHVkZWQg
dGhlIGhpZ2ggb3JkZXIgYml0IG9mIFRyYW5zbWl0IE1hcmdpbiwgdGhlIEVudGVyCj4gTW9kaWZp
ZWQgQ29tcGxpYW5jZSBiaXQsIGFuZCB0aGUgQ29tcGxpYW5jZSBTT1MgYml0LCBidXQgSSB0aGlu
ayB3aGF0Cj4gd2FzIGludGVuZGVkIHdhcyB0aGUgMy1iaXQgVHJhbnNtaXQgTWFyZ2luIGZpZWxk
IGF0IGJpdHMgOTo3LgoKQ2FuIHlvdSBzcGxpdCBvdXQgdGhlIGZ1bmN0aW9uYWwgY2hhbmdlIGlu
dG8gYSBzZXBhcmF0ZSBwYXRjaCAxPyBUaGF0CmNvdWxkIG1ha2UgdGhpbmdzIGVhc2llciBmb3Ig
YW55b25lIHdobyBiaXNlY3RzIHRoZSBmdW5jdGlvbmFsIGNoYW5nZQpmb3Igd2hhdGV2ZXIgcmVh
c29uLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAg
ICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
