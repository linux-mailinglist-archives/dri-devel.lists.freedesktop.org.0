Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F191F8FC9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1F56E26C;
	Mon, 15 Jun 2020 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BC289D4A
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 19:36:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id n23so16603074ljh.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 12:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1oH7NEv4PmtGLNbJThmXxcB8UaLcSHXncndfYE40f7s=;
 b=bkf5YXbqGdwW6lPc/1SSSWgymcELeJyDmOtK7/kYlJc/HWU2UIcK60fCWIwvN9PkGX
 74iIUMnv/pCLXNK8YRnSObP4mmegyxoB8efjFVhVCmt7WVLqOzbrJHe5rhRCEMLOnOnn
 bTxEE500hpm00IDWiEV2WbODS835j702vjOJKke0bwrlidMjYQTIW+RsFKOMqkfdOkAK
 iuPtDGP9GM7W30IWtxUv9Bxo3JXXUcF5Ic3csiHpWKivQwE+EGjEDXekfQKB0zwMQDgA
 bw+KmqYR5MpvdWfzS6+jBNyerfNWPCFdozk6p7wZE185FiksqVqG+ADprFDulpj0HPnx
 XNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1oH7NEv4PmtGLNbJThmXxcB8UaLcSHXncndfYE40f7s=;
 b=g+trp1Peur9qB5PCwyBfnzz7iWi5iBF/B0qdatBjQSzsEWvN+Nac4UYHhN3C6+OBdO
 UzsUI39yaGTdLtzR1oWmmp40ghVVuLGOgqd+j36fNqeh1ilUpTAlx4T6fgFCYTdwgfW5
 vSuJAIvB6tYKx/IU3eO7QA1uok8+WIqlLBbZD0RXKce36ZsWgbyvdCvi5I8DNKM4Whv7
 4SRF0MLS38EYfQ/eraem0PRd6ZFbvu8fiWvbblyRrkRSjEa3Xt5bvRARwU19CSfuTNKX
 8kcMOEqgRA1Li7zF2wJwFUgskjF3w77UQlPUZ6Fy/xYgbx3nhJdzFASotM0wkWab3n/M
 G2CA==
X-Gm-Message-State: AOAM532oQ42q8G+4vvQHJgXrbWbUzyFx27osx/GX33BJfF4ESuoHI/oa
 5k6kovYfRkTHvf0c2WG6RWk=
X-Google-Smtp-Source: ABdhPJyl6Ol7cj6oCxj3XNEdTRqr/duhC5G7MTmnjBSgNWPgoRcc5u81BoYLmHaL3Z+LaswrxAaSsg==
X-Received: by 2002:a2e:7e08:: with SMTP id z8mr10385946ljc.339.1592163389586; 
 Sun, 14 Jun 2020 12:36:29 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id s25sm3418494ljj.119.2020.06.14.12.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2020 12:36:28 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] drm/panel: Set display info in panel attach
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
References: <20200614190348.12193-1-digetx@gmail.com>
 <20200614190348.12193-3-digetx@gmail.com>
Message-ID: <81b3ed4b-5cf1-0b61-1457-b07e8d8a2de3@gmail.com>
Date: Sun, 14 Jun 2020 22:36:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200614190348.12193-3-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTQuMDYuMjAyMCAyMjowMywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gRnJvbTogRGVy
ZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gCj4gRGV2aWNldHJlZSBzeXN0
ZW1zIGNhbiBzZXQgcGFuZWwgb3JpZW50YXRpb24gdmlhIGEgcGFuZWwgYmluZGluZywgYnV0Cj4g
dGhlcmUncyBubyB3YXksIGFzIGlzLCB0byBwcm9wYWdhdGUgdGhpcyBzZXR0aW5nIHRvIHRoZSBj
b25uZWN0b3IsCj4gd2hlcmUgdGhlIHByb3BlcnR5IG5lZWQgdG8gYmUgYWRkZWQuCj4gVG8gYWRk
cmVzcyB0aGlzLCB0aGlzIHBhdGNoIHNldHMgb3JpZW50YXRpb24sIGFzIHdlbGwgYXMgb3RoZXIg
Zml4ZWQKPiB2YWx1ZXMgZm9yIHRoZSBwYW5lbCwgaW4gdGhlIGRybV9wYW5lbF9hdHRhY2ggZnVu
Y3Rpb24uIFRoZXNlIHZhbHVlcwo+IGFyZSBzdG9yZWQgZnJvbSBwcm9iZSBpbiB0aGUgZHJtX3Bh
bmVsIHN0cnVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3Jl
QGNocm9taXVtLm9yZz4KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+IFRlc3RlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiAtLS0KCkFo
LCBJIGp1c3QgcmVhbGl6ZWQgdGhhdCB0aGlzIHBhdGNoIGlzIG9ic29sZXRlIG5vdyEgSSBhbHNv
IGdvdCBlbWFpbApib3VuY2VzIHNheWluZyB0aGF0IHNvbWUgZW1haWwgc2VydmVycyBkaWRuJ3Qg
bGlrZSB0aGUgVVRGIHN5bWJvbCBpbgpuYW1lIG9mIHRoZSBmaXJzdCBlbWFpbCwgc28gd2lsbCBt
YWtlIGEgdjIgc2hvcnRseS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
