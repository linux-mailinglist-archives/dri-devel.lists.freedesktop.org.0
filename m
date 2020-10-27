Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4A29CEAB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF816EC5C;
	Wed, 28 Oct 2020 08:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C266EC43
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 20:22:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x6so3273550ljd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L50iVw7FLmT3wGVAPb+hegW9AcFLwxxQql22N1YNr3s=;
 b=Osq7f6NjC6ISj1R2BgrpzFkaTOIKofACZRAtBSa4SrXYxI+3d+GBoKGHSIkOwNHcvB
 UvsWbgVgQNE+3OGfNtzZF5unO04U88aePHGsjklEtbjQLFWX7553MPixlZyVN+s4+WO1
 Vf9yVY+JWv5qYvkFhJWU7gO6QwEUVjdu2Vz8j3ok3dgunfF2kyG7hie3KTgXZ1s1/gZJ
 gFKYb9OhRCG7w8kF+6swG4GHsuXs6dxh8UfRItF3f+lH+KRinGgI3JfKy8FJBzF0MAus
 a0XOpOMhpHxZapOru7oVQgaMJ4s8d2MJ60b0Y9GUnYWN58OSVL1pDkJbkKd/iDjeo/wU
 +9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L50iVw7FLmT3wGVAPb+hegW9AcFLwxxQql22N1YNr3s=;
 b=FtuIx3Vj+1RUxlYKHDzhZXQwCJNAeFV33aSnrFBX2SLs3zt3hH8tsGv+PdvllnL6JL
 Y37Qr8mTi5L26+Id0V/rzeHZ2x0fsHCgztUFm+mXY04P2Ru8A7wcy1OhMnxNCUgw8OMY
 mz4swQ3xPSFx5CWqUyl7vNTGGzy88dz6tk0UoqRAZ3xGuLZB18GhXPPQkFiE/fdzn1MB
 NMpD3nOlvZcQTxbDeJU/ABdVxLQFgsPdU3hw+dZWT8rO7ADmW6AvNsr/zDxyNouPNLle
 FTL7uM3gi6UHftbYdxrdS+Iz5k2+87EtXiiUvZ9HOoByPNyEt0V3uG2o1d/p8wlyhImF
 r6fQ==
X-Gm-Message-State: AOAM532zikXYqaWCotOAEly0fa38rZWkZO9B+jgKY+3fljpAZMgHABaS
 UDdidLK2HuNC0ne+7ISQWgs=
X-Google-Smtp-Source: ABdhPJwL4Q3axPQhjx8u6GfilK2mbyNcLAJMab3+6Bu/x6z8sYJBTZgcQRvvzZfAlSBhe4ovtwUq0A==
X-Received: by 2002:a2e:b014:: with SMTP id y20mr1846339ljk.362.1603830175544; 
 Tue, 27 Oct 2020 13:22:55 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id w142sm281413lff.108.2020.10.27.13.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 13:22:55 -0700 (PDT)
