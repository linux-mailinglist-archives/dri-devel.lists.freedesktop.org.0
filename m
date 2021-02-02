Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0830B9F7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0226E8E6;
	Tue,  2 Feb 2021 08:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D746E8E6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 08:33:45 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hs11so28639928ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 00:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=lgrmCKn7fa8BZQSBnv8N1P+Cvs3u32JT2Mm/OzoKs+0=;
 b=t+fWg0vAwx5ufrwZKcMvat8HOg68VhwiqVfrZQQW4H64LWXOPDnoGUraWGjkq2DLDq
 QLcFd/Lm7Ezl5DlNjLXXzTzdJB0mggMuj+NzctFSz+DpnVh6UswTwClRO3jKh0vLrZm/
 YeD0FWr+o2jYc9nZp8Czk+hbSGzo5mY5gfo55zgUjTmvOVpIXpxOHI7P7vFgkOf4RCmM
 KCMAuM0uwL4X9CLvhfo/pckIfVxsN9QLHiKEGWiEALrdGTEAilbwzpL7+MDp58Y0sjE8
 pmceePGlgiIsoEOhVcaeYOXB4cETjV/RP2aPcHEWDEnySS7P9FT0p8hn9nbDw+EQPvDY
 EEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=lgrmCKn7fa8BZQSBnv8N1P+Cvs3u32JT2Mm/OzoKs+0=;
 b=VymcXH1JFRHYzIsLcMy3HbuFF5OxU5+i2atEcTiIGMxG497wQ9Ob8SVEyKoRJkAGgi
 X9CFZsUxle8mChjtH/f3w57Vz/dmHN57LvjkJIQhY4VBDLXMTXdsN+IxV7R7xXa+Nw4W
 A4dIwjfOwvb3U96dxi7OBeeKPJ6oO8BZROpAc9eImELUuKnVaLYYx2WMOrkEg8iuOhYC
 nNUcN1m/cBBmImwk1UDmdxXK5FiMjxxMF1xB5chNU4qcS/soARrdBs1q0QBqiVX8kVEb
 Up/W438v6YXnuIptVS1yzi3zSA7MqjX5qCONsMoyNAyIGupZq0NLfKj2CS610hRdjpJT
 hIsw==
X-Gm-Message-State: AOAM532qMdSQa5LQhQ0tcTs6MX2u1gHyaGf8gl1kl+07OChGI3LYxCm9
 jt5SSlQ28dasWwumEX/JarE=
X-Google-Smtp-Source: ABdhPJxm7JcawV6X0WgZcSOHtcFQbGQTHlwGpTNi24TTZued12CJDBGns027oBVSU3dhbviuAQ4vxQ==
X-Received: by 2002:a17:906:30cd:: with SMTP id
 b13mr21330941ejb.336.1612254824483; 
 Tue, 02 Feb 2021 00:33:44 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u23sm9727370edt.87.2021.02.02.00.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 00:33:43 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH 08/29] dma-buf: Avoid comma separated
 statements
To: lyude@redhat.com, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Joe Perches <joe@perches.com>,
 Jiri Kosina <trivial@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
 <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
 <4266568da0437ea605bfb2810ead2b05475bfbb8.camel@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ad79432b-9c83-ce5a-f8ca-ec45bb55fb2c@gmail.com>
Date: Tue, 2 Feb 2021 09:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4266568da0437ea605bfb2810ead2b05475bfbb8.camel@redhat.com>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WWVhaCwga25vd24gaXNzdWUuCgpBbiBOVFAgc2VydmVyIHdoaWNoIEkgZG9uJ3QgaGF2ZSBhY2Nl
c3MgdG8gaGFzIGdvbmUgYmFuYW5hcyBhbmQgCnNvbWV0aW1lcyBzcGl0cyBvdXQgaW52YWxpZCB0
aW1lIHN0YW1wcy4KCk9ubHkgdGhpbmcgSSBjYW4gZG8gaXMgd2FpdCBmb3IgYW4gYWRtaW4gdG8g
dGFrZSBjYXJlIG9mIHRoaXMuCgpDaHJpc3RpYW4uCgpBbSAwMS4wMi4yMSB1bSAyMjo1NCBzY2hy
aWViIEx5dWRlIFBhdWw6Cj4gVGhpcyBpcyBlbnRpcmVseSB1bnJlbGF0ZWQgdG8gdGhpcyB0aHJl
YWQsIGJ1dCBJIG5vdGljZWQgd2hlbiBnb2luZyB0aHJvdWdoIGRyaS0KPiBkZXZlbCB0aGF0IHRo
aXMgZW1haWwgaXMgc29tZWhvdyBkYXRlZCB0d28gZGF5cyBpbiB0aGUgZnV0dXJlIGZyb20gbm93
Lgo+Cj4gT24gV2VkLCAyMDIxLTAyLTAzIGF0IDE0OjI2ICswMTAwLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOgo+PiBBbSAzMC4wMS4yMSB1bSAxOTo0NyBzY2hyaWViIEpvZSBQZXJjaGVzOgo+Pj4g
T24gTW9uLCAyMDIwLTA4LTI0IGF0IDIxOjU2IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPj4+
PiBVc2Ugc2VtaWNvbG9ucyBhbmQgYnJhY2VzLgo+Pj4gUGluZz8KPj4+ICAgIAo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4+IFJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Cj4+IERvIHlvdSBo
YXZlIGNvbW1pdCByaWdodHMgdG8gZHJtLW1pc2MtbmV4dD8KPj4KPj4+PiAtLS0KPj4+PiAgwqDC
oGRyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYyB8IDcgKysrKystLQo+Pj4+ICDCoMKgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1i
dWYvc3QtZG1hLQo+Pj4+IGZlbmNlLmMKPj4+PiBpbmRleCBlNTkzMDY0MzQxYzguLmM4YTEyZDdh
ZDcxYSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKPj4+
PiArKysgYi9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKPj4+PiBAQCAtNDcxLDggKzQ3
MSwxMSBAQCBzdGF0aWMgaW50IHRocmVhZF9zaWduYWxfY2FsbGJhY2sodm9pZCAqYXJnKQo+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfZmVu
Y2Vfc2lnbmFsKGYxKTsKPj4+PiAgICAKPj4+Pgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHNtcF9zdG9yZV9tYihjYi5zZWVuLCBmYWxzZSk7Cj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmICghZjIgfHwgZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhmMiwg
JmNiLmNiLAo+Pj4+IHNpbXBsZV9jYWxsYmFjaykpCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtaXNzKyssIGNiLnNlZW4gPSB0cnVlOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWYyIHx8Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfYWRkX2NhbGxiYWNrKGYyLCAmY2Iu
Y2IsIHNpbXBsZV9jYWxsYmFjaykpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoG1pc3MrKzsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNiLnNlZW4gPSB0cnVlOwo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9Cj4+Pj4gICAgCj4+Pj4KPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoIXQtPmJlZm9yZSkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZG1hX2ZlbmNlX3NpZ25hbChmMSk7Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
