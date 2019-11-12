Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9BF94C2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 16:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CD96E0FF;
	Tue, 12 Nov 2019 15:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from blackstar.xs4all.nl (blackstar.xs4all.nl [83.163.96.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 423286E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:52:58 +0000 (UTC)
Received: from [192.168.3.139] (usg [192.168.3.254])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by blackstar.xs4all.nl (Postfix) with ESMTP id D83B83501F0;
 Tue, 12 Nov 2019 16:52:51 +0100 (CET)
Subject: Re: How to create a drm_display_mode for a new display
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <36fff77b-1e11-7faa-1c31-3fc719a4d354@blackstar.nl>
 <20191112150840.GP1208@intel.com>
From: Bas Vermeulen <bvermeul@blackstar.nl>
Message-ID: <203b2065-a7df-5663-1179-8e732da7af05@blackstar.nl>
Date: Tue, 12 Nov 2019 16:52:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112150840.GP1208@intel.com>
Content-Language: en-US
X-blackstar.nl-MailScanner-Information: Please contact the ISP for more
 information
X-blackstar.nl-MailScanner-ID: D83B83501F0.AD002
X-blackstar.nl-MailScanner: Found to be clean
X-blackstar.nl-MailScanner-From: bvermeul@blackstar.nl
X-Spam-Status: No
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTItMTEtMTkgMTY6MDgsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUdWUsIE5vdiAx
MiwgMjAxOSBhdCAwMzoxODoyMVBNICswMTAwLCBCYXMgVmVybWV1bGVuIHdyb3RlOgo+PiBIZWxs
bywKPj4KPj4gSSBhbSB0cnlpbmcgdG8gY3JlYXRlIGEgbmV3IGRpc3BsYXkgbW9kZSBmb3IgYSBu
ZXcgZGlzcGxheSBJIGhhdmUgdG8KPj4gc3VwcG9ydC4KPj4KPj4gSSBoYXZlIHRoZSBmb2xsb3dp
bmcgaW5mb3JtYXRpb246Cj4+Cj4+IERvdGNsb2NrIC0gZnJlcXVlbmN5IHBlcmlvZCAtIDEvVENM
UCAtIDg5LjYgTUh6Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBUQ0RQIC0gMTEsMTYgbnMKPj4KPj4gSHN5bmMgLSBQZXJpb2Qg
LSBUSCAtIDIwNDggZG90Y2xvY2ssIDQzLDc1IEtIeiwgMjIsODYgdXMKPj4gICDCoMKgwqDCoMKg
wqDCoCBQdWxzZSBXaWR0aCAtIFRIcCAtIDQwIGRvdGNsb2NrLCAwLDQ1IHVzIC0gYWN0aXZlIGxv
dywgc3luYwo+PiBwdWxzZSBoaWdoLCBwb2xhcml0eSsKPj4KPj4gVnN5bmMgLSBQZXJpb2QgLSBU
ViAtIDcyOSBkb3RjbG9jaywgNjAgSHosIDE2LDY2IG1zCj4+ICAgwqDCoMKgwqDCoMKgwqAgUHVs
c2UgV2lkdGggLSBUVnAgLSAyIGxpbmUsIDQ1LDcyIHVzIC0gYWN0aXZlIGxvdywgc3luYyBwdWxz
ZQo+PiBoaWdoLCBwb2xhcml0eSsKPj4KPj4gRW5hYmxlIC0gUHVsc2UgV2lkdGggLSBUSGQgLSAx
OTIwIGRvdGNsb2NrCj4+Cj4+IFYgRGlzcGxheSAtIFRlcm0gLSBUVmQgLSA3MjAgbGluZQo+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU3RhcnQgLSBURmQgLSA1IGxpbmUKPj4KPj4gUGhhc2Ug
LSBIc3luYy1FbmFibGUgLSBUSGUgLSA4OCBkb3RjbG9jawo+PiAgIMKgwqDCoMKgwqDCoMKgIEhz
eW5jLVZzeW5jIC0gVFZoIC0gMCBkb3RjbG9jawo+IFlvdSBkb24ndCBoYXBwZW4gdG8gaGF2ZSBh
biBhY3R1YWwgdGltaW5nIGRpYWdyYW0gdG8gZ28gYWxvbmcgd2l0aAo+IHRob3NlPwoKClVuZm9y
dHVuYXRlbHkgSSBkb24ndC4gSSdtIGN1cnJlbnRseSB0cnlpbmcgdG8gZ2V0IGl0LgoKCj4+IEkg
bWFkZSB0aGUgZm9sbG93aW5nIGRybV9kaXNwbGF5X21vZGUgb3V0IG9mIGl0Ogo+Pgo+PiB7IERS
TV9NT0RFKCIxOTIweDcyMCIsIERSTV9NT0RFX1RZUEVfRFJJVkVSLCA4OTYwMCwgMTkyMCwgMTky
MCwKPj4gICDCoMKgwqDCoMKgwqDCoMKgIDE5NjAsIDIwNDgsIDAsIDcyMCwgNzIyLCA3MjQsIDcy
OSwgMCwKPiBUaGUgemVybyBsZW5ndGggaG9yaXpvbnRhbCBmcm9udCBwb3JjaCBpcyBwZXJoYXBz
IGEgYml0IG9kZCwKPiBidXQgbG9va3MgbGlrZSBpdCBjb3VsZCBiZSBjb3JyZWN0IGdpdmVuIFRI
cD09NDAgYW5kIFRIZT09ODguCj4KPiBBbHNvIG5vdCBzdXJlIGFib3V0IHRoZSB0aGUgdmVydGlj
YWwgZnJvbnQgdnMuIGJhY2sgcG9yY2guCj4gTWF5YmUgdHJ5IHN3YXBwaW5nIHRob3NlIGFyb3Vu
ZD8KClRoYW5rcyBmb3IgdGhlIGhpbnQsIEknbGwgdHJ5IHRoYXQuCgo+PiAgIMKgwqDCoMKgwqDC
oMKgwqAgRFJNX01PREVfRkxBR19OSFNZTkMgfCBEUk1fTU9ERV9GTEFHX05WU1lOQyksCj4gTm90
IHN1cmUgdGhvc2UgYXJlIGNvcnJlY3QuIEl0IGRvZXMgc2F5cyAiYWN0aXZlIGxvdyIgYnV0IHRo
ZW4gaXQgaGFzCj4gdGhhdCAic3luYyBwdWxzZSBoaWdoLCBwb2xhcml0eSsiIHN0dWZmIGFzIHdl
bGwuIENvbmZ1c2luZy4gQ291bGQKPiBiZSB3b3J0aCBhIHNob3QgdG8gdHJ5IGZsaXBwaW5nIHRo
ZXNlLgoKSSdsbCB0cnkgZmxpcHBpbmcgdGhvc2UgYXMgd2VsbCwgdGhhbmtzLgoKQmFzIFZlcm1l
dWxlbgoKCi0tIApUaGlzIG1lc3NhZ2UgaGFzIGJlZW4gc2Nhbm5lZCBmb3IgdmlydXNlcyBhbmQK
ZGFuZ2Vyb3VzIGNvbnRlbnQgYnkgTWFpbFNjYW5uZXIsIGFuZCBpcwpiZWxpZXZlZCB0byBiZSBj
bGVhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
