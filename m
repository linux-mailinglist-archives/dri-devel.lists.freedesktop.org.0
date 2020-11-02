Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2E72A34D1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 21:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2826E580;
	Mon,  2 Nov 2020 20:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346E56E558;
 Mon,  2 Nov 2020 20:02:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y12so16025905wrp.6;
 Mon, 02 Nov 2020 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+LHkPNNHGbEfsJSQWciAnfkrQlxui91397IyZ7j51r4=;
 b=s/XXlneVIJlCJqA+P3wqUaXYCK2ybHjf+F+WnpOSHIIg3kHtEB1z3Gc/pgUKvHF4He
 vsv1iWVlFT8uZPEEg5jF/+zW2PGq8gW1DKDdmO8X0S6euvf3NJ8meCddkGp3sje+58MS
 5CUJqqeG0HeGZ1EiMe2HPXlMejTWo5lCw6iYAk3ClO89NIxF0S8Lcs5xupGvEpHWedKW
 kssWl8UnN5T2ejXz+WhH8xcuaJAVWLZ1xLV9LllODxi3sJ577JUNsa78V4uB/mjswCSD
 ozf9/apVVI6gXkiGQPVfMdQavzNxCI6T93iHkHFStVD+zfTZNlFp6Li3SjuHcUDVZHFd
 D8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+LHkPNNHGbEfsJSQWciAnfkrQlxui91397IyZ7j51r4=;
 b=ZbssOFKgyKlTGmvWHXe2s9KDkV2z9KAwNlg5zUtVPPiHIDSIxOi6NqOCslEeELJw4L
 XjBLrPTIPLVQh866/MBKIM9MEs4+gkJCeJ0IYKjvm3H0H9MUsSJRGbgyLqajfaBCKqmO
 sFxsxcAPa+u8T91NQmpLNK61vnoSy3VCQghnDqTdeQDQY1h4zA0NmK7vtYphf8ulkskr
 aHa7VYlAJz/+ghmj97pTvufgW4LScUCJtiHd/Xm+3PY1ryOBEwVfPcElINFP39L9ZVh/
 kbxKfPPg0JehwjMSeo7rycnAL8JAc2xu+O2seJdMjtO9269hLA3cPDIc5SNGcMqLKgYF
 yjvw==
X-Gm-Message-State: AOAM531xcVJe6U9O2b59tjp24slvSzMZtY90A1bkQn7S1etFfNdxR/HM
 JHZe2Fbroj06qvQwTdAlCmY=
X-Google-Smtp-Source: ABdhPJx/kNoq2YtHLfUwD/tFAfh/4biaXbd6hWObircRavhW5qvCIADgoqAOup5/kF5517/O/JPOhg==
X-Received: by 2002:adf:c847:: with SMTP id e7mr15411821wrh.346.1604347336925; 
 Mon, 02 Nov 2020 12:02:16 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b4sm15426048wro.57.2020.11.02.12.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 12:02:16 -0800 (PST)
Subject: Re: [PATCH] drm/amd: fix typoes
To: Bernard Zhao <bernard@vivo.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Ian King <colin.king@canonical.com>, zhengbin <zhengbin13@huawei.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20201102125747.6420-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <654ce843-8b12-7ba2-9225-3c724afa3cdf@gmail.com>
Date: Mon, 2 Nov 2020 21:02:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102125747.6420-1-bernard@vivo.com>
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
Reply-To: christian.koenig@amd.com
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMTEuMjAgdW0gMTM6NTcgc2NocmllYiBCZXJuYXJkIFpoYW86Cj4gRml4IHR5cG9lcy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KCkFja2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jIHwgMiAr
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxj
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jCj4g
aW5kZXggMmM2ZGIzNzlhZmFlLi5lOTk0ZDIzM2FhMjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jCj4gQEAgLTE5ODAsNyArMTk4
MCw3IEBAIHN0YXRpYyB2b2lkIGNhbGN1bGF0ZV9iYW5kd2lkdGgoCj4gICAJZWxzZSB7Cj4gICAJ
CWRhdGEtPmxhdGVuY3lfZm9yX25vbl9tY2lmd3JfY2xpZW50cyA9IGJ3X2ludF90b19maXhlZCgw
KTsKPiAgIAl9Cj4gLQkvKmRtaWYgbWMgdXJnZW50IGxhdGVuY3kgc3VwcHBvcnRlZCBpbiBoaWdo
IHNjbGsgYW5kIHljbGsqLwo+ICsJLypkbWlmIG1jIHVyZ2VudCBsYXRlbmN5IHN1cHBvcnRlZCBp
biBoaWdoIHNjbGsgYW5kIHljbGsqLwo+ICAgCWRhdGEtPmRtaWZtY191cmdlbnRfbGF0ZW5jeV9z
dXBwb3J0ZWRfaW5faGlnaF9zY2xrX2FuZF95Y2xrID0gYndfZGl2KChid19zdWIoZGF0YS0+bWlu
X3JlYWRfYnVmZmVyX3NpemVfaW5fdGltZSwgZGF0YS0+ZG1pZl9idXJzdF90aW1lW2hpZ2hdW3Nf
aGlnaF0pKSwgZGF0YS0+dG90YWxfZG1pZm1jX3VyZ2VudF90cmlwcyk7Cj4gICAJLypkcmFtIHNw
ZWVkL3Atc3RhdGUgY2hhbmdlIG1hcmdpbiovCj4gICAJLyppbiB0aGUgbXVsdGktZGlzcGxheSBj
YXNlIHRoZSBuYiBwLXN0YXRlIGNoYW5nZSB3YXRlcm1hcmsgY2Fubm90IGV4Y2VlZCB0aGUgYXZl
cmFnZSBsYiBzaXplIHBsdXMgdGhlIGRtaWYgc2l6ZSBvciB0aGUgY3Vyc29yIGRjcCBidWZmZXIg
c2l6ZSovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
