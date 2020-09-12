Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C526855B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A45A6E1E5;
	Mon, 14 Sep 2020 07:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CA06E228
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 12:53:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d15so8610344lfq.11
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 05:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6dpGMF5H6mcAiyzNoMmGfadu4ovPBWLZg+ptyqmEQ3c=;
 b=GXCU5k+x3LKia0FF3MZBGHOBUUDHjarSFvGoP9BdpM7H7SlqQg3x+6Rk7G7AJeRhvg
 btpCB1km5qAONevBQ5E2oZPD1keQja9f7Yp9dlmkyVXxuNZ9o9xpFaFdrnyjFsZR+eN7
 Wu+RbP2v/SH/Jg3Zr66xXZtrapAmo/aW6fMf/HmpjftHimoTbexjo/B/dUWuvKIdSQVx
 NjpjrsFfntSgCh75gGnxaKIX3iFHQrdbO1yp93R31Dkj1YGxTam0+2ZL2VC4XiyF1dHX
 KPxMwZa00LXqfaz+ECi4eOWE6mVJ1rHDQIK//TsNN1hYQuldftsEEfCX3C+5Vb1kfRV/
 lSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6dpGMF5H6mcAiyzNoMmGfadu4ovPBWLZg+ptyqmEQ3c=;
 b=GWgsz/lgfhiJPVZkeVNOtF0xFiK/pFB5sVsuX1WaVHYyXU5n2+DhOyKPtC+3pHed/b
 Ju/r0BxJK+ky26UgO6wVsYqg4PuwExk1IZIRiwh3+1afpdwyZLNm5HjASl/LMdhp7A4j
 yUI0rdmwNaD39smdNEgkX9TZisu1tjZksjoSo+XzhjSgkE7fqROIefsI+pVQPnwHEXqZ
 Z1YCeKI9IJV5J36IBFLmIERGt2n2H/iHrK+hF4I7SK33LyWCPWJjU9eeyexmeWFDSzQZ
 K8iauyfdkUY4cuQ8496RmI6ddkxh7aG/15ZtBz9D6BkoAIRN1QQKg5HseYSv2vsZwSEG
 6lTQ==
X-Gm-Message-State: AOAM530I0yStXa9CH3lVb+dLX6iZpwg+f2oZe0L77aDvc+fwD2NJmihy
 3Skv0BfCQKxfY6iyERdRv5VdBGnneLk=
X-Google-Smtp-Source: ABdhPJyYqL5hARpaMerGitztfJMZzriV+mhvbSTZbptctxwEBoif6dD+CQGd1Sisa5Ocf/RbHlLlww==
X-Received: by 2002:a19:4c44:: with SMTP id z65mr1550169lfa.434.1599915186912; 
 Sat, 12 Sep 2020 05:53:06 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id k3sm959598lfg.300.2020.09.12.05.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 05:53:06 -0700 (PDT)
Subject: Re: [RFC PATCH v2 10/17] WIP: gpu: host1x: Add no-recovery mode
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-11-mperttunen@nvidia.com>
 <7d7a29e8-3151-12ea-da66-d8a479edda84@gmail.com>
 <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <07f933b3-10d9-0318-e2f3-6dfd5b4903ac@gmail.com>
