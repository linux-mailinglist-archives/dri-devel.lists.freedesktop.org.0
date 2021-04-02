Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D8352BE4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 18:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731C66EE89;
	Fri,  2 Apr 2021 16:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1016EE8B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 16:02:35 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 184so6033082ljf.9
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7LS9QMZtPYDSC3+ItKIFHS8bZQT3Z+oEzlDTiKOG5UU=;
 b=LJsfj5596jju+lIm1cpaVNsyCnnUvNtPfrsphvCWDG9WKXhAQE6dJvQiLXmWTQfEr2
 xgmY0WIl6O+zQy1ZqqrDWZyZxIrNP//9i6WhZ9TJ25ywiiE7o+BxWSnNDXfvrCi7LYHP
 jURQzWKFGkWQEvXMP1kdICj5dxzaZ6mWt1KJSpo2E6LBqWY42li6wAWCe4eJc75fEpVf
 Q7UJYNHwnZaNavhYuVyvSzMplwPTaz6+QCBRoJKOwz7lhy+tosMg4edQLW9FuneISqtI
 NwL1kmvTCIu3LBShypgTyXVcv5Kc3fHggOxHL4W/0wBo6qCduNhqfuFzQcKDCjFl1jiQ
 0nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7LS9QMZtPYDSC3+ItKIFHS8bZQT3Z+oEzlDTiKOG5UU=;
 b=K4zlTKSUKwwyggEHNlDyHaQ7x2WtfoSGaOJjvyqnfUnbngXaAhoxIWU/2UYDaekO/7
 66CDuZVy+QiLOBFvtMtj9rrM/60sNsTnQ+aKSqRZYHGyVfepHmzW/uzkq9r+pDYrX+6M
 Fvmk+18/SEvoBB9z89QxQP+BtYHffZ5x07kywoaFXip6DNOZ9fmyWu/U27GeF86oF82f
 cjvRoM2OOJRoHJrzk6MzXj5IItbEoRB12Gb0THxunlmIGZz4hPahAULCQBaNLZf5no4f
 kfdKraeezIw01MxgoW/wz1NUVnKcygd2qK4RLUaeaE7Jgbb1VZNVhhqZSAt8w0ttF6sH
 /xrw==
X-Gm-Message-State: AOAM5323WKR/zGGefp/FSRdcerYu9rD4LhHE4x+ckG6PQBzISuBRzt2X
 IXIQ6fvHguSuE67leKPeZvQ=
X-Google-Smtp-Source: ABdhPJwFNWKRiTRgqWKMz0vNmB+o4wQzBgwHAYdkKEiQHbkbjtnJ34ZorbBoUyodH7Mer97dYyU/9Q==
X-Received: by 2002:a2e:9855:: with SMTP id e21mr8396252ljj.26.1617379354145; 
 Fri, 02 Apr 2021 09:02:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru.
 [109.252.193.85])
 by smtp.googlemail.com with ESMTPSA id x4sm962500ljj.91.2021.04.02.09.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:02:33 -0700 (PDT)
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Mikko Perttunen <cyndis@kapsi.fi>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
 <20210401211949.GA25223@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
