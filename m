Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C361A90E
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 20:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210BC896A3;
	Sat, 11 May 2019 18:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF766E7B4;
 Fri, 10 May 2019 18:01:08 +0000 (UTC)
Received: from [222.129.46.90] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <aaron.ma@canonical.com>)
 id 1hP9pR-0003IV-LD; Fri, 10 May 2019 18:01:05 +0000
Subject: Re: [PATCH] Revert "vgaarb: Keep adding VGA device in queue"
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <20190510142958.28017-1-alexander.deucher@amd.com>
 <20190510154208.GL17751@phenom.ffwll.local>
 <58ea5dae-be17-af97-0066-48feab80497e@daenzer.net>
From: Aaron Ma <aaron.ma@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=aaron.ma@canonical.com; prefer-encrypt=mutual; keydata=
 mQENBFffeLkBCACi4eE4dPsgWN6B9UDOVcAvb5QgU/hRG6yS0I1lGKQv4KA+bke0c5g8clbO
 9gIlIl2bityfA9NzBsDik4Iei3AxMbFyxv9keMwcOFQBIOZF0P3f05qjxftF8P+yp9QTV4hp
 BkFzsXzWRgXN3r8hU8wqZybepF4B1C83sm2kQ5A5N0AUGbZli9i2G+/VscG9sWfLy8T7f4YW
 MjmlijCjoV6k29vsmTWQPZ7EApNpvR5BnZQPmQWzkkr0lNXlsKcyLgefQtlwg6drK4fe4wz0
 ouBIHJEiXE1LWK1hUzkCUASra4WRwKk1Mv/NLLE/aJRqEvF2ukt3uVuM77RWfl7/H/v5ABEB
 AAG0IUFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPokBNwQTAQgAIQUCV994uQIb
 AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDNxCzQfVU6ntJ9B/9aVy0+RkLqF9QpLmw+
 LAf1m3Fd+4ZarPTerqDqkLla3ekYhbrEtlI1mYuB5f+gtrIjmcW27gacHdslKB9YwaL8B4ZB
 GJKhcrntLg4YPzYUnXZkHHTv1hMw7fBYw82cBT+EbG0Djh6Po6Ihqyr3auHhfFcp1PZH4Mtq
 6hN5KaDZzF/go+tRF5e4bn61Nhdue7mrhFSlfkzLG2ehHWmRV+S91ksH81YDFnazK0sRINBx
 V1S8ts3WJ2f1AbgmnDlbK3c/AfI5YxnIHn/x2ZdXj1P/wn7DgZHmpMy5DMuk0gN34NLUPLA/
 cHeKoBAF8emugljiKecKBpMTLe8FrVOxbkrauQENBFffeLkBCACweKP3Wx+gK81+rOUpuQ00
 sCyKzdtMuXXJ7oL4GzYHbLfJq+F+UHpQbytVGTn3R5+Y61v41g2zTYZooaC+Hs1+ixf+buG2
 +2LZjPSELWPNzH9lsKNlCcEvu1XhyyHkBDbnFFHWlUlql3nSXMo//dOTG/XGKaEaZUxjCLUC
 8ehLc16DJDvdXsPwWhHrCH/4k92F6qQ14QigBMsl75jDTDJMEYgRYEBT1D/bwxdIeoN1BfIG
 mYgf059RrWax4SMiJtVDSUuDOpdwoEcZ0FWesRfbFrM+k/XKiIbjMZSvLunA4FIsOdWYOob4
 Hh0rsm1G+fBLYtT+bE26OWpQ/lSn4TdhABEBAAGJAR8EGAEIAAkFAlffeLkCGwwACgkQzcQs
 0H1VOp6p5Af/ap5EVuP1AhFdPD3pXLNrUUt72W3cuAOjXyss43qFC2YRjGfktrizsDjQU46g
 VKoD6EW9XUPgvYM+k8BJEoXDLhHWnCnMKlbHP3OImxzLRhF4kdlnLicz1zKRcessQatRpJgG
 NIiD+eFyh0CZcWBO1BB5rWikjO/idicHao2stFdaBmIeXvhT9Xp6XNFEmzOmfHps+kKpWshY
 9LDAU0ERBNsW4bekOCa/QxfqcbZYRjrVQvya0EhrPhq0bBpzkIL/7QSBMcdv6IajTlHnLARF
 nAIofCEKeEl7+ksiRapL5Nykcbt4dldE3sQWxIybC94SZ4inENKw6I8RNpigWm0R5w==
