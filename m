Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D42922CE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FD36E8DA;
	Mon, 19 Oct 2020 07:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9D26E8DA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:08:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC694AB0E;
 Mon, 19 Oct 2020 07:08:20 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Avoid to access BMC addressing when P2A is
 disabled
To: David Airlie <airlied@redhat.com>,
 KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
References: <1602834078-1700-1-git-send-email-kuohsiang_chou@aspeedtech.com>
 <CAMwc25oC596560WUJjh8f2jfcnHjfUTW+cgf=maSMsAc83TcrQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b1b67662-ef49-9dae-ad7c-ea5e3d58fb97@suse.de>
Date: Mon, 19 Oct 2020 09:08:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CAMwc25oC596560WUJjh8f2jfcnHjfUTW+cgf=maSMsAc83TcrQ@mail.gmail.com>
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
Cc: jenmin_yuan@aspeedtech.com, eich@suse.com,
 dri-devel <dri-devel@lists.freedesktop.org>, arc_sung@aspeedtech.com,
 tommy_huang@aspeedtech.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDE2LjEwLjIwIDIzOjAxLCBEYXZpZCBBaXJsaWUgd3JvdGU6Cj4gT24gRnJpLCBPY3Qg
MTYsIDIwMjAgYXQgNjowMyBQTSBLdW9Ic2lhbmcgQ2hvdQo+IDxrdW9oc2lhbmdfY2hvdUBhc3Bl
ZWR0ZWNoLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBwYXRjaCBpcyB1cHN0cmVhbWVkCj4+IDEuIEZv
ciBSSEVMNy54LCBiZWNhdXNlIGl0cyBuYXRpdmUga2VybmVsIGlzIHN1Z2dlc3RlZCB0byB1cGRh
dGUKPj4gICAgZnJvbSAzLjEwIHRvIDQuOSBvbiAyIE9ETSdzIHBsYXRmb3JtLgo+PiAyLiBGb3Ig
QVNUMjYwMC4KPj4gMy4gRm9yIEFTVERQLgo+PiA0LiB2MS4xMQo+IAo+IEhpLAo+IAo+IEkndmUg
Y2MnZWQgVGhvbWFzIHdobyBpcyBtYWludGFpbmluZyB0aGlzIHVwc3RyZWFtLCBidXQgdGhpcyBw
YXRjaCBpbgo+IGl0J3MgY3VycmVudCBmb3JtIGlzbid0IGFjY2VwdGFibGUsIE1heWJlIFRob21h
cyBjYW4gcHJvdmlkZSBtb3JlCj4gZGV0YWlsZWQgaW5mbywgYnV0IHRoZSBiYXNpYyBydWxlcyBh
cmUKPiAKPiBPbmUgcGF0Y2ggc2hvdWxkIGRvIG9uZSB0aGluZy4KPiBQYXRjaGVzIHNob3VsZCBi
ZSBiaXNlY3RhYmxlIHNvIGFueSBpc3N1ZXMgY2FuIGJlIHRyYWNrZWQgZG93biBlYXNpZXIuCj4g
Rml4ZXMgc2hvdWxkIGJlIHNlcGFyYXRlZCBmcm9tIG5ldyBjb2RlLgo+IE5ldyBmZWF0dXJlcyBh
bmQgY2hpcCBzdXBwb3J0IHNob3VsZCBiZSBzZXBhcmF0ZS4KPiAKPiBodHRwczovL3d3dy5rZXJu
ZWwub3JnL2RvYy9odG1sL3Y1LjkvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbAoKUGxl
YXNlIGZvbGxvdyB0aGlzIGRvY3VtZW50IHdoZW4gc3VibWl0dGluZyBwYXRjaGVzLgoKPiAKPiBQ
bGVhc2UgbWF5YmUgd29yayB3aXRoIFRob21hcyBvbiBoYXZpbmcgYSBiZXR0ZXIgdXBzdHJlYW0g
ZGV2ZWxvcG1lbnQKPiBwcm9jZXNzIGZvciBhc3QgY2hpcHNldHMuCgpJJ2Qgd2VsY29tZSBtb3Jl
IHN1cHBvcnQgYW5kIGNvbnRyaWJ1dGlvbnMgZnJvbSBBc3BlZWQgZGV2ZWxvcGVycy4gQnV0Cmlu
IGl0cyBjdXJyZW50IGZvcm0sIHRoZSBwYXRjaCBpcyBub3QgYWNjZXB0YWJsZS4KCkJlc3QgcmVn
YXJkcwpUaG9tYXMKCj4gCj4gVGhhbmtzLAo+IERhdmUuCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4gCgotLSAKVGhvbWFzIFppbW1lcm1h
bm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgKTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55CihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykKR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
