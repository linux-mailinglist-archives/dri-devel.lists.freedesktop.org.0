Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998B336E4B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 09:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33BF6EB33;
	Thu, 11 Mar 2021 08:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2DB6EB2F;
 Thu, 11 Mar 2021 08:54:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jt13so44632464ejb.0;
 Thu, 11 Mar 2021 00:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=74lcwYBpZti2JX+AnLita0F3Q+SuAKneVVEX1qvmJKA=;
 b=m2ZQoyAtypEpW/KCb7CjszP+3lU9faU2B0C5fiEQ8rhrhDhIRRjNTzOjEtOuvgj1zn
 f5etmZBe67c+AU32wiO4tUOs7wFPdx4IeAaI324hVPQwJ3EW09befz86etvH3TL+jHyJ
 /arfJgNqqaYpSsSatjeNa+KavTiHVllAlx3umcHO7IX/e7ilaawSV14QCKusrn5dWyex
 Na3RFLZ/upJYaHv+QLZY32wMAPYQG3IzhEwivbEiwHr/9djS4jVsBIelQRpTiB/VhZHz
 kX+KMvA2VPqR4KDAb7glKdw/Ye+FKFVTzgaa670W7/VLHbERHF6N+n+T+WBq4si34Zw9
 3U7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=74lcwYBpZti2JX+AnLita0F3Q+SuAKneVVEX1qvmJKA=;
 b=pNY6uEJxcqMk2J1p4L5yAoy2KNQMoyz8mhTsqnS7/T7RxHF1B/Y7XYHZtCwqiVXbdX
 qAYIC0uOXHD02JKO4OypxlselMAoPUSz4fwGXCKS5dXjyWzTeUFo4xxxeW+IKLxqkvDl
 vZ25+SDyqAgv/HPwJwVD57JPJNExIOFbPXLFWQgMRhet11/HyeRzn6mlYplybZ1zOUTI
 VwMH0zZOuijbIE66xRHsCqHoaHQwh9VxBvO38AWYJrDiXpUMGSPSXXVzOjJBpNtLXXtI
 rMnVAosOwMhLiUZZXt9mlNEW0UQy7hmi+ZhDS+JCYi6ekaG/APYl8sqZni3IlyT/pZlV
 31vw==
X-Gm-Message-State: AOAM5323PA55tzsT7eYApkHluvC+xpd1MNc1jjtW/3ZK+bAK4QEVfaGy
 0L0FoWGghOxJJ3/qRai2OpGUEEphNpXSyg==
X-Google-Smtp-Source: ABdhPJyP7UGP4pXo0vE5y/N26WIhbWazgJI+NMXZgfRjvCM1hfidzzDt6VVqrSor0GNB/xba/9tQXg==
X-Received: by 2002:a17:906:7e12:: with SMTP id
 e18mr2155102ejr.316.1615452851324; 
 Thu, 11 Mar 2021 00:54:11 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:e21c:b1e1:cff0:2c70?
 ([2a02:908:1252:fb60:e21c:b1e1:cff0:2c70])
 by smtp.gmail.com with ESMTPSA id hd8sm897101ejc.92.2021.03.11.00.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 00:54:10 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/amdgpu: fix compile error on architecture s390
To: Oak Zeng <Oak.Zeng@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <1615433344-16267-1-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <51520443-87d1-84fd-cc30-70d432acfbb9@gmail.com>
Date: Thu, 11 Mar 2021 09:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615433344-16267-1-git-send-email-Oak.Zeng@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDMuMjEgdW0gMDQ6Mjkgc2NocmllYiBPYWsgWmVuZzoKPiBpb3JlbWFwX2NhY2hlIGlz
IG5vdCBzdXBwb3J0ZWQgb24gc29tZSBhcmNoaXRlY3R1cmUKPiBzdWNoIGFzIHMzOTAuIFB1dCB0
aGUgY29kZXMgaW50byBhICNpZmRlZiB0byBmaXgKPiBzb21lIGNvbXBpbGUgZXJyb3IgcmVwb3J0
ZWQgYnkgdGVzdCByb2JvdC4KPgo+IFNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0Bh
bWQuY29tPgo+IFJlcG9ydGVkLWJ5OiBLZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4K
ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
IGZvciB0aGUgc2VyaWVzLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+IGlu
ZGV4IDM3NzUxZTcuLjEwOTE1ODUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jCj4gQEAgLTE4MTcsNyArMTgxNyw3IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAKPiAgIAkvKiBDaGFuZ2UgdGhlIHNpemUgaGVy
ZSBpbnN0ZWFkIG9mIHRoZSBpbml0IGFib3ZlIHNvIG9ubHkgbHBmbiBpcyBhZmZlY3RlZCAqLwo+
ICAgCWFtZGdwdV90dG1fc2V0X2J1ZmZlcl9mdW5jc19zdGF0dXMoYWRldiwgZmFsc2UpOwo+IC0j
aWZkZWYgQ09ORklHXzY0QklUCj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4gICAJaWYgKGFkZXYtPmdt
Yy54Z21pLmNvbm5lY3RlZF90b19jcHUpCj4gICAJCWFkZXYtPm1tYW4uYXBlcl9iYXNlX2thZGRy
ID0gaW9yZW1hcF9jYWNoZShhZGV2LT5nbWMuYXBlcl9iYXNlLAo+ICAgCQkJCWFkZXYtPmdtYy52
aXNpYmxlX3ZyYW1fc2l6ZSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
