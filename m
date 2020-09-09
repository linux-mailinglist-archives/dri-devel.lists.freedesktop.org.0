Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410DA2627EF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21516E9E7;
	Wed,  9 Sep 2020 07:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997466E8DF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 01:13:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k25so1351341ljk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 18:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jj82HdlnfwJBabE3Abr3ieMOvv+zrwZvhDyEyryedaM=;
 b=eac1WE+1WLfzrxtEMgce8NTQ1hKbyaWoQoPt6qzi94OmsHrm494hEx7WLXzRGLoK2w
 7ScEIi0bZctdueYSZqcncmutlpV1ISI29djVaHox0zLuF72IngoDIhm/xbVGLWtylicc
 xOz2y6wT/ZqtgM7LhdJ/Htg/4uCPp3Se4g591idMlJxwqV+O2dfit+WPmR9hdz52qPFy
 ykV/ykOli8sRZRuSOzrYB8+I89brjh7Xq5grmxwfNWMbXuANRjfuqSQ49poeJOHTpi29
 hqqopFY0Rfn01H+YkEa5ykiwc9e30Ro0oI1sBrdus6O0kt5eqFAvB5uFf3r8UzHw8IXx
 Ppfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jj82HdlnfwJBabE3Abr3ieMOvv+zrwZvhDyEyryedaM=;
 b=VIwV0Tv+wVGQF7z0en/d5FhES9Jw3Zpx74nCzhoYJdxA2O9isZYVx8soS4ro73m8ir
 csUdznEfgB+TAWNR/wOZeV2OUMO0QiR5hF/5VND+D/udJJUrk3+SYGM24DGeoL93kXVa
 ezbptIhCZkr1t8s6x70v+DqQcPKIQ0bXOQnqxK3Jmyjap2C+Kc1vSUoN/PcqSZgxU22y
 m2JeqZRK+1NAxxANhqIpoQAqast7/HgN+kwQlIaDkMfq5fjMqVnsx3Gog2WGqi8gtRLw
 NwUzpOIL+o2nEg1uIrfzju6DgIPibcD0WwYd6InByvJ3bT7c2/O++vJbEQmy4kiuiRR6
 tUEw==
X-Gm-Message-State: AOAM530TfJlX2zL1CGHyvXRuZVGx1T9J/WYSqRC4q780/XufRjm//HKo
 MmNQwdZO4Hno1QxxpUChPYoIzfMTYMM=
X-Google-Smtp-Source: ABdhPJw5+cc9vvB6KCyYmDiPP6Rp1BNitkjvcNKl5RtvpKYK7R+J7P6B4DI5CwLY3TNIMl4K+6RqEw==
X-Received: by 2002:a2e:8619:: with SMTP id a25mr607336lji.390.1599614005028; 
 Tue, 08 Sep 2020 18:13:25 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id 25sm326994lji.130.2020.09.08.18.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 18:13:24 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
Date: Wed, 9 Sep 2020 04:13:23 +0300
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
YV9kcm1faW9jdGxfY2hhbm5lbF9zdWJtaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgdm9pZCAq
ZGF0YSwKPiArCQkJCSAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPiArewo+ICsJc3RydWN0IHRl
Z3JhX2RybV9maWxlICpmcHJpdiA9IGZpbGUtPmRyaXZlcl9wcml2Owo+ICsJc3RydWN0IGRybV90
ZWdyYV9jaGFubmVsX3N1Ym1pdCAqYXJncyA9IGRhdGE7Cj4gKwlzdHJ1Y3QgZHJtX3RlZ3JhX3N1
Ym1pdF9zeW5jcHRfaW5jciBpbmNyOwo+ICsJc3RydWN0IHRlZ3JhX2RybV9qb2JfZGF0YSAqam9i
X2RhdGE7Cj4gKwlzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggYWNxdWlyZV9jdHg7Cj4gKwlzdHJ1Y3Qg
dGVncmFfZHJtX2NoYW5uZWxfY3R4ICpjdHg7Cj4gKwlzdHJ1Y3QgaG9zdDF4X2pvYiAqam9iOwo+
ICsJc3RydWN0IGdhdGhlcl9ibyAqYm87Cj4gKwl1MzIgaTsKPiArCWludCBlcnI7Cj4gKwo+ICsJ
aWYgKGFyZ3MtPnJlc2VydmVkWzBdIHx8IGFyZ3MtPnJlc2VydmVkWzFdIHx8IGFyZ3MtPnJlc2Vy
dmVkWzJdIHx8Cj4gKwkgICAgYXJncy0+cmVzZXJ2ZWRbM10pCj4gKwkJcmV0dXJuIC1FSU5WQUw7
Cj4gKwo+ICsJY3R4ID0gdGVncmFfZHJtX2NoYW5uZWxfY3R4X2xvY2soZnByaXYsIGFyZ3MtPmNo
YW5uZWxfY3R4KTsKPiArCWlmICghY3R4KQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWVy
ciA9IHN1Ym1pdF9jb3B5X2dhdGhlcl9kYXRhKGRybSwgJmJvLCBhcmdzKTsKPiArCWlmIChlcnIp
Cj4gKwkJZ290byB1bmxvY2s7Cj4gKwo+ICsJam9iX2RhdGEgPSBremFsbG9jKHNpemVvZigqam9i
X2RhdGEpLCBHRlBfS0VSTkVMKTsKPiArCWlmICgham9iX2RhdGEpIHsKPiArCQllcnIgPSAtRU5P
TUVNOwo+ICsJCWdvdG8gcHV0X2JvOwo+ICsJfQo+ICsKPiArCWVyciA9IHN1Ym1pdF9wcm9jZXNz
X2J1ZnMoZHJtLCBibywgam9iX2RhdGEsIGN0eCwgYXJncywgJmFjcXVpcmVfY3R4KTsKPiArCWlm
IChlcnIpCj4gKwkJZ290byBmcmVlX2pvYl9kYXRhOwo+ICsKPiArCWVyciA9IHN1Ym1pdF9jcmVh
dGVfam9iKGRybSwgJmpvYiwgYm8sIGN0eCwgYXJncywgZmlsZSk7Cj4gKwlpZiAoZXJyKQo+ICsJ
CWdvdG8gZnJlZV9qb2JfZGF0YTsKPiArCj4gKwllcnIgPSBzdWJtaXRfaGFuZGxlX3N5bmNwdHMo
ZHJtLCBqb2IsICZpbmNyLCBhcmdzKTsKPiArCWlmIChlcnIpCj4gKwkJZ290byBwdXRfam9iOwoK
SG93IG1hbnkgc3luYyBwb2ludHMgd291bGQgdXNlIGFuIGF2ZXJhZ2Ugam9iPyBNYXliZSBpdCBz
aG91bGQgYmUgYmV0dGVyCnRvIGhhdmUgdGhlIHByZWRlZmluZWQgYXJyYXkgb2Ygc3luYyBwb2lu
dHMgd2l0aGluIHRoZSBzdHJ1Y3QKZHJtX3RlZ3JhX2NoYW5uZWxfc3VibWl0PwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
