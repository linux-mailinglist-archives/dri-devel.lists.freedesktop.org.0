Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C702426CD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 10:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49896E8CA;
	Wed, 12 Aug 2020 08:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B050E6E8CA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:36:20 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id f24so1335606ejx.6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 01:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GWBpPbEU/iJqb9l6tqby6CJl7qX3Zl21wxv1zYud858=;
 b=MkvEbeAPb5ubVtof/Jdk49xt8BXTQRhLo3IH7GhWPxeWFt3BSCuSQS7vR6EsyphPmK
 xzolBRsmyvZZ04BXBx4ppy/afj0C9iMOY5yZWoESyWIWXKF9Avji1Pi64rBVjXaGqUkG
 ZymOmojQwqfHVsHMshtAw2nZGEsx2XKdFk02lZDVf79lLmmcKwjDUHopRb0pNZGwPyK6
 G25PM+oXH0o5MqCNO46GwiM0Fhvk7S5+eXTspa1fPj1wJ9iqgmqjGtbe4WingW7xEURf
 ny5yBnvTkNnOG67SpZMMZ94pO8IGziIxHC7LYqTZVibOmS0EeJK46KCrIlrOYq0KXgWM
 jscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=GWBpPbEU/iJqb9l6tqby6CJl7qX3Zl21wxv1zYud858=;
 b=kXMjJunKE0ZJ8bpQvQgYkdpWvihvRMaDDi1fkP0OA1EG3QTYzQnNwjOf58ZHWW0Rxj
 zjww5Hdgd9lv0SSx7tfmfXqqa5XTPeoQr9cJGEKicgC/DtO9jRcU0EGOd3J+4nvkVD7X
 NdnmE8GfQrIc69mMGuPSOc/fCvHOAmcwoV6qBY8hmtqz9euENC1DnPObIQxsg1X7rrk5
 8d0e39lZEcHid2M4vjVN8rdUHVu7dzuRKQV30IewsDGzCBoYvDd6+Alzreygvvpl4YM6
 +77ZxnVvy2AGlUL0OFPMExwSj1Uq3YSzdUoesGhh91Y+Te9tuVY5GQY+6QeRvYaKWESt
 9R6Q==
X-Gm-Message-State: AOAM533hcIPj5mRqdLN+BKshv7K4t8fby0vRP8gcwF6KZz+nm8C7ifSX
 JN5s1t6BUmvTeFMoa9a5v23NfnFC
X-Google-Smtp-Source: ABdhPJz6XwqwoQZ2sET1yeizbK5XmsWn7o3q9U/n9bqEViw6u8cZIvdEfbcYlbhzB76ATmjrRrfz1w==
X-Received: by 2002:a17:906:57ca:: with SMTP id
 u10mr5256932ejr.290.1597221378955; 
 Wed, 12 Aug 2020 01:36:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id js19sm1060322ejb.76.2020.08.12.01.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 01:36:17 -0700 (PDT)
Subject: Re: [PATCH] locking/rwsem: remove redundant semicolon of
 down_write_nest_lock
To: peterz@infradead.org
References: <20200811111852.190209-1-christian.koenig@amd.com>
 <20200812081057.GJ2674@hirez.programming.kicks-ass.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8356e96d-8732-0e2e-e962-dec671c19eb2@gmail.com>
Date: Wed, 12 Aug 2020 10:36:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812081057.GJ2674@hirez.programming.kicks-ass.net>
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
Cc: mingo@redhat.com, will@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDguMjAgdW0gMTA6MTAgc2NocmllYiBwZXRlcnpAaW5mcmFkZWFkLm9yZzoKPiBPbiBU
dWUsIEF1ZyAxMSwgMjAyMCBhdCAwMToxODo1MlBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+PiBGcm9tOiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4KPj4KPj4gT3Ro
ZXJ3aXNlLCBicmFjZXMgYXJlIG5lZWRlZCB3aGVuIHVzaW5nIGl0Lgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBUaGFua3MhCgpEbyB5
b3UgcGljayBpdCB1cCBvciBjYW4gSSBwdXNoIGl0IHRocm91Z2ggZHJtLW1pc2MtZml4ZXM/CgpJ
ZiB0aGUgZm9ybWVyIHBsZWFzZSBsZXQgbWUga25vdyB3aGVuIGl0IGhpdHMgTGludXMgdHJlZSBz
aW5jZSBJIGhhdmUgYSAKZHJpdmVyIHdoaWNoIGNvbnRhaW5zIHNvbWUgZXh0cmEge30gYmVjYXVz
ZSBvZiB0aGlzLgoKVGhhbmtzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