Date: Sat, 12 Sep 2020 15:53:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c2498218-e107-4df4-41ce-c60da65ceaf7@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTIuMDkuMjAyMCAwMToxMSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gOS8xMS8y
MCA3OjQwIFBNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDA1LjA5LjIwMjAgMTM6MzQsIE1p
a2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4gK8KgwqDCoCB9IGVsc2Ugewo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHN0cnVjdCBob3N0MXhfam9iICpmYWlsZWRfam9iID0gam9iOwo+Pj4gKwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIGhvc3QxeF9qb2JfZHVtcChkZXYsIGpvYik7Cj4+PiArCj4+PiArwqDC
oMKgwqDCoMKgwqAgaG9zdDF4X3N5bmNwdF9zZXRfbG9ja2VkKGpvYi0+c3luY3B0KTsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBmYWlsZWRfam9iLT5jYW5jZWxsZWQgPSB0cnVlOwo+Pj4gKwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfY29udGludWUoam9iLCAmY2RtYS0+c3lu
Y19xdWV1ZSwgbGlzdCkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50
IGk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoam9iLT5zeW5jcHQgIT0g
ZmFpbGVkX2pvYi0+c3luY3B0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b250aW51ZTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkg
PCBqb2ItPm51bV9zbG90czsgaSsrKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBzbG90ID0gKGpvYi0+Zmlyc3RfZ2V0LzggKyBpKSAlCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhPU1Qx
WF9QVVNIQlVGRkVSX1NMT1RTOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
MzIgKm1hcHBlZCA9IGNkbWEtPnB1c2hfYnVmZmVyLm1hcHBlZDsKPj4+ICsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwcGVkWzIqc2xvdCswXSA9IDB4MWJhZDAwMDA7Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcHBlZFsyKnNsb3QrMV0gPSAweDFi
YWQwMDAwOwo+Pgo+PiBUaGUgMHgxYmFkMDAwMCBpcyBhIHZhbGlkIG1lbW9yeSBhZGRyZXNzIG9u
IFRlZ3JhMjAuCj4+Cj4+IFRoZSAweDYwMDAwMDAwIGlzIGludmFsaWQgcGh5cyBhZGRyZXNzIGZv
ciBhbGwgaGFyZHdhcmUgZ2VuZXJhdGlvbnMuCj4+IEl0J3MgdXNlZCBieSBncmF0ZS1rZXJuZWwg
WzFdIGFuZCBWREUgZHJpdmVyIFsyXS4gTm90ZSB0aGF0IHRoZSAweDYgPDwKPj4gMjggaXMgYWxz
byBpbnZhbGlkIEhvc3QxeCBvcGNvZGUsIHdoaWxlIDB4MSBzaG91bGQgYnJlYWsgQ0RNQSBwYXJz
ZXIKPj4gZHVyaW5nIG9mIFBCIGRlYnVnLWR1bXBpbmcuCj4+Cj4+IFsxXQo+PiBodHRwczovL2dp
dGh1Yi5jb20vZ3JhdGUtZHJpdmVyL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9nZW0uaCNMMTYKPj4KPj4KPj4gWzJdCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y1LjktcmM0L3NvdXJjZS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEtdmRlL2lv
bW11LmMjTDk5Cj4+Cj4+Cj4+IFRoZSBWREUgZHJpdmVyIHJlc2VydmVzIHRoZSB0cmFwcGluZyBJ
T1ZBIGFkZHJlc3NlcywgSSBhc3N1bWUgdGhlIEhvc3QxeAo+PiBkcml2ZXIgc2hvdWxkIGRvIHRo
ZSBzYW1lLgo+Pgo+IAo+IFRoZSAweDFiYWQwMDAwJ3MgYXJlIG5vdCBpbnRlbmRlZCB0byBiZSBt
ZW1vcnkgYWRkcmVzc2VzLCB0aGV5IGFyZSBOT09QCj4gb3Bjb2RlcyAoSU5DUiBvZiAwIHdvcmRz
IHRvIG9mZnNldCAweGJhZCkuIEknbGwgZml4IHRoaXMgdG8gdXNlIHByb3Blcgo+IGZ1bmN0aW9u
cyB0byBjb25zdHJ1Y3QgdGhlIG9wY29kZXMgYW5kIGFkZCBzb21lIGNvbW1lbnRzLiBUaGVzZSBu
ZWVkIHRvCj4gYmUgTk9PUCBvcGNvZGVzIHNvIHRoZSBjb21tYW5kIHBhcnNlciBza2lwcyBvdmVy
IHRoZXNlICJjYW5jZWxsZWQiIGpvYnMKPiB3aGVuIHRoZSBjaGFubmVsIGlzIHJlc3VtZWQuCj4g
Cj4gQlRXLCAweDYwMDAwMDAwIGlzIHZhbGlkIG9uIFRlZ3JhMTk0IGFuZCBsYXRlci4KCkF0IGEg
cXVpY2sgZ2xhbmNlIGl0IGxvb2tlZCBsaWtlIGEgbWVtb3J5IGFkZHJlc3MgOikKCkknbSBub3cg
dGFraW5nIGEgY2xvc2VyIGxvb2sgYXQgdGhpcyBwYXRjaCBhbmQgaXQgcmFpc2VzIHNvbWUgbW9y
ZQpxdWVzdGlvbnMsIGxpa2UgZm9yIGV4YW1wbGUgYnkgbG9va2luZyBhdCB0aGUgIk9uIGpvYiB0
aW1lb3V0LCB3ZSBzdG9wCnRoZSBjaGFubmVsLCBOT1AgYWxsIGZ1dHVyZSBqb2JzIG9uIHRoZSBj
aGFubmVsIHVzaW5nIHRoZSBzYW1lIHN5bmNwb2ludAouLi4iIHRocm91Z2ggdGhlIHByaXNtIG9m
IGdyYXRlLWtlcm5lbCBleHBlcmllbmNlLCBJJ20gbm90IHN1cmUgaG93IGl0CmNvdWxkIGNvLWV4
aXN0IHdpdGggdGhlIGRybS1zY2hlZHVsZXIgYW5kIHdoeSBpdCdzIG5lZWRlZCBhdCBhbGwuIEJ1
dCBJCnRoaW5rIHdlIG5lZWQgYSBmZWF0dXJlLWNvbXBsZXRlIHZlcnNpb24gKGF0IGxlYXN0IGEg
cm91Z2ggdmVyc2lvbiksIHNvCnRoYXQgd2UgY291bGQgc3RhcnQgdGhlIHRlc3RpbmcsIGFuZCB0
aGVuIGl0IHNob3VsZCBiZSBlYXNpZXIgdG8gcmV2aWV3CmFuZCBkaXNjdXNzIHN1Y2ggdGhpbmdz
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
