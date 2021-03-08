Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12C3310A7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 15:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239686E32A;
	Mon,  8 Mar 2021 14:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8456E32A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 14:20:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id q25so21225159lfc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0qSqLyKBzw4nb8j17jU5SupuAgYw/Y4EGFPBpUKaihs=;
 b=H1L0Z5d54+bKkv1NMZjlGMdv2lvvIaogWTE4at+h3hahV4w7UFyPR7pcmfObjw2SQQ
 9K0qL4nLHig0eSQpmZzm6K5Vy2/VwG39JxGa29NIRBlEsRLCeTGHsO9OFpq6RiQ9++7l
 eoJ5nB1iV47JAXv2LLW0YwiqsqvtVmypkSXlG6MNAQzSomEJZJCIdc+vh1rVQ62JL/2y
 dWv+qMyUjBhA6MH8CJpwAJ35KwXVjBgR3KKtSTVD6LCRIlRiwz5UcYEich/+TuZybcs2
 T27tgfeWT9FtKn+gMEKmMx5zg2LkuKixR50cY9tkIloCU6c4H+3oFTFcGzNYAMF9xq4f
 8+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0qSqLyKBzw4nb8j17jU5SupuAgYw/Y4EGFPBpUKaihs=;
 b=M0vV63Jx0e6SwZ/3dsgM3pBPSrldjnWGqleZ0xn2Lgqz8D999BIBVxcz9ZQwD8im57
 pm1quJTsa7aaTXHt+VYy7+geD8HQnNyfO1y7xrfU2gGfncoUYiG/X4ll/d4fCR1bi6Tw
 Gncnz2bkWIzig6QrvvSQwO94nH6In3GnVJIUoOkTqlOQwNlFkMB9cL7jc+nqWEwCRwrG
 FLYRjfEa/yNpfvsC7oHvdMUOaiz9g/9xTe7wzmdqSMh82/dKcRAucDmgGDeT5omQHmkh
 aPdI8WvkCAqWXlog3iqMDcdTnpZUPVtkZxEGmZrEis2TXxCDpRI7fHFFwhFRFGgdqkJv
 YCLg==
X-Gm-Message-State: AOAM531sedXANIYuBu1U2oa3OJX9Oo3/59RfnrZELrkJKhhpWwr2EMkt
 7+EVVRFwFuta70449HPQXdZ67QhWZJ0=
X-Google-Smtp-Source: ABdhPJznNPgojN/nObRq+gs8Ca5XApc8sug9k/GrLjNKYrfLSpPuBe0IYA6WM0BuWX8Ci3xWPlXlhQ==
X-Received: by 2002:a19:ac42:: with SMTP id r2mr5176532lfc.548.1615213255627; 
 Mon, 08 Mar 2021 06:20:55 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id v10sm1367316lfb.238.2021.03.08.06.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:20:54 -0800 (PST)
Subject: Re: [PATCH v13 1/2] drm/tegra: dc: Support memory bandwidth management
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20210302124445.29444-1-digetx@gmail.com>
 <20210302124445.29444-2-digetx@gmail.com>
 <20210303230827.GA22628@qmqm.qmqm.pl>
 <1b352c7e-cc72-ba08-32ba-08c05cc3aa03@gmail.com>
 <20210305230222.GA28867@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5cc7aaa9-1168-64ba-f311-2f27038dcf4a@gmail.com>