Date: Fri, 2 Apr 2021 19:02:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401211949.GA25223@qmqm.qmqm.pl>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDIuMDQuMjAyMSAwMDoxOSwgTWljaGHFgiBNaXJvc8WCYXcg0L/QuNGI0LXRgjoKPiBPbiBGcmks
IE1hciAyNiwgMjAyMSBhdCAwNDozNDoxM1BNICswMjAwLCBNaWtrbyBQZXJ0dHVuZW4gd3JvdGU6
Cj4+IE9uIDMvMjMvMjEgMTI6MTYgUE0sIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+Pj4gT24gTW9u
LCBKYW4gMTEsIDIwMjEgYXQgMDM6MDA6MDFQTSArMDIwMCwgTWlra28gUGVydHR1bmVuIHdyb3Rl
Ogo+Pj4+IFNob3cgdGhlIG51bWJlciBvZiBwZW5kaW5nIHdhaXRlcnMgaW4gdGhlIGRlYnVnZnMg
c3RhdHVzIGZpbGUuCj4+Pj4gVGhpcyBpcyB1c2VmdWwgZm9yIHRlc3RpbmcgdG8gdmVyaWZ5IHRo
YXQgd2FpdGVycyBkbyBub3QgbGVhawo+Pj4+IG9yIGFjY3VtdWxhdGUgaW5jb3JyZWN0bHkuCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlh
LmNvbT4KPj4+PiAtLS0KPj4+PiAgIGRyaXZlcnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jIHwgMTQgKysr
KysrKysrKystLS0KPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZWJ1
Zy5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMKPj4+PiBpbmRleCAxYjQ5OTdiZGExYzcu
LjhhMTQ4ODBjNjFiYiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgvZGVidWcu
Ywo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jCj4+Pj4gQEAgLTY5LDYgKzY5
LDcgQEAgc3RhdGljIGludCBzaG93X2NoYW5uZWwoc3RydWN0IGhvc3QxeF9jaGFubmVsICpjaCwg
dm9pZCAqZGF0YSwgYm9vbCBzaG93X2ZpZm8pCj4+Pj4gICBzdGF0aWMgdm9pZCBzaG93X3N5bmNw
dHMoc3RydWN0IGhvc3QxeCAqbSwgc3RydWN0IG91dHB1dCAqbykKPj4+PiAgIHsKPj4+PiArCXN0
cnVjdCBsaXN0X2hlYWQgKnBvczsKPj4+PiAgIAl1bnNpZ25lZCBpbnQgaTsKPj4+PiAgIAlob3N0
MXhfZGVidWdfb3V0cHV0KG8sICItLS0tIHN5bmNwdHMgLS0tLVxuIik7Cj4+Pj4gQEAgLTc2LDEy
ICs3NywxOSBAQCBzdGF0aWMgdm9pZCBzaG93X3N5bmNwdHMoc3RydWN0IGhvc3QxeCAqbSwgc3Ry
dWN0IG91dHB1dCAqbykKPj4+PiAgIAlmb3IgKGkgPSAwOyBpIDwgaG9zdDF4X3N5bmNwdF9uYl9w
dHMobSk7IGkrKykgewo+Pj4+ICAgCQl1MzIgbWF4ID0gaG9zdDF4X3N5bmNwdF9yZWFkX21heCht
LT5zeW5jcHQgKyBpKTsKPj4+PiAgIAkJdTMyIG1pbiA9IGhvc3QxeF9zeW5jcHRfbG9hZChtLT5z
eW5jcHQgKyBpKTsKPj4+PiArCQl1bnNpZ25lZCBpbnQgd2FpdGVycyA9IDA7Cj4+Pj4gLQkJaWYg
KCFtaW4gJiYgIW1heCkKPj4+PiArCQlzcGluX2xvY2soJm0tPnN5bmNwdFtpXS5pbnRyLmxvY2sp
Owo+Pj4+ICsJCWxpc3RfZm9yX2VhY2gocG9zLCAmbS0+c3luY3B0W2ldLmludHIud2FpdF9oZWFk
KQo+Pj4+ICsJCQl3YWl0ZXJzKys7Cj4+Pj4gKwkJc3Bpbl91bmxvY2soJm0tPnN5bmNwdFtpXS5p
bnRyLmxvY2spOwo+Pj4KPj4+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8ga2VlcCBhIHJ1bm5pbmcg
Y291bnQgc28gdGhhdCB3ZSBkb24ndCBoYXZlIHRvCj4+PiBjb21wdXRlIGl0IGhlcmU/Cj4+Cj4+
IENvbnNpZGVyaW5nIHRoaXMgaXMganVzdCBhIGRlYnVnIGZhY2lsaXR5LCBJIHRoaW5rIEkgcHJl
ZmVyIG5vdCBhZGRpbmcgYSBuZXcKPj4gZmllbGQganVzdCBmb3IgaXQuCj4gCj4gVGhpcyBsb29r
cyBsaWtlIElSUS1kaXNhYmxlZCByZWdpb24sIHNvIHVubGVzcyBvbmx5IHJvb3QgY2FuIHRyaWdn
ZXIKPiB0aGlzIGNvZGUsIG1heWJlIHRoZSBhZGRpdGlvbmFsIGZpZWxkIGNvdWxkIHNhdmUgYSBw
b3RlbnRpYWwgaGVhZGFjaGU/Cj4gSG93IG1hbnkgd2FpdGVycyBjYW4gdGhlcmUgYmUgaW4gdGhl
IHdvcnN0IGNhc2U/CgpUaGUgaG9zdDF4J3MgSVJRIGhhbmRsZXIgcnVucyBpbiBhIHdvcmtxdWV1
ZSwgc28gaXQgc2hvdWxkIGJlIG9rYXkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
