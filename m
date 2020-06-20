Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9147C20302E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136836E59F;
	Mon, 22 Jun 2020 07:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA39C6E265
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 13:19:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w15so7079622lfe.11
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q+HPq9rW61DL+VfRzHknH+s+PfhTro91G/UUlHPqxLM=;
 b=F6Vf4hPViwBSIMfo8n/dilKTnUx1KvbMipBDiWABoTRTGpL4u6tsybqseu0EI6DMln
 B/vU/UFzDbiuFg41pg3ou4PCp/T7v1S9E5CBx3pugxTexjRTWuY/oUZTFmFtAJx2qZXu
 dCCpcDyO3PNL66D5fg1OSomdr1GNPoqngdydT1TOrcmqodSIqmor+9oFPOE3cSDvi54n
 tIPeRGz8m0NE70L9tZyjRgLvaPGI90a9r3Z9Tszup/ivaZBCag6HB5Awl5QQgQ5vrx/X
 0Fxcf8kn3kwHcz2qtHo1lDXbOINAIGO3kuL9BHf8/ohDU5BQf8+wkjLtZ+YmEPCIVjb3
 HUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q+HPq9rW61DL+VfRzHknH+s+PfhTro91G/UUlHPqxLM=;
 b=aA1YrpTRSSS3A3BFAnucT0Vs77I3jHswrb0hfskX8sige6sB9WKw83uli5jKgwXVpD
 9LKBcgVXTIjf3YX81Gg/7yHOyWgiWB74SwhvPq3YbQaBB32XUWLOsd0BORblMm37cgBd
 ccYPW+bjEGGWtEIy3jfonDcxcgqijaiBkjE3xRtHymWIF+COF7wwIkI1lwMwpJyE7tk/
 OxTiwGe7TZjKrOOg4ujpBHj90k34Ft9KgJznN4NhQPlJE/B5b0knn13HXg2nCMxFizE3
 z0xMSdNCsGEJAfjC5WS7Cc8Ohx81hpdPgm6fxgyClfIS4ETydv8nwHyt4n9ssvKICgh6
 Dk4A==
X-Gm-Message-State: AOAM531I5+9t4PjuqMaZGlW+badvJPYyM6C8Y5ELSzy/r1oeA2n6gNoR
 vAl23LT4wAt4XppV7TBHYCxUZRtH
X-Google-Smtp-Source: ABdhPJzHdeFt48oSkDQi8A35rPILoGoyNbXE/0ti1Lfi6bNWNubUqaD+fn4PzK0tY6D+4Uf5iT19qw==
X-Received: by 2002:a19:ca11:: with SMTP id a17mr4612844lfg.120.1592659141932; 
 Sat, 20 Jun 2020 06:19:01 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id j25sm688506lfh.95.2020.06.20.06.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jun 2020 06:19:01 -0700 (PDT)
Subject: Re: [PATCH v8 7/7] drm/panel-simple: Add missing connector type for
 some panels
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-8-digetx@gmail.com>
 <20200620112132.GB16901@ravnborg.org>
 <20200620114934.GB5829@pendragon.ideasonboard.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea421084-a91c-bc03-5997-1723075b7cae@gmail.com>
