Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333D17CD8F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3046E17B;
	Sat,  7 Mar 2020 10:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 161726E84B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 09:51:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A96831B;
 Fri,  6 Mar 2020 01:51:37 -0800 (PST)
Received: from [192.168.1.161] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C01543F6C4;
 Fri,  6 Mar 2020 01:51:35 -0800 (PST)
Subject: Re: [PATCH] drm: komeda: Make rt_pm_ops dependent on CONFIG_PM
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>
References: <20200304145412.33936-1-vincenzo.frascino@arm.com>
 <20200305184255.GH364558@e110455-lin.cambridge.arm.com>
 <20200306041407.GA27096@jamwan02-TSP300>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <053abb02-cdeb-76f8-d651-88734a338010@arm.com>
Date: Fri, 6 Mar 2020 09:51:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200306041407.GA27096@jamwan02-TSP300>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: nd@arm.com, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiAzLzYvMjAgNDoxNCBBTSwgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDYsIDIwMjAgYXQgMDI6NDI6NTVBTSAr
MDgwMCwgTGl2aXUgRHVkYXUgd3JvdGU6Cj4+IE9uIFdlZCwgTWFyIDA0LCAyMDIwIGF0IDAyOjU0
OjEyUE0gKzAwMDAsIFZpbmNlbnpvIEZyYXNjaW5vIHdyb3RlOgo+Pj4ga29tZWRhX3J0X3BtX3N1
c3BlbmQoKSBhbmQga29tZWRhX3J0X3BtX3Jlc3VtZSgpIGFyZSBjb21waWxlZCBvbmx5IHdoZW4K
Pj4+IENPTkZJR19QTSBpcyBlbmFibGVkLiBIYXZpbmcgaXQgZGlzYWJsZWQgdHJpZ2dlcnMgdGhl
IGZvbGxvd2luZyB3YXJuaW5nCj4+PiBhdCBjb21waWxlIHRpbWU6Cj4+Pgo+Pj4gbGludXgvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmM6MTU2OjEyOgo+Pj4g
d2FybmluZzog4oCYa29tZWRhX3J0X3BtX3Jlc3VtZeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtZnVuY3Rpb25dCj4+PiAgc3RhdGljIGludCBrb21lZGFfcnRfcG1fcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikKPj4+ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPj4+
IGxpbnV4L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jOjE0
OToxMjoKPj4+IHdhcm5pbmc6IOKAmGtvbWVkYV9ydF9wbV9zdXNwZW5k4oCZIGRlZmluZWQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KPj4+ICBzdGF0aWMgaW50IGtvbWVkYV9ydF9w
bV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPj4+Cj4+PiBNYWtlIGtvbWVkYV9ydF9wbV9z
dXNwZW5kKCkgYW5kIGtvbWVkYV9ydF9wbV9yZXN1bWUoKSBkZXBlbmRlbnQgb24KPj4+IENPTkZJ
R19QTSB0byBhZGRyZXNzIHRoZSBpc3N1ZS4KPj4+Cj4+PiBDYzogIkphbWVzIChRaWFuKSBXYW5n
IiA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4+PiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1
ZGF1QGFybS5jb20+Cj4+PiBDYzogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBh
cm0uY29tPgo+Pj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPj4+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4+PiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgo+Pj4gU2lnbmVkLW9mZi1ieTogVmluY2Vuem8gRnJhc2Npbm8g
PHZpbmNlbnpvLmZyYXNjaW5vQGFybS5jb20+Cj4+Cj4gCj4gSGkgVmluY2Vuem86Cj4gCj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2guCj4gCj4gYW5kIFZpbmNlbnpvICYgTGl2aXUsIHNvcnJ5Cj4gCj4g
U2luY2UgdGhlcmUgaXMgYSBwYXRjaCBmb3IgdGhpcyBwcm9ibGVtIGFscmVhZHk6Cj4gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy83MTcyMS8KPiAKPiBBbmQgSSBoYXZl
IHB1c2hlZCB0aGF0IG9sZCBmaXggdG8gZHJtLW1pc2MtZml4ZXMganVzdCBiZWZvcmUgSSBzYXcK
PiB0aGlzIG1haWwuIHNvcnJ5Lgo+IAoKTm8gaXNzdWUsIGFzIGZhciBhcyBpdCBpcyBmaXhlZCA6
KSBJdCBpcyBhbm5veWluZyBzdGVwcGluZyBvbiBpdCBkdXJpbmcKcmFuZGNvbmZpZyA6KQoKVGhh
bmtzIGZvciBsZXR0aW5nIG1lIGtub3chCgpbLi4uXQoKLS0gClJlZ2FyZHMsClZpbmNlbnpvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
