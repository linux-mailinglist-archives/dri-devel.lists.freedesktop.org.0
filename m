Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D91DE4D4
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 12:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1C16E9BE;
	Fri, 22 May 2020 10:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E90C6E9BE;
 Fri, 22 May 2020 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 9A5F42A6048;
 Fri, 22 May 2020 12:49:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id JOk1slwn-S-B; Fri, 22 May 2020 12:49:11 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id C2F402A6046;
 Fri, 22 May 2020 12:49:10 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jc5Ej-000xcK-VK; Fri, 22 May 2020 12:49:09 +0200
Subject: Re: [RFC] Deprecate AGP GART support for Radeon/Nouveau/TTM
To: christian.koenig@amd.com, Alex Deucher <alexander.deucher@amd.com>
References: <20200513110313.12979-1-christian.koenig@amd.com>
 <9d784383-905e-59af-b17c-923c92474ece@gmail.com>
 <ea2dfaaa-a7ca-5e4a-9264-0a82f1d5ea9b@daenzer.net>
 <39241451-b25e-759f-6d52-455d806add09@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <b08c9f7d-ffa2-c9f9-6ccb-3ce40708cc84@daenzer.net>
Date: Fri, 22 May 2020 12:49:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <39241451-b25e-759f-6d52-455d806add09@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, debian-powerpc@lists.debian.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yMiAxMjo0MCBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDIw
LjA1LjIwIHVtIDE4OjI1IHNjaHJpZWIgTWljaGVsIETDpG56ZXI6Cj4+IE9uIDIwMjAtMDUtMjAg
NDo0MyBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4gQW0gMTMuMDUuMjAgdW0gMTM6
MDMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4+IFVuZm9ydHVuYXRlbHkgQUdQIGlzIHN0
aWxsIHRvIHdpZGVseSB1c2VkIGFzIHdlIGNvdWxkIGp1c3QgZHJvcAo+Pj4+IHN1cHBvcnQgZm9y
IHVzaW5nIGl0cyBHQVJULgo+Pj4+Cj4+Pj4gTm90IHVzaW5nIHRoZSBBR1AgR0FSVCBhbHNvIGRv
ZXNuJ3QgbWVhbiBhIGxvc3MgaW4gZnVuY3Rpb25hbGl0eSBzaW5jZQo+Pj4+IGRyaXZlcnMgd2ls
bCBqdXN0IGZhbGxiYWNrIHRvIHRoZSBkcml2ZXIgc3BlY2lmaWMgUENJIEdBUlQuCj4+Pj4KPj4+
PiBGb3Igbm93IGp1c3QgZGVwcmVjYXRlIHRoZSBjb2RlIGFuZCBkb24ndCBlbmFibGUgdGhlIEFH
UCBHQVJUIGluIFRUTQo+Pj4+IGV2ZW4gd2hlbiBnZW5lcmFsIEFHUCBzdXBwb3J0IGlzIGF2YWls
YWJsZS4KPj4+IFNvIEkndmUgdXNlZCBhbiBhbmNpZW50IHN5c3RlbSAoMzJiaXQpIHRvIHNldHVw
IGEgdGVzdCBib3ggZm9yIHRoaXMuCj4+Pgo+Pj4KPj4+IFRoZSBmaXJzdCBHUFUgSSBjb3VsZCB0
ZXN0IGlzIGFuIFJWMjgwIChSYWRlb24gOTIwMCBQUk8pIHdoaWNoIGlzIGVhc2lseQo+Pj4gMTUg
eWVhcnMgb2xkLgo+Pj4KPj4+IFdoYXQgaGFwcGVucyBpbiBBR1AgbW9kZSBpcyB0aGF0IGdseGdl
YXJzIHNob3dzIGFydGlmYWN0cyBkdXJpbmcKPj4+IHJlbmRlcmluZyBvbiB0aGlzIHN5c3RlbS4K
Pj4+Cj4+PiBJbiBQQ0kgbW9kZSB0aG9zZSByZW5kZXJpbmcgYXJ0aWZhY3RzIGFyZSBnb25lIGFu
ZCBnbHhnZWFycyBzZWVtcyB0bwo+Pj4gZHJhdyBldmVyeXRoaW5nIGNvcnJlY3RseSBub3cuCj4+
Pgo+Pj4gUGVyZm9ybWFuY2UgaXMgb2J2aW91c2x5IG5vdCBjb21wYXJhYmxlLCBjYXVzZSBpbiBB
R1Agd2UgZG9uJ3QgcmVuZGVyCj4+PiBhbGwgdHJpYW5nbGVzIGNvcnJlY3RseS4KPj4+Cj4+Pgo+
Pj4gVGhlIHNlY29uZCBHUFUgSSBjb3VsZCB0ZXN0IGlzIGFuIFJWNjMwIFBSTyAoUmFkZW9uIEhE
IDI2MDAgUFJPIEFHUCkKPj4+IHdoaWNoIGlzIG1vcmUgdGhhbiAxMCB5ZWFycyBvbGQuCj4+Pgo+
Pj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhpcyBvbmUgd29ya3MgaW4gYm90aCBBR1AgYW5kIFBD
SWUgbW9kZSBwZXJmZWN0bHkKPj4+IGZpbmUuCj4+Pgo+Pj4gU2luY2UgdGhpcyBpcyBvbmx5IGEg
MzJiaXQgc3lzdGVtIEkgY291bGRuJ3QgcmVhbGx5IHRlc3QgYW55IE9wZW5HTCBnYW1lCj4+PiB0
aGF0IHdlbGwuCj4+Pgo+Pj4gQnV0IGZvciBnbHhnZWFycyBzd2l0Y2hpbmcgZnJvbSBBR1AgdG8g
UENJZSBtb2RlIHNlZW1zIHRvIHJlc3VsdCBpbiBhCj4+PiByb3VnaGx5IDUlIHBlcmZvcm1hbmNl
IGRyb3AuCj4+Pgo+Pj4gVGhlIHN1cnByaXNpbmcgcmVhc29uIGZvciB0aGlzIGlzIG5vdCB0aGUg
YmV0dGVyIFRMQiBwZXJmb3JtYW5jZSwgYnV0Cj4+PiB0aGUgbGFjayBvZiBVU1dDIHN1cHBvcnQg
Zm9yIHRoZSBQQ0llIEdBUlQgaW4gcmFkZW9uLgo+PiBJIHN1c3BlY3QgdGhlIG1haW4gcmVhc29u
IGl0J3Mgb25seSA1JSBpcyB0aGF0IFBDSWUgR0FSVCBwYWdlIHRhYmxlcyBhcmUKPj4gc3RvcmVk
IGluIFZSQU0sIHNvIHRoZXkgZG9uJ3QgbmVlZCB0byBiZSBmZXRjaGVkIGFjcm9zcyB0aGUgUENJ
ZSBsaW5rCj4+IChhbmQgcHJlc3VtYWJseSBpdCBoYXMgbW9yZSB0aGFuIG9uZSBUTEIgZW50cnkg
YXMgd2VsbCkuIFRoZSBkaWZmZXJlbmNlCj4+IGlzIG11Y2ggYmlnZ2VyIHdpdGggbmF0aXZlIEFH
UCBBU0lDcyB3aXRoIFBDSSBHQVJULgo+IAo+IERvIHlvdSBoYXZlIHNvbWUgaGFyZHdhcmUgeW91
IGNvdWxkIGdpdmUgdGhhdCBhIHRyeSBvbj8KCkFzIEkgbWVudGlvbmVkIGJlZm9yZSwgSSB0ZXN0
ZWQgdGhpcyBtYW55IHRpbWVzIG9uIG15IEFHUCBQb3dlckJvb2tzCmJhY2sgaW4gdGhlIGRheS4g
VGhlIHJlc3VsdCB3YXMgYWx3YXlzIGEgc2ltaWxhciwgYmlnIGhpdCB3aXRoIFBDSSBHQVJUCnZz
IEFHUCAoZXZlbiBqdXN0IDF4KS4gSSBoYXZlbid0IHNlZW4gYW55IHJlYXNvbiB0byBiZWxpZXZl
IHRoaXMgaGFzCmNoYW5nZWQuCgoKPiBXaGlsZSBJIGFncmVlIHRoYXQgaXQgbWVhbnMgYSBwZXJm
b3JtYW5jZSByZWdyZXNzaW9uLCB0aGlzIGlzIGEgcmF0aGVyCj4gaGlnaCBtb3RpdmF0aW9uIHRv
IGdvIGFoZWFkIHdpdGggYXQgbGVhc3QgdGhlIGZpcnN0IHBhdGNoLgoKSSB0b3RhbGx5IGFncmVl
IHdpdGggdGhlIGJlbmVmaXRzLCBJIGp1c3Qgd2FudCBldmVyeW9uZSB0byBiZSBob25lc3QgYW5k
CmNsZWFyIGFib3V0IHRoZSBwZXJmb3JtYW5jZSBoaXQgd2l0aCBuYXRpdmUgQUdQIFJhZGVvbnMs
IHdoaWNoIGFscmVhZHkKaGF2ZSB2ZXJ5IHdlYWsgcGVyZm9ybWFuY2UgYnkgdG9kYXkncyBzdGFu
ZGFyZHMgZXZlbiB3aXRoIEFHUC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAg
ICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJyZSBzb2Z0d2Fy
ZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9w
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
