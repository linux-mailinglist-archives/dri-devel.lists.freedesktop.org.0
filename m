Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192859AB74
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 11:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA566EC48;
	Fri, 23 Aug 2019 09:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF3146EC48
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 09:37:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C295337;
 Fri, 23 Aug 2019 02:37:03 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 886B83F246;
 Fri, 23 Aug 2019 02:37:02 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Add missing check for pfdev->regulator
To: Rob Herring <robh@kernel.org>
References: <20190822091512.GA32661@mwanda>
 <20190822093218.26014-1-steven.price@arm.com>
 <CAL_Jsq+1-qUxF3FSocVis6h4HV-=qnzWfK13hDq+Ns9kNEZuUg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f6800b5c-0b43-e326-b435-5d626c99cc4b@arm.com>
Date: Fri, 23 Aug 2019 10:37:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+1-qUxF3FSocVis6h4HV-=qnzWfK13hDq+Ns9kNEZuUg@mail.gmail.com>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDgvMjAxOSAwMjo1MiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBBdWcgMjIs
IDIwMTkgYXQgNDozMiBBTSBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPiB3cm90
ZToKPj4KPj4gV2hlbiBtb2RpZnlpbmcgcGFuZnJvc3RfZGV2ZnJlcV90YXJnZXQoKSB0byBzdXBw
b3J0IGEgZGV2aWNlIHdpdGhvdXQgYQo+PiByZWd1bGF0b3IgZGVmaW5lZCBJIG1pc3NlZCB0aGUg
Y2hlY2sgb24gdGhlIGVycm9yIHBhdGguIExldCdzIGFkZCBpdC4KPj4KPj4gUmVwb3J0ZWQtYnk6
IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPj4gRml4ZXM6IGUyMWRk
MjkwODgxYiAoImRybS9wYW5mcm9zdDogRW5hYmxlIGRldmZyZXEgdG8gd29yayB3aXRob3V0IHJl
Z3VsYXRvciIpCj4+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFy
bS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZy
ZXEuYyB8IDYgKysrKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IExvb2tzIGZpbmUgdG8gbWUsIGJ1dCBzZWVtcyB0byBiZSBkZWxheWVk
IGdldHRpbmcgdG8gdGhlIGxpc3QgYW5kCj4gcGF0Y2h3b3JrLiBJJ20gZ3Vlc3NpbmcgeW91J3Jl
IG5vdCBzdWJzY3JpYmVkIHRvIGRyaS1kZXZlbCBiZWNhdXNlIGFsbAo+IHlvdXIgcGF0Y2hlcyBz
ZWVtIHRvIGdldCBkZWxheWVkLgoKQWgsIHllcyBJJ20gc3Vic2NyaWJlZCB3aXRoIGEgZGlmZmVy
ZW50IGVtYWlsIGFkZHJlc3MgLSBob3BlZnVsbHkgbm93CmFsc28gc3Vic2NyaWJlZCB3aXRoIG15
IEBhcm0uY29tIG9uZS4KClN0ZXZlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