Subject: Re: [PATCH v6 33/52] memory: tegra20: Support interconnect framework
To: Thierry Reding <thierry.reding@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-34-digetx@gmail.com> <20201027141152.GN1822510@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <713bf4eb-dc5b-9c4b-4ab4-23b36ba4fab1@gmail.com>
Date: Tue, 27 Oct 2020 23:22:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027141152.GN1822510@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxNzoxMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKLi4uCj4+ICtzdGF0
aWMgaW50IGVtY19pY2Nfc2V0KHN0cnVjdCBpY2Nfbm9kZSAqc3JjLCBzdHJ1Y3QgaWNjX25vZGUg
KmRzdCkKPj4gK3sKPj4gKwlzdHJ1Y3QgdGVncmFfZW1jICplbWMgPSB0b190ZWdyYV9lbWNfcHJv
dmlkZXIoZHN0LT5wcm92aWRlcik7Cj4+ICsJdW5zaWduZWQgbG9uZyBsb25nIHBlYWtfYncgPSBp
Y2NfdW5pdHNfdG9fYnBzKGRzdC0+cGVha19idyk7Cj4+ICsJdW5zaWduZWQgbG9uZyBsb25nIGF2
Z19idyA9IGljY191bml0c190b19icHMoZHN0LT5hdmdfYncpOwo+PiArCXVuc2lnbmVkIGxvbmcg
bG9uZyByYXRlID0gbWF4KGF2Z19idywgcGVha19idyk7Cj4+ICsJdW5zaWduZWQgaW50IGRyYW1f
ZGF0YV9idXNfd2lkdGhfYnl0ZXMgPSA0Owo+IAo+IFBlcmhhcHMgdXNlIHNvbWV0aGluZyBzaG9y
dGVyIGZvciB0aGlzIHZhcmlhYmxlIChsaWtlIGRyYW1fYnVzX3dpZHRoKT8gQWxzbywKPiBzaW5j
ZSBpdCdzIG5ldmVyIG1vZGlmaWVkLCBwZXJoYXBzIG1ha2UgaXQgY29uc3Q/IE9yIGEgI2RlZmlu
ZT8KCkl0IGFjdHVhbGx5IGNvdWxkIGJlIDIsIGRlcGVuZGluZyBvbiBhIGJvYXJkIGNvbmZpZ3Vy
YXRpb24sIGJ1dCBJIGRvbid0Cmtub3cgd2hldGhlciBhIDE2Yml0IGJ1cyB3YXMgZXZlciB1c2Vk
IGluIGEgd2lsZC4gQUZBSUssIG52LXRlZ3JhCmtlcm5lbHMgYXNzdW1lcyAzMmJpdCBidXMgZm9y
IGFsbCBkZXZpY2VzLgoKLi4uCj4+ICtlcnJfbXNnOgo+PiArCWRldl9lcnIoZW1jLT5kZXYsICJm
YWlsZWQgdG8gaW5pdGlhbGl6ZSBJQ0M6ICVkXG4iLCBlcnIpOwo+IAo+IEl0IG1pZ2h0IGJlIHdv
cnRoIGR1cGxpY2F0aW5nIHRoaXMgZXJyb3IgbWVzc2FnZSB0byB0aGUgZmFpbHVyZQo+IGxvY2F0
aW9ucyBzbyB0aGF0IHRoZSBleGFjdCBmYWlsdXJlIGNhbiBiZSBpZGVudGlmaWVkLgoKSSB0aGlu
ayBpdCBzaG91bGQgYmUgYmV0dGVyIHRvIGV4dGVuZCBlcnJvciBtZXNzYWdlcyBvbiBieSBhcy1u
ZWVkZWQKYmFzaXMuIEl0J3MgdmVyeSB1bmxpa2VseSB0aGF0IHdlIHdpbGwgZXZlciBzZWUgdGhp
cyBlcnJvciBpbiBwcmFjdGljZS4KT2theT8KCi4uLgo+PiArCSAqIG9mIHRoZSBjbGllbnQncyBG
SUZPIGJ1ZmZlcnMuIFNlY29uZGx5LCB3ZSBuZWVkIHRvIHRha2UgaW50bwo+PiArCSAqIGFjY291
bnQgaW1wdXJpdGllcyBvZiB0aGUgbWVtb3J5IHN1YnN5c3RlbS4KPj4gKwkgKi8KPj4gKwlpZiAo
dGFnID09IFRFR1JBX01DX0lDQ19UQUdfSVNPKQo+PiArCQlwZWFrX2J3ID0gdGVncmFfbWNfc2Nh
bGVfcGVyY2VudHMocGVha19idywgMzAwKTsKPiAKPiAzMDAlIHNvdW5kcyBhIGJpdCBleGNlc3Np
dmUuIERvIHdlIHJlYWxseSBuZWVkIHRoYXQgbXVjaD8KCkl0IHNob3VsZCBiZSBwb3NzaWJsZSB0
byBkcm9wIGl0IHRvIDE1MCUgYnkgdHVuaW5nIHByaW9yaXR5IHRpbWVycyBhbmQKaHlzdGVyZXNp
cyBvZiB0aGUgY2xpZW50cywgYnV0IHNvbWUgb2YgdGhvc2UgY29uZmlndXJhdGlvbnMgYXJlIHBs
YWNlZAp3aXRoaW4gZGV2aWNlIHJlZ2lzdGVycyByYW5nZSBhbmQgd2Ugd2lsbCBuZWVkIGEgbW9y
ZSBjb21wbGljYXRlZApiYW5kd2lkdGggbWFuYWdlci4KClRoZSAzMDAlIGlzIGFuIG92ZXJlc3Rp
bWF0aW9uLCBidXQgaXQncyBiZXR0ZXIgdG8gb3ZlcmVzdGltYXRlIGZvciB0aGUKc3RhcnRlciB0
aGFuIGhhdmUgYW4gdW51c2FibGUgZGV2aWNlcy4gVGhpcyBpcyB3aGF0IG52LXRlZ3JhIGtlcm5l
bCBkb2VzCmFzIHdlbGwsIGJ0dy4KCj4+ICsKPj4gKwkqYWdnX2F2ZyArPSBhdmdfYnc7Cj4+ICsJ
KmFnZ19wZWFrID0gbWF4KCphZ2dfcGVhaywgcGVha19idyk7Cj4gCj4gSSdtIG5vdCB2ZXJ5IGZh
bWlsaWFyIHdpdGggSUNDLCBidXQgc2hvdWxkbid0IHRoZSBhZ2dyZWdhdGVkIHBlYWsgdmFsdWUK
PiBiZSB0aGUgc3VtIG9mIHRoZSBjdXJyZW50IGFnZ3JlZ2F0ZWQgcGVhayBhbmQgdGhlIG5ldyBw
ZWFrIGJhbmR3aWR0aD8KPiBDdXJyZW50bHkgeW91J3JlIHNlbGVjdGluZyB0aGUgbWF4aW11bSBw
ZWFrIGJhbmR3aWR0aCBhY3Jvc3MgYWxsCj4gY2xpZW50cywgc28gaXNuJ3QgdGhhdCBnb2luZyB0
byBiZSB0b28gc21hbGwgaWYgZm9yIHdoYXRldmVyIHJlYXNvbgo+IG11bHRpcGxlIGNsaWVudHMg
bmVlZCBwZWFrIGJhbmR3aWR0aCBhdCB0aGUgc2FtZSB0aW1lPwoKSXQncyB1cCB0byB0aGUgcGxh
dGZvcm0gZHJpdmVycyB0byBkZWNpZGUgaG93IHRvIGludGVycHJldCBhbmQgdXNlIHRoZQphdmcg
YW5kIHBlYWsgdmFsdWVzLgoKUGxlYXNlIHNlZSB0aGUgYWJvdmUgZW1jX2ljY19zZXQoKSB3aGlj
aCBzZWxlY3RzIG1heCBvZiAoYXZnLCBwZWFrKQp2YWx1ZXMsIGJ1dCBtYXliZSBpdCBhbHNvIHNo
b3VsZCBiZSBnb29kIHRvIG1vdmUgaXQgb3V0IGZyb20gSUNDIHNldCgpCnRvIHRoZSBJQ0MgYWdn
cmVnYXRlKCkgY2FsbGJhY2s6CgoqYWdnX3BlYWsgPSBtYXgoKmFnZ19wZWFrLCAqYWdnX2F2Zyk7
CgpJJ2xsIG5lZWQgdG8gdGFrZSBhIGNsb3NlciBsb29rLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