Date: Mon, 8 Mar 2021 17:20:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210305230222.GA28867@qmqm.qmqm.pl>
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDYuMDMuMjAyMSAwMjowMiwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE1hciAwNSwgMjAyMSBhdCAxMjo0NTo1MUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+IDA0LjAzLjIwMjEgMDI6MDgsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6Cj4+PiBP
biBUdWUsIE1hciAwMiwgMjAyMSBhdCAwMzo0NDo0NFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28g
d3JvdGU6Cj4+Pj4gRGlzcGxheSBjb250cm9sbGVyIChEQykgcGVyZm9ybXMgaXNvY2hyb25vdXMg
bWVtb3J5IHRyYW5zZmVycywgYW5kIHRodXMsCj4+Pj4gaGFzIGEgcmVxdWlyZW1lbnQgZm9yIGEg
bWluaW11bSBtZW1vcnkgYmFuZHdpZHRoIHRoYXQgc2hhbGwgYmUgZnVsZmlsbGVkLAo+Pj4+IG90
aGVyd2lzZSBmcmFtZWJ1ZmZlciBkYXRhIGNhbid0IGJlIGZldGNoZWQgZmFzdCBlbm91Z2ggYW5k
IHRoaXMgcmVzdWx0cwo+Pj4+IGluIGEgREMncyBkYXRhLUZJRk8gdW5kZXJmbG93IHRoYXQgZm9s
bG93cyBieSBhIHZpc3VhbCBjb3JydXB0aW9uLgo+IFsuLi5dCj4+Pj4gKwkvKgo+Pj4+ICsJICog
SG9yaXpvbnRhbCBkb3duc2NhbGUgdGFrZXMgZXh0cmEgYmFuZHdpZHRoIHdoaWNoIHJvdWdobHkg
ZGVwZW5kcwo+Pj4+ICsJICogb24gdGhlIHNjYWxlZCB3aWR0aC4KPj4+PiArCSAqLwo+Pj4+ICsJ
aWYgKHNyY193ID4gZHN0X3cpCj4+Pj4gKwkJbXVsID0gKHNyY193IC0gZHN0X3cpICogYnBwIC8g
MjA0OCArIDE7Cj4+Pj4gKwllbHNlCj4+Pj4gKwkJbXVsID0gMTsKPj4+Cj4+PiBEb2VzIGl0IHJl
YWxseSBuZWVkIG1vcmUgYmFuZHdpZHRoIHRvIHNjYWxlIGRvd24/IERvZXMgaXQgcmVhZCB0aGUg
c2FtZQo+Pj4gZGF0YSBtdWx0aXBsZSB0aW1lcyBqdXN0IHRvIHRocm93IGl0IGF3YXk/Cj4+IFRo
ZSBoYXJkd2FyZSBpc24ndCBvcHRpbWl6ZWQgZm9yIGRvd25zY2FsZSwgaXQgaW5kZWVkIHRha2Vz
IG1vcmUKPj4gYmFuZHdpZHRoLiBZb3UnbGwgd2l0bmVzcyBhIHNldmVyZSB1bmRlcmZsb3cgb2Yg
cGxhbmUncyBtZW1vcnkgRklGTwo+PiBidWZmZXIgb24gdHJ5aW5nIHRvIGRvd25zY2FsZSAxMDgw
cCBwbGFuZSB0byA1MHg1MC4KPiBbLi4uXQo+IAo+IEluIHlvdXIgZXhhbXBsZSwgZG9lcyBpdCBy
ZWFsbHkgbmVlZCAxNnggdGhlIGJhbmR3aWR0aCBjb21wYXJlZCB0bwo+IG5vIHNjYWxpbmcgY2Fz
ZT8gIFRoZSBuYWl2ZSB3YXkgdG8gaW1wbGVtZW50IGRvd25zY2FsaW5nIHdvdWxkIGJlIHRvIHJl
YWQKPiBhbGwgdGhlIHBpeGVscyBhbmQgb25seSB0YWtlIGV2ZXJ5IE4tdGguICBNYXliZSB0aGUg
cHJvYmxlbSBpcyB0aGF0IGluCj4gZG93bnNjYWxpbmcgbW9kZSB0aGUgbGF0ZW5jeSByZXF1aXJl
bWVudHMgYXJlIHRpZ2h0ZXI/ICBXaHkgd291bGQgYmFuZHdpZHRoCj4gcmVxdWlyZWQgYmUgcHJv
cG9ydGlvbmFsIHRvIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB3aWR0aHMgKGluc3RlYWQgZS5n
Lgo+IHRvIHNyYy9kc3Qgb3IgZHN0KmNhY2hlbGluZV9zaXplKT8KClNlZW1zIHlvdSdyZSByaWdo
dCwgaXQncyBhY3R1YWxseSBub3QgdGhlIGJhbmR3aWR0aC4gUmVjZW50bHkgSSBhZGRlZAptZW1v
cnkgY2xpZW50IHN0YXRpc3RpY3MgZ2F0aGVyaW5nIHN1cHBvcnQgdG8gZ3JhdGUta2VybmVsIGZv
ciBUZWdyYTIwCmFuZCBpdCBzaG93cyB0aGF0IHRoZSBjb25zdW1lZCBiYW5kd2lkdGggaXMgYWN0
dWFsbHkgbG93ZXIgd2hlbiBwbGFuZSBpcwpkb3duc2NhbGVkLgoKU28gaXQgc2hvdWxkIGJlIHRo
ZSBsYXRlbmN5LCB3aGljaCBkZXBlbmRzIG9uIG1lbW9yeSBmcmVxdWVuY3ksIGFuZAp0aHVzLCBv
biBiYW5kd2lkdGguIEknbGwgdHJ5IHRvIGltcHJvdmUgY29tbWVudCB0byB0aGUgY29kZSBpbiB0
aGUgbmV4dAp2ZXJzaW9uLCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
