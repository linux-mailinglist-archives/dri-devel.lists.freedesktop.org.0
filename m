Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5FC484A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC006E8D9;
	Wed,  2 Oct 2019 07:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8446E5DE;
 Wed,  2 Oct 2019 05:47:59 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.73.205]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M89fV-1hu0Dq3Rxp-00vcqo; Wed, 02
 Oct 2019 07:47:40 +0200
References: <20191002034612.26607-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH v4] drm/amdgpu: fix multiple memory leaks in acp_hw_init
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <c03a8983-3f83-0596-96fa-a1a9312e82f8@web.de>
Date: Wed, 2 Oct 2019 07:47:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191002034612.26607-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:ab6excF9+5PpxL1WVTUjh/hNozNGZpLDzmA6yRMO8NCOc1RuHgJ
 puM3unXcxoESutHWF02Cj+luDoaLlDrro1ILb021cZWUBi01by+uHcncDEgr1xYBKFL4WCM
 IyGhIh9ZfihR+KD9nLMiHeYpEYFf6IdOLHuFb8rgzavaedrNE82cheE4ts50oaOl/Lg4eWf
 UsqbJj79PHAyUsyVbqA5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qgltnkPiLAs=:I5Kh+48FQWvUHzcJuFbUyU
 ha9g7p/3i4+7vE0s2oNkHW/Bqxuty8rsakiNldmNeXxjgpLfJ/QLvSp4bDrLJrVwASqMT70HJ
 rrlIftNLDd2xwdqc3GROltXYVg75EWwieMIDJHL1Y7iemg9CHZw3ID/NTyP4Ib+7Y89Rb9FQ5
 9FMJbHlo7q5AXQiaWTCErDLZieukqVJCbR0wTy1Y6cdEYhTYQ78DYYloK0ZqHLSG2oi0cYlhe
 U6W3BvCv+p3G4Oi/bmJ+wxMPuwKR4r4p22632Lu2WcP8YK54zTVdQstE0nhWNijLgyRBIB440
 BTTKvkXUfdOsGTbrZhyFIZKbu84hhR7shPIYTYLeJrhx4kAXW7VtT6DJkRWFj3J4CsmbecBG+
 FTtnss//t8vZT/YXLBbEcXKSUhjvooX3h0LrPC1qhBe4M0WlLSzmE5TB9HjTaff311qZqoynb
 dqnHlr9O2fgCe7PFnfxUncN5nT3kRjrLeUhNnnvTC2c+oO6BZ/42knParD7Xw5WU/x9Zs8Dl2
 4rS/76B34+Vu5DOpvFFLneoDxYCAyfa3btX6LNqeaEAz6Np74avqh1NqMVgfjAfdo3e3ohjui
 U7OfS5veXpnMbLFyaI/aM+d1H6Jr8T05B3gWYzG72KZ9nx0nZBT9FkG2gRA8/egcA2A3hEZ5q
 xkz55XdJzr+KU4mVwZs6JWECKSG+YvaG6Qd3u9KEG7JlQ2I2RJsqNAYGSV7sSXE8jBGNal9o7
 ScWfd2FavnAjEFlzPFa6O73AfVL5T5VoqtM6Pk2fvN5OnxLT7oFengGNECZ5Jvkion9rCORz+
 34kqmFC+kvSCH4zkm2NpRK7IrAec+GjMhGpfPkWV4TZk9A54xbgq2O1ePb6iJbH6V+1zg9Kmf
 2VbRk6vigVSLomrEipvj0PEyWxSrG84umoCndEQlECmYT88z+beHQqmeih/1Ubu0EWt7HZNkQ
 AeTX0AXHc/ON8+1GNbOtER9rbfPhDql0kEPl3GEOOYQrzJuaLUCXHf8BmeV+rMG+doWJA+/Gl
 s9s28OU2ctA9ORXsRqQ8YTG0nkfVQ2u/586ARrhAQRZYygDcIkUM3RpdJSprQ0izy6hjWEpI6
 uNp2BnJ+QxOoFq8tmbX27syEAF0RUERo+ii4e45c7fcXtxchgwUeCl5OWhLlMIqxeyq+tPnxq
 zYHOIvDWk5ktFmGeI13buicks8x9h0ZU4ADgG+V6Rqnb0xTEaN/CmnmNm/+uGd7YGQcwPNmWC
 sQccV/21VHrj+SYaN/fi8t7Z9tur3pv5V/0E8AocfOh2ELkoAp2jSWlzDFTY=
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1569995260;
 bh=kryjEbVOjgPm/+T4JDkUXLGlaj6VWpM3aqTFuOHF088=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=dE7nCCoA8xG2Mmy2CK2Ggu5tt0SAvfSE/mOuuAX3X8WLmDdBdKzC++5k/3YoaUKS3
 aFc6pCBg3LDIx0QGMaXOIPdOc/Rd+8QerJiht45fAmSuO1RIwKJSiCP123HBKJnXsh
 3+E7Z7970yPJeXRQg9NgRF7pjDGWRANhEzuVyIxM=
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org,
 Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0KCldoeSBkaWQgeW91IG9taXQgdGhlIHBhdGNoIGNoYW5nZSBsb2cgYXQgdGhpcyBwbGFj
