Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDF1F82B0
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4957B6E424;
	Sat, 13 Jun 2020 10:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78E66E185
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 21:53:40 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d7so6264435lfi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VOElnJrxFX82zCegdC8CJL4A4jdek0Vm1aStzl7y+ic=;
 b=gXp9vM9n3ge6BhZsmJD9ksIhohLFm9UN/zIoj6mNfhOtfJioBKmvHW0fwY5x/GbU1v
 Kf8RMQGkmUSAabZAsqnQfPEKUnRgT7mkxxqkv8JrGUSOPmYZipgOosu/SsSMGo4aQs0n
 tHIVHPnGOU5fyr1iOUB7oqTy1oKD5TKoRmDgJ/tWd88wlLjOKAih3CTypJNU3jhumj7N
 1CjcrkziDeG8PiCzSJ8NfDo3FsbZgLvrBrFH6havbWUkyS/VQjctFpqp+cOorzOEUPrU
 OxLgEkO+5F2n72o6cYq93lAYysIZnij/b2cBpYUfXaoEF4jSruKoiDWmVJ+r/qgcbQLR
 uYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VOElnJrxFX82zCegdC8CJL4A4jdek0Vm1aStzl7y+ic=;
 b=cq+eDM3SG+rkKbUuSXnaegLLE3QGaKg1k3XaMCijUmAKV1YqSrxI26GKy1rqOU/3hw
 m44iOnP+iQLQB7CaR498NWhijEQLj0CxLjqCC0V5zRcFzX3W0HKXnsz9EsHAUpv4Al94
 XUXHQ9SgNEFMghra8EWoiqBq2pcvXCcgV5U0X/ceb2SQVpxvA7IN/dvbVJ80WMNkLi/B
 ZmUN+S0Jm/EMHmDYLdOoR6KMsrHXfsLXGRD+1rCvuRsa8H3lM8vCk8w9sHn0iGjig3Y8
 iPnVka+JvPJu/qVXfwclVWG9N/bMtePFksEMMBH3wD8u3cAs7ppdkYn7jkoEyPHo5IZ4
 ZHWg==
X-Gm-Message-State: AOAM533ciIT6nkUl1oyHXdBT0ZYT48ssDSSWS/BLc98X2xOd/X1myqfs
 dNLVIMdI53KV4OsyTht4EcU=
X-Google-Smtp-Source: ABdhPJzmwhK1lXiY/Qgd36vBnvVViqZWltRLjQJol/PlPOPqVI7Vu3PHUVi3sCmITZaFPdk6xhO2qQ==
X-Received: by 2002:a19:cb05:: with SMTP id b5mr7803699lfg.108.1591998819280; 
 Fri, 12 Jun 2020 14:53:39 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id n1sm2046995ljg.131.2020.06.12.14.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 14:53:38 -0700 (PDT)
Subject: Re: [PATCH v6 6/6] drm/tegra: output: rgb: Wrap directly-connected
 panel into DRM bridge
To: kernel test robot <lkp@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
References: <20200609132855.20975-7-digetx@gmail.com>
 <202006130511.AE6Kvrjm%lkp@intel.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <48645520-047f-da72-f8b1-3520911f242e@gmail.com>
Date: Sat, 13 Jun 2020 00:53:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <202006130511.AE6Kvrjm%lkp@intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTMuMDYuMjAyMCAwMDoyMywga2VybmVsIHRlc3Qgcm9ib3Qg0L/QuNGI0LXRgjoKPiBIaSBEbWl0
cnksCj4gCj4gSSBsb3ZlIHlvdXIgcGF0Y2ghIFBlcmhhcHMgc29tZXRoaW5nIHRvIGltcHJvdmU6
Cj4gCj4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIGxpbnVzL21hc3Rlcl0KPiBbYWxzbyBi
dWlsZCB0ZXN0IFdBUk5JTkcgb24gbmV4dC0yMDIwMDYxMl0KPiBbY2Fubm90IGFwcGx5IHRvIHRl
Z3JhL2Zvci1uZXh0IHJvYmgvZm9yLW5leHQgdjUuN10KPiBbaWYgeW91ciBwYXRjaCBpcyBhcHBs
aWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMgYSBub3RlIHRvIGhlbHAK
PiBpbXByb3ZlIHRoZSBzeXN0ZW0uIEJUVywgd2UgYWxzbyBzdWdnZXN0IHRvIHVzZSAnLS1iYXNl
JyBvcHRpb24gdG8gc3BlY2lmeSB0aGUKPiBiYXNlIHRyZWUgaW4gZ2l0IGZvcm1hdC1wYXRjaCwg
cGxlYXNlIHNlZSBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL2EvMzc0MDY5ODJdCj4gCj4gdXJs
OiAgICBodHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL0RtaXRyeS1Pc2lw
ZW5rby9TdXBwb3J0LURSTS1icmlkZ2VzLW9uLU5WSURJQS1UZWdyYS8yMDIwMDYwOS0yMTMwMjYK
PiBiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdCBhYmZiYjI5Mjk3YzI3ZTNmMTAxZjM0OGRjOWU0NjdiMGZlNzBm
OTE5Cj4gY29uZmlnOiBhcm02NC1yYW5kY29uZmlnLXIwMjYtMjAyMDA2MTIgKGF0dGFjaGVkIGFz
IC5jb25maWcpCj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24gMTEuMC4wIChodHRwczovL2dpdGh1
Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgM2I0M2YwMDYyOTQ5NzFiODA0OWQ0ODA3MTEwMDMyMTY5
NzgwZTViOCkKCkludGVyZXN0aW5nbHksIEdDQyBkb2Vzbid0IHJlcG9ydCB0aGlzIHdhcm5pbmcu
Cgo+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6Cj4gICAgICAgICB3Z2V0IGh0dHBz
Oi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4v
bWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICBjaG1vZCAreCB+L2Jpbi9t
YWtlLmNyb3NzCj4gICAgICAgICAjIGluc3RhbGwgYXJtNjQgY3Jvc3MgY29tcGlsaW5nIHRvb2wg
Zm9yIGNsYW5nIGJ1aWxkCj4gICAgICAgICAjIGFwdC1nZXQgaW5zdGFsbCBiaW51dGlscy1hYXJj
aDY0LWxpbnV4LWdudQo+ICAgICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxp
bnV4IGJ1aWxkIHRyZWUKPiAgICAgICAgIENPTVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5
IENPTVBJTEVSPWNsYW5nIG1ha2UuY3Jvc3MgQVJDSD1hcm02NCAKPiAKPiBJZiB5b3UgZml4IHRo
ZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIGFzIGFwcHJvcHJpYXRlCj4gUmVwb3J0
ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IAo+IEFsbCB3YXJuaW5n
cyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4sIG9sZCBvbmVzIHByZWZpeGVkIGJ5IDw8KToKPiAK
Pj4+IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9yZ2IuYzoxMDA6NDg6IHdhcm5pbmc6IHVudXNlZCB2
YXJpYWJsZSAndGVncmFfcmdiX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MnIFstV3VudXNlZC1jb25z
dC12YXJpYWJsZV0KPiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzIHRlZ3JhX3JnYl9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewo+IF4KPiAxIHdhcm5pbmcg
Z2VuZXJhdGVkLgoKClRoZXJlIGFyZSB0d28gdW51c2VkIHN0cnVjdHMgaW4gdGhlIGNvZGUgYW5k
IG9uZSBpcyByZWZlcmVuY2VkIGJ5IHRoZQpvdGhlciwgSSdsbCByZW1vdmUgdGhlIHVudXNlZCBz
dHJ1Y3RzIGluIHY3LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
