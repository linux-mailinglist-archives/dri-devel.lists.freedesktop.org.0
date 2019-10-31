Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F8EBEF2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5616F75C;
	Fri,  1 Nov 2019 08:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5388E46
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 15:41:54 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id g3so1022410ljl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 08:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hs9AJBC+az+ICiDdHQdwfGOKMqZZjjUvDnX+IerCWm4=;
 b=Pa+1fK/r/EZaDRJPeDRNQeB9JTsnEPkDSi53AgllLf5PqvOI8VhyOQjLDmOdmgQg8t
 jM07ezl177vecF+GO87ELfRhzWHhiUDAn26Zv1JrKu7z2H5mJNhHoVvZGyEOpRfoieLu
 0wjnHCfJLLjZfI8bv861yNrR5MxCIWwR14hzS8JzI/Et4r7ZcMwogZNdG+nuC37bxEQb
 CsH/9FU/K9CoQGj1bQFTPBDZFoaDUzoQpuTuIOIIWyUniDFMH8Ysu92zP8TLYD971+Ab
 RNxtIZ1kn0pOIWQzG4URX/iS5wrsOe6l5CKI1jvJxgLIxbUcWyUAX1PS9LuSQUsNy5Rv
 eWgg==
X-Gm-Message-State: APjAAAXOuO0ip3aVzVlzMfQ6jAPQ+y09dHwKuWUmBd1KXbtdyNqWkfoz
 BF+/6dl3B0u7uiYR6xvL2PM=
X-Google-Smtp-Source: APXvYqw9ljJRtaYk1C+MaZKATjFuvS0ms3pUzEegvu2xIhkxddGbBZbqsQ+yNUguxpMqrqluvMffdA==
X-Received: by 2002:a05:651c:390:: with SMTP id
 e16mr4671922ljp.196.1572536512669; 
 Thu, 31 Oct 2019 08:41:52 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id v203sm2428879lfa.25.2019.10.31.08.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2019 08:41:51 -0700 (PDT)
Subject: Re: [PATCH -next] gpu: host1x: Fix compile test failure
To: Yuehaibing <yuehaibing@huawei.com>, thierry.reding@gmail.com,
 mperttunen@nvidia.com, arnd@arndb.de, seanpaul@chromium.org
References: <20191030135458.27960-1-yuehaibing@huawei.com>
 <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
 <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fe9c774b-7fec-e423-9cdb-e742fefbd4eb@gmail.com>
Date: Thu, 31 Oct 2019 18:41:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hs9AJBC+az+ICiDdHQdwfGOKMqZZjjUvDnX+IerCWm4=;
 b=Y5NUgS7W7OiIJXi6jmIl7T1HH8NU4D7KBflaK5Sq3mwQbHHqxGRNb7XZjwqah9S5S0
 MpKIHCt7H7zLw+88fN6/+vYHFIst8/xwmcLKzP4gvInLJcY+inYL8N2bYOa5iaIrNCZ0
 SZjxKGQzoAdaXaWsipubXD5a9dy8NY0oJmGlECGPd/qDvi0DIpQrPhVrMUOQKZXT0tdp
 C48g5+zj1G4D+/w3Pf1W3Dc0CIWPOj7D5Ypftawfbc4CIhLwh4qJQN49ujycuBFPm7gZ
 QUlSE/fqzwY/mxde1u3HHtcjM6yGrgy3+YMvvD6w/41kb6FVjvOKowlCksfVmP91CpID
 W++w==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MzEuMTAuMjAxOSAxNjozMywgWXVlaGFpYmluZyDQv9C40YjQtdGCOgo+IE9uIDIwMTkvMTAvMzEg
NjoyNiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAzMC4xMC4yMDE5IDE2OjU0LCBZdWVIYWli
aW5nINC/0LjRiNC10YI6Cj4+PiBJZiBJT01NVV9TVVBQT1JUIGlzIG5vdCBzZXQsIGJ1dCBJT01N
VV9JT1ZBIGlzIG0gYW5kCj4+PiBDT01QSUxFX1RFU1QgaXMgeSwgYnVpbGRpbmcgZmFpbHM6Cj4+
Pgo+Pj4gZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5vOiBJbiBmdW5jdGlvbiBgaG9zdDF4X3JlbW92
ZSc6Cj4+PiBkZXYuYzooLnRleHQrMHg2MjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBwdXRf
aW92YV9kb21haW4nCj4+PiBkZXYuYzooLnRleHQrMHg2MjQpOiByZWxvY2F0aW9uIHRydW5jYXRl
ZCB0byBmaXQ6IFJfQUFSQ0g2NF9DQUxMMjYgYWdhaW5zdCB1bmRlZmluZWQgc3ltYm9sIGBwdXRf
aW92YV9kb21haW4nCj4+PiBkZXYuYzooLnRleHQrMHg2MmMpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBpb3ZhX2NhY2hlX3B1dCcKPj4+IGRldi5jOigudGV4dCsweDYyYyk6IHJlbG9jYXRpb24g
dHJ1bmNhdGVkIHRvIGZpdDogUl9BQVJDSDY0X0NBTEwyNiBhZ2FpbnN0IHVuZGVmaW5lZCBzeW1i
b2wgYGlvdmFfY2FjaGVfcHV0Jwo+Pj4KPj4+IFNlbGVjdCBJT01NVV9JT1ZBIHdoaWxlIENPTVBJ
TEVfVEVTVCBpcyBzZXQgdG8gZml4IHRoaXMuCj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9i
b3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+Pj4gRml4ZXM6IDUyNDk5YTZhZDJhZSAoImdwdTogaG9z
dDF4OiBzZWxlY3QgSU9NTVVfSU9WQSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5
dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL2dwdS9ob3N0MXgvS2Nv
bmZpZyB8IDIgKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L0tjb25maWcgYi9k
cml2ZXJzL2dwdS9ob3N0MXgvS2NvbmZpZwo+Pj4gaW5kZXggY2Y5ODdhMy4uMzU0MjMyZCAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9LY29uZmlnCj4+PiArKysgYi9kcml2ZXJz
L2dwdS9ob3N0MXgvS2NvbmZpZwo+Pj4gQEAgLTIsNyArMiw3IEBACj4+PiAgY29uZmlnIFRFR1JB
X0hPU1QxWAo+Pj4gIAl0cmlzdGF0ZSAiTlZJRElBIFRlZ3JhIGhvc3QxeCBkcml2ZXIiCj4+PiAg
CWRlcGVuZHMgb24gQVJDSF9URUdSQSB8fCAoQVJNICYmIENPTVBJTEVfVEVTVCkKPj4+IC0Jc2Vs
ZWN0IElPTU1VX0lPVkEgaWYgSU9NTVVfU1VQUE9SVAo+Pj4gKwlzZWxlY3QgSU9NTVVfSU9WQSBp
ZiAoSU9NTVVfU1VQUE9SVCB8fCBDT01QSUxFX1RFU1QpCj4+PiAgCWhlbHAKPj4+ICAJICBEcml2
ZXIgZm9yIHRoZSBOVklESUEgVGVncmEgaG9zdDF4IGhhcmR3YXJlLgo+Pj4gIAo+Pj4KPj4KPj4g
SXQgc2hvdWxkIGJlIGJldHRlciB0byB1bmNvbmRpdGlvbmFsbHkgc2VsZWN0IElPTU1VX0lPVkEg
aGVyZS4KPj4KPj4gVGhlIHNhbWUgY291bGQgYmUgZG9uZSBmb3IgZHJpdmVycy9zdGFnaW5nL21l
ZGlhL3RlZ3JhLXZkZS8gYW5kCj4+IGRyaXZlcnMvZ3B1L2hvc3QxeC8sIHBsZWFzZSBzZWUgWzFd
Lgo+IAo+IFllcCwgSSB3aWxsIHJlcG9zdCwgdGhhbmtzIQoKT2gsIEkgbWlzc2VkIHRoYXQgeW91
IG1hZGUgYSBwYXRjaCBmb3IgaG9zdDF4IGFuZCBub3QgZm9yIGRybS4gVGh1cwpkcml2ZXJzL2dw
dS9kcm0vdGVncmEvIGFsc28gbmVlZHMgdGhlIHNhbWUgY2hhbmdlLgoKPj4KPj4gWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11LzIwMTkwODI5MTU0OTAyLkdDMTk4NDJAdWxt
by8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
