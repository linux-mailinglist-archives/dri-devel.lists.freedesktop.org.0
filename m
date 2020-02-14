Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64A15DB0F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 16:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B349C6E821;
	Fri, 14 Feb 2020 15:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 088686E821;
 Fri, 14 Feb 2020 15:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id C35892A6046;
 Fri, 14 Feb 2020 16:36:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id hkjvpc2T5O5o; Fri, 14 Feb 2020 16:36:19 +0100 (CET)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 2BE0F2A6045;
 Fri, 14 Feb 2020 16:36:19 +0100 (CET)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1j2d0r-000ACQ-Qm; Fri, 14 Feb 2020 16:36:17 +0100
Subject: Re: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20200214054706.33870-1-natechancellor@gmail.com>
 <87v9o965gg.fsf@intel.com>
 <158166913989.4660.10674824117292988120@skylake-alporthouse-com>
 <87o8u1wfqs.fsf@intel.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <ff302c03-d012-a80d-b818-b7feababb86b@daenzer.net>
Date: Fri, 14 Feb 2020 16:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <87o8u1wfqs.fsf@intel.com>
Content-Language: en-CA
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
Cc: clang-built-linux@googlegroups.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wMi0xNCAxMjo0OSBwLm0uLCBKYW5pIE5pa3VsYSB3cm90ZToKPiBPbiBGcmksIDE0
IEZlYiAyMDIwLCBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6
Cj4+IFF1b3RpbmcgSmFuaSBOaWt1bGEgKDIwMjAtMDItMTQgMDY6MzY6MTUpCj4+PiBPbiBUaHUs
IDEzIEZlYiAyMDIwLCBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwuY29t
PiB3cm90ZToKPj4+PiBBIHJlY2VudCBjb21taXQgaW4gY2xhbmcgYWRkZWQgLVd0YXV0b2xvZ2lj
YWwtY29tcGFyZSB0byAtV2FsbCwgd2hpY2ggaXMKPj4+PiBlbmFibGVkIGZvciBpOTE1IGFmdGVy
IC1XdGF1dG9sb2dpY2FsLWNvbXBhcmUgaXMgZGlzYWJsZWQgZm9yIHRoZSByZXN0Cj4+Pj4gb2Yg
dGhlIGtlcm5lbCBzbyB3ZSBzZWUgdGhlIGZvbGxvd2luZyB3YXJuaW5nIG9uIHg4Nl82NDoKPj4+
Pgo+Pj4+ICAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5j
OjE0MzM6MjI6IHdhcm5pbmc6Cj4+Pj4gIHJlc3VsdCBvZiBjb21wYXJpc29uIG9mIGNvbnN0YW50
IDU3NjQ2MDc1MjMwMzQyMzQ4NyB3aXRoIGV4cHJlc3Npb24gb2YKPj4+PiAgdHlwZSAndW5zaWdu
ZWQgaW50JyBpcyBhbHdheXMgZmFsc2UKPj4+PiAgWy1XdGF1dG9sb2dpY2FsLWNvbnN0YW50LW91
dC1vZi1yYW5nZS1jb21wYXJlXQo+Pj4+ICAgICAgICAgIGlmICh1bmxpa2VseShyZW1haW4gPiBO
X1JFTE9DKFVMT05HX01BWCkpKQo+Pj4+ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5efn5+
fn5+fn5+fn5+fn5+fn5+fn4KPj4+PiAgLi4vaW5jbHVkZS9saW51eC9jb21waWxlci5oOjc4OjQy
OiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICd1bmxpa2VseScKPj4+PiAgIyBkZWZpbmUgdW5s
aWtlbHkoeCkgICAgX19idWlsdGluX2V4cGVjdCghISh4KSwgMCkKPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4+PiAgMSB3YXJuaW5nIGdlbmVyYXRl
ZC4KPj4+Pgo+Pj4+IEl0IGlzIG5vdCB3cm9uZyBpbiB0aGUgY2FzZSB3aGVyZSBVTE9OR19NQVgg
PiBVSU5UX01BWCBidXQgaXQgZG9lcyBub3QKPj4+PiBhY2NvdW50IGZvciB0aGUgY2FzZSB3aGVy
ZSB0aGlzIGZpbGUgaXMgYnVpbHQgZm9yIDMyLWJpdCB4ODYsIHdoZXJlCj4+Pj4gVUxPTkdfTUFY
ID09IFVJTlRfTUFYIGFuZCB0aGlzIGNoZWNrIGlzIHN0aWxsIHJlbGV2YW50Lgo+Pj4+Cj4+Pj4g
Q2FzdCByZW1haW4gdG8gdW5zaWduZWQgbG9uZywgd2hpY2gga2VlcHMgdGhlIGdlbmVyYXRlZCBj
b2RlIHRoZSBzYW1lCj4+Pj4gKHZlcmlmaWVkIHdpdGggY2xhbmctMTEgb24geDg2XzY0IGFuZCBH
Q0MgOS4yLjAgb24geDg2IGFuZCB4ODZfNjQpIGFuZAo+Pj4+IHRoZSB3YXJuaW5nIGlzIHNpbGVu
Y2VkIHNvIHdlIGNhbiBjYXRjaCBtb3JlIHBvdGVudGlhbCBpc3N1ZXMgaW4gdGhlCj4+Pj4gZnV0
dXJlLgo+Pj4+Cj4+Pj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9s
aW51eC9pc3N1ZXMvNzc4Cj4+Pj4gU3VnZ2VzdGVkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWljaGVs
QGRhZW56ZXIubmV0Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRl
Y2hhbmNlbGxvckBnbWFpbC5jb20+Cj4+Pgo+Pj4gV29ya3MgZm9yIG1lIGFzIGEgd29ya2Fyb3Vu
ZCwKPj4KPj4gQnV0IHRoZSB3aG9sZSBwb2ludCB3YXMgdGhhdCB0aGUgY29tcGlsZXIgY291bGQg
c2VlIHRoYXQgaXQgd2FzCj4+IGltcG9zc2libGUgYW5kIG5vdCBlbWl0IHRoZSBjb2RlLiBEb2Vz
bid0IHRoaXMgYnJlYWsgdGhhdD8KPiAKPiBJdCBzZWVtcyB0aGF0IGdvYWwgYW5kIHRoZSB3YXJu
aW5nIGFyZSBmdW5kYW1lbnRhbGx5IGluY29tcGF0aWJsZS4KCk5vdCByZWFsbHk6CgogICAgaWYg
KHNpemVvZihyZW1haW4pID49IHNpemVvZih1bnNpZ25lZCBsb25nKSAmJgoJdW5saWtlbHkocmVt
YWluID4gTl9SRUxPQyhVTE9OR19NQVgpKSkKICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoK
SW4gY29udHJhc3QgdG8gdGhlIGNhc3QsIHRoaXMgZG9lc24ndCBnZW5lcmF0ZSBhbnkgbWFjaGlu
ZSBjb2RlIG9uIDY0LWJpdDoKCmh0dHBzOi8vZ29kYm9sdC5vcmcvei9HbVVFNFMKCmJ1dCBzdGls
bCBnZW5lcmF0ZXMgdGhlIHNhbWUgY29kZSBvbiAzMi1iaXQ6CgpodHRwczovL2dvZGJvbHQub3Jn
L3ovaEFvejhMCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFz
dCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
