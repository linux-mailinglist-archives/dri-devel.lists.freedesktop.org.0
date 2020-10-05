Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFDD283684
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 15:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834B389D1D;
	Mon,  5 Oct 2020 13:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF0D89D1D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 13:29:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u16so574063wml.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 06:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=J4lJSUw2mnolBVSLSi1T1yMpxQeJ1k5VmJ1lslOfVkM=;
 b=L7uo6Ef0yMAaXVYn9zH2w53pTfb1Vp8E/wLU7dUONTGj7KP2h1PWgioL2H3mwE0Xbl
 oKzHsiaWidHrKQ8XlKVYSjnNHL870lwGWJTr8Z9Qs1JvM7Gcw9HicqgemTcAvuAv51bK
 QInU0c7EKOUOXvsg3m21c0fNLzBQ66hq+0w54vZG/MmYIDC6z0JdQCt/aeo9pkMgT3Ap
 +Xcn72WT6oVSS0cOUvsUJLupTzfNSltRZptr8A/TdRp8sXbWkzNPXEggYkjFwcknj4Jf
 4fVZXBQHuhk6HvMNr/PYzNeAvIw2KXeLsBpStuUl0rgDwwbCRg6X07C655yblVxWqBFl
 VoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=J4lJSUw2mnolBVSLSi1T1yMpxQeJ1k5VmJ1lslOfVkM=;
 b=ghwleCl9NLOBm9t1W67Xu7OB2A0JsQmzsQl05+nFIn/rBivObyF7Myw3/ZaDUHvus1
 57I2GtgqL0BsUo6PS3R9zLlD88osoGvbE3pTCVemnow0xPmwD09QhSE9aLNUz9TAR/t5
 U0/EifcwEFjxxIRjrtcSRAp90L06X0li8FFfAlz8XvOW8MDk46t0TSEES4il/ZVJQi4+
 jPQU9dNfXiyV0NqLOyDe9yzk8FLReBpo42vCCp8BCJRcJCcIML+NMPec7T8agSD4CB0C
 DF5PXAqGFUqwvlhLDP38LS7Hf0cM97CFi0lsc4UPx+6PSixbPKEuU8+ozdqy2HG01b54
 K/Hw==
X-Gm-Message-State: AOAM530tEi0DUojJY859pkY3lALnzP17vFNyEoLX9WR5HrhhVWdhEHKd
 /TRqdkr8XWQkeh1Gg98Q4Fk=
X-Google-Smtp-Source: ABdhPJwkrzXue/XKOUf9c5ltaHqiVrX7isUjZ4VWpAkHE7cz49pxicK7YpEK0m5FT2H9gsJW+e0R3Q==
X-Received: by 2002:a1c:4306:: with SMTP id q6mr6077422wma.189.1601904543887; 
 Mon, 05 Oct 2020 06:29:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id u188sm8831060wmu.0.2020.10.05.06.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 06:29:03 -0700 (PDT)
Subject: Re: [PATCH 1/8] drm/ttm: remove TTM_PAGE_FLAG_WRITE
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20201001112817.20967-1-christian.koenig@amd.com>
Message-ID: <1e18a1de-de6d-c728-7eb4-801faa4db28f@gmail.com>
Date: Mon, 5 Oct 2020 15:29:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001112817.20967-1-christian.koenig@amd.com>
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

UGluZz8gQnVuY2ggb2YgdHJpdmlhbCBjbGVhbnVwcyBhbmQgcmVtb3ZhbCBvZiB0aGUgY2FjaGlu
ZyBwbGFjZW1lbnQgZmxhZ3MuCgpBbnkgY29tbWVudHMgb24gdGhpcz8KClRoYW5rcywKQ2hyaXN0
aWFuLgoKQW0gMDEuMTAuMjAgdW0gMTM6Mjggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IE5v
dCB1c2VkIGFueSBtb3JlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IC0tLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV90dC5o
IHwgMSAtCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL3R0bS90dG1fdHQuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fdHQuaAo+IGlu
ZGV4IDkxNjkxMjQwYTUwOS4uNWQxODM1ZDQ0MDg0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L3R0bS90dG1fdHQuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fdHQuaAo+IEBAIC0zNCw3
ICszNCw2IEBAIHN0cnVjdCB0dG1fcmVzb3VyY2U7Cj4gICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3Q7Cj4gICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHg7Cj4gICAKPiAtI2RlZmluZSBUVE1fUEFH
RV9GTEFHX1dSSVRFICAgICAgICAgICAoMSA8PCAzKQo+ICAgI2RlZmluZSBUVE1fUEFHRV9GTEFH
X1NXQVBQRUQgICAgICAgICAoMSA8PCA0KQo+ICAgI2RlZmluZSBUVE1fUEFHRV9GTEFHX1pFUk9f
QUxMT0MgICAgICAoMSA8PCA2KQo+ICAgI2RlZmluZSBUVE1fUEFHRV9GTEFHX0RNQTMyICAgICAg
ICAgICAoMSA8PCA3KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
