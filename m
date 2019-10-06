Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E6CD3A1
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 18:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE5089D4B;
	Sun,  6 Oct 2019 16:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219C989D4B
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 16:48:39 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id q24so5658382plr.13
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 09:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=TxLT9bpNl4jFVPAGhPpjPn1KDoP3vrxyC3V+3rCVHuM=;
 b=Cjz2W7xqSDfVuZVgR7AD0+QAtFvlzLRwnKMnr5b08NKsU1m3T0ytK/mHJs571D8hfC
 9oEpE0723lQpPzPMGxKeGU/X0lzKoHQ6ZHnDnPCgSIHpBfqSA9o/ExvBttrc0/M089f1
 D76EJ/VIztPbgeY6x8PohUPfk4klxqOtiaSNbvQQTZDlWCZWmboQD4Drrnu7+FCuVEEw
 tnTXpFmXb1k36LK/F1yXt8h6HSniv/AMTaffKSd1PAXBvc6Wzy96bK9l1vPKtUh5IJY7
 lG+ndBkRjnLKboky4pXpjZRn0n9XbX2Adn2mi07LdTfT8JRX+vK0KDVd9zSi9j66Tlik
 DxNw==
X-Gm-Message-State: APjAAAUx9AA2ESZsskwPI6sNSdCL0pZZQm4YvXe2R6882tqP8RMgUNz3
 nTppn6E+PvHEb1a6ZJ14VkA=
X-Google-Smtp-Source: APXvYqzmjl+mcprCJRZxez82R7Yc8QkQNXYtyYVkQIbk7eqcboNITANQlLm+Tif+J1GnDnyYzSmYPg==
X-Received: by 2002:a17:902:563:: with SMTP id
 90mr24478184plf.13.1570380518616; 
 Sun, 06 Oct 2019 09:48:38 -0700 (PDT)
Received: from SL2P216MB0105.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:22::5])
 by smtp.gmail.com with ESMTPSA id
 h2sm20378814pfq.108.2019.10.06.09.48.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Oct 2019 09:48:37 -0700 (PDT)
From: Jingoo Han <jingoohan1@gmail.com>
To: Pavel Machek <pavel@denx.de>, Daniel Thompson
 <daniel.thompson@linaro.org>, "alex@alexanderweb.de" <alex@alexanderweb.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: Re: New sysfs interface for privacy screens
Thread-Topic: New sysfs interface for privacy screens
Thread-Index: AXdoTmVTBb+NyICdEDRjYqdq56nWEjUwLjQwZmZpcml2Y2w1MDUyNTEwse7NLzw=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Sun, 6 Oct 2019 16:48:31 +0000
Message-ID: <SL2P216MB01055AE2F23BB2546DC93708AA980@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <20191002094650.3fc06a85@lwn.net> <87muei9r7i.fsf@intel.com>
 <20191003102254.dmwl6qimdca3dbrv@holly.lan>
 <20191006110455.GC24605@amd>
