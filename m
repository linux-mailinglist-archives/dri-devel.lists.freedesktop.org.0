Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA52627D9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E806E9D7;
	Wed,  9 Sep 2020 07:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC126E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 02:06:54 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a22so1383222ljp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 19:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CxD0K5ERopLSbf6cvkQwLtW5syT9rt5pdwC61DUguiE=;
 b=GMBwItlSrwzsWAdp91ahdy7Pi2m+LdLOEFbWZU6DfjpIbh2SwAQdMZGdtpshN38cGS
 RNUEnY+s7nmhut7zAxIjAVXoTAOTpYDn/tcgXm8jcK7hOKNzA9D5nRHTYyzO9URVSg/J
 Hw9BO2yOzhrivGoeS7ART7aXt3YH6A/O3Ez8U/S01Xt/R7N9SvCaO/apEVy++3ZdG7rU
 w/hABDk+Kz2WmGAF8yWk6JfgMBoy6ef4j67nhvrPAOCW1LVleyCCVJr7ucfCAx0AKvhM
 BWu4KrYeiRkp67AKlJN9svFL+QeKSBWDxzBfXUHKJr8MCMvBb802Z9MRXvbV6yf09Hk0
 XLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CxD0K5ERopLSbf6cvkQwLtW5syT9rt5pdwC61DUguiE=;
 b=THxsDOdcipOrQH29QYGAuiooRe+4RaRcAv1uFOucxK5kKHUvrM3xmfwLLsLaFHNaV2
 aAxGLyAj5+pRYYYkb9h3LrImc7M55TzZgR0ryoPaWUfkEDtv3ZgCzdTwbAkILLFIcBvX
 xGcXnBAmHG7aC/ZLY7kKvTWyIFICqsf+78QY3l49EX8tyhTSuz8nHCmUgHk3zzizNohk
 bCp2SiCLRct1SEUTOK+L0vhLUN729vMCESQuCuDlbreu/zrl2hTjqoP1G7ouIqpX5HMk
 k0giVfu8WBo7GoXqtzXyqxy5Be9zVf7JTUdv0zVhh70ir5MZHy9xfc/+TnzOAcbDepaH
 RppA==
X-Gm-Message-State: AOAM533KWPNAin1uAuWeJjovu4tOghWjmBjp0zrwo/Xr58rn+aHgZNjI
 ddPEG9lLfQKlUdSY06doJ6M=
X-Google-Smtp-Source: ABdhPJzTEfBiW5wnT+E8sPjnN6aQhgbBQkm8zRs21KV5Hf7WYovJYTFtoOsdg3ZwjBfF7NQmFpqgRQ==
X-Received: by 2002:a05:651c:1193:: with SMTP id
 w19mr605476ljo.89.1599617213398; 
 Tue, 08 Sep 2020 19:06:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id u14sm349930lji.83.2020.09.08.19.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 19:06:52 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <172f940f-af60-8f8a-6c76-4ff89accd8c5@gmail.com>
Date: Wed, 9 Sep 2020 05:06:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-18-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gK2ludCB0ZWdy
YV9kcm1faW9jdGxfY2hhbm5lbF9vcGVuKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmRh
dGEsCj4gKwkJCQkgc3RydWN0IGRybV9maWxlICpmaWxlKQo+ICt7Cj4gKwlzdHJ1Y3QgdGVncmFf
ZHJtX2ZpbGUgKmZwcml2ID0gZmlsZS0+ZHJpdmVyX3ByaXY7Cj4gKwlzdHJ1Y3QgdGVncmFfZHJt
ICp0ZWdyYSA9IGRybS0+ZGV2X3ByaXZhdGU7Cj4gKwlzdHJ1Y3QgZHJtX3RlZ3JhX2NoYW5uZWxf
b3BlbiAqYXJncyA9IGRhdGE7Cj4gKwlzdHJ1Y3QgdGVncmFfZHJtX2NsaWVudCAqY2xpZW50ID0g
TlVMTDsKPiArCXN0cnVjdCB0ZWdyYV9kcm1fY2hhbm5lbF9jdHggKmN0eDsKPiArCWludCBlcnI7
Cj4gKwo+ICsJaWYgKGFyZ3MtPmZsYWdzIHx8IGFyZ3MtPnJlc2VydmVkWzBdIHx8IGFyZ3MtPnJl
c2VydmVkWzFdKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWN0eCA9IGt6YWxsb2Moc2l6
ZW9mKCpjdHgpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghY3R4KQo+ICsJCXJldHVybiAtRU5PTUVN
Owo+ICsKPiArCWVyciA9IC1FTk9ERVY7Cj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGNsaWVudCwg
JnRlZ3JhLT5jbGllbnRzLCBsaXN0KSB7Cj4gKwkJaWYgKGNsaWVudC0+YmFzZS5jbGFzcyA9PSBh
cmdzLT5ob3N0MXhfY2xhc3MpIHsKPiArCQkJZXJyID0gMDsKPiArCQkJYnJlYWs7Cj4gKwkJfQo+
ICsJfQo+ICsJaWYgKGVycikKPiArCQlnb3RvIGZyZWVfY3R4Owo+ICsKPiArCWlmIChjbGllbnQt
PnNoYXJlZF9jaGFubmVsKSB7Cj4gKwkJY3R4LT5jaGFubmVsID0gaG9zdDF4X2NoYW5uZWxfZ2V0
KGNsaWVudC0+c2hhcmVkX2NoYW5uZWwpOwo+ICsJfSBlbHNlIHsKPiArCQljdHgtPmNoYW5uZWwg
PSBob3N0MXhfY2hhbm5lbF9yZXF1ZXN0KCZjbGllbnQtPmJhc2UpOwo+ICsJCWlmICghY3R4LT5j
aGFubmVsKSB7Cj4gKwkJCWVyciA9IC1FQlVTWTsKPiArCQkJZ290byBmcmVlX2N0eDsKPiArCQl9
Cj4gKwl9Cj4gKwo+ICsJZXJyID0geGFfYWxsb2MoJmZwcml2LT5jb250ZXh0cywgJmFyZ3MtPmNo
YW5uZWxfY3R4LCBjdHgsCj4gKwkJICAgICAgIFhBX0xJTUlUKDEsIFUzMl9NQVgpLCBHRlBfS0VS
TkVMKTsKPiArCWlmIChlcnIgPCAwKSB7Cj4gKwkJbXV0ZXhfdW5sb2NrKCZmcHJpdi0+bG9jayk7
CgpMb29rcyBsaWtlIHRoZSBsb2NrIHdhcyBuZXZlciB0YWtlbi4KCj4gKwkJZ290byBwdXRfY2hh
bm5lbDsKPiArCX0KPiArCj4gKwljdHgtPmNsaWVudCA9IGNsaWVudDsKPiArCXhhX2luaXRfZmxh
Z3MoJmN0eC0+bWFwcGluZ3MsIFhBX0ZMQUdTX0FMTE9DKTsKCldoeSBub3QgWEFfRkxBR1NfQUxM
T0MxPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
