Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4C32E460
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 10:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A400C6EB24;
	Fri,  5 Mar 2021 09:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DE26EB26
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 09:10:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f12so1226203wrx.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 01:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=63BZTwf3MLMQAkn2BdrHZ1xTK2bwmRKITVezIt3sV9k=;
 b=qIhQjiqOP57bI/hD1kFs2/6tOxvCVgreYU6SWkrNvwDFlxQwEnv3kFFVIEiRAtV0bs
 ghqevsOeKImy2rOLICgbeqWEThfUBb62WD98f6OLGoRbJPi+3ECHQTjzD7T09L6iNH1X
 oAm7OJWf/W0mgFiXr47BHOFHjWLpDx1yqdw07vCbJeqMn/SZ6et48VCP9iSh47jL2RrG
 gVVStZeH/O8pcqGXOJ9EMd4F8njNQwNN9alPkOkaB3F9hedHZi9ivpiK4dy/1O75s2EC
 b80SYjFrOOr3XHujkCejze9BNQcAsrZT3Cpqt9O3cmDicy//qO7rhTZOo3V9VbGlcI9b
 TE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=63BZTwf3MLMQAkn2BdrHZ1xTK2bwmRKITVezIt3sV9k=;
 b=CjOt0uozXncsQn39xXSBY6gVrE4Ufl7H5VGKKSfH+AytGjvk5233BLh3DwSdnLOlw5
 jKBjhFmObap6Gt3jXwQX29WNe5sh7ovq2XlQrWeJZyT+3JY/xh9LgKMiGuXWcoH2+R0P
 o2yLTvcbmZ5uRzZ8BK+KrPAKf8735bOlGIlIZWy4DZOWe9CNGnLDtj4zX2ewbcSR5Mxz
 HYX3YIj+ruuJtgtU4A8axX9fH9vMK/zKTv7CscoRd3QIHjbuCDfmrlodoArEVHd2/P0w
 ZjmJvEfI3ccx0/MxCY3kbdVet0NFxnFGyN/RVW5T15MO0HqDI0w4ey8nsrN/5FNkj9fK
 iNVQ==
X-Gm-Message-State: AOAM533YTfFnhaBFaYYsNyhf/M7thSiHW0nKhbOXSoPoc1UQUzfKldzX
 4JD2XzJ8LKt//go6rDlxwIty7Q==
X-Google-Smtp-Source: ABdhPJwGPV9w/pRUAVZfWeOAHCnQFfI/8tinbzeWQre8iQkJRqLUzFYfp3bIvMhEWSuLcWlSXdr0MQ==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr8376871wrv.194.1614935418378; 
 Fri, 05 Mar 2021 01:10:18 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net.
 [82.252.144.192])
 by smtp.googlemail.com with ESMTPSA id 36sm3695411wrh.94.2021.03.05.01.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:10:17 -0800 (PST)
Subject: Re: [PATCH] devfreq: Register devfreq as a cooling device
To: Steven Price <steven.price@arm.com>, cwchoi00@gmail.com,
 kyungmin.park@samsung.com, myungjoo.ham@samsung.com
References: <20210304125034.28404-1-daniel.lezcano@linaro.org>
 <23db1b13-9418-91f5-4871-f45b983f6e3c@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e8c5f550-0ca5-b4e4-1113-3af760d2780e@linaro.org>
Date: Fri, 5 Mar 2021 10:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <23db1b13-9418-91f5-4871-f45b983f6e3c@arm.com>
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
Cc: "moderated list:DRM DRIVERS FOR LIMA" <lima@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS FOR LIMA" <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Qiang Yu <yuq825@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDMvMjAyMSAwOToxMiwgU3RldmVuIFByaWNlIHdyb3RlOgo+IE9uIDA0LzAzLzIwMjEg
MTI6NTAsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBDdXJyZW50bHkgdGhlIGRlZmF1bHQgYmVo
YXZpb3IgaXMgdG8gbWFudWFsbHkgaGF2aW5nIHRoZSBkZXZmcmVxCj4+IGJhY2tlbmQgdG8gcmVn
aXN0ZXIgdGhlbXNlbHZlcyBhcyBhIGRldmZyZXEgY29vbGluZyBkZXZpY2UuCj4+Cj4+IFRoZXJl
IGFyZSBubyBzbyBtYW55IGFuZCBhY3R1YWxseSBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHJlZ2lz
dGVyIHRoZQo+PiBkZXZmcmVxIGRldmljZSB3aGVuIGFkZGluZyBpdC4KPj4KPj4gQ29uc2VxdWVu
dGx5LCBldmVyeSBkZXZmcmVxIGJlY29tZXMgYSBjb29saW5nIGRldmljZSBsaWtlIGNwdWZyZXEg
aXMuCj4+Cj4+IEhhdmluZyBhIGRldmZyZXEgYmVpbmcgcmVnaXN0ZXJlZCBhcyBhIGNvb2xpbmcg
ZGV2aWNlIGNhbiBub3QgbWl0aWdhdGUKPj4gYSB0aGVybWFsIHpvbmUgaWYgaXQgaXMgbm90IGJv
dW5kIHRvIHRoaXMgb25lLiBUaHVzLCB0aGUgY3VycmVudAo+PiBjb25maWd1cmF0aW9ucyBhcmUg
bm90IGltcGFjdGVkIGJ5IHRoaXMgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
TGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KPj4gLS0tCgpbIC4uLiBdCgo+PiDC
oMKgwqDCoMKgIGlmIChwZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRlZCkgewo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X3BtX29wcF9vZl9yZW1vdmVfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYp
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGZkZXZmcmVxLT5vcHBfb2ZfdGFibGVfYWRkZWQgPSBm
YWxzZTsKPiAKPiBZb3UndmUgcmVtb3ZlZCBhbGwgcmVmZXJlbmNlcyB0byBwZmRldmZyZXEtPmNv
b2xpbmcsIHNvIHBsZWFzZSBhbHNvCj4gcmVtb3ZlIHRoZSBtZW1iZXIgZnJvbSBzdHJ1Y3QgcGFu
ZnJvc3RfZGV2ZnJlcSAoYXMgYWxyZWFkeSBkb25lIHdpdGgKPiBsaW1hIGFuZCBtc20pLgoKU3Vy
ZSwgdGhhbmtzIGZvciBzcG90dGluZyB0aGlzLgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
Lz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