ZT8KCgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMgfCAzNCArKysr
KysrKysrKysrKysrLS0tLS0tLS0tCgoKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYWNwLmMKPiBAQCAtMTg5LDcgKzE4OSw3IEBAIHN0YXRpYyBpbnQgYWNwX2h3X2lu
aXQodm9pZCAqaGFuZGxlKQrigKYKPiArCXN0cnVjdCBpMnNfcGxhdGZvcm1fZGF0YSAqaTJzX3Bk
YXRhID0gTlVMTDsK4oCmCgpJIHByb3Bvc2UgdG8gcmVjb25zaWRlciB0aGlzIHVwZGF0ZSBzdWdn
ZXN0aW9uIG9uY2UgbW9yZS4KCgo+IEBAIC0zOTMsNiArMzk2LDEzIEBAIHN0YXRpYyBpbnQgYWNw
X2h3X2luaXQodm9pZCAqaGFuZGxlKQo+ICAJdmFsICY9IH5BQ1BfU09GVF9SRVNFVF9fU29mdFJl
c2V0QXVkX01BU0s7Cj4gIAljZ3Nfd3JpdGVfcmVnaXN0ZXIoYWRldi0+YWNwLmNnc19kZXZpY2Us
IG1tQUNQX1NPRlRfUkVTRVQsIHZhbCk7Cj4gIAlyZXR1cm4gMDsKPiArCj4gK2ZhaWx1cmU6Cj4g
KwlrZnJlZShpMnNfcGRhdGEpOwo+ICsJa2ZyZWUoYWRldi0+YWNwLmFjcF9yZXMpOwo+ICsJa2Zy
ZWUoYWRldi0+YWNwLmFjcF9jZWxsKTsKPiArCWtmcmVlKGFkZXYtPmFjcC5hY3BfZ2VucGQpOwo+
ICsJcmV0dXJuIHI7Cj4gIH0KPgo+ICAvKioKCkFyZSB5b3UgZ29pbmcgdG8gZm9sbG93IGEga25v
d24gcHJvZ3JhbW1pbmcgZ3VpZGVsaW5lPwpodHRwczovL3dpa2kuc2VpLmNtdS5lZHUvY29uZmx1
ZW5jZS9kaXNwbGF5L2MvTUVNMTItQy4rQ29uc2lkZXIrdXNpbmcrYStnb3RvK2NoYWluK3doZW4r
bGVhdmluZythK2Z1bmN0aW9uK29uK2Vycm9yK3doZW4rdXNpbmcrYW5kK3JlbGVhc2luZytyZXNv
dXJjZXMjTUVNMTItQy5Db25zaWRlcnVzaW5nYWdvdG9jaGFpbndoZW5sZWF2aW5nYWZ1bmN0aW9u
b25lcnJvcndoZW51c2luZ2FuZHJlbGVhc2luZ3Jlc291cmNlcy1Db21wbGlhbnRTb2x1dGlvbiUy
OGNvcHlfcHJvY2VzcyUyOCUyOWZyb21MaW51eGtlcm5lbCUyOQoKUmVnYXJkcywKTWFya3VzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
