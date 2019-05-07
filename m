Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592E16AA0
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7433A6E826;
	Tue,  7 May 2019 18:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECDF6E827
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 18:45:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r7so23697984wrr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 11:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QyaVXRj7oJo0baLd2KgtrI93jLGKALbtwS6fggJD/Y8=;
 b=anMhqk9SjlsZ2OC+D4PhwmcHrSICwSXJ+0/DvGS4ihgJPCX6LapK9z59QnaY/jm5zD
 qNw55Kibo8RlO+WFsXkK3CjU3UJZHqEDXfPTxkT1L9qQ49oSw4dNqaIbdPtrvQV0sC0L
 EXy2oaQ7vZF3mSgiUJLXeQh1PV1TOFoBmKjI5L+A/hP0rAM8PksBAOIyLQZPNcXci4Uv
 cGWxnH697btHG6m/MyREp+yu1+5ZqQhjtXI807I2fS9pEhVLjQtdpURM07XHgMNx+zBS
 6Zw+cwmr+uux7sixoynxK3UOqXBMtPKLK0wIpNy9imaSI7IHQfUuoxkADxNGauXQNyB9
 0iUg==
X-Gm-Message-State: APjAAAUCTxcMFh38BukzaDUroou340lb12a6PqiRXKlxtB0q0NSsS64K
 k+0IVSRUTCTvTnCBRvSXGWekqf92FcXYoSqPkIi/qQ==
X-Google-Smtp-Source: APXvYqxaQb+HJHQ8Jd1AdlBwaDzvFfx1AHWk/bDK2Of+98XchvAqXXfFRfUTJ6UefRuOXAf/lASCO2lwXyycU3kFOHk=
X-Received: by 2002:adf:f685:: with SMTP id v5mr4096693wrp.233.1557254710879; 
 Tue, 07 May 2019 11:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <20190502180346.4769-4-john.stultz@linaro.org>
 <155725408440.4885.13566386067662971275@anlee.localdomain>
In-Reply-To: <155725408440.4885.13566386067662971275@anlee.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 7 May 2019 11:44:58 -0700
Message-ID: <CALAqxLVu-bVpEtqGmjFTJjZX1vKSADr1kHSe2ZUPVWCiNykEeQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mesa: android: freedreno: Fix build failure due to
 path change
To: Dylan Baker <dylan@pnwbakers.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QyaVXRj7oJo0baLd2KgtrI93jLGKALbtwS6fggJD/Y8=;
 b=W2bXwjS0+6N3EHdA6b9oqxaBL4ASQ+2drwauBcYyRuVGXEi7M/vJB++MMwdkjtXZVB
 Icwqs2Oip/i2JL7l8JvrvMToeUstNSxyxMdhdcy1zAeb/zY5yl0dJTTQJjEGq2uvsqKD
 GH5Thl4plNr2WtsGEYOswZ64BQwIKjH0v82zNh8STSJjRKqavjnZdVhSJ4mLjuMNIPfl
 kHM+BGtQLx7bZLN3MG/0YTIe68zm0HrEnnNepVYnWc8o0UigI+vZxwRKagipa+7WRqiZ
 92Js86DRaJvmn2X1v7/lqdY+5a0vor4DHDEmmV7tArYq2+HYjJ/jthI2X50HPixoI8uA
 1lig==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgNywgMjAxOSBhdCAxMTozNCBBTSBEeWxhbiBCYWtlciA8ZHlsYW5AcG53YmFr
ZXJzLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFuZCB0aGUgcHJldmlvdXMgb25lIGxhbmRl
ZCB3aXRoIGEgZml4ZXMgdGFnIG5vbWluYXRpbmcgdGhlbSBmb3IgdGhlCj4gc3RhZ2luZy8xOS4w
IGJyYW5jaCwgYnV0IHRoZXkgZG9uJ3QgYXBwbHksIGFuZCB0byBnZXQgdGhlIHRvIGFwcGx5IHJl
cXVpcmVzCj4gcHVsbGluZyBpbiBzZXZlcmFsIG90aGVyIGFuZHJvaWQgYnVpbGQgc3lzdGVtIHBh
dGNoZXMuIElmIHlvdSdkIGxpa2UgdGhvc2UgaW4KPiB0aGUgMTkuMCBzdGFibGUgYnJhbmNoIGNh
biB5b3UgcHV0IHRvZ2V0aGVyIGFuIE1SIGFnYWluc3QgdGhlIHN0YWdpbmcvMTkuMAo+IGJyYW5j
aCwgb3IgaWYgeW91IGRvbid0IGNhcmUgbGV0IG1lIGtub3cgc28gSSBjYW4gbWFyayB0aGVtIGFz
IGRlLW5vbWluYXRlZD8KPgoKWWVhLCBzbyB0aGlzIG9uZSBJIGRvbid0IHRoaW5rIGlzIG5lY2Vz
c2FyeSBmb3IgIDE5LjAKClNvIHlvdSBjYW4gc2VlIHRoZSBwYXRjaHNldCBJJ20gcHVzaGluZyBh
dCB0aGUgbW9tZW50IGFnYWluc3QgMTkuMC4zIGZvciBBT1NQOgogIGh0dHBzOi8vYW5kcm9pZC1y
ZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL3BsYXRmb3JtL2V4dGVybmFsL21lc2EzZC8rLzk1Njg0
NAoKdGhhbmtzCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
