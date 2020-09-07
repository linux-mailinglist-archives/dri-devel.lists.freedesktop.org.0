Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D227825F83A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 12:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA776E41B;
	Mon,  7 Sep 2020 10:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AC9D6E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 10:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0C0B02A6042;
 Mon,  7 Sep 2020 12:29:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id qXTjMtX9lbI6; Mon,  7 Sep 2020 12:29:24 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.174.212])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id CE6672A6016;
 Mon,  7 Sep 2020 12:29:23 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1kFEOw-000Lc5-KY; Mon, 07 Sep 2020 12:29:22 +0200
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH v1 0/2] video: fbdev: radeonfb: PCI PM framework upgrade
 and fix-ups.
Message-ID: <5ea9e575-e2ba-1f12-4894-3c0d271ea294@daenzer.net>
Date: Mon, 7 Sep 2020 12:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200907075559.GN2352366@phenom.ffwll.local>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bjorn@helgaas.com>,
 Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wOS0wNyA5OjU1IGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBB
dWcgMDYsIDIwMjAgYXQgMTI6NTI6NTRQTSArMDUzMCwgVmFpYmhhdiBHdXB0YSB3cm90ZToKPj4g
TGludXggS2VybmVsIE1lbnRlZTogUmVtb3ZlIExlZ2FjeSBQb3dlciBNYW5hZ2VtZW50Lgo+Pgo+
PiBUaGUgb3JpZ2luYWwgZ29hbCBvZiB0aGUgcGF0Y2ggc2VyaWVzIGlzIHRvIHVwZ3JhZGUgdGhl
IHBvd2VyIG1hbmFnZW1lbnQKPj4gZnJhbWV3b3JrIG9mIHJhZGVvbmZiIGZiZGV2IGRyaXZlci4g
VGhpcyBoYXMgYmVlbiBkb25lIGJ5IHVwZ3JhZGluZyAuc3VzcGVuZCgpCj4+IGFuZCAucmVzdW1l
KCkgY2FsbGJhY2tzLgo+Pgo+PiBUaGUgdXBncmFkZSBtYWtlcyBzdXJlIHRoYXQgdGhlIGludm9s
dmVtZW50IG9mIFBDSSBDb3JlIGRvZXMgbm90IGNoYW5nZSB0aGUKPj4gb3JkZXIgb2Ygb3BlcmF0
aW9ucyBleGVjdXRlZCBpbiBhIGRyaXZlci4gVGh1cywgZG9lcyBub3QgY2hhbmdlIGl0cyBiZWhh
dmlvci4KPj4KPj4gRHVyaW5nIHRoaXMgcHJvY2VzcywgaXQgd2FzIGZvdW5kIHRoYXQgIiNpZiBk
ZWZpbmVkKENPTkZJR19QTSkiIGF0IGxpbmUgMTQzNCBpcwo+PiByZWR1bmRhbnQuIFRoaXMgd2Fz
IGludHJvZHVjZWQgaW4gdGhlIGNvbW1pdAo+PiA0MmRkYjQ1M2EwY2QgKCJyYWRlb246IENvbmRp
dGlvbmFsbHkgY29tcGlsZSBQTSBjb2RlIikuCj4gCj4gSSBkbyB3b25kZXIgd2hldGhlciBpdCB3
b3VsZG4ndCBiZSBiZXR0ZXIgdG8ganVzdCBvdXRyaWdodCBkZWxldGUgdGhlc2UsCj4gd2UgaGF2
ZSB0aGUgZHJtIHJhZGVvbiBkcml2ZXIgZm9yIHByZXR0eSBtdWNoIGFsbCB0aGUgc2FtZSBoYXJk
d2FyZSAuLi4KCkluIGNvbnRyYXN0IHRvIHJhZGVvbmZiLCB0aGUgcmFkZW9uIGRyaXZlciBkb2Vz
bid0IHN1cHBvcnQgCnN1c3BlbmQtdG8tUkFNIG9uIEFwcGxlIFBvd2VyUEMgbm90ZWJvb2tzLgoK
Ci0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAg
ICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
