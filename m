Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99951C1937
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 21:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E65B6E323;
	Sun, 29 Sep 2019 19:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A8B6E13A;
 Fri, 27 Sep 2019 16:37:56 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.191.8]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MD8Au-1iNjYN24gG-00GXHM; Fri, 27
 Sep 2019 18:37:39 +0200
References: <20190918190529.17298-1-navid.emamdoost@gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix multiple memory leaks
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1cc7e3f9-69fb-e8dc-4bfc-dbb69de66ec7@web.de>
Date: Fri, 27 Sep 2019 18:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190918190529.17298-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:x3y4px5Ca6A9Tjc7OU4XF0XzHzgfug9dGxj2aIp6hdiDS2oAeaw
 23aISDl82ZH+CWFFDyXLbXI1b9sYjA3fDs6C+S1267j6PIHkeYjzXbq0ZUch4U9fHEdj7Ci
 purT5BZE1UgtejLFp5n+qo97nZUBXaA9+5xYUi3Ev+l+vSa+YNvBWoYpCXFtvdI73s4Azb5
 1+8nKVzxd7ifeAOXWSuNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3txmecOp1X4=:rpCh3k9mOLXjje/Af+wkK8
 E+Kl/K1amNOP15t6BJWHfNfAC1yva6bNz98vV4juh2dIbN+qtVgORh7yslVd388k3VhVz6FW+
 UI+/tDCoATtmgoWDZsE1s8+leooRRaRhpc9mFFwTrMBHUHQAIi+eeBGKyhN1GM8IMvGSPjc7y
 QspLvUwG8BZY7cYdS/cFSdhDzpcKCn5rVzo+xyVMpb5sDDkunaWXBRLsd5vj2dEFIwSzv9tlD
 q2CmG7UmvDaA9lYVN2KnRI+ltXDUoAbaFbT/T4ybuJdKGlcgB0VXB/fnW1FJxgQLNAv7FF1kr
 K7I+d9VA7ydiGo9upEVvHvMmH6vTUkif/5GArqNBJLaHLVaNh16Ws99WQWUUQkQKipS7fJ3JN
 Nf27S9SXQqPUNQV65kDfVt2c2sluizpy9u4MNjh6c56hQd9Mv2SaI9gj1Sqew+0WVkahHg2hv
 UGfPNSfrMotdPPc3kq9wB95xpXviWg4KVSJnI4wLpMMWjDXyVIizuiarA6F7G76ShRooSVxod
 zPCaEHkvgqEwPxz4tZ97Jihi9UxHl8t8isBiKhntU0zeQXbxE2EbZqb/58js8Xwh0tPMJWP33
 NJiba8lRPiid/hK3T6K8NiPINIvT+umm1V4mA/3Ddp1FsbC+PRWrk7YWaXK9HLyYt/XybRe+m
 vgCto8YseUoCZC7ujwpx/Vnj1hnwLxQ948RXxi30W96xw1icD1SSmjM5m+vF6FIgzDRFGAQgx
 EvQJq0Ky4Xb7yAojHRwNvSRPGeK/oU+jr7QH25MiXnTu8HAosBrf6e2Sxu0dhkdc1Abb7AIIt
 5CjU1zOQyw0l1PYA6a0MsjAUS3My/3wSp22xz7c2V5v3y9Qmh5mQTEnjT7/N/R4QonE249+NH
 0rng5QhdacyuKV5OGIQjNMtlQQRhr8zSkm35JZ9pGwPkeocdqpM/kZ731I1O3DK+lS1OcnqHN
 C8WCnDGK+2GHLBm9EmN4uiF/kWjua9oUlBFazLThpjqPVufgFdlMrXJlWdOKQb9FjqyglPdhW
 v2v0obn9OWt+XqOBESA9Gg/DroPf6fSuwdW7dLOdY64uWEl905m8loGmbJAkgT79TZD1zqwvT
 /jR60bwxOgqzbVemO+hYC2iGYYobgWYOAQ4OzHq92bXpdR3V/KH/hWt98BZt1Vk2t+eVswrl3
 v2bIkrTXsxFT10IUa1iVKOh0uwwlU7/SCHQZL/lcNqfCHXzGCfOcn3kxyl7owtUMasMzOUCHc
 xQ+5NCp+HXGgCVBiBUMrcZ8UcsWR4fiN9XM/RurxolXf0VlbZybHAyfGjOQY=
X-Mailman-Approved-At: Sun, 29 Sep 2019 19:47:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=web.de; s=dbaedf251592; t=1569602259;
 bh=qJ8sK+Y+0J00l/ur+PK+VM0mN+AD/veeiKCxwnwLXA4=;
 h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
 b=dIL+XSppQKGtKmy3NS+d4eUPrRG+zEFxN+5efeyrDJb0+gsYw3Jdx2sgwQF47nxH6
 o+81eO+d6qnqrk/buzfXiyDlCuO5Tx5GiXCi1eEM3sLKyPyR40/5AFrmuV8A+YbQej
 rY6Q0F1pCmTfOyLWyUPnKMjx7zyNT3R/a4iJDCp8=
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
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>,
 Stephen A McCamant <smccaman@umn.edu>,
 Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiB2MjogbW92ZWQgdGhlIHJlbGVhc2VkIGludG8gZ290byBlcnJvciBoYW5kbGluZ3MKCkEgYmV0
dGVyIHZlcnNpb24gY29tbWVudCBzaG91bGQgYmUgbW92ZWQgYmVsb3cgdGhlIHRyaXBsZSBkYXNo
ZXMuCgoKV2lsbCB0aGUgdGFnIOKAnEZpeGVz4oCdIGJlIGFkZGVkPwoKCj4gQEAgLTM5Myw2ICsz
OTUsMTYgQEAgc3RhdGljIGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpCj4gIAl2YWwgJj0g
fkFDUF9TT0ZUX1JFU0VUX19Tb2Z0UmVzZXRBdWRfTUFTSzsKPiAgCWNnc193cml0ZV9yZWdpc3Rl
cihhZGV2LT5hY3AuY2dzX2RldmljZSwgbW1BQ1BfU09GVF9SRVNFVCwgdmFsKTsKPiAgCXJldHVy
biAwOwo+ICsKPiArb3V0NDoKPiArCWtmcmVlKGkyc19wZGF0YSk7Cj4gK291dDM6Cj4gKwlrZnJl
ZShhZGV2LT5hY3AuYWNwX3Jlcyk7Cj4gK291dDI6Cj4gKwlrZnJlZShhZGV2LT5hY3AuYWNwX2Nl
bGwpOwo+ICtvdXQxOgo+ICsJa2ZyZWUoYWRldi0+YWNwLmFjcF9nZW5wZCk7Cj4gKwlyZXR1cm4g
cmV0Owo+ICB9Cj4KPiAgLyoqCgpJIHN1Z2dlc3QgdG8gcmVjb25zaWRlciB0aGUgbGFiZWwgc2Vs
ZWN0aW9uIGFjY29yZGluZyB0byB0aGUgTGludXggY29kaW5nIHN0eWxlLgoKUmVnYXJkcywKTWFy
a3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
