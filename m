Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4F27BDAF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3619F89E32;
	Tue, 29 Sep 2020 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F48F89B0C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:04:34 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id s14so2004252pju.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=RJCBm+SExKQXhoNNt6cZz3q3IYgQOBDeM3UdJw1s5TE=;
 b=JIVBTkvwa8dAIMVTumigP3fdPqsCfbZ05sZNj5b1m4wIQ13cUd/SubxMhe1dW7/tUU
 IEbC+DvmVAtjfZ22hd0NZ1cL5yS1scjk4ooWUBVcxqt0adDzXep9pTb1yjoHb0+7jfUy
 ImUNuH6JQO2CC9qomK13frrNdC+q2Kh0ySkpcyeHbx2ElKKL0Y9vN2izIVBiYhfe+mc+
 NCQ12LKOhMv1XAku4qjZK1K4b7H7/yQyHMcVhIwKfIrZWJ082ywQ1BLafO+cHak8KAlC
 Ek877Ee3OLWLrwjH/Prm2jyfGOCNwM7aiPlQq1VNMrXVyqy+YqgnoGsPCQ/Ogur7pDJa
 LsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=RJCBm+SExKQXhoNNt6cZz3q3IYgQOBDeM3UdJw1s5TE=;
 b=rcBauwz6fCkOrS07yqkJbZlDLaUQ5hG4PBvpd+z549yqdv97yfW5If9PBuhB434ctK
 N5QvUL7LjE+DdjNUqAtvCJK4DncuahMRZnQqbRYHA+uthFxiyt5cGXluRBTIIrfS+Ueo
 EUg0igQ0cLZAd4M+fbaEms1Jsame77FFP5MO/WD5EfCv/3LVfnhp1dinHhyH6NHFBdzP
 8Q5kXVzua1Ph7KhEriZD1cUhB9bymuq6MoITv98woShY977oR5N5pKx3lx5iZm4kKSn1
 8fkbrAwqIiIovA0u9Skkw8fYPzrmxbaW0fiQQPCWWx+segknwGb84i7P2HbvJgBj6anF
 eelw==
X-Gm-Message-State: AOAM532g8wHhZh3aLPB1Nyz8LRIL9q0c+N59M7AbAgeXqJiNRjWznwy1
 DYRM4HlWIxul5W//quxm2D0f9w==
X-Google-Smtp-Source: ABdhPJyvu/DIOXRutdhbldQ+CUKy6EYFVMjphqk8vlLEsJopKhnoHBvXGS8LHhKNLPmhfG3ervbCgw==
X-Received: by 2002:a17:90b:f0b:: with SMTP id
 br11mr644868pjb.191.1601287473743; 
 Mon, 28 Sep 2020 03:04:33 -0700 (PDT)
Received: from [10.86.118.224] ([103.136.221.71])
 by smtp.gmail.com with ESMTPSA id k11sm806168pjs.18.2020.09.28.03.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 03:04:33 -0700 (PDT)
Subject: Re: [External] Re: [PATCH 2/2] sched: mark
 PRINTK_DEFERRED_CONTEXT_MASK in __schedule()
To: Peter Zijlstra <peterz@infradead.org>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20200927161130.33172-1-zhouchengming@bytedance.com>
 <20200927161130.33172-2-zhouchengming@bytedance.com>
 <20200928073202.GA2611@hirez.programming.kicks-ass.net>
 <40ab934e-5b8b-735b-da65-3043efab9fdc@bytedance.com>
 <20200928090143.GA2628@hirez.programming.kicks-ass.net>
From: Chengming Zhou <zhouchengming@bytedance.com>
Message-ID: <688eadd7-4ca3-3e32-3520-25977ff059a6@bytedance.com>
Date: Mon, 28 Sep 2020 18:04:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928090143.GA2628@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: juri.lelli@redhat.com, pmladek@suse.com, vincent.guittot@linaro.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
 sergey.senozhatsky@gmail.com, mingo@redhat.com, mgorman@suse.de,
 songmuchun@bytedance.com, dietmar.eggemann@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDIwLzkvMjgg5LiL5Y2INTowMSwgUGV0ZXIgWmlqbHN0cmEg5YaZ6YGTOgo+IE9uIE1v
