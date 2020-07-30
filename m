Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1723318A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 14:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22AE6E1B9;
	Thu, 30 Jul 2020 12:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD256E1B9;
 Thu, 30 Jul 2020 12:03:12 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l23so6045144edv.11;
 Thu, 30 Jul 2020 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=kTyIB8a8ynCW3WqaP6UVysZ6xRftgn4zqn+hfslnyfk=;
 b=UwzAb5zoVB/2SjBmyyK0tLHY6mooRDRvP1GGboYTwuAR8aHTPIErlWnGYl+QMCAnIL
 yQA5KglMPV1nEtOb7DHGActKRO3l8MWgwOdaNahAYgA3kHgOmBgMXlGd2HI9I8iRrQrJ
 wJgVaeOvoH9XzlJzskZo1NyVdWeLw8x2PUPy1EZNT20QfesYz3oX5U7qNS1xgX7sfzrF
 ENVjmOvisgVOKKSpbzThAIbdpGEoAqwPm4q8ioaTNwxJIf0jtmIbYv7mae6ThqRWT497
 KWPqBviEq0zDV183wqqQXIByMXeJUlfa7qFmI44NwRQI+wpNK/TIMHfUciugJyaNUJpg
 VLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=kTyIB8a8ynCW3WqaP6UVysZ6xRftgn4zqn+hfslnyfk=;
 b=DrYwu8osCgYAKouYYOmUN0PL/DBF8k0/PFvLUDSVZIdJbgJfiypM9j3YzIDbl2ALrv
 eJ1OkAfj1c86pLG/cHrhm6sf9p+8I0EnGWYoW0e6VajchtDnEfCN1Reotm+OxcW045ou
 PbBnnJIDcMQeaimyquUnA9UFy+kJLyWMU20VTShR/2IpgeOcdTQKTAft3Hzi0/JDbYcK
 Vyj8sVr9vjnAU9sIemCq32nc05yhq7VIo96ZTKhQvv8At1/VHeRDegtryKq1bZMpA0rD
 Kx3zdcsDiI7Vl9VwgcMIzm1AV6ZlzvRxQ3aeHsqW0EAv0uXTblPwDeQPIAoHGvdVBXjj
 tbAg==
X-Gm-Message-State: AOAM532b3jOPP0krQjDvyiBdl6Mmk5cD2cbM+K9PN0BTPl0XHKNf+Z8g
 fmyrtOgEpcApKdqGUkCLSf0=
X-Google-Smtp-Source: ABdhPJz6WS7N0D21c7MBqLBmnP9+Pig+3y1KgatNCRD3IGpud2kNLYc1R2efcFjX5Wl6CLo5SVCOnQ==
X-Received: by 2002:aa7:ca4f:: with SMTP id j15mr1460242edt.334.1596110591672; 
 Thu, 30 Jul 2020 05:03:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b18sm5628976ejc.41.2020.07.30.05.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 05:03:11 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] dma-resv: lockdep-prime
 address_space->i_mmap_rwsem for dma-resv
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200728135839.1035515-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b9b42b4e-78cd-ed10-5ce5-a9261b018e08@gmail.com>
Date: Thu, 30 Jul 2020 14:03:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728135839.1035515-1-daniel.vetter@ffwll.ch>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-rdma@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Qian Cai <cai@lca.pw>,
 linux-fsdevel@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDcuMjAgdW0gMTU6NTggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IEdQVSBkcml2ZXJz
