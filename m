Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B36020CA60
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498646E180;
	Sun, 28 Jun 2020 20:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC756E311
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 21:47:16 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id t74so6988846lff.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ekENi2JYHEuJAdUbeYjX727t9pq4C9ly4N7cklnjims=;
 b=Y+HHlMeUG0RxTatZAp0BPfDVMCKaT90nwXFPWAs42ZQKMIoxCS5yVC0FIxLIfp+tO1
 ZhMq5RHuqS53fl9CjjZCU1GOElYN3Ze9brBStc5gSyzYbnSBrdJyggIfuwjwsh6DPRHv
 xzaUq6GgjCTNyYCwL7kSB/bdDMlfD7nIhXsWU288Qj/4cLfno5qfnk1H4ToFlYVckZE4
 orHv6ex4e+qr7MRXvbh713z9FQPxkXIKiuIus1rcG27AG7jNTvW9zoHoFszHOCgwYPUI
 m1GbQRKuG7rGf8oe2iEAMXaymIev9tpn+bI9BTzOjsDkea0L53e7rYvG87vd2TNHx9WK
 MFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ekENi2JYHEuJAdUbeYjX727t9pq4C9ly4N7cklnjims=;
 b=WkSjCpMlyEF4qjrPd5L3+oAX7NOiaKh/XgKlyK335qwFYGi6B5p7AQ5CnPcO2uDYBO
 rxd94QDGZkbZWPz00pfCjLy9PoDvghkeseuPT45LIYIJRX8GbMfg7pgFIEPZ81p/o9w3
 c2rTKAnbzd9A472a2JTLG9InLc2b9n+Rk2F6WGKm8leRm+9uLi8he51bqwSg+jqmOSny
 lIL3QjmHWE36xWwO3dbOytD5pund1QXglC8He1tHpvKOmIqFSUh22JW3MTYDlrnPs0O1
 EtO1rG+HPpavQYoAtUeW2TBXWJy0v9xl1LaEJzbjLAIn654moOfYeNKUr/wtSs90oaSv
 3+VA==
X-Gm-Message-State: AOAM533rLHhzUrK8XPdg9CH5dpigGFASrLCZpAO8BgEezzT1KUVRd498
 9qOkiG1zd/GKCqLqmNCwhPg=
X-Google-Smtp-Source: ABdhPJzDdiwU3twKlFT/dTT9VX4bQgwiRxsN/AhDhVDQqgiKa4z3Ss5iaPiYiwbzaI9FkKhAunhr3g==
X-Received: by 2002:a19:ef09:: with SMTP id n9mr5354460lfh.215.1593294435138; 
 Sat, 27 Jun 2020 14:47:15 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id u19sm854922ljk.0.2020.06.27.14.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jun 2020 14:47:14 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_syncpt_incr)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9ddfedff-f465-b22d-5d6f-c7ba01731455@gmail.com>
Date: Sun, 28 Jun 2020 00:47:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gc3RydWN0IGRy
bV90ZWdyYV9zdWJtaXRfc3luY3B0X2luY3Igewo+IMKgwqDCoMKgwqDCoMKgIC8qCj4gwqDCoMKg
wqDCoMKgwqDCoCAqIFtpbl0gU3luY3BvaW50IEZEIG9mIHRoZSBzeW5jcG9pbnQgdGhhdCB0aGUg
am9iIHdpbGwKPiDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIGluY3JlbWVudC4KPiDCoMKgwqDCoMKg
wqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqAgX19zMzIgc3luY3B0X2ZkOwo+IAo+IMKgwqDCoMKg
wqDCoMKgIC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0gTnVtYmVyIG9mIGluY3JlbWVudHMg
dGhhdCB0aGUgam9iIHdpbGwgZG8uCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDC
oMKgIF9fdTMyIG51bV9pbmNyczsKPiAKPiDCoMKgwqDCoMKgwqDCoCAvKgo+IMKgwqDCoMKgwqDC
oMKgwqAgKiBbb3V0XSBWYWx1ZSB0aGUgc3luY3BvaW50IHdpbGwgaGF2ZSBvbmNlIGFsbCBpbmNy
ZW1lbnRzIGhhdmUKPiDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIGV4ZWN1dGVkLgo+IMKgwqDCoMKg
wqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBmZW5jZV92YWx1ZTsKPiAKPiDCoMKg
wqDCoMKgwqDCoCBfX3UzMiByZXNlcnZlZFsxXTsKPiB9OwoKVGhlIGpvYiBzaG91bGQgYmUgY29u
c2lkZXJlZCBleGVjdXRlZCBvbmNlIHRoZSBmaW5hbCBzeW5jIHBvaW50IGlzCmluY3JlbWVudGVk
LgoKSGVuY2UsIHRoZXJlIHNob3VsZCBiZSBvbmx5IG9uZSBzeW5jIHBvaW50IHBlci1qb2IgZm9y
IGluY3JlbWVudCwgd2h5CndvdWxkIHlvdSBldmVyIG5lZWQgbW9yZSB0aGFuIG9uZT8KCkNvdWxk
IHlvdSBwbGVhc2UgZXhwbGFpbiB3aGF0IHRoaXMgc3VibWl0X3N5bmNwdF9pbmNyIGlzIGFib3V0
PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