In-Reply-To: <20191006110455.GC24605@amd>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=TxLT9bpNl4jFVPAGhPpjPn1KDoP3vrxyC3V+3rCVHuM=;
 b=GCaLLOHABMVDzUOh3ZA+xjsSzoVnMe1OSpprvlXKbr3FidW133qVKYOkb5FIceNKPQ
 KHhGro4dl3fmL0QQgtMMhd1SRJuyWdL4b+DvJoTt3w+PgN2TNUg6wKYwvtQljvsSvTX+
 a9JGo1FzYyiUJpewUjM7DGB6A/K63HuuJywazIzk6RwHxuUldu3Z7NftG8FGsWMjylMR
 QD7wgrgxUP2OrnU60tW2CAlbjcUtBPr5N3Op+7EcZrL4s0mcrzwJvlQuoSvl7TFaN1bS
 411vNbPX7EZ9NkFNpKzsRMq5VLeHv+Vw77dlAZnGXIps6/nwZRNi/mO+jjHLTxt450TN
 ++BA==
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Ross Zwisler <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mat King <mathewk@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Han Jingoo <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IE9uIDEwLzYvMTksIDc6MDQgQU0sIFBhdmVsIE1hY2hlayB3cm90ZToKPgo+IEhpIQo+Cj4g
PiA+ID4+IEkgaGF2ZSBiZWVuIGxvb2tpbmcgaW50byBhZGRpbmcgTGludXggc3VwcG9ydCBmb3Ig
ZWxlY3Ryb25pYyBwcml2YWN5Cj4gPiA+ID4+IHNjcmVlbnMgd2hpY2ggaXMgYSBmZWF0dXJlIG9u
IHNvbWUgbmV3IGxhcHRvcHMgd2hpY2ggaXMgYnVpbHQgaW50byB0aGUKPiA+ID4gPj4gZGlzcGxh
eSBhbmQgYWxsb3dzIHVzZXJzIHRvIHR1cm4gaXQgb24gaW5zdGVhZCBvZiBuZWVkaW5nIHRvIHVz
ZSBhCj4gPiA+ID4+IHBoeXNpY2FsIHByaXZhY3kgZmlsdGVyLiBJbiBkaXNjdXNzaW9ucyB3aXRo
IG15IGNvbGxlYWd1ZXMgdGhlIGlkZWEgb2YKPiA+ID4gPj4gdXNpbmcgZWl0aGVyIC9zeXMvY2xh
c3MvYmFja2xpZ2h0IG9yIC9zeXMvY2xhc3MvbGVkcyBidXQgdGhpcyBuZXcKPiA+ID4gPj4gZmVh
dHVyZSBkb2VzIG5vdCBzZWVtIHRvIHF1aXRlIGZpdCBpbnRvIGVpdGhlciBvZiB0aG9zZSBjbGFz
c2VzLgo+ID4gPiA+Cj4gPiA+ID4gRldJVywgaXQgc2VlbXMgdGhhdCB5b3UncmUgbm90IGFsb25l
IGluIHRoaXM7IDUuNCBnb3Qgc29tZSBzdXBwb3J0IGZvcgo+ID4gPiA+IHN1Y2ggc2NyZWVucyBp
ZiBJIHVuZGVyc3RhbmQgdGhpbmdzIGNvcnJlY3RseToKPiA+ID4gPgo+ID4gPiA+ICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L2NvbW1pdC8/aWQ9MTEwZWExZDgzM2FkCj4gPiA+IAo+ID4gPiBPaCwgSSBkaWRuJ3QgcmVh
bGl6ZSBpdCBnb3QgbWVyZ2VkIGFscmVhZHksIEkgdGhvdWdodCB0aGlzIHdhcwo+ID4gPiByZWxh
dGVkLi4uCj4gPiA+IAo+ID4gPiBTbyB3ZSd2ZSBhbHJlYWR5IHJlcGxpY2F0ZWQgdGhlIGJhY2ts
aWdodCBzeXNmcyBpbnRlcmZhY2UgcHJvYmxlbSBmb3IKPiA+ID4gcHJpdmFjeSBzY3JlZW5zLiA6
KAo+ID4gCj4gPiBJIGd1ZXNzLi4uIGFsdGhvdWdoIHRoZSBUaGlua3BhZCBjb2RlIGhhc24ndCBh
ZGRlZCBhbnkgc3RhbmRhcmQKPiA+IGludGVyZmFjZXMgKG5vIG90aGVyIGxhcHRvcCBzaG91bGQg
YmUgcGxhY2luZyBjb250cm9scyBmb3IgYSBwcml2YWN5Cj4gPiBzY3JlZW4gaW4gL3Byb2MvYWNw
aS9pYm0vLi4uICkuIE1heWJlIGl0cyBub3QgdG9vIGxhdGUuCj4KPiBUaGVyZSdzIG5ldyBpbnRl
cmZhY2UgZm9yIGNvbnRyb2xsaW5nIHByaXZhY3lndWFyZC4uLiBidXQgcGVyaGFwcyB3ZQo+IG5l
ZWQgYmV0dGVyIHNvbHV0aW9uIHRoYW4gd2hhdCB3ZW50IGluIDUuNC4gUGVyaGFwcyBpdCBzaG91
bGQgYmUKPiByZWNvbnNpZGVyZWQ/CgpJIGFncmVlIHdpdGggeW91ciBvcGluaW9uLiBJIGFsc28g
dGhpbmsgdGhhdCBiZXR0ZXIgc29sdXRpb24gY2FuIGJlIGNvbnNpZGVyZWQsCmFsdGhvdWdoIHRo
ZXJlIGlzIGFscmVhZHkgc29tZXRoaW5nIGluIDUuNC4KCkJlc3QgcmVnYXJkcywKSmluZ29vIEhh
bgoKPgo+IEJlc3QgcmVnYXJkcywKPgkJCQkJCQkJCVBhdmVsCj4gLS0gCj4gKGVuZ2xpc2gpIGh0
dHA6Ly93d3cubGl2ZWpvdXJuYWwuY29tL35wYXZlbG1hY2hlawo+IChjZXNreSwgcGljdHVyZXMp
IGh0dHA6Ly9hdHJleS5rYXJsaW4ubWZmLmN1bmkuY3ovfnBhdmVsL3BpY3R1cmUvaG9yc2VzL2Js
b2cuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
