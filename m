Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829CE309BA0
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08866E06B;
	Sun, 31 Jan 2021 11:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10236E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 11:38:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id s24so9628411wmj.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 03:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=agJUYTjcmgJDioolIIz4vd3FIPAvY+IwHgv8CbHcDPg=;
 b=Ew68ocghZkbijdxpyi2AnnqasQRwbahVq+sx9OZObwqfurNRThBgv1PyoQueJdJDIL
 dGyMlRZgivvbI8iW8ebfQlBuvsgpI/AIb3XEYkeYhNc+avLaPDhCVr0PGQ46+n8X4Uxw
 xdBrnqjaYtxh2pZypadEig7DCkhUWWbOcnwYQyoBwsmKo2p5zDCN2Cn8Ou0rtFz7f/vM
 rHwgtW415AwcchQyZ0qDvvvwVroVQzq9F+2NErKIF9IJwK/TWEN4LangbCnR34cr4PmB
 7PHtAqgkpNvaCUO41SFqWwLcC9z4dexZDYXTbVlS4vTLzyWwohsdQ2z2CEyJFHOKOOhF
 gdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=agJUYTjcmgJDioolIIz4vd3FIPAvY+IwHgv8CbHcDPg=;
 b=rxxiO1pTIs3NvZdIevtuKhNcA1fux0/yhcphqvbbzvRV1JJGLzsKsxlShQSd69bYeG
 EK5RSlYISBa9K03paTjOJB308ugnHC7Ql/ULq9t2hNNOyjH+6mAvtnlHNtwtBY3Gxmro
 JstfV8c0vJYIqy5Sb7NnzAcLXv2Yo6RqUa2TXmSdQr+Vzo3VO9NjjOqDrcrTn9OS0egQ
 PIh2Zlh9uG34303cjMjkm8sSlS2NdOFyXNCCQFw+s9+u7LVknx8e12yxcf0vlw0I/oLw
 cEgR0voRaErG7qDJeChRFIbDR71hYGtBjhc1PTIjJCtOF7j6l4QVV8LqAKSx626p/8wl
 QhSA==
X-Gm-Message-State: AOAM530kwC1XmVqCMk7YAE6Fs1LL1audcyHOMmbozZcGqgykpEWJqGCy
 NBeHWYAuswnCRu+ixGauz4E=
X-Google-Smtp-Source: ABdhPJwlNaZKxEVHWWA1xfZSIl6heekF9PrvP8nEBGHYtJ0bSJDQpnG8bVJuBrvK6qXtoPQZ/pje+Q==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr10909110wmi.117.1612093107345; 
 Sun, 31 Jan 2021 03:38:27 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id d17sm13281728wma.2.2021.01.31.03.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 03:38:26 -0800 (PST)
Subject: Re: [PATCH] soc: mediatek: cmdq: Remove cmdq_pkt_flush()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20201202235856.7652-1-chunkuang.hu@kernel.org>
 <CAAOTY__p4C0ctXuOFu42-9HaTrGnOef-Sg47pyC0Uk7yN5406w@mail.gmail.com>
 <CAAOTY_9Qk8Bun9km1DRoCPMAwOJdJ2omsnMipS1jGzUrrrv=sg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <11fac093-d40a-3e2e-169d-cf91645eb45f@gmail.com>
