Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E115F38F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7901D6E283;
	Thu,  4 Jul 2019 07:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1F66E0F9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 08:56:01 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t132so863708pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 01:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XdF8qJKb1GAY42zfZPi3PXK4hyrVRJ+7cGCa7TlVzFA=;
 b=au3OjMmmb/GsKySdnTc2qWqNHIhI+pNhx2FCd/k8EKNElnzoKVhQZGYFWGbC70dwSZ
 lMjKHGCSk5Fokv233+wAAFBxwybrLlBjm3Xa5WKtRYBUhS3YIAlKHvEViveIA9k3VyG8
 7OBC9RULB9MFjKhiGsJx9m3l6h3DX4MLPDIfUT5QOkdFs44lVt0LkfhC1YBA/Vzicrmo
 ZtPNl2qrRtjKACmvSEuIOloXm0j/9WgQyAOrGkWAa5Pa65F9fZSf0cVLujKhqR2gT8yN
 +IEpSwevKruj+x2cqhKVPmq+Jjk5WjLJOHOMbzwMgTcgnyeW4jzNdy3WbDNIyWfq35V4
 pgAA==
X-Gm-Message-State: APjAAAXLExhsA4CGxBX30px98baczGdmAs4XZNsUb7IL3+zk1mnWSLUd
 KP+Byu4aDqcVIog70DfLjX5L2drq
X-Google-Smtp-Source: APXvYqz2lKZCQ2W2iw7xVJWEcklLamDKp+dNwJk6EOxWr2KojHD3pFBw0MkDt6Wh22QMXeCEbznJRw==
X-Received: by 2002:a17:90a:1b0c:: with SMTP id
 q12mr11452111pjq.76.1562144161421; 
 Wed, 03 Jul 2019 01:56:01 -0700 (PDT)
Received: from [10.0.2.15] ([122.163.64.117])
 by smtp.gmail.com with ESMTPSA id 201sm3453882pfz.24.2019.07.03.01.55.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 01:56:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] staging: android: ion: Remove file ion_carveout_heap.c
To: Greg KH <gregkh@linuxfoundation.org>
References: <20190703081842.22872-1-nishkadg.linux@gmail.com>
 <20190703083745.GB8996@kroah.com>
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <380a7fb4-d299-a3ee-43ae-0822ec25ece6@gmail.com>
Date: Wed, 3 Jul 2019 14:14:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190703083745.GB8996@kroah.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XdF8qJKb1GAY42zfZPi3PXK4hyrVRJ+7cGCa7TlVzFA=;
 b=rrDxzS1sEOQF3ISU/GawXGpYCs32yVh/dsYMhAX7Plfyz2Yv2rcQY9WG59q7BEeARz
 ZBnjhRLeJhyNCoWlgSMVWxjkFjWSX9q9coQ3H/q4mugg3pddeMf4nUBKZmNxon52gNNH
 utQVru9TMjWUacPabPRgdsEx3cvdrGV0aZHYmrHxkWzJq9EpiLGj1bG5VTWdLg8TNLoO
 QnGX2IAdbNjZOLpuyzAJ8JFyXK/YCCteejKjKvZh9zS6296Aei0auK723BG+RLL/xC0k
 sb1hjBvExw7sz0209p77KnKoEG/YwW/3K/hdtRKPFEP1LcZ8pkNPXkc7GuLLCljgiytA
 muMQ==
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
Cc: devel@driverdev.osuosl.org, tkjos@android.com,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 arve@android.com, joel@joelfernandes.org, maco@android.com,
 christian@brauner.io
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDMvMDcvMTkgMjowNyBQTSwgR3JlZyBLSCB3cm90ZToKPiBPbiBXZWQsIEp1bCAwMywgMjAx
OSBhdCAwMTo0ODo0MVBNICswNTMwLCBOaXNoa2EgRGFzZ3VwdGEgd3JvdGU6Cj4+IFJlbW92ZSBm
aWxlIGlvbl9jYXJ2ZW91dF9oZWFwLmMgYXMgaXRzIGZ1bmN0aW9ucyBhbmQgZGVmaW5pdGlvbnMg
YXJlIG5vdAo+PiB1c2VkIGFueXdoZXJlLgo+PiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5pc2hrYSBEYXNndXB0YSA8bmlzaGthZGcubGludXhAZ21h
aWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vS2NvbmZpZyAg
ICAgICAgICAgfCAgIDkgLS0KPj4gICBkcml2ZXJzL3N0YWdpbmcvYW5kcm9pZC9pb24vTWFrZWZp
bGUgICAgICAgICAgfCAgIDEgLQo+PiAgIC4uLi9zdGFnaW5nL2FuZHJvaWQvaW9uL2lvbl9jYXJ2
ZW91dF9oZWFwLmMgICB8IDEzMyAtLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiBJIGtlZXAgdHJ5aW5n
IHRvIGRvIHRoaXMsIGJ1dCBvdGhlcnMgcG9pbnQgb3V0IHRoYXQgdGhlIGlvbiBjb2RlIGlzCj4g
ImdvaW5nIHRvIGJlIGZpeGVkIHVwIHNvb24iIGFuZCB0aGF0IHBlb3BsZSByZWx5IG9uIHRoaXMg
aW50ZXJmYWNlIG5vdy4KPiBXZWxsLCAiY29kZSBvdXRzaWRlIG9mIHRoZSBrZXJuZWwgdHJlZSIg
cmVsaWVzIG9uIHRoaXMsIHdoaWNoIGlzIG5vdCBvaywKPiBidXQgdGhlICJzb29uIiBwZW9wbGUg
a2VlcCBpbnNpc3Rpbmcgb24gaXQuLi4KPiAKPiBPZGRzIGFyZSBJIHNob3VsZCBqdXN0IGRlbGV0
ZSBhbGwgb2YgSU9OLCBhcyB0aGVyZSBoYXNuJ3QgYmVlbiBhbnkKPiBmb3J3YXJkIHByb2dyZXNz
IG9uIGl0IGluIGEgbG9uZyB0aW1lLgoKSSdtIHNvcnJ5LCBJIGRvbid0IHRoaW5rIEkgdW5kZXJz
dGFuZC4gU2hvdWxkIEkgZHJvcCB0aGVzZSBwYXRjaGVzIGZyb20gCm15IHRyZWUgdGhlbj8KClRo
YW5raW5nIHlvdSwKTmlzaGthCgo+IEhvcGVmdWxseSB0aGF0IHdha2VzIHNvbWUgcGVvcGxlIHVw
Li4uCj4gCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
