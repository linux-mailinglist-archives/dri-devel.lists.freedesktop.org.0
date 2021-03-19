Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455323418E9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F8D6E9CF;
	Fri, 19 Mar 2021 09:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FAF6E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3l3BfTP70gXS5Doqn0pw4lSC+ETHFzwyHhsUK4GEBKU=;
 b=RuU4kqz5fsi9ox2BUiAntEbtUfkysIdHxNrCd2KfzsEaSC3GysIwvcwlo50dlfXUVY6qvb
 TjVnY3mb+Zrp99vZLr0G+vBdqzvhm8LvlndBcYmlmchsc2kMR7DVUVBWmjJ4msyFGgY7Tx
 fDnxydbiDLTnkjnXk7YmYXcZ+rmj4+Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-ZKLbDkx0PvmE7HyFC4UFdw-1; Fri, 19 Mar 2021 05:57:00 -0400
X-MC-Unique: ZKLbDkx0PvmE7HyFC4UFdw-1
Received: by mail-wr1-f71.google.com with SMTP id h21so21376726wrc.19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3l3BfTP70gXS5Doqn0pw4lSC+ETHFzwyHhsUK4GEBKU=;
 b=EIFwMSO8hA7yizRv/IjGxlg3HT2pUBgEPznWSM6PrdbwpTh7aDEzWc4GRABRNRQMCt
 Obaplz5zl3768m1a8nsLgKaAm1Bk9n8RxkP8swdtyP1dFhSc6Oc1dIMkZFslF/NgogvB
 VsUb36zEdrnFOx1jI844XAm6+RKHn4TjmKZq1WgtmkT0nih4DR1zslFy0IdxMtB3eMQ5
 q7TRSEsxvzdoS3EChD6wKWD3aWxjGg278c54lH1nD2hPdVTwsbr9duQ35TdMpLXrJaZN
 GHyD2WtiWhZ6b3l+5LOEwhx4NrYIR2XhVG/bK1Fxq2s7IN4+SG5sxtfS2oZySjqhOfe5
 rHrA==
X-Gm-Message-State: AOAM531h3Vee84Tc6a1lH7wz7CRnKAmaUMulP1reykxe/NMujsKZEcqc
 6XdfpSg1EO1GYmoXqJF76Mj6u3jSTr3XsPl6n41RKrpKvWvrZCHqQnExuZ8BdFRvQS1fNqHAuvm
 4KbJJlAQyUv5zsSoGbzpW2hHmY7qkwXBlbSIZFCGh7bxV
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3638693wrv.10.1616147818278; 
 Fri, 19 Mar 2021 02:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydXZ7PTUXXk61n8Vm+NGA5deM8sQ8DWxF3xA9WDgrGsCesLVfERpF5oUV4xlX2RUpBfsYQ1O9Hc0Hb/dn7k7o=
X-Received: by 2002:a5d:560e:: with SMTP id l14mr3638680wrv.10.1616147818103; 
 Fri, 19 Mar 2021 02:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-11-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-11-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:56:47 +0100
Message-ID: <CACO55tvYCgxXuqwoyXbVL50zLqPGQck_EjMxK_yePgG6tHnxKw@mail.gmail.com>
Subject: Re: [PATCH 10/19] drm/nouveau/nouveau_bo: Remove unused variables
 'dev'
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMTksIDIwMjEgYXQgOToyNSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzogSW4g
ZnVuY3Rpb24g4oCYbm91dmVhdV90dG1fdHRfcG9wdWxhdGXigJk6Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYzoxMjI4OjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbi
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiDigJhub3V2ZWF1X3R0
bV90dF91bnBvcHVsYXRl4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Jv
LmM6MTI1MjoxNzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0By
ZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gQ2M6IEplcmVteSBLb2xiIDxqa29sYkBicmFuZGVpcy5lZHU+Cj4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFy
by1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCAyODFlOWVkMTM5ODk1Li45MTMw
MzVhYjg1ZWMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Ym8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IEBAIC0x
MjUwLDcgKzEyNTAsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Rldmlj
ZSAqYmRldiwKPiAgewo+ICAgICAgICAgc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICop
dHRtOwo+ICAgICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAgICAgICBzdHJ1Y3Qg
ZGV2aWNlICpkZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5wYWdlX2ZsYWdzICYg
VFRNX1BBR0VfRkxBR19TRyk7Cj4KPiAgICAgICAgIGlmICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0
bSkpCj4gQEAgLTEyNjMsNyArMTI2Miw2IEBAIG5vdXZlYXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVj
dCB0dG1fZGV2aWNlICpiZGV2LAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1
X2JkZXYoYmRldik7Cj4gLSAgICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICBy
ZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRybS0+dHRtLmJkZXYucG9vbCwgdHRtLCBjdHgpOwo+ICB9
Cj4gQEAgLTEyNzMsMTQgKzEyNzEsMTIgQEAgbm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1
Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0
dG1fdHQgKnR0bSkKPiAgewo+ICAgICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAg
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5w
YWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRyk7Cj4KPiAgICAgICAgIGlmIChzbGF2ZSkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1X2JkZXYoYmRl
dik7Cj4gLSAgICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICByZXR1cm4gdHRt
X3Bvb2xfZnJlZSgmZHJtLT50dG0uYmRldi5wb29sLCB0dG0pOwo+ICB9Cj4gLS0KPiAyLjI3LjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
