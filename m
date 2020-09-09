Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EC8262A38
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2433A6EABB;
	Wed,  9 Sep 2020 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8946EABB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahGisM3uLbI4xc5gHDD0bpaFeXKzpMxMMpbEoXOWZXw=; b=yyEttu/uiry6brGC8WGbjMxRgN
 Mrm4gkc4+9YCQW+WWjZfvVn40vFE7xAHgdcVcqZqxhbdzPrB8vTUSjXMGAqoAHccbTgh1L7bw0UDy
 ImcsRG4ebSFtLMUg29Boysq/K4ZbANxxsU/73VIOFqjVc1AqAo4AdwShBqcJ4z/Xzpu96CE96VMtT
 XlzTHg8Hexde0sAIuVVcyCCSwySaApXWJ35+1RxoPhXIdhUNvnkh2gDUjlaMweTNUz9jrLjcX7hn/
 +CB1oCIiW2CGoVHN3Xca4Dub4inWV7vJ9h4llp8XZmKA9l6EBz6S9i0G+sXZMe9IcfQOXEerK2G8p
 8rzy0q/g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kFvRS-00025A-4q; Wed, 09 Sep 2020 11:26:58 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <172f940f-af60-8f8a-6c76-4ff89accd8c5@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <a2606037-74fb-21e7-3318-9403da1729c6@kapsi.fi>
Date: Wed, 9 Sep 2020 11:26:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <172f940f-af60-8f8a-6c76-4ff89accd8c5@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS85LzIwIDU6MDYgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAwNS4wOS4yMDIwIDEz
OjM0LCBNaWtrbyBQZXJ0dHVuZW4g0L/QuNGI0LXRgjoKPj4gK2ludCB0ZWdyYV9kcm1faW9jdGxf
Y2hhbm5lbF9vcGVuKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmRhdGEsCj4+ICsJCQkJ
IHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPj4gK3sKPj4gKwlzdHJ1Y3QgdGVncmFfZHJtX2ZpbGUg
KmZwcml2ID0gZmlsZS0+ZHJpdmVyX3ByaXY7Cj4+ICsJc3RydWN0IHRlZ3JhX2RybSAqdGVncmEg
PSBkcm0tPmRldl9wcml2YXRlOwo+PiArCXN0cnVjdCBkcm1fdGVncmFfY2hhbm5lbF9vcGVuICph
cmdzID0gZGF0YTsKPj4gKwlzdHJ1Y3QgdGVncmFfZHJtX2NsaWVudCAqY2xpZW50ID0gTlVMTDsK
Pj4gKwlzdHJ1Y3QgdGVncmFfZHJtX2NoYW5uZWxfY3R4ICpjdHg7Cj4+ICsJaW50IGVycjsKPj4g
Kwo+PiArCWlmIChhcmdzLT5mbGFncyB8fCBhcmdzLT5yZXNlcnZlZFswXSB8fCBhcmdzLT5yZXNl
cnZlZFsxXSkKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKwljdHggPSBremFsbG9jKHNp
emVvZigqY3R4KSwgR0ZQX0tFUk5FTCk7Cj4+ICsJaWYgKCFjdHgpCj4+ICsJCXJldHVybiAtRU5P
TUVNOwo+PiArCj4+ICsJZXJyID0gLUVOT0RFVjsKPj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGNs
aWVudCwgJnRlZ3JhLT5jbGllbnRzLCBsaXN0KSB7Cj4+ICsJCWlmIChjbGllbnQtPmJhc2UuY2xh
c3MgPT0gYXJncy0+aG9zdDF4X2NsYXNzKSB7Cj4+ICsJCQllcnIgPSAwOwo+PiArCQkJYnJlYWs7
Cj4+ICsJCX0KPj4gKwl9Cj4+ICsJaWYgKGVycikKPj4gKwkJZ290byBmcmVlX2N0eDsKPj4gKwo+
PiArCWlmIChjbGllbnQtPnNoYXJlZF9jaGFubmVsKSB7Cj4+ICsJCWN0eC0+Y2hhbm5lbCA9IGhv
c3QxeF9jaGFubmVsX2dldChjbGllbnQtPnNoYXJlZF9jaGFubmVsKTsKPj4gKwl9IGVsc2Ugewo+
PiArCQljdHgtPmNoYW5uZWwgPSBob3N0MXhfY2hhbm5lbF9yZXF1ZXN0KCZjbGllbnQtPmJhc2Up
Owo+PiArCQlpZiAoIWN0eC0+Y2hhbm5lbCkgewo+PiArCQkJZXJyID0gLUVCVVNZOwo+PiArCQkJ
Z290byBmcmVlX2N0eDsKPj4gKwkJfQo+PiArCX0KPj4gKwo+PiArCWVyciA9IHhhX2FsbG9jKCZm
cHJpdi0+Y29udGV4dHMsICZhcmdzLT5jaGFubmVsX2N0eCwgY3R4LAo+PiArCQkgICAgICAgWEFf
TElNSVQoMSwgVTMyX01BWCksIEdGUF9LRVJORUwpOwo+PiArCWlmIChlcnIgPCAwKSB7Cj4+ICsJ
CW11dGV4X3VubG9jaygmZnByaXYtPmxvY2spOwo+IAo+IExvb2tzIGxpa2UgdGhlIGxvY2sgd2Fz
IG5ldmVyIHRha2VuLgoKVGhhbmtzLCB3aWxsIGZpeC4KCj4gCj4+ICsJCWdvdG8gcHV0X2NoYW5u
ZWw7Cj4+ICsJfQo+PiArCj4+ICsJY3R4LT5jbGllbnQgPSBjbGllbnQ7Cj4+ICsJeGFfaW5pdF9m
bGFncygmY3R4LT5tYXBwaW5ncywgWEFfRkxBR1NfQUxMT0MpOwo+IAo+IFdoeSBub3QgWEFfRkxB
R1NfQUxMT0MxPwo+IAoKV2lsbCBmaXggYXMgd2VsbC4KCk1pa2tvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
