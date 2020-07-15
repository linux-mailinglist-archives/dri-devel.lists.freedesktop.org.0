Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0C221FE9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 11:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4A86EC3F;
	Thu, 16 Jul 2020 09:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAB16E2C8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1594836747;
 bh=QcpLvxTprRN97noWYETKUiSM4hg9Ue7fzui0lALddEI=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=gptbLyzTdAXPDGpEGAIBW2DpkSatGYena1MP1jHDrC7RtnVUXj2gDHy2f0o8ZPCU6
 wLTbgKLIPVZBRZs3yL8oBGKflLHJMtP8optXiMAEdX+Y7V7iCK2jzcuzRXdwJoAWqn
 6PrCZGnICLt5PkLxdXrkUFr/vlnmCe9owIzxJyNk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.102.166]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHVen-1k8kKg09jd-00DYgm; Wed, 15
 Jul 2020 20:12:27 +0200
To: Jing Xiangfeng <jingxiangfeng@huawei.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: add the missed kfree() for nouveau_bo_alloc()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <df40519c-1850-6dfc-35bf-bdcc2eb6c117@web.de>
Date: Wed, 15 Jul 2020 20:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:p0wUwp+F6TQiqi/U6wSPc06mtjJKuai6xaqD2S6dWBoKgGwfU4M
 wrQaj1e5bViNDQ0nFcrhlmkoHVDnIYjK8MSLnCsUYuyKBKRba6mvZpfziCtnHr/EDGysBWM
 YdEddRS0RaIrDS/GBKgBMVdTNgZjGbMp6p4YPW4jm57sazgcHu/h/0u459mJPN7S028BuyT
 QqqEJV8WF+jHH2lshKnVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+nGvxOs79Nk=:JRHTh7bUmibQ+EYmEQkeYh
 i7NqKrxpzRpBUoNb9SujZOEfiaY4teiTTwK6Iibhqzp+uJehN91dIcpThqkXAh9EVoi7o2hg3
 6BivmY2BVnIPZz+YUDJ9qn/xnPN9oQ+bihY4YLa+8Bp9hE+97A/TXMRGhraZou99lwCLey/Rd
 aL63cbOiAqFA1kV/fLBr/wL/1AJeFRi+nqvmtXIzNMF1o5vrM+E2tVd+HYb7r9EgNju5yyGl+
 zdbdbu9ddnnnmthJFF0wHm3j0QMD7WzmL+8SReXqlAH+XDgug03VoVaITZ4UuFNVXsWbhUnwK
 ZKhQdorOFYr422ls5XHjAbJ9nWw3sLav7Fp+fO1hFnvgRNCESEM+i1YC5F305cMIyYcjvyX0r
 TK7vkSPiA40qZi6dtMy0c1PW1Nhh4tNPlSak0+lVPw2RQBp/K7Q7VeGuJX5l3cKmsKY/1TjFd
 e5ChHvWm0yc+d7St0McMuGV0LN2ArPbsnzPMmEKPjJ1sV81gpDqeHq6ffg4E3z7NXcSsGfuqK
 ZOWw8FiM+t7AtCqxGF+3x8oUC7cylaLTvZUGbIzqGG8BhP6n96lm4sKDnoMcCYPDrbbABQF3X
 qfBmvW7Sn9IjjwcgvUVMdURDkYcFBL9L4UNR953HHO7c9y7efqQ8FfZkh35RrckQvkQtbS5KN
 +1howGOUmM4JID5M1ejjGuc9En1OavQbxoI59gPYw8xUYwjzMJk6Nlm20s8FienOlVdskbii6
 SbtyGrCjum5530we74JMndeqXnZPLJIRAFg5M/J650NbKBHF3+7UWOU7AL78dh5z6fM8CEv3t
 bhP4gvo9Jf/x6oauWpvYJtxj6dFcAi5caNHbyo/LEjiUQ1MWhD/Mk+lhl6RDJ/HO47X5r8e0U
 xJkbuUHWJexjhNINqowwlMb7AKHubndX2Bo2l+Sm/SmCtsla/dyzSuBCnFtK/+un2LyMjky9e
 yg2zGWNKPEloOoCLgiRF4KmVUZ5PjJuVrsbs0J/RHcqUZ0ur7BzOOO3BR1miyjXCP0DkuiPLo
 D4KYc9eadkJNgj1qCrHyuAoQE4B9ClJea3WH5LkAVRwTVeTPhybasecsKi9CEsaWSxpvHlzfL
 nrkmBRskyCNm9K6Xs5j9zSoGZeXIpr5cda3frQYAqy3fWXLy/zd6YhPiw6JxyX2wJwQCnrJdt
 g1wmz8GeVoLgmbxQV1WfDgEWggXz7bJW1kTWY/6oFvaYtNd+wQPZ+fLuIMsVexcEYLjgi3yXY
 xEU1gxSwBgVzHiFNUvSjDc8m9ngyfX61bITONqA==
X-Mailman-Approved-At: Thu, 16 Jul 2020 09:42:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiDigKYgdG8gZml4IGl0LgoKSSBzdWdnZXN0IHRvIHJlcGxhY2UgdGhpcyB3b3JkaW5nIGJ5IHRo
ZSB0YWcg4oCcRml4ZXPigJ0uCgoK4oCmCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9iby5jCj4gQEAgLTI3Niw4ICsyNzYsMTAgQEAgIG5vdXZlYXVfYm9fYWxsb2Moc3Ry
dWN0IG5vdXZlYXVfY2xpICpjbGksIHU2NCAqc2l6ZSwgaW50ICphbGlnbiwgdTMyIGZsYWdzLAo+
ICAJCQlicmVhazsKPiAgCX0KPgo+IC0JaWYgKFdBUk5fT04ocGkgPCAwKSkKPiArCWlmIChXQVJO
X09OKHBpIDwgMCkpIHsKPiArCQlrZnJlZShudmJvKTsKPiAgCQlyZXR1cm4gRVJSX1BUUigtRUlO
VkFMKTsKPiArCX0KCkkgcHJvcG9zZSB0byBtb3ZlIHN1Y2ggY29tbW9uIGV4Y2VwdGlvbiBoYW5k
bGluZyB0byB0aGUgZW5kIG9mCnRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24gc28gdGhhdCBh
IGJpdCBvZiBkdXBsaWNhdGUgY29kZSB3aWxsIGJlIGF2b2lkZWQuCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0Rv
Y3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0P2lkPWU5OTE5ZTExZTIxOWVhYTVl
ODA0MWI3YjFhMTk2ODM5MTQzZTkxMjUjbjQ4MQoKUmVnYXJkcywKTWFya3VzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