IG5lZWQgdGhpcyBpbiB0aGVpciBzaHJpbmtlcnMsIHRvIGJlIGFibGUgdG8gdGhyb3cgb3V0Cj4g
bW1hcCdlZCBidWZmZXJzLiBOb3RlIHRoYXQgd2UgYWxzbyBuZWVkIGRtYV9yZXN2X2xvY2sgaW4g
c2hyaW5rZXJzLAo+IGJ1dCB0aGF0IGxvb3AgaXMgcmVzb2x2ZWQgYnkgdHJ5bG9ja2luZyBpbiBz
aHJpbmtlcnMuCj4KPiBTbyBmdWxsIGhpZXJhcmNoeSBpcyBub3cgKGlnbm9yZSBzb21lIG9mIHRo
ZSBvdGhlciBicmFuY2hlcyB3ZSBhbHJlYWR5Cj4gaGF2ZSBwcmltZWQpOgo+Cj4gbW1hcF9yZWFk
X2xvY2sgLT4gZG1hX3Jlc3YgLT4gc2hyaW5rZXJzIC0+IGlfbW1hcF9sb2NrX3dyaXRlCj4KPiBJ
IGhvcGUgdGhhdCdzIG5vdCBpbmNvbnNpc3RlbnQgd2l0aCBhbnl0aGluZyBtbSBvciBmcyBkb2Vz
LCBhZGRpbmcKPiByZWxldmFudCBwZW9wbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5h
cm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBDYzogRGF2ZSBDaGlubmVyIDxkYXZpZEBmcm9t
b3JiaXQuY29tPgo+IENjOiBRaWFuIENhaSA8Y2FpQGxjYS5wdz4KPiBDYzogbGludXgteGZzQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBU
aG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIDx0aG9tYXNfb3NAc2hpcG1haWwub3JnPgo+IENjOiBB
bmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBKYXNvbiBHdW50
aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENjOiBs
aW51eC1yZG1hQHZnZXIua2VybmVsLm9yZwo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2RtYS1idWYv
ZG1hLXJlc3YuYyB8IDUgKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyBiL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtcmVzdi5jCj4gaW5kZXggMGU2Njc1ZWMxZDExLi45Njc4MTYyYTRhYzUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKPiArKysgYi9kcml2ZXJzL2RtYS1i
dWYvZG1hLXJlc3YuYwo+IEBAIC0xMDQsMTIgKzEwNCwxNCBAQCBzdGF0aWMgaW50IF9faW5pdCBk
bWFfcmVzdl9sb2NrZGVwKHZvaWQpCj4gICAJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBtbV9hbGxv
YygpOwo+ICAgCXN0cnVjdCB3d19hY3F1aXJlX2N0eCBjdHg7Cj4gICAJc3RydWN0IGRtYV9yZXN2
IG9iajsKPiArCXN0cnVjdCBhZGRyZXNzX3NwYWNlIG1hcHBpbmc7Cj4gICAJaW50IHJldDsKPiAg
IAo+ICAgCWlmICghbW0pCj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCj4gICAJZG1hX3Jlc3Zf
aW5pdCgmb2JqKTsKPiArCWFkZHJlc3Nfc3BhY2VfaW5pdF9vbmNlKCZtYXBwaW5nKTsKPiAgIAo+
ICAgCW1tYXBfcmVhZF9sb2NrKG1tKTsKPiAgIAl3d19hY3F1aXJlX2luaXQoJmN0eCwgJnJlc2Vy
dmF0aW9uX3d3X2NsYXNzKTsKPiBAQCAtMTE3LDYgKzExOSw5IEBAIHN0YXRpYyBpbnQgX19pbml0
IGRtYV9yZXN2X2xvY2tkZXAodm9pZCkKPiAgIAlpZiAocmV0ID09IC1FREVBRExLKQo+ICAgCQlk
bWFfcmVzdl9sb2NrX3Nsb3coJm9iaiwgJmN0eCk7Cj4gICAJZnNfcmVjbGFpbV9hY3F1aXJlKEdG
UF9LRVJORUwpOwo+ICsJLyogZm9yIHVubWFwX21hcHBpbmdfcmFuZ2Ugb24gdHJ5bG9ja2VkIGJ1
ZmZlciBvYmplY3RzIGluIHNocmlua2VycyAqLwo+ICsJaV9tbWFwX2xvY2tfd3JpdGUoJm1hcHBp
bmcpOwo+ICsJaV9tbWFwX3VubG9ja193cml0ZSgmbWFwcGluZyk7Cj4gICAjaWZkZWYgQ09ORklH
X01NVV9OT1RJRklFUgo+ICAgCWxvY2tfbWFwX2FjcXVpcmUoJl9fbW11X25vdGlmaWVyX2ludmFs
aWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKPiAgIAlfX2RtYV9mZW5jZV9taWdodF93YWl0KCk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
