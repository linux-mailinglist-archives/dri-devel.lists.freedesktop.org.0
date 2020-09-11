Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2040E268568
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBFB6E200;
	Mon, 14 Sep 2020 07:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941066E069
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 16:40:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v23so13025737ljd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s/H/gDz410T534CAt4TPbdHUY+qlZvAzdyyNfh+ES2I=;
 b=RhtS9pjymfijzTI6xem6SOzEF898S/QqhAEn1KdjA2bCT0MgB9o3Uro+UgFRTva06F
 LEVDgKjSTWHMytB5vn1xpCoXaSAhQrJfyT8cdKlH3Uarlz4FOgPT0mYVnapsWi8F6JEN
 TMLSRrWKyw+Mqs8GXt5oxBM3h+9NBXur5iQvVUiVYbW+Qr+1RbOb+Tp86MLfpcF7AEdh
 iM2AJGCE7moZMSDaUcJtQtVqV2usa1v6ZLB9HjCsTYj2XD8yOC+0P9WUcCRV3MMVLro5
 mzdofZ5zRwjc8mebp4UNrakC5RgQD6E9FcJOAUUHJLPCWD6v2Z8AP7mmcaZMxlS2UK0T
 /JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s/H/gDz410T534CAt4TPbdHUY+qlZvAzdyyNfh+ES2I=;
 b=MwwxBJeAZAE4TU4xywZnjdDf4N16tcUEYeaSp+Uh7MqNv9N6uBTnL6WA5eRqexgbfr
 HJbvMxmxd30CsHG4Q4NXZtrWIu1++MpBtkVDaPNHS8exggUu7PICe4h7sE3WU8VdyjJ5
 bMRY5xnHVhu3ySyugd4HZ2+Sfje5QIk3yP3EYAhIpMrncYuvYjA7rnkBm6oE8wClV75j
 3z6dh1WvMTiWAAAof/qW9il3Esos2cqfJVFZ8V2Yi14QLv8bB9wZFwcg6vWRbbA9Xgoa
 ADVamYXyWQwePhKKpgtpyRLuRSH8fBujKn/Tkm2hbD5f7lLZcelED8lLWAErYcc0r0im
 prYQ==
X-Gm-Message-State: AOAM531tTbnZmtcPH3ytV9UElxjRZMTouzccZdIKGtUvOjn3eQUR1AhB
 cQRpO5dV0wQtwXO1jkZcsQg=
X-Google-Smtp-Source: ABdhPJwVShUZYpjapXvRIR//ZQongBdDDi5huXKQAa0hbSUrTv/ffz5KoIzURpMgPoctRWXXejP5DQ==
X-Received: by 2002:a2e:9ad4:: with SMTP id p20mr1120622ljj.456.1599842410904; 
 Fri, 11 Sep 2020 09:40:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id 10sm500534lfq.64.2020.09.11.09.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 09:40:10 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
Date: Fri, 11 Sep 2020 19:40:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-11-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gKwl9IGVsc2Ug
ewo+ICsJCXN0cnVjdCBob3N0MXhfam9iICpmYWlsZWRfam9iID0gam9iOwo+ICsKPiArCQlob3N0
MXhfam9iX2R1bXAoZGV2LCBqb2IpOwo+ICsKPiArCQlob3N0MXhfc3luY3B0X3NldF9sb2NrZWQo
am9iLT5zeW5jcHQpOwo+ICsJCWZhaWxlZF9qb2ItPmNhbmNlbGxlZCA9IHRydWU7Cj4gKwo+ICsJ
CWxpc3RfZm9yX2VhY2hfZW50cnlfY29udGludWUoam9iLCAmY2RtYS0+c3luY19xdWV1ZSwgbGlz
dCkgewo+ICsJCQl1bnNpZ25lZCBpbnQgaTsKPiArCj4gKwkJCWlmIChqb2ItPnN5bmNwdCAhPSBm
YWlsZWRfam9iLT5zeW5jcHQpCj4gKwkJCQljb250aW51ZTsKPiArCj4gKwkJCWZvciAoaSA9IDA7
IGkgPCBqb2ItPm51bV9zbG90czsgaSsrKSB7Cj4gKwkJCQl1bnNpZ25lZCBpbnQgc2xvdCA9IChq
b2ItPmZpcnN0X2dldC84ICsgaSkgJQo+ICsJCQkJCQkgICAgSE9TVDFYX1BVU0hCVUZGRVJfU0xP
VFM7Cj4gKwkJCQl1MzIgKm1hcHBlZCA9IGNkbWEtPnB1c2hfYnVmZmVyLm1hcHBlZDsKPiArCj4g
KwkJCQltYXBwZWRbMipzbG90KzBdID0gMHgxYmFkMDAwMDsKPiArCQkJCW1hcHBlZFsyKnNsb3Qr
MV0gPSAweDFiYWQwMDAwOwoKVGhlIDB4MWJhZDAwMDAgaXMgYSB2YWxpZCBtZW1vcnkgYWRkcmVz
cyBvbiBUZWdyYTIwLgoKVGhlIDB4NjAwMDAwMDAgaXMgaW52YWxpZCBwaHlzIGFkZHJlc3MgZm9y
IGFsbCBoYXJkd2FyZSBnZW5lcmF0aW9ucy4KSXQncyB1c2VkIGJ5IGdyYXRlLWtlcm5lbCBbMV0g
YW5kIFZERSBkcml2ZXIgWzJdLiBOb3RlIHRoYXQgdGhlIDB4NiA8PAoyOCBpcyBhbHNvIGludmFs
aWQgSG9zdDF4IG9wY29kZSwgd2hpbGUgMHgxIHNob3VsZCBicmVhayBDRE1BIHBhcnNlcgpkdXJp
bmcgb2YgUEIgZGVidWctZHVtcGluZy4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUtZHJp
dmVyL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uaCNMMTYKClsy
XQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJjNC9zb3VyY2UvZHJpdmVy
cy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZkZS9pb21tdS5jI0w5OQoKVGhlIFZERSBkcml2ZXIgcmVz
ZXJ2ZXMgdGhlIHRyYXBwaW5nIElPVkEgYWRkcmVzc2VzLCBJIGFzc3VtZSB0aGUgSG9zdDF4CmRy
aXZlciBzaG91bGQgZG8gdGhlIHNhbWUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