Message-ID: <1946afdf-f87f-c6bb-e492-be5c73707995@canonical.com>
Date: Sat, 11 May 2019 02:01:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <58ea5dae-be17-af97-0066-48feab80497e@daenzer.net>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 11 May 2019 18:22:57 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xMC8xOSAxMTo0NiBQTSwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IEdpdmVuIHRoYXQg
dGhlIGJ1ZyBpcyBhIGJpdCBhIG1lc3MgSSB0aGluayB3ZSBuZWVkIHRvIGFkZCBhIGJpdCBtb3Jl
Cj4+IGNvbnRleHQgaGVyZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIE15IHVuZGVyc3RhbmRpbmc6
Cj4+Cj4+IEdvYWwgb2YgdGhlIHJldmVydCBjb21taXQgd2FzIHRvIG1ha2UgdGhlIGludGVncmF0
ZWQgYm9vdCBkZXZpY2UgdGhlCj4+IHByaW1hcnkgb25lLCBpZiB3ZSBjYW4ndCBkZXRlY3Qgd2hp
Y2ggb25lIGlzIHRoZSBib290IGRldmljZSwgaW5zdGVhZCBvZgo+PiB0aGUgbGFzdCBvbmUuIFdo
aWNoIG1ha2VzIHNvbWUgc2Vuc2UuCj4+Cj4+IE5vdyBwZW9wbGUgaGF2ZSByZWxpZWQgb24gdGhl
IGtlcm5lbCBwaWNraW5nIHRoZSBsYXN0IG9uZSwgd2hpY2ggdXN1YWxseQo+PiBpcyBhbiBhZGQt
b24gY2FyZCwgYW5kIHRoZXJlZm9yZSBzaW1wbHkgcGx1Z2dpbmcgaW4gYW4gYWRkLW9uIGNhcmQg
YWxsb3dzCj4+IHRoZW0gdG8gb3ZlcndyaXRlIHRoZSBkZWZhdWx0IGNob2ljZS4gV2hpY2ggYWxz
byBtYWtlcyBzZW5zZSwgYW5kIHNpbmNlCj4+IGl0J3MgdGhlIG9sZGVyIGJlaGF2aW91ciwgd2lu
cy4KPj4KPj4gSSB0aGluayBpdCdkIGJlIGdvb2QgdG8gYWRkIGEgY29tbWVudCBoZXJlIHRoYXQg
dGhpcyBiZWhhdmlvdXIgaGFzIGJlY29tZQo+PiB1YXBpLCBlLmcuCj4+Cj4+IAkvKiBBZGQgYXQg
dGhlIGZyb250IHNvIHRoYXQgd2UgcGljayB0aGUgbGFzdCBkZXZpY2UgYXMgZmFsbGJhY2sKPj4g
CSAqIGRlZmF1bHQsIHdpdGggdGhlIHVzdWFsIHJlc3VsdCB0aGF0IHBsdWcgaW4gY2FyZHMgYXJl
IHByZWZlcnJlZAo+PiAJICogb3ZlciBpbnRlZ3JhdGVkIGdyYXBoaWNzLiAqLwo+Pgo+PiBXaXRo
IHRoYXQgKG9yIHNpbWlsYXIpIGFuZCBtb3JlIGNvbW1pdCBtZXNzYWdlIGNvbnRleHQ6Cj4gVGhl
IGJ1ZyByZXBvcnRlcidzIHN5c3RlbSBkb2Vzbid0IGhhdmUgaW50ZWdyYXRlZCBncmFwaGljcyB0
aG91Z2gsIGp1c3QKPiB0d28gcGx1Zy1pbiBjYXJkcy4gSXQncyBub3QgY2xlYXIgdG8gbWUgeWV0
IHRoYXQgdGhlaXIgZXhwZWN0YXRpb24gb2YKPiBYb3JnIHRvIHBpY2sgYW55IHBhcnRpY3VsYXIg
b25lIG9mIHRoZW0gd2l0aG91dCBjb25maWd1cmF0aW9uIHdhcyBqdXN0aWZpZWQuCgoKVGhpcyBj
b2RlIGlzIGtpbmQgb2YgZmFpbCBzYWZlLgoKV2hlbiBpbiBoeWJyaWQgZ3JhcGhpYyBtb2RlLgpJ
dCBzaG91bGQgZmFsbGJhY2sgdG8gaW50ZWdyYXRlZCBHUFUsIHdoaWNoIHNob3VsZCBhbHdheXMg
YmUgcHJpbWFyeSBmYi4KU28gcGlja2luZyAxc3QgKG1pbm9yIFBDSSBJRCBudW1iZXIpIEdQVSBz
aG91bGQgbWFrZSBtb3JlIHNlbnNlLgoKV2hlbiB3aXRoIG11bHRpcGxlIGQtR1BVcywgd2UgY2Fu
J3Qgc2F5IHdoaWNoIGNhcmQgc2hvdWxkIGJlIHRoZSByaWdodApvbmUgZm9yIHVzZXJzIHdoZW4g
bm8gWG9yZyBjb25mIHNldC4KVXN1YWxseSBCSU9TIHdpbGwgc2V0IHRoZSAxc3QgKG1pbm9yIFBD
SSBJRCBudW1iZXIpIGQtR1BVIGFzIHByaW1hcnkuClNvIGFsaWduaW5nIHdpdGggQklPUyBzZXR0
aW5nIHdpbGwgYmUgYmV0dGVyIEkgdGhpbmsuCgpBYXJvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
