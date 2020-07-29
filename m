Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CEA231C46
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 11:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B0C6E4A2;
	Wed, 29 Jul 2020 09:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318856E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 09:47:41 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i26so13623846edv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=L+u/TX3bOVQYl2Bs9NIKiPzImnxuJGeU99Muag+2qvM=;
 b=Gq+PM1hJSyRCeCZFwma67Ik9fMRMDbAGCwps0zPC3JzjrniSeJ3DfbycnJlUUhbmFT
 6nRUwW+tPBVn5VexuWjQC/0XSYXvABezzk29I5AiR9DmwmZHphrMLseWQl7QvQ1WIiI0
 OkD6ucAN2ShbMPnMjCahFcgWJN4DHxMnb9az+8x991xfXjuehM1OkMFIWATrJPqPP/wE
 KW/5NWl/gnwqZkzc2NdEb/Mgcmbhs8ziyfvj/ID1OMBliRBgsgYZQK1DUToES3R3Sblb
 q+FeiDmDxCDtpTtxjuSpCgzcCUvpYuXKhsGK2ZMNI+3s4Bkam+iEXrdsPJGO0Xj60vRz
 KFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=L+u/TX3bOVQYl2Bs9NIKiPzImnxuJGeU99Muag+2qvM=;
 b=nyL9PY8p9k5fYFqZtN6wb+QaNXdv+ONJNtb2RQqo2rMgaBIJTzKsBpyPLSD+2IKlUm
 YJax8hLoqlkj17WC5H086QrmV+ISAh4rwN9aWq5r6NVS2kEB4kRIZMKHoDcR7Du9QExB
 RflKPNxgdyxpR9OxdWYIrr8d8TXebcuLCi3pXIoqxJUf5cc8mI9fGcDs1HKFJlchAHnZ
 bN02TSFG4anB8o9rVCHl56a6PORKD2TQrSsxvCH3RL+YvXobOZ1jkqaofB/nE3saIJgZ
 lXCGBxPcqtEpbCcO/t8oUryY629T4Z1gbHASwXxJwoeJz5iZ2dPzQbj3HKlAXF2rdAOX
 Vo4A==
X-Gm-Message-State: AOAM530XzfD7yhyGNQuGmCy4px4wOEJzDxDV5mZvLjlti0TXQzf0HgcJ
 4yu9pS8VH2rocZ55zspF6jQFn4gN
X-Google-Smtp-Source: ABdhPJzyKWL/LMzOcBKsFUODVOyFLiQ8wOj6HI5XNOzWXqQjqU2rAZttU39yJDCyJ9k06bjE7KyEhA==
X-Received: by 2002:a05:6402:2379:: with SMTP id
 a25mr19027352eda.180.1596016059564; 
 Wed, 29 Jul 2020 02:47:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r6sm1140060ejd.55.2020.07.29.02.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 02:47:35 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/ttm: initialize the system domain with defaults
To: Dave Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20200723151710.3591-1-christian.koenig@amd.com>
 <20200723151710.3591-2-christian.koenig@amd.com>
 <0f69b57b-407a-8c23-04e2-280436e6c368@suse.de>
 <CAPM=9tzxbuRreP36053dfKXwm0AppDKp+y55JEJ6bt=YE5WRLg@mail.gmail.com>
 <CAPM=9tz=0a0J4N=FAd5vN1M7yTszDy7D9qvZCc-m6szZAi9M=w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2cce5907-e856-2768-65a5-703fa55a56ce@gmail.com>
Date: Wed, 29 Jul 2020 11:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tz=0a0J4N=FAd5vN1M7yTszDy7D9qvZCc-m6szZAi9M=w@mail.gmail.com>
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDcuMjAgdW0gMDg6MjMgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBXZWQsIDI5IEp1
bCAyMDIwIGF0IDE2OjIxLCBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+
PiBPbiBGcmksIDI0IEp1bCAyMDIwIGF0IDE2OjQzLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4+Pgo+Pj4KPj4+IEFtIDIzLjA3LjIwIHVtIDE3OjE3IHNj
aHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+PiBJbnN0ZWFkIG9mIHJlcGVhdGluZyB0aGF0IGlu
IGVhY2ggZHJpdmVyLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+PiBJJ20gbm90IHN1cmUgd2hhdCBoYXBwZW5lZCBi
dXQgdGhlIHBhdGNod29yayBjb3BpZXMgb2YgdGhpcyBzZXJpZXMgYXJlCj4+IG1hbmdsZWQgYmFk
bHksIEkgZXhwZWN0IEFNRCBlbWFpbCB3aXRoIHRoZSBjcmFwcHkgaGVhZGVycyBvciBzb21ldGhp
bmcKPj4gZ290IGluIHRoZXJlIHNvbWV3aGVyZS4KPj4KPj4gQ2FuIHdlIGdldCB0aGVtIGluIGRy
bS1taXNjLW5leHQgYXQgc29tZSBwb2ludCBzbyBJIGNhbiBjbGVhbmx5IGxvb2sgYXQgdGhlbS4K
PiBPaCBpdCBsb29rcyBsaWtlIHRoZXkgYXJlIHRoZXJlIGFscmVhZHksIEknbSBub3Qgc3VyZSB3
aHkgSSdtIGhhdmluZwo+IHRyb3VibGUgYXBwbHlpbmcgdGhlIG5leHQgc2V0LiB3aWxsIGRpZyBh
IGJpdCBtb3JlLgoKV2FudGVkIHRvIHNlbmQgdGhhdCBvbmUgb3V0IG9uY2UgbW9yZSB0b2RheSBh
bnl3YXkgc2luY2UgSSB3b3VsZCBsaWtlIHRvIAprZWVwIHRoZSBzcGVjaWFsIFZNV0dGWCBiaXRz
IERhbmllbCBwb2ludGVkIGZvciBub3cuCgpHaXZlIG1lIGEgZmV3IGhvdXJzIHRvIGNsZWFuIHRo
YXQgdXAsCkNocmlzdGlhbi4KCj4KPiBEYXZlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
