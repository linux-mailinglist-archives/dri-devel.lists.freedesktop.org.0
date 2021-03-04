Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7B732D022
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 10:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C9F6E243;
	Thu,  4 Mar 2021 09:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3805 seconds by postgrey-1.36 at gabe;
 Thu, 04 Mar 2021 09:53:25 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAF66E243
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Mar 2021 09:53:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1248m3Ze014700; Thu, 4 Mar 2021 09:49:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FVNy8tJa/zBb6Dg12zoReyCjkz82aSQwtAndHZjvGrI=;
 b=U4rIj9FWvU3QrNu8eC7iMsPaO5M3+VYijeR/qKqVEbkIfB7bFhgMVHqzx2bQhAM41bx1
 uy0xUuy6JQNL5m8T8+Is/l3X+nj4KssdJO7kbSkQz3itCywduFAAiz8a/B3A3NTBfP68
 zGwDozSj3w34/pGoCMkvRsQW4Fe+9K5JxWvV8RVYkK2Xyg2r97vQ+kfpohr2FoLRcsJ9
 lddIy1QAgdQZFazh2hzvpvxniYNTTl4JNBYwNy1Mmsp1OgYG+vZu2AyiP7kJcJkvxye8
 8jhPiss1zGvUcgoAJz4IqG4BY0qMqHItC1/pW9qwjxl2ig1TdNB+IqOR90DiwcNuuEXN Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfdye49s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 09:49:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9FEEF10002A;
 Thu,  4 Mar 2021 09:49:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74D7A228C23;
 Thu,  4 Mar 2021 09:49:56 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar
 2021 09:49:55 +0100
Subject: Re: [PATCH] drm/stm: ltdc: Use simple encoder
To: Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki
 <jagan@amarulasolutions.com>, Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>
References: <20210302175700.28640-1-jagan@amarulasolutions.com>
 <791a6f75-3603-9b84-c267-76c24fb77ee2@suse.de>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <1d6ff4e2-9213-6e13-214d-b1705199610e@foss.st.com>
Date: Thu, 4 Mar 2021 09:49:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <791a6f75-3603-9b84-c267-76c24fb77ee2@suse.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_02:2021-03-03,
 2021-03-04 signatures=0
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLApJIHdhaXQgYSBmZXcgZGF5cyBiZWZvcmUgbWVyZ2luZyBpdC4KVGhhbmsgeW91
IGZvciB5b3VyIGhlbHAuCgpCZXN0IHJlZ2FyZHMKCllhbm5pY2sKCgpPbiAzLzQvMjEgOToyMSBB
TSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGksCj4gCj4gc2hhbGwgSSBtZXJnZSB0aGlz
IHBhdGNoPwo+IAo+IEFtIDAyLjAzLjIxIHVtIDE4OjU3IHNjaHJpZWIgSmFnYW4gVGVraToKPj4g
U1RNIGx0ZGMgZHJpdmVyIHVzZXMgYW4gZW1wdHkgaW1wbGVtZW50YXRpb24gZm9yIGl0cyBlbmNv
ZGVyLgo+PiBSZXBsYWNlIHRoZSBjb2RlIHdpdGggdGhlIGdlbmVyaWMgc2ltcGxlIGVuY29kZXIu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAxMiArKy0tLS0t
LS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4+IGluZGV4IDc4MTIwOTRmOTNkNi4uYWVlYjQzNTI0Y2Ew
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+PiBAQCAtMzEsNiArMzEsNyBAQAo+PiDCoCAjaW5jbHVk
ZSA8ZHJtL2RybV9vZi5oPgo+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV9wbGFuZV9oZWxwZXIuaD4K
Pj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Cj4+ICsjaW5jbHVkZSA8ZHJt
L2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgo+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV92Ymxhbmsu
aD4KPj4gwqAgI2luY2x1ZGUgPHZpZGVvL3ZpZGVvbW9kZS5oPgo+PiBAQCAtMTAyMCwxNCArMTAy
MSw2IEBAIHN0YXRpYyBpbnQgbHRkY19jcnRjX2luaXQoc3RydWN0IGRybV9kZXZpY2UgCj4+ICpk
ZGV2LCBzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4g
wqAgfQo+PiAtLyoKPj4gLSAqIERSTV9FTkNPREVSCj4+IC0gKi8KPj4gLQo+PiAtc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBsdGRjX2VuY29kZXJfZnVuY3MgPSB7Cj4+IC3C
oMKgwqAgLmRlc3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAo+PiAtfTsKPj4gLQo+PiDCoCBz
dGF0aWMgdm9pZCBsdGRjX2VuY29kZXJfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29k
ZXIpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IGVuY29k
ZXItPmRldjsKPj4gQEAgLTEwODgsOCArMTA4MSw3IEBAIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVy
X2luaXQoc3RydWN0IGRybV9kZXZpY2UgCj4+ICpkZGV2LCBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlKQo+PiDCoMKgwqDCoMKgIGVuY29kZXItPnBvc3NpYmxlX2NydGNzID0gQ1JUQ19NQVNLOwo+
PiDCoMKgwqDCoMKgIGVuY29kZXItPnBvc3NpYmxlX2Nsb25lcyA9IDA7wqDCoMKgIC8qIE5vIGNs
b25pbmcgc3VwcG9ydCAqLwo+PiAtwqDCoMKgIGRybV9lbmNvZGVyX2luaXQoZGRldiwgZW5jb2Rl
ciwgJmx0ZGNfZW5jb2Rlcl9mdW5jcywKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1f
TU9ERV9FTkNPREVSX0RQSSwgTlVMTCk7Cj4+ICvCoMKgwqAgZHJtX3NpbXBsZV9lbmNvZGVyX2lu
aXQoZGRldiwgZW5jb2RlciwgRFJNX01PREVfRU5DT0RFUl9EUEkpOwo+PiDCoMKgwqDCoMKgIGRy
bV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2RlciwgJmx0ZGNfZW5jb2Rlcl9oZWxwZXJfZnVuY3Mp
Owo+Pgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
