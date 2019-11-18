Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EBA1005B2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AA96E4E6;
	Mon, 18 Nov 2019 12:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359766E4E6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:34:01 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-0xs8nqf2PmW74dTbgbDnvQ-1; Mon, 18 Nov 2019 07:33:58 -0500
Received: by mail-wr1-f72.google.com with SMTP id u2so15260485wrm.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 04:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=39oqToYn1Z9ihjo2uyn5Oqqs8SmkZ5gSZbt3umynrbo=;
 b=OvY7tSBxWg30VZfCI52eJrGx/AEv2pp8pZk+8jxkRRua+eFN4WIa/43onufZZYQIuf
 Eoy6+2VV7MDmMK185dQ4YzdMJcQpJDjex0m2vZojSY4REcgqy1bWMaTNhXed3qKUuxca
 s/W7qzWGcfUZfPCjnlqi6RTsjpjZcNiBM5AxTM/u/c6Q9bgoz5sOXT2wo0QUa09jheEr
 oD84ABy7Bxw3LC/QxQhEW5TGeIK/Lt1gNM9xxggDnlLHquA0DHmGXkQXrMbld47ZnGET
 tEBUz1uZlcxGZnsbHK5ZBF4zDb1kvGUW2R21IFFzaT/5hnLNoepe0bmgmXTdEDGoZTQt
 y3Yg==
X-Gm-Message-State: APjAAAVe+KhR6VwxNlvfrgeVefPdOlu6TaJNYC9OFp3KUmUViEafDUr4
 leSMclQJU1Zcup7bjhwhzBqk4bfeLyjYwqTSRExxal7Vd056J+DM6rQMyAsQj7mbWbS+pjX4/pl
 3rz+3mH5Soh8ZdjBlKdXTOEw3zo2M
X-Received: by 2002:adf:9323:: with SMTP id 32mr29637487wro.15.1574080437250; 
 Mon, 18 Nov 2019 04:33:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqyK+Jo2n2eVEF/5wRe1g+C7/sUA4hlgcyUoignOGlUzjR1uh4HFtpNtGFp9IPIe+prIHODgQQ==
X-Received: by 2002:adf:9323:: with SMTP id 32mr29637468wro.15.1574080437070; 
 Mon, 18 Nov 2019 04:33:57 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id a8sm20105135wme.11.2019.11.18.04.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2019 04:33:56 -0800 (PST)
Subject: Re: [PATCH v2 11/13] drm/modes: parse_cmdline: Explicitly memset the
 passed in drm_cmdline_mode struct
To: Maxime Ripard <mripard@kernel.org>
References: <20191113164434.254159-1-hdegoede@redhat.com>
 <20191113164434.254159-11-hdegoede@redhat.com>
 <20191118122816.GJ4345@gilmour.lan>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <da4aac4b-08a4-6831-d2e3-1e4d0e7aac7b@redhat.com>
Date: Mon, 18 Nov 2019 13:33:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191118122816.GJ4345@gilmour.lan>
Content-Language: en-US
X-MC-Unique: 0xs8nqf2PmW74dTbgbDnvQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574080440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FB8dI4hIlavJLZ4FLmtD2wh5qomNzvtvN/iRiCNBpgw=;
 b=AncgxSF8x8BgAmn2wlWNZhcjkRjsHLmNhryYD4o5+ZJ+SS9OmhEFFcU89oheJejjLfL5PT
 uJ1MAEQSCSPUx72ES6vL/ySwmf9J8S8x0sA8wpblqb/jIcLOXXnvJwFuEIHLdQs77102DU
 kdLJwAIoeeHUhyM3SQnNOSYKLG6vWn0=
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
Cc: David Airlie <airlied@linux.ie>, Derek Basehore <dbasehore@chromium.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxOC0xMS0yMDE5IDEzOjI4LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+IE9uIFdlZCwg
Tm92IDEzLCAyMDE5IGF0IDA1OjQ0OjMyUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+
IEluc3RlYWQgb2Ygb25seSBzZXR0aW5nIG1vZGUtPnNwZWNpZmllZCBvbiBmYWxzZSBvbiBhbiBl
YXJseSBleGl0IGFuZAo+PiBsZWF2aW5nIGUuZy4gbW9kZS0+YnBwX3NwZWNpZmllZCBhbmQgbW9k
ZS0+cmVmcmVzaF9zcGVjaWZpZWQgYXMgaXMsCj4+IGxldHMgYmUgY29uc2lzdGVudCBhbmQganVz
dCB6ZXJvIG91dCB0aGUgZW50aXJlIHBhc3NlZCBpbiBzdHJ1Y3QgYXQKPj4gdGhlIHRvcCBvZiBk
cm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3RvcigpCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDUgKystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4+IGlu
ZGV4IGJlYjc2NGVmZTZiMy4uMWZlZTRhNzFlZmY3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4+
IEBAIC0xNzQ1LDEyICsxNzQ1LDExIEBAIGJvb2wgZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5l
X2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24sCj4+ICAgCWNoYXIgKmJwcF9l
bmRfcHRyID0gTlVMTCwgKnJlZnJlc2hfZW5kX3B0ciA9IE5VTEw7Cj4+ICAgCWludCBpLCBsZW4s
IHJldDsKPj4KPj4gKwltZW1zZXQobW9kZSwgMCwgc2l6ZW9mKCptb2RlKSk7Cj4+ICAgCW1vZGUt
PnBhbmVsX29yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fVU5LTk9XTjsK
PiAKPiBUaGUgcmVwb3J0ZWQgZXJyb3IgYnkga2J1aWxkIHJpbmdzIGEgYmVsbC4gSSB0aGluayBJ
IHRyaWVkIHRvIGRvIHRoaXMsCj4gc2F3IHRoYXQgZXJyb3IsIGFuZCB0aGVuIGZvcmdvdCBhYm91
dCBpdC4KCmtidWlsZChib3QpIGVycm9yID8gSSBkaWQgbm90IHNlZSBhbnkgbWVzc2FnZXMgYWJv
dXQgdGhhdCBmb3IgdGhpcyBwYXRjaCwKbm9yIGRvIEkgc2VlIGFueSBtYWlscyBhYm91dCB0aGlz
IGluIHRoZSBhcmNoaXZlcz8KCgpSZWdhcmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
