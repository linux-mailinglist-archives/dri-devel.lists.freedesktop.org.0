Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CDE32D927
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 19:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B756EA3F;
	Thu,  4 Mar 2021 18:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4426EA3F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 18:03:05 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id d13so31064795edp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Mar 2021 10:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=JOrTC958Hjmd5GcWd5gySSwqx1YxjHR3xrSXr7gF8wE=;
 b=ErG1VoXZIvTQ7D2O17hIslapLdykF4mw9OGdlm1VdDmH+sDKrvVOx4Jn3mN8JVu1a5
 AA2tef31k2OFSh2ggr1xnbbtuY4lk8XRj+kdp6y5XHcn2CrvR5IAg2E1xOO/bMQRs7V/
 crGaWFNc+iZRYBbLAYZSQHjPOdQ3x/ExjWFZ+Blyjdf1pHHFkNuw0hU7jHKeR1t16ufM
 YwBs4grt+7FtNIfL5Fj8Xhh0DuCN86HDSI/izCMDqsABXeharjCuUC589ZrhUvKQ0K5U
 zXfYoBneFtT/+7q+dwZbSG+byyDif9cbIhFJp5C3POFC4kpftN2a0XqqdKRvvwDzGcB2
 xhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JOrTC958Hjmd5GcWd5gySSwqx1YxjHR3xrSXr7gF8wE=;
 b=l9kQtVCKTyR3z+yQDM5ss21FMRwYzxmpzHmwl9c0jZKIFFhOeiJzkfpN0q/dewiGFc
 Zcns0t1+w+L1fEh9GZD3X4sGSAEy3z8YC6xrQspFPdo7uOSWqi8QWsiDpOX3325aepMe
 CpDFhxocXrEQqyZqpSM0g9zex81Cfb2HGJsB5RVyHAk/Wv29xPt8ilD9dwHNLMYPnafU
 6hrPmrSafRpJUDAjBoEM8rthwjOWuV22wZCnYBWswi9xRLe7M0mLKEyr5LpvqVyu+BSg
 IB5aWxZ6SZ3zoJ+eOrf3IkUl1LaqgkwmaHc2A603al5N9MIoMHduRLeGOw+scMihwZJ5
 /vpg==
X-Gm-Message-State: AOAM533RLg5v3JOT+5CeiKF/MuiN88HH1a68HtX9lLJ0XFZQQAfrB2kl
 A61yvF1RVb42t/aQXdjyuqGKYMODODCBKw==
X-Google-Smtp-Source: ABdhPJwUPP3aoIhbFClhu9fJ4zui1Dp1wlOPjaafK+gKI8tUcSbfUC2VnZwJ91wKhaogyeaPX8gbEg==
X-Received: by 2002:a05:6402:84b:: with SMTP id
 b11mr5685778edz.56.1614880979292; 
 Thu, 04 Mar 2021 10:02:59 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:3d04:4b7c:635f:3a0?
 ([2a02:908:1252:fb60:3d04:4b7c:635f:3a0])
 by smtp.gmail.com with ESMTPSA id eo22sm30092ejc.0.2021.03.04.10.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 10:02:58 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: soften TTM warnings
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210303155757.82497-1-christian.koenig@amd.com>
 <20210304140509.u33mxittujxubaaj@sirius.home.kraxel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a2191eb8-bfd5-b1fb-bd6d-d84c6561c076@gmail.com>