biwgU2VwIDI4LCAyMDIwIGF0IDA0OjU0OjUzUE0gKzA4MDAsIENoZW5nbWluZyBaaG91IHdyb3Rl
Ogo+PiDlnKggMjAyMC85LzI4IOS4i+WNiDM6MzIsIFBldGVyIFppamxzdHJhIOWGmemBkzoKPj4+
IE9uIE1vbiwgU2VwIDI4LCAyMDIwIGF0IDEyOjExOjMwQU0gKzA4MDAsIENoZW5nbWluZyBaaG91
IHdyb3RlOgo+Pj4+IFRoZSBXQVJOX09OL1dBUk5fT05fT05DRSB3aXRoIHJxIGxvY2sgaGVsZCBp
biBfX3NjaGVkdWxlKCkgc2hvdWxkIGJlCj4+Pj4gZGVmZXJyZWQgYnkgbWFya2luZyB0aGUgUFJJ
TlRLX0RFRkVSUkVEX0NPTlRFWFRfTUFTSywgb3Igd2lsbCBjYXVzZQo+Pj4+IGRlYWRsb2NrIG9u
IHJxIGxvY2sgaW4gdGhlIHByaW50ayBwYXRoLgo+Pj4gSXQgYWxzbyBzaG91bGRuJ3QgaGFwcGVu
IGluIHRoZSBmaXJzdCBwbGFjZSwgc28gd2hvIGJsb29keSBjYXJlcy4KPj4gWWVzLCBidXQgaWYg
b3VyIGJveCBkZWFkbG9jayBqdXN0IGJlY2F1c2UgYSBXQVJOX09OX09OQ0UsIHdlIGhhdmUgdG8K
Pj4gcmVib290IDogKAo+IFlvdSBoYXZlIHRvIHJlYm9vdCBhbnl3YXkgdG8gZ2V0IGludG8gdGhl
IGZpeGVkIGtlcm5lbC4KCk1vc3RseSwgV0FSTl9PTl9PTkNFIGhhcHBlbmVkIGluIHRoZSBwZXJm
IGNvZGUgb24gb3VyIG1hY2hpbmVzLCB3ZSBhY3R1YWxseQoKZG9uJ3QgY2FyZSB0b28gbXVjaCBh
Ym91dCB0aGUgcGVyZiBmdW5jdGlvbiB3b3JrcyA6ICnCoMKgIExvb2tzIGxpa2Ugd2UKaGF2ZSB0
byBmaW5kIGFuZAoKZml4IHRoYXQgcGVyZiBidWcgYmVmb3JlIGdvIG9uLi4uCgo+PiBTbyB0aGVz
ZSBXQVJOX09OX09OQ0UgaGF2ZSBCVUdfT04gZWZmZWN0ID/CoCBPciB3ZSBzaG91bGQgY2hhbmdl
IHRvIHVzZQo+PiBCVUdfT04gPwo+IE9yIHVzZSBhIHNhbmUgcHJpbnRrIGltcGxlbWVudGF0aW9u
LCBJIG5ldmVyIHN1ZmZlciB0aGlzLgoKV2VsbCwgeW91IGFyZSBsdWNreS4gU28gaXQncyBhIHBy
b2JsZW0gaW4gb3VyIHByaW50ayBpbXBsZW1lbnRhdGlvbi4KClRoZSBkZWFkbG9jayBwYXRoIGlz
OgoKcHJpbnRrCgrCoCB2cHJpbnRrX2VtaXQKCsKgwqDCoCBjb25zb2xlX3VubG9jawoKwqAgwqAg
wqAgdnRfY29uc29sZV9wcmludAoKwqAgwqAgwqAgwqAgaGlkZV9jdXJzb3IKCsKgIMKgIMKgIMKg
IMKgIGJpdF9jdXJzb3IKCsKgIMKgIMKgIMKgIMKgIMKgIHNvZnRfY3Vyc29yCgrCoCDCoCDCoCDC
oCDCoCDCoCDCoCBxdWV1ZV93b3JrX29uCgrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBfX3F1ZXVl
X3dvcmsKCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRyeV90b193YWtlX3VwCgrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBfcmF3X3NwaW5fbG9jawoKwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgbmF0aXZlX3F1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgKCkxvb2tzIGxp
a2UgaXQncyBpbnRyb2R1Y2VkIGJ5IHRoaXMgY29tbWl0OgoKZWFhNDM0ZGVmYWNhMTc4MWZiMjkz
MmM2ODUyODliNjEwYWViOGI0YgoKImRybS9mYi1oZWxwZXI6IEFkZCBmYl9kZWZlcnJlZF9pbyBz
dXBwb3J0IgoKwqDCoMKgIFRoaXMgYWRkcyBkZWZlcnJlZCBpbyBzdXBwb3J0IHRvIGRybV9mYl9o
ZWxwZXIuCsKgwqDCoCBUaGUgZmJkZXYgZnJhbWVidWZmZXIgY2hhbmdlcyBhcmUgZmx1c2hlZCB1
c2luZyB0aGUgY2FsbGJhY2sKwqDCoMKgIChzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICopLT5mdW5j
cy0+ZGlydHkoKSBieSBhIGRlZGljYXRlZCB3b3JrZXIKwqDCoMKgIGVuc3VyaW5nIHRoYXQgaXQg
YWx3YXlzIHJ1bnMgaW4gcHJvY2VzcyBjb250ZXh0LgrCoMKgwqAKwqDCoMKgIEZvciB0aG9zZSB3
b25kZXJpbmcgd2h5IHdlIG5lZWQgdG8gYmUgYWJsZSB0byBoYW5kbGUgYXRvbWljIGNhbGxpbmcK
wqDCoMKgIGNvbnRleHRzOiBCb3RoIHBhbmljIHBhdGhzIGFuZCBjdXJzb3IgY29kZSBhbmQgZmJj
b24gYmxhbmtpbmcgY2FuIHJ1bgrCoMKgwqAgZnJvbSBhdG9taWMuIFNlZQrCoMKgwqAKwqDCoMKg
IGNvbW1pdCBiY2IzOWFmNDQ4NmJlMDdlODk2ZmMzNzRhMjMzNmJhZDMxMDRhZTBhCsKgwqDCoCBB
dXRob3I6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CsKgwqDCoCBEYXRlOsKgwqAg
VGh1IEZlYiA3IDExOjE5OjE1IDIwMTMgKzEwMDAKwqDCoMKgCsKgwqDCoMKgwqDCoMKgIGRybS91
ZGw6IG1ha2UgdXNhZ2UgYXMgYSBjb25zb2xlIHNhZmVyCsKgwqDCoArCoMKgwqAgZm9yIHdoZXJl
IHRoaXMgd2FzIG9yaWdpbmFsbHkgZGlzY292ZXJlZC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
