Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B222AD72E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 14:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA9D8958E;
	Tue, 10 Nov 2020 13:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258D089A86
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605013952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2V11rFQ3FKVTN+koXAVvig/bkOvKVZoOl9jWSSiZ8Ik=;
 b=Di+p8tHpuaV5rtMlatp24D6j8+WKmCUBtqz8yv0zCEdrS6sGXtBKp/ajiNQKnRgk1iVbBf
 EPgPhQ0oDcmNLweqKLA2uf1G287zKEdUoDcJ+SAJtNZ7ElvnOQlZ77m+OxtwtGg6hoPAvK
 H8JUZjK8UjW7EnlIU91t9XZBpHRi/X8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-WRf8j7dSN8CvND7dyAXeZA-1; Tue, 10 Nov 2020 08:12:31 -0500
X-MC-Unique: WRf8j7dSN8CvND7dyAXeZA-1
Received: by mail-qv1-f71.google.com with SMTP id q6so6044700qvr.21
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 05:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2V11rFQ3FKVTN+koXAVvig/bkOvKVZoOl9jWSSiZ8Ik=;
 b=Uo3ydFi72QU2Jaf850UeLhP/tY0AymdVYK8yvbFDHyLRmoeUU7X7lJK6KDrx4URDf1
 fAUg3p49r3buPrtjwUitKz7e4LzQud7ds8e0qoFL9s1TtoYYxZN2M6IdlQqmRQTQ2ibr
 SmfUNa3cqys7x2dH5K+1XnBkEWTdhPa02I+bTsYULPWwbey8Vuhwzns4I5zdNCd+2qo3
 m1waw2jLglb3SRp5A8DZYxU46Ip3zvPlOndtwzvbI1KjnqDTKNnMWCz0u6mCwxKnDDRZ
 4w8ZVdmvehQ9U64B2mj655MjyiDIqkhObKxZZoqfr5pzRP6Z82g9U0mLvDuuZwlVvoL+
 93Bw==
X-Gm-Message-State: AOAM5301ZmnjrO7x0Ow6Zc30WMiGme6qTN+zYlOI/DjU7QoMCFJi/O8G
 Ur2gwxRjLUdB1mCQmTPRlxGIF8CsVJxZMRuUDcjy67V9rxvo8njTT0hO5/08LQI2/dj6UMUD44v
 SSAZ/yCcm2+cLNm0R/z7jNTtf1Uzr
X-Received: by 2002:ac8:3621:: with SMTP id m30mr8787102qtb.168.1605013950447; 
 Tue, 10 Nov 2020 05:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRnI1rUF5eW2rST1vImtIogpOlMRBum2fO0dVCe+zUlRqVIaRBqmVo31rjlhOk2kmW2Hr8dQ==
X-Received: by 2002:ac8:3621:: with SMTP id m30mr8787064qtb.168.1605013950178; 
 Tue, 10 Nov 2020 05:12:30 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id e8sm7658678qti.28.2020.11.10.05.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 05:12:29 -0800 (PST)
Subject: Re: Subject: [RFC] clang tooling cleanups
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, cocci <cocci@systeme.lip6.fr>
References: <20201027164255.1573301-1-trix@redhat.com>
 <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <cc512954-2e1d-a165-f1f1-2c489fd6d3a9@redhat.com>
Date: Tue, 10 Nov 2020 05:12:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzkvMjAgNjo1MiBQTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gVHVlLCAyMDIwLTEw
LTI3IGF0IDA5OjQyIC0wNzAwLCB0cml4QHJlZGhhdC5jb20gd3JvdGU6Cj4+IFRoaXMgcmZjIHdp
bGwgZGVzY3JpYmUKPj4gQW4gdXBjb21pbmcgdHJlZXdpZGUgY2xlYW51cC4KPj4gSG93IGNsYW5n
IHRvb2xpbmcgd2FzIHVzZWQgdG8gcHJvZ3JhbWF0aWNhbGx5IGRvIHRoZSBjbGVhbiB1cC4KPj4g
U29saWNpdCBvcGluaW9ucyBvbiBob3cgdG8gZ2VuZXJhbGx5IHVzZSBjbGFuZyB0b29saW5nLgo+
Pgo+PiBUaGUgY2xhbmcgd2FybmluZyAtV2V4dHJhLXNlbWktc3RtdCBwcm9kdWNlcyBhYm91dCAx
MGsgd2FybmluZ3MuCj4+IFJldmlld2luZyB0aGVzZSwgYSBzdWJzZXQgb2Ygc2VtaWNvbG9uIGFm
dGVyIGEgc3dpdGNoIGxvb2tzIHNhZmUgdG8KPj4gZml4IGFsbCB0aGUgdGltZS4gIEFuIGV4YW1w
bGUgcHJvYmxlbQo+Pgo+PiB2b2lkIGZvbyhpbnQgYSkgewo+PiDCoMKgwqDCoMKgc3dpdGNoKGEp
IHsKPj4gwqDCoMKgwqDCoAkgICAgICAgY2FzZSAxOgo+PiAJICAgICAgIC4uLgo+PiDCoMKgwqDC
oMKgfTsgPC0tLSBleHRyYSBzZW1pY29sb24KPj4gfQo+Pgo+PiBUcmVld2lkZSwgdGhlcmUgYXJl
IGFib3V0IDEwMCBwcm9ibGVtcyBpbiA1MCBmaWxlcyBmb3IgeDg2XzY0IGFsbHllc2NvbmZpZy4K
Pj4gVGhlc2UgZml4ZXMgd2lsbCBiZSB0aGUgdXBjb21pbmcgY2xlYW51cC4KPiBjb2NjaW5lbGxl
IGFscmVhZHkgZG9lcyBzb21lIG9mIHRoZXNlLgo+Cj4gRm9yIGluc3RhbmNlOiBzY3JpcHRzL2Nv
Y2NpbmVsbGUvbWlzYy9zZW1pY29sb24uY29jY2kKPgo+IFBlcmhhcHMgc29tZSB0b29sIGNvb3Jk
aW5hdGlvbiBjYW4gYmUgZG9uZSBoZXJlIGFzCj4gY29jY2luZWxsZS9jaGVja3BhdGNoL2NsYW5n
L0xpbmRlbnQgY2FsbCBhbGwgYmUgdXNlZAo+IHRvIGRvIHNvbWUgZmFjZXQgb3IgYW5vdGhlciBv
ZiB0aGVzZSBjbGVhbnVwIGlzc3Vlcy4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgpJ
IHdpbGwgdGFrZSBhIGxvb2sgYXQgaXQuCgpUb20KCj4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