Date: Sun, 31 Jan 2021 12:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAAOTY_9Qk8Bun9km1DRoCPMAwOJdJ2omsnMipS1jGzUrrrv=sg@mail.gmail.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAzMC8wMS8yMDIxIDEwOjQ1LCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+IEhpLCBNYXR0aGlh
czoKPiAKPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIwMjHl
ubQx5pyIMTDml6Ug6YCx5pelIOS4iuWNiDY6NTnlr6vpgZPvvJoKPj4KPj4gSGksIE1hdHRoaWFz
Ogo+Pgo+PiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIwMjDl
ubQxMuaciDPml6Ug6YCx5ZubIOS4iuWNiDc6NTnlr6vpgZPvvJoKPj4+Cj4+PiByeF9jYWxsYmFj
ayBpcyBhIHN0YW5kYXJkIG1haWxib3ggY2FsbGJhY2sgbWVjaGFuaXNtIGFuZCBjb3VsZAo+Pj4g
Y292ZXIgdGhlIGZ1bmN0aW9uIG9mIHByb3ByaWV0YXJ5IGNtZHFfdGFza19jYiwgc28gaXQgaXMg
YmV0dGVyCj4+PiB0byB1c2UgdGhlIHN0YW5kYXJkIG9uZSBpbnN0ZWFkIG9mIHRoZSBwcm9wcmll
dGFyeSBvbmUuIEJ1dAo+Pj4gcmVnaXN0ZXIgcnhfY2FsbGJhY2sgc2hvdWxkIGJlZm9yZSBtYm94
X3JlcXVlc3RfY2hhbm5lbCgpLAo+Pj4gc28gcmVtb3ZlIGNtZHFfcGt0X2ZsdXNoKCkgYW5kIGxl
dCBjbGllbnQgZHJpdmVyIGltcGxlbWVudAo+Pj4gaXRzIG93biBzeW5jaHJvbm91cyBmbHVzaC4K
Pj4KPj4gSG93IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIHBhdGNoPyBUaGlzIHBhdGNoIGlzIGRl
cml2ZWQgZnJvbSBbMV0KPj4gYWNjb3JkaW5nIHRvIEphc3NpJ3Mgc3VnZ2VzdGlvbiBbMl0uCj4+
Cj4+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0
ZWsvcGF0Y2gvMjAyMDA5MjcyMzA0MjIuMTE2MTAtMy1jaHVua3VhbmcuaHVAa2VybmVsLm9yZy8K
Pj4gWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRl
ay9jb3Zlci8yMDIwMDkyNzIzMDQyMi4xMTYxMC0xLWNodW5rdWFuZy5odUBrZXJuZWwub3JnLwo+
IAo+IEp1c3QgYSBwaW5nLgo+IAoKQXBwbGllZCBub3cgdG8gdjUuMTEtbmV4dC9zb2MKClNvcnJ5
IGZvciB0aGUgZGVsYXkuCk1hdHRoaWFzCgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPj4K
Pj4gUmVnYXJkcywKPj4gQ2h1bi1LdWFuZy4KPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHVu
LUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMv
c29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgMzIgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oICB8IDEyIC0t
LS0tLS0tLS0KPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDQ0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYyBiL2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4+PiBpbmRleCA1MDU2NTFiMGQ3MTUu
LmZkM2JjMzk1MzhhMSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1j
bWRxLWhlbHBlci5jCj4+PiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxw
ZXIuYwo+Pj4gQEAgLTUwMiwzNiArNTAyLDQgQEAgaW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5jKHN0
cnVjdCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2NiIGNiLAo+Pj4gIH0KPj4+ICBF
WFBPUlRfU1lNQk9MKGNtZHFfcGt0X2ZsdXNoX2FzeW5jKTsKPj4+Cj4+PiAtc3RydWN0IGNtZHFf
Zmx1c2hfY29tcGxldGlvbiB7Cj4+PiAtICAgICAgIHN0cnVjdCBjb21wbGV0aW9uIGNtcGx0Owo+
Pj4gLSAgICAgICBib29sIGVycjsKPj4+IC19Owo+Pj4gLQo+Pj4gLXN0YXRpYyB2b2lkIGNtZHFf
cGt0X2ZsdXNoX2NiKHN0cnVjdCBjbWRxX2NiX2RhdGEgZGF0YSkKPj4+IC17Cj4+PiAtICAgICAg
IHN0cnVjdCBjbWRxX2ZsdXNoX2NvbXBsZXRpb24gKmNtcGx0Owo+Pj4gLQo+Pj4gLSAgICAgICBj
bXBsdCA9IChzdHJ1Y3QgY21kcV9mbHVzaF9jb21wbGV0aW9uICopZGF0YS5kYXRhOwo+Pj4gLSAg
ICAgICBpZiAoZGF0YS5zdGEgIT0gQ01EUV9DQl9OT1JNQUwpCj4+PiAtICAgICAgICAgICAgICAg
Y21wbHQtPmVyciA9IHRydWU7Cj4+PiAtICAgICAgIGVsc2UKPj4+IC0gICAgICAgICAgICAgICBj
bXBsdC0+ZXJyID0gZmFsc2U7Cj4+PiAtICAgICAgIGNvbXBsZXRlKCZjbXBsdC0+Y21wbHQpOwo+
Pj4gLX0KPj4+IC0KPj4+IC1pbnQgY21kcV9wa3RfZmx1c2goc3RydWN0IGNtZHFfcGt0ICpwa3Qp
Cj4+PiAtewo+Pj4gLSAgICAgICBzdHJ1Y3QgY21kcV9mbHVzaF9jb21wbGV0aW9uIGNtcGx0Owo+
Pj4gLSAgICAgICBpbnQgZXJyOwo+Pj4gLQo+Pj4gLSAgICAgICBpbml0X2NvbXBsZXRpb24oJmNt
cGx0LmNtcGx0KTsKPj4+IC0gICAgICAgZXJyID0gY21kcV9wa3RfZmx1c2hfYXN5bmMocGt0LCBj
bWRxX3BrdF9mbHVzaF9jYiwgJmNtcGx0KTsKPj4+IC0gICAgICAgaWYgKGVyciA8IDApCj4+PiAt
ICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPj4+IC0gICAgICAgd2FpdF9mb3JfY29tcGxldGlv
bigmY21wbHQuY21wbHQpOwo+Pj4gLQo+Pj4gLSAgICAgICByZXR1cm4gY21wbHQuZXJyID8gLUVG
QVVMVCA6IDA7Cj4+PiAtfQo+Pj4gLUVYUE9SVF9TWU1CT0woY21kcV9wa3RfZmx1c2gpOwo+Pj4g
LQo+Pj4gIE1PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsKPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0
ZWsvbXRrLWNtZHEuaAo+Pj4gaW5kZXggOTYwNzA0ZDc1OTk0Li4yYzZhYTg0YzBlODAgMTAwNjQ0
Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4+PiArKysg
Yi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4+PiBAQCAtMjg4LDE2ICsy
ODgsNCBAQCBpbnQgY21kcV9wa3RfZmluYWxpemUoc3RydWN0IGNtZHFfcGt0ICpwa3QpOwo+Pj4g
IGludCBjbWRxX3BrdF9mbHVzaF9hc3luYyhzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgY21kcV9hc3lu
Y19mbHVzaF9jYiBjYiwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsK
Pj4+Cj4+PiAtLyoqCj4+PiAtICogY21kcV9wa3RfZmx1c2goKSAtIHRyaWdnZXIgQ01EUSB0byBl
eGVjdXRlIHRoZSBDTURRIHBhY2tldAo+Pj4gLSAqIEBwa3Q6ICAgICAgIHRoZSBDTURRIHBhY2tl
dAo+Pj4gLSAqCj4+PiAtICogUmV0dXJuOiAwIGZvciBzdWNjZXNzOyBlbHNlIHRoZSBlcnJvciBj
b2RlIGlzIHJldHVybmVkCj4+PiAtICoKPj4+IC0gKiBUcmlnZ2VyIENNRFEgdG8gZXhlY3V0ZSB0
aGUgQ01EUSBwYWNrZXQuIE5vdGUgdGhhdCB0aGlzIGlzIGEKPj4+IC0gKiBzeW5jaHJvbm91cyBm
bHVzaCBmdW5jdGlvbi4gV2hlbiB0aGUgZnVuY3Rpb24gcmV0dXJuZWQsIHRoZSByZWNvcmRlZAo+
Pj4gLSAqIGNvbW1hbmRzIGhhdmUgYmVlbiBkb25lLgo+Pj4gLSAqLwo+Pj4gLWludCBjbWRxX3Br
dF9mbHVzaChzdHJ1Y3QgY21kcV9wa3QgKnBrdCk7Cj4+PiAtCj4+PiAgI2VuZGlmIC8qIF9fTVRL
X0NNRFFfSF9fICovCj4+PiAtLQo+Pj4gMi4xNy4xCj4+PgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