Date: Sat, 20 Jun 2020 16:19:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200620114934.GB5829@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAuMDYuMjAyMCAxNDo0OSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+IEhpIFNhbSBh
bmQgRG1pdHJ5LAo+IAo+IE9uIFNhdCwgSnVuIDIwLCAyMDIwIGF0IDAxOjIxOjMyUE0gKzAyMDAs
IFNhbSBSYXZuYm9yZyB3cm90ZToKPj4gT24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgMDE6Mjc6MDNB
TSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4gVGhlIERSTSBwYW5lbCBicmlkZ2Ug
Y29yZSByZXF1aXJlcyBjb25uZWN0b3IgdHlwZSB0byBiZSBzZXQgdXAgcHJvcGVybHksCj4+PiBv
dGhlcndpc2UgaXQgcmVqZWN0cyB0aGUgcGFuZWwuIFRoZSBtaXNzaW5nIGNvbm5lY3RvciB0eXBl
IHByb2JsZW0gcG9wcGVkCj4+PiB1cCB3aGlsZSBJIHdhcyB0cnlpbmcgdG8gd3JhcCBDTEFBMDcw
V1AwM1hHIHBhbmVsIGludG8gYSBEUk0gYnJpZGdlIGluCj4+PiBvcmRlciB0byB0ZXN0IHdoZXRo
ZXIgcGFuZWwncyByb3RhdGlvbiBwcm9wZXJ0eSB3b3JrIHByb3Blcmx5IHVzaW5nCj4+PiBwYW5l
bC1zaW1wbGUgZHJpdmVyIG9uIE5WSURJQSBUZWdyYTMwIE5leHVzIDcgdGFibGV0IGRldmljZSwg
d2hpY2ggdXNlcwo+Pj4gQ0xBQTA3MFdQMDNYRyBkaXNwbGF5IHBhbmVsLgo+Pj4KPj4+IFRoZSBO
VklESUEgVGVncmEgRFJNIGRyaXZlciByZWNlbnRseSBnYWluZWQgRFJNIGJyaWRnZXMgc3VwcG9y
dCBmb3IgdGhlCj4+PiBSR0Igb3V0cHV0IGFuZCBub3cgZHJpdmVyIHdyYXBzIGRpcmVjdGx5LWNv
bm5lY3RlZCBwYW5lbHMgaW50byBEUk0gYnJpZGdlLgo+Pj4gSGVuY2UgYWxsIHBhbmVscyBzaG91
bGQgaGF2ZSBjb25uZWN0b3IgdHlwZSBzZXQgcHJvcGVybHkgbm93LCBvdGhlcndpc2UKPj4+IHRo
ZSBwYW5lbCdzIHdyYXBwaW5nIGZhaWxzLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYWRkcyBtaXNzaW5n
IGNvbm5lY3RvciB0eXBlcyBmb3IgdGhlIExWRFMgcGFuZWxzIHRoYXQgYXJlIGZvdW5kCj4+PiBv
biBOVklESUEgVGVncmEgZGV2aWNlczoKPj4+Cj4+PiAgIDEuIEFVTyBCMTAxQVcwMwo+Pj4gICAy
LiBDaHVuZ2h3YSBDTEFBMDcwV1AwM1hHCj4+PiAgIDMuIENodW5naHdhIENMQUExMDFXQTAxQQo+
Pj4gICA0LiBDaHVuZ2h3YSBDTEFBMTAxV0IwMQo+Pj4gICA1LiBFRFQgRVQwNTcwOTBESFUKPj4+
ICAgNi4gSW5ub2x1eCBOMTU2QkdFIEwyMQo+Pj4gICA3LiBTYW1zdW5nIExUTjEwMU5UMDUKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+
Cj4+IFZlcnkgZ29vZCB0byBoYXZlIHRoaXMgZml4ZWQuCj4+IEkgd2VudCBhaGVhZCBhbmQgcHVz
aGVkIHRoaXMgY29tbWl0IHRvIGRybS1taXNjLW5leHQgYXMgaXQgaXMgcmVhbGx5Cj4+IGluZGVw
ZW5kZW50IGZyb20gdGhlIHJlc3Qgb2YgdGhlIHNlcmllcy4KPj4KPj4+IC0tLQo+Pj4gIGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyB8IDcgKysrKysrKwo+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jCj4+PiBpbmRleCA2NzY0YWM2MzBlMjIuLjllYjJkYmI3YmZhNiAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4+PiBAQCAtNjg3LDYgKzY4Nyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhdW9fYjEwMWF3MDMgPSB7Cj4+PiAgCQkud2lk
dGggPSAyMjMsCj4+PiAgCQkuaGVpZ2h0ID0gMTI1LAo+Pj4gIAl9LAo+Pj4gKwkuY29ubmVjdG9y
X3R5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfTFZEUywKPiAKPiBOb3RlIHRoYXQsIGZvciBMVkRT
IHBhbmVscywgdGhlIGJ1c19mb3JtYXQgZmllbGQgaXMgbWFuZGF0b3J5LiBUaGlzCj4gcGFuZWws
IGZvciBpbnN0YW5jZSwgYWNjb3JkaW5nIHRvCj4gaHR0cDovL3d3dy52c2xjZC5jb20vU3BlY2lm
aWNhdGlvbi9CMTAxQVcwMyUyMFYuMC5wZGYsIHVzZXMKPiBNRURJQV9CVVNfRk1UX1JHQjY2Nl8x
WDdYM19TUFdHIChzZWUKPiBodHRwczovL2xpbnV4dHYub3JnL2Rvd25sb2Fkcy92NGwtZHZiLWFw
aXMvdXNlcnNwYWNlLWFwaS92NGwvc3ViZGV2LWZvcm1hdHMuaHRtbCN2NGwyLW1idXMtcGl4ZWxj
b2RlKS4KPiBUaGUgcGFuZWxzIGJlbG93IG5lZWQgdG8gYmUgaW52ZXN0aWdhdGVkIHNpbWlsYXJs
eS4KCk9rYXkhIEknbGwgYWRkIHRoZSBtaXNzaW5nIGZpZWxkIGluIHY5LgoKPj4+ICB9Owo+Pj4g
IAo+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGlzcGxheV90aW1pbmcgYXVvX2IxMDFlYW4wMV90
aW1pbmcgPSB7Cj4+PiBAQCAtMTM0MCw2ICsxMzQxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
YW5lbF9kZXNjIGNodW5naHdhX2NsYWEwNzB3cDAzeGcgPSB7Cj4+PiAgCQkud2lkdGggPSA5NCwK
Pj4+ICAJCS5oZWlnaHQgPSAxNTAsCj4+PiAgCX0sCj4+PiArCS5jb25uZWN0b3JfdHlwZSA9IERS
TV9NT0RFX0NPTk5FQ1RPUl9MVkRTLAo+Pj4gIH07Cj4+PiAgCj4+PiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlIGNodW5naHdhX2NsYWExMDF3YTAxYV9tb2RlID0gewo+Pj4g
QEAgLTEzNjIsNiArMTM2NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBjaHVu
Z2h3YV9jbGFhMTAxd2EwMWEgPSB7Cj4+PiAgCQkud2lkdGggPSAyMjAsCj4+PiAgCQkuaGVpZ2h0
ID0gMTIwLAo+Pj4gIAl9LAo+Pj4gKwkuY29ubmVjdG9yX3R5cGUgPSBEUk1fTU9ERV9DT05ORUNU
T1JfTFZEUywKPj4+ICB9Owo+Pj4gIAo+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSBjaHVuZ2h3YV9jbGFhMTAxd2IwMV9tb2RlID0gewo+Pj4gQEAgLTEzODQsNiArMTM4
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBjaHVuZ2h3YV9jbGFhMTAxd2Iw
MSA9IHsKPj4+ICAJCS53aWR0aCA9IDIyMywKPj4+ICAJCS5oZWlnaHQgPSAxMjUsCj4+PiAgCX0s
Cj4+PiArCS5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTLAo+Pj4gIH07
Cj4+PiAgCj4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIGRhdGFpbWFn
ZV9zY2YwNzAwYzQ4Z2d1MThfbW9kZSA9IHsKPj4+IEBAIC0xNTczLDYgKzE1NzcsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgZWR0X2V0MDU3MDkwZGh1ID0gewo+Pj4gIAl9LAo+
Pj4gIAkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMTgsCj4+PiAgCS5idXNf
ZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZF
X05FR0VER0UsCj4+PiArCS5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRT
LAo+IAo+IFRoaXMgY29udHJhZGljdHMgLmJ1c19mb3JtYXQgYW5kIC5idXNfZmxhZ3MgdGhhdCBo
aW50IHRoYXQgdGhlIHBhbmVsIGlzCj4gYSBEUEkgcGFuZWwsIG5vdCBhbiBMVkRTIHBhbmVsLiBB
Y2NvcmRpbmcgdG8KPiBodHRwczovL3d3dy5sY2R0ZWsuY28udWsvZHdwZGYvRVQwNTcwOTBESFUt
Um9IUy5wZGYsIHRoaXMgaXNuJ3QgYW4gTFZEUwo+IHBhbmVsLgo+IAo+IEknbSB3b3JyaWVkIGVu
b3VnaCByZXNlYXJjaCBoYXNuJ3QgZ29uZSBpbnRvIHRoaXMgcGF0Y2gsIGFuZCBJJ2QgcHJlZmVy
Cj4gcmV2ZXJ0aW5nIGl0IHVudGlsIHdlIGNoZWNrIGVhY2ggcGFuZWwgaW5kaXZpZHVhbGx5LgoK
SGVsbG8gU2FtIGFuZCBMYXVyZW50LAoKT29wcyEgR29vZCBjYXRjaCEgSW5kZWVkLCBJIGJsaW5k
bHkgc2V0IHRoZSBMVkRTIHR5cGUgdG8gYWxsIHRoZXNlCnBhbmVscy4gUGxlYXNlIHJldmVydCB0
aGlzIHBhdGNoLCBJJ2xsIGRvdWJsZSBjaGVjayBlYWNoIHBhbmVsIGFuZApwcmVwYXJlIGFuIHVw
ZGF0ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoLiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUK
cmV2aWV3IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