Date: Thu, 4 Mar 2021 19:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304140509.u33mxittujxubaaj@sirius.home.kraxel.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwNC4wMy4yMSB1bSAxNTowNSBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4gT24gV2VkLCBN
YXIgMDMsIDIwMjEgYXQgMDQ6NTc6NTdQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gUVhMIGluZGVlZCB1bnJlZnMgcGlubmVkIEJPcyBhbmQgdGhlIHdhcm5pbmdzIGFyZSBzcGFt
bWluZyBwZW9wbGVzIGxvZyBmaWxlcy4KPj4KPj4gTWFrZSBzdXJlIHdlIHdhcm4gb25seSBvbmNl
IHVudGlsIHRoZSBRWEwgZHJpdmVyIGlzIGZpeGVkLgo+PiAtCWRtYV9yZXN2X2Fzc2VydF9oZWxk
KGJvLT5iYXNlLnJlc3YpOwo+PiArCWlmICghYm8tPmRlbGV0ZWQpCj4+ICsJCWRtYV9yZXN2X2Fz
c2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpOwo+IEhtbT8gIEknbSBub3QgYXdhcmUgb2YgcXhsIGhh
dmluZyBwcm9ibGVtcyB3aXRoIHRoaXMgb25lLgo+IERpZCBJIG1pc3Mgc29tZXRoaW5nPwoKU2Vl
IHRoZSBtYWlsIGZyb20gUGV0ZXIsIGJ1dCBhc3NlcnRzIHdlcmUgdHJpZ2dlcmVkIHdoZW4gdGhl
IHBpbl9jb3VudCAKd2FzIG5vbiB6ZXJvIGFuZCBkZXN0cnVjdGlvbi4KCj4KPj4gLQkJaWYgKFdB
Uk5fT04oYm8tPnBpbl9jb3VudCkpIHsKPj4gKwkJaWYgKFdBUk5fT05fT05DRShiby0+cGluX2Nv
dW50KSkgewo+IFdlbGwsIGFzIHRlbXBvcmFyeSB0aGluZyB0aGlzIGlzIHJhdGhlciBwb2ludGxl
c3MsIHF4bCBmaXggZm9yIHRoaXMgb25lCj4gaXMgYWxyZWFkeSBxdWV1ZWQgaW4gZHJtLW1pc2Mt
Zml4ZXMgc28gdGhpcyB3b3VsZCBvbmx5IGxhbmQgYWZ0ZXIgdGhlCj4gcXhsIGZpeGVzIC4uLgo+
Cj4gQnV0IEkgdGhpbmsgdXNpbmcgV0FSTl9PTl9PTkNFKCkgaXMgYSBnb29kIGlkZWEgaW4gZ2Vu
ZXJhbCwgZXNwZWNpYWxseQo+IGluIGEgY29kZSBwYXRoIGxpa2UgdGhpcyB3aGVyZSBhIHNpbmds
ZSBidWcgY2FuIGVhc2lseSBjYXVzZSBhIGZsb29kIG9mCj4gc3RhY2sgdHJhY2VzLgoKV2VsbCB0
aGF0IGZsb29kIG9mIHN0YWNrIHRyYWNlcyBjYW4gYWxzbyBiZSBoZWxwZnVsLCBjYXVzZSBpdCBt
YWtlcyAKcGVvcGxlIHJlcG9ydCBzdWNoIGtpbmQgb2YgaXNzdWVzIGltbWVkaWF0ZWx5LgoKQW55
d2F5IEknbSBnb2luZyB0byBrZWVwIHRoYXQgV0FSTl9PTl9PTkNFIGZvciBhIGN5Y2xlIG9yIHR3
byBhbmQgaWYgSSAKZG9uJ3QgaGVhciBhbnkgbW9yZSBjb21wbGFpbnMgSSdtIGdvaW5nIHRvIGNv
bXBsZXRlbHkgcmVtb3ZlIHRoaXMgCiJmZWF0dXJlIiBhbmQganVzdCBhbHdheXMgd2FybiB3aGVu
IHdlIHNlZSBhIG5vbiB6ZXJvIHBpbl9jb3VudCBvbiAKZGVzdHJ1Y3Rpb24uCgpDaHJpc3RpYW4u
Cgo+Cj4gQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+Cj4gdGFr
ZSBjYXJlLAo+ICAgIEdlcmQKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
