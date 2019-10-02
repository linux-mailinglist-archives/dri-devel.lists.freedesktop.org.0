Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDADC8A4C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 15:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10289AC3;
	Wed,  2 Oct 2019 13:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1333 seconds by postgrey-1.36 at gabe;
 Wed, 02 Oct 2019 13:55:10 UTC
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
 [192.185.145.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3318489AB9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 13:55:10 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 26704CB29
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 08:32:55 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id FekQisCx0BnGaFekQi2dIx; Wed, 02 Oct 2019 08:32:55 -0500
X-Authority-Reason: nr=8
Received: from [187.192.22.73] (port=47872 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1iFekQ-000dlA-9i; Wed, 02 Oct 2019 08:32:54 -0500
To: "Liu, Leo" <Leo.Liu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20191001171635.GA17306@embeddedor>
 <192815d9-5ecb-09a7-4624-5fd36126890d@amd.com>
 <823b10a3-fe0e-2e8c-02c3-534944dbe6d2@embeddedor.com>
 <dc76a52b-09a2-7ab9-b53e-52500f4f8669@amd.com>
 <3c6ebf4a-8cba-40e2-7d70-c4d5006a160b@embeddedor.com>
 <23314fce-800c-552f-e879-464f9709d12b@amd.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Subject: Re: [PATCH] drm/amdgpu: fix structurally dead code vcn_v2_5_hw_init
Message-ID: <36766293-28b1-8903-bde8-5f04082c8b89@embeddedor.com>
Date: Wed, 2 Oct 2019 08:32:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23314fce-800c-552f-e879-464f9709d12b@amd.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.22.73
X-Source-L: No
X-Exim-ID: 1iFekQ-000dlA-9i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.22.73]:47872
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:Cc:To:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kHKsNwF9Ka8xiepdAJj7uetI4LP94/I8beN6oS0PN7s=; b=ktUgks2m+5GUUkmWUwnbEQxmcy
 9bC2du8Zqc/PzGQ/79p+WbOUnlE4BJIKBYvkiiqZ3hjXNVceleq2DNsSwpjfJEQdKXXLyUDtFFbHT
 Y9vY+0glCBMEkOqJH6R/FoznZ3JK7ikhj9+bH3qmMQ+kXoz1nqhMsXx0Q9asth+Z25BIq/Y3K3L7Y
 HhttwsBR/q973sY1K2Y02mpTbNoW/WDuroqQCprbHMxHj9JU66iHH7CQVpFaXHYOhtbQ23d78dL5W
 NlzW/AqnAloOHtUpb+GQAiLYm/AoS7eRj3nQ9Ejgy+9V9rh0PNecMKv0/O7Qb7T/SwXZxfqhnrTUl
 3Dc6nOLw==;
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAxMC8xLzE5IDE3OjIxLCBMaXUsIExlbyB3cm90ZToKCj4+Pj4gT0suIFNvLCBtYXliZSB3
ZSBjYW4gYWRkIGEgY29tbWVudCBwb2ludGluZyB0aGF0IG91dD8KPj4+IFRoYXQgY291bGQgYmUg
YmV0dGVyLgo+Pj4KPj4gR3JlYXQuIEknbSBnbGFkIGl0J3Mgbm90IGEgYnVnLiAgSSdsbCB3cml0
ZSBhIHBhdGNoIGZvciB0aGF0IHNvIG90aGVyCj4+IHBlb3BsZSBkb24ndCB3YXN0ZSB0aW1lIHRh
a2luZyBhIGxvb2suCj4gCj4gVGhhbmtzLCBqdXN0IHNlbnQgdHdvIHBhdGNoZXMgdG8gYWRkIGNv
bW1lbnQsIGFuZCBsb25nIHdpdGggdGhlIHBhdGNoIHRvIAo+IG1ha2UgVkNOIHJpbmcgcmVhZHkg
cHJvcGVybHkuCj4gCgpBd2Vzb21lLiBUaGFuayB5b3UuIEkgd291bGQganVzdCBhZGQgYSBjb21t
aXQgbG9nIHRvIHRoaXMgcGF0Y2g6CgpbUEFUQ0ggMi8yXSBkcm0vYW1kZ3B1OiBhZGQgYSBjb21t
ZW50IHRvIFZDTiAyLjUgZW5jb2RlIHJpbmcKCkknZCB1cGRhdGUgdGhlIHN1YmplY3QgdG86IGRy
bS9hbWRncHU6IGFkZCBjb2RlIGNvbW1lbnQgaW4gdmNuX3YyXzVfaHdfaW5pdAphbmQgYWRkIHRo
aXMgYXMgYSBjb21taXQgbG9nOiBBZGQgYSBjb21tZW50IHRvIFZDTiAyLjUgZW5jb2RlIHJpbmcK
CkFsc28sIEkgdGhpbmsgaXQncyBpbXBvcnRhbnQgdG8gZm9sbG93IHRoZSBwcm9jZXNzIGFuZCBD
QyBhbGwgdGhlIHBlb3BsZSBhbmQgbGlzdHMKYmVsb3c6CgokIHNjcmlwdHMvZ2V0X21haW50YWlu
ZXIucGwgLS1ub2tleXdvcmRzIC0tbm9naXQgLS1ub2dpdC1mYWxsYmFjayBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCkFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4gKHN1cHBvcnRlcjpSQURFT04gYW5kIEFNREdQVSBEUk0gRFJJVkVSUykKIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IChzdXBwb3J0ZXI6UkFERU9O
IGFuZCBBTURHUFUgRFJNIERSSVZFUlMpCiJEYXZpZCAoQ2h1bk1pbmcpIFpob3UiIDxEYXZpZDEu
WmhvdUBhbWQuY29tPiAoc3VwcG9ydGVyOlJBREVPTiBhbmQgQU1ER1BVIERSTSBEUklWRVJTKQpE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+IChtYWludGFpbmVyOkRSTSBEUklWRVJTKQpE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IChtYWludGFpbmVyOkRSTSBEUklWRVJTKQph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAob3BlbiBsaXN0OlJBREVPTiBhbmQgQU1ER1BV
IERSTSBEUklWRVJTKQpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIChvcGVuIGxpc3Q6
RFJNIERSSVZFUlMpCmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgKG9wZW4gbGlzdCkKClRo
YW5rcwotLQpHdXN0YXZvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
