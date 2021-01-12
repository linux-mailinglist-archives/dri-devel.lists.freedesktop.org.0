Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67202F4638
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765CF6E151;
	Wed, 13 Jan 2021 08:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DF789ACC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 22:27:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x20so5707709lfe.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 14:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KZTVZX+G1faRH05XHR9eW49XGapVn7odqnWVVEsQeeU=;
 b=mjY6QsoOXqXLjUlDXa1uFZye0tpvyiHP17TLeeRaNHObEmGqA7j3lgvNpjBbctNvQC
 D8Y/DkStU+z8uhOuIZVeCn/Yf+LbKgDdykSyJJJHi0ShVUavxV0gsVKg8Me2yRXWao3l
 cUqlptaxfGOqGh3vkaZLebKgJUgXLddhbtwG3rRqTT/0LXGnPmEUphpGLb088JH53dO+
 3OgDyjQ3e6dhqwqlhLPTHyVQgaQQooXKGwjyL2bZqVAzR2rdIhOLjJkDuK6kJkHu5b8v
 PLPyYKbpkVvNbfUHSSfQdT2Z3xQorlp7C9DOqZadsLJoyvoVQr9+5PBP4FlTrIXIcywK
 x2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KZTVZX+G1faRH05XHR9eW49XGapVn7odqnWVVEsQeeU=;
 b=V0+frWrBDgCrMwsJGy1MjYan7ahN+D0z7IsF4LM05IGfgGe4ob/T/ZsRmIeBlVbl+o
 qT2Zm38LtsdsDPOFrC9mK9+VyMq4z/b7JRVoumPhwoWeRHBXSH7bUOlYJsZV6YhrgOO9
 s43BGE+wCQBLMf5e8KxIp3N7GcRp0PocIOMZMDBovWsFykY/KcfxXDXLqlK0fSZvbYiH
 QU17tcevn8KQB0DpdeCXEWSvHZ6Flj0GJVjFENzRBVmt4MUS8NE7ty9e7jn3svu+BhnA
 Wfy5CHHQlU3mOwEvxWcQA6rVk2qc1b6oAZMk4tGp+RGpTiHvughsjCRHnKxiXmk6UKZP
 q7jg==
X-Gm-Message-State: AOAM530EAupdRMhUlfxQCKhVAp6o8eFyY9dSphTOePtFbe4hkyyJl3ab
 ERgopT7fDb+WpuJ1uC5cNB4=
X-Google-Smtp-Source: ABdhPJxCjoQBortocwDiTLP454k0ohJgpNerRSVUQQGnZbbECAA0NzL96jnWpdlDXzK/36UXME1Pgw==
X-Received: by 2002:ac2:598a:: with SMTP id w10mr442750lfn.547.1610490423712; 
 Tue, 12 Jan 2021 14:27:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id l8sm1011lfk.120.2021.01.12.14.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 14:27:03 -0800 (PST)
Subject: Re: [PATCH v5 19/21] drm/tegra: Implement new UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-20-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fef08a5b-dbe4-f1a2-2ecc-41c86611cfe4@gmail.com>
Date: Wed, 13 Jan 2021 01:27:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210111130019.3515669-20-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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

MTEuMDEuMjAyMSAxNjowMCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gK2ludCB0ZWdy
YV9kcm1faW9jdGxfY2hhbm5lbF9vcGVuKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHZvaWQgKmRh
dGEsCj4gKwkJCQkgc3RydWN0IGRybV9maWxlICpmaWxlKQo+ICt7Cj4gKwlzdHJ1Y3QgdGVncmFf
ZHJtX2ZpbGUgKmZwcml2ID0gZmlsZS0+ZHJpdmVyX3ByaXY7Cj4gKwlzdHJ1Y3QgdGVncmFfZHJt
ICp0ZWdyYSA9IGRybS0+ZGV2X3ByaXZhdGU7Cj4gKwlzdHJ1Y3QgZHJtX3RlZ3JhX2NoYW5uZWxf
b3BlbiAqYXJncyA9IGRhdGE7Cj4gKwlzdHJ1Y3QgdGVncmFfZHJtX2NsaWVudCAqY2xpZW50ID0g
TlVMTDsKPiArCXN0cnVjdCB0ZWdyYV9kcm1fY2hhbm5lbF9jdHggKmN0eDsKPiArCWludCBlcnI7
Cj4gKwo+ICsJaWYgKGFyZ3MtPmZsYWdzKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWN0
eCA9IGt6YWxsb2Moc2l6ZW9mKCpjdHgpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghY3R4KQo+ICsJ
CXJldHVybiAtRU5PTUVNOwo+ICsKPiArCWVyciA9IC1FTk9ERVY7Cj4gKwlsaXN0X2Zvcl9lYWNo
X2VudHJ5KGNsaWVudCwgJnRlZ3JhLT5jbGllbnRzLCBsaXN0KSB7Cj4gKwkJaWYgKGNsaWVudC0+
YmFzZS5jbGFzcyA9PSBhcmdzLT5ob3N0MXhfY2xhc3MpIHsKPiArCQkJZXJyID0gMDsKPiArCQkJ
YnJlYWs7Cj4gKwkJfQo+ICsJfQo+ICsJaWYgKGVycikKPiArCQlnb3RvIGZyZWVfY3R4Owo+ICsK
PiArCWlmIChjbGllbnQtPnNoYXJlZF9jaGFubmVsKSB7Cj4gKwkJY3R4LT5jaGFubmVsID0gaG9z
dDF4X2NoYW5uZWxfZ2V0KGNsaWVudC0+c2hhcmVkX2NoYW5uZWwpOwoKTGV0J3Mgb21pdCB0aGUg
c2hhcmVkX2NoYW5uZWwgdW50aWwgaXQgd2lsbCBiZSByZWFsbHkgbmVlZGVkIGFuZCB1c2VkLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
