Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B06B1241E7B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 18:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CA66E5C3;
	Tue, 11 Aug 2020 16:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F4C36E5C3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 16:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 55E722A6042;
 Tue, 11 Aug 2020 18:42:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id hcaTGQJ4uh3y; Tue, 11 Aug 2020 18:42:11 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id CD0E42A6016;
 Tue, 11 Aug 2020 18:42:11 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1k5XLm-000fAX-WB; Tue, 11 Aug 2020 18:42:11 +0200
Subject: Re: [PATCH] drm/ttm: revert "make TT creation purely optional v3"
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20200811092400.188124-1-christian.koenig@amd.com>
 <bbeaca4b-189d-c4dd-6d3a-e1489d6b0e4f@gmail.com>
 <052cbf93-00d1-6913-a278-eb3dafa86281@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <12304df3-e891-9e8e-8a51-8be3c2bddc61@daenzer.net>
Date: Tue, 11 Aug 2020 18:42:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <052cbf93-00d1-6913-a278-eb3dafa86281@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOC0xMSAyOjUzIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTEu
MDguMjAgdW0gMTQ6NTIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAxMS4wOC4yMCB1
bSAxMToyNCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+PiBUaGlzIHJldmVydHMgY29tbWl0
IDJkZGVmMTc2NzhiYzJlYTFkMjA1MTdkZDJiNGVkNGFhOTY3ZmZhOGIuCj4+Pgo+Pj4gQXMgaXQg
dHVybmVkIG91dCBWTVdHRlggbmVlZHMgYSBtdWNoIHdpZGVyIGF1ZGl0IHRvIGZpeCB0aGlzLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPj4KPj4gRGFyZSB0byBnaXZlIG1lIGFuIHJiIGZvciB0aGlzPyBJIGFscmVhZHkg
dGVzdGVkIG9uIGFtZGdwdSBhbmQgaXQKPj4gc2hvdWxkIGJlIGZpeGluZyB0aGUgVk1XR0ZYIHBy
b2JsZW1zIHdlIGN1cnJlbnRseSBoYXZlLgo+IAo+IFVwcywgdGhhdCB3YXMgeW91ciBvbGQgQU1E
IGFkZHJlc3MgOikKPiAKPiBTbyBvbmNlIG1vcmUgd2l0aCBmZWVsaW5nLAoKOikKCkhvd2V2ZXIs
IEknbSBhZnJhaWQgSSdtIG5vdCBkZWVwIGVub3VnaCBpbnRvIFRUTSBjb2RlIGFueW1vcmUgdG8g
Z2l2ZQp5b3UgYW4gUi1iLCBnaXZlbiBpdCdzIG5vdCBhIHN0cmFpZ2h0IHJldmVydCAocHJlc3Vt
YWJseSBkdWUgdG8gb3RoZXIKY2hhbmdlcyBpbiB0aGUgbWVhbnRpbWUpLgoKCi0tIApFYXJ0aGxp
bmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9y
ZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAg
ICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
