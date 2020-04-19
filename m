Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058121B01EB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055B66E1CE;
	Mon, 20 Apr 2020 06:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9936E451;
 Sun, 19 Apr 2020 09:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1587288890;
 bh=aBvp8j+L1nTaifasG/k6Eo+pawLiP4BJx5o+pIro8s0=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=NGL2kl3SGeJGNdhv085qZJDI8JQKKK1KUB3SS5KkI6jkJAAv44o4ns7QXIan8EO0f
 fERGM2/7NL4VW3J5GAntXx40oILNalQQ68f5qWGl//O4LDHw78+ZXbHApk151LbqTv
 WcLni7ro2Ijf8liKzqGcp25a6Iockt/FByNL2AnE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.85.208]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lx7Ab-1jBBwm47jN-016bxG; Sun, 19
 Apr 2020 11:34:50 +0200
To: Bernard Zhao <bernard@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Return more error codes in
 amdgpu_connector_set_property()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a00cc21a-383f-67ca-cdc5-b727ae59d31c@web.de>
Date: Sun, 19 Apr 2020 11:34:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:32A2D40OkSgOcF5U7bMgBASVmVpEIHqnEQAeY0qIr1t30awZDCv
 dKG06tryG/C3sJ6q1+pylBfR81tovhOYb3Zp0CrR5ItgTtWjdAs3FqJyAc02g1KJr9CVhPw
 DR+ej5uT+rp2Vhu5YYZB6ognP0v6Wc4MAzaVF5n/mLRNTpgCm8VfVP00kVGwERE2GYyD1Hp
 p20p3jIjOjK82b42fQaNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7BxhmcytRdY=:fTRjN3HGS/7AbzQduubich
 eeKu4J5yzbwF+70UnBon0fmKOIhqyaq6ipwA8RbA+v4+ow0jEjPiU/drOLFQTFr9faa8Drhxy
 /5sRAiWsE4EGg+3BR/fRyBN4957pBwX+J6Ai7GI89cOQ6iNmUkIqZn0l/KW5lVWEo5c4C+q1r
 +eWKX9pQ0yJVsCSgdXeP1SJs5iLKcRzrcCh5AyakT5GsxEihpQH/SxAav3I0qvmDQdxQwTsHY
 UcArRghSx992CFbV6+XYzjIUP50Z31G7LoaPhNY1PHSKq4lMeXh7Vi7Ka59P5f+xkkXAPP5vF
 Gqp3RNgLBcmW14TVjHuInyk7A2L0Yf5GnJaEjZmMrhnzw8M9juCo+T9RwvGErQ5xq8B9t1Hhb
 W+jGfNNkyPvLn0gqulxbUTj5ZNaNDfJ0LQOnqzqyFJqaWnQn7E9aUPi2RoY19YQvFhkyWcmS2
 o3r410BFdBkgM5fVkuRUlO4NI4vU1s4ayIlDlh275ko0Fufk3y846BMU+Z8GZCHZUpvqceiNi
 1zTlfydTNSZnv4UKuJ31G0NaE9BhKSYKxQns93zJWd/mR5AmJxBA0CWMqL5+9flVwRo5c9j/b
 RWhQ/8O/qjzTKE1RpZXBg7zTeOSX0z4jgsZK88Sni+LpfsrusW2fn5T+/s5gE3cnOh9I0jnmV
 i0vJZh9fQ5ILNyvjCdsIS4XTtP3Kd29GYkDMP0alyqJiUqxYjEx7h8utBVSembjoxvDiBrxEc
 64p8WbjW9iPrP6Kl732cS9xlKFc64Ol8vlCbIFOYq5LP7rmDYUT0LH65bMTdkh9wT11/kbYBG
 pFOcjkLLafZwEfzy1EcyLkb6pAnqNMhvLyleZt070KG8IQwzAjp7fJv0qQH96qiRQ6Wp+/Ed5
 X8g+Q1LLQQ/FmOYmPU//AjI1Rw75qw5tBqLjWNCYhnralLSclxPedSnS/uPR6PVe7QB8Vys4W
 s72prYTTHER+nXyqJ1/oawoi/Mea62qNbeSZ75IoDBOUa9khIQ1sWGkjUqUSmLy8m3WivbWQX
 SdKW2xwT7Y2Q+jwNUBd1UMZU3LAF+vxVkQpEY9/dkWCdCaR6nJphCe5GwpCFsfL8amj8Fxxr4
 2IhUCpgQM2UPpZDbO5uh3zbvcNXNgEODi7ciiqJ57yf1+Ww0cpWJ+xrLA3FvbkGLiM988v0st
 G86CYnAaNsPDz4QsLO0KE5GbS3SaRwkjjvx2wC8rH8ER3vVWAXC5h2QCoMj13I4PqgfHeuMf2
 s3oGdQUkXkWcqnwZb
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
Cc: opensource.kernel@vivo.com, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBUaGUgImlmKCFlbmNvZGVyKSIgYnJhbmNoIHJldHVybiB0aGUgc2FtZSB2YWx1ZSAwIG9mIHRo
ZSBzdWNjZXNzCj4gYnJhbmNoLCBtYXliZSByZXR1cm4gLUVJTlZBTCBpcyBtb3JlIGJldHRlci4K
Ckkgc3VnZ2VzdCB0byBpbXByb3ZlIHRoZSBjb21taXQgbWVzc2FnZS4KCiogV291bGQgeW91IGxp
a2UgdG8gYWRqdXN0IHRoZSBwYXRjaCBzdWJqZWN0PwoKKiBIb3cgZG8geW91IHRoaW5rIGFib3V0
IHRvIGFkZCB0aGUgdGFnIOKAnEZpeGVz4oCdCiAgYmVjYXVzZSBvZiBhZGp1c3RtZW50cyBmb3Ig
dGhlIGV4Y2VwdGlvbiBoYW5kbGluZz8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
