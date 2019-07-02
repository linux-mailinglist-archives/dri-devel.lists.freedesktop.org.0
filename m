Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B25DE7C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E756E0D0;
	Wed,  3 Jul 2019 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366FE6E067
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 20:35:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u18so225196wru.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 13:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YiKm32fbrJXvadhbbH8R2AC30oRr6R/vtBXdk9UU6tg=;
 b=heBI3x1K4szksIdWiiGj/3fEQhYQmlPfgUrBC8cfqqDTYsPdGT9sNFCf2eb4kBg6rY
 71qeRut75F6uXKhto1zGFqlNXaO5VnoLQLOiWQYkUJdpFr7AvEmwFVj4XSgzFNSm83PA
 sBydCzXHmRLfB9/Zfk9r5ViSeS0YOvI+I00ZJ0lhKCx22XmPHh3gD0A6f0EgCbQpJf5w
 IlgviKPzNXZ0JaJ94pgMQVEGwe6KzfFE2ebWSrfSU6EI0UG7mVw2w9QYqjfnykEbYmkQ
 rlNpO1fvtSeJV7paXJJqN7TQ4XqOLJe5w1LhhF08p7lj1Is2HnXqp4WdvfjYXlrt9U9z
 /2tw==
X-Gm-Message-State: APjAAAUa772dVAw1EG77rASYLGsomimT+F3xEX+3hYksesi7j9Lask9A
 JKumGgQTglsDiMgUJr0BnbqBNKB4Ub0snDYgXZn7bw==
X-Google-Smtp-Source: APXvYqyzF5MuwoPkI10B4TbfC/rzEV0YiPHBluGmH1/zHhhFfHwqiAfVyxlK7Fj4GY/VFsoeVVgftVQDaSC75isjmzg=
X-Received: by 2002:adf:b69a:: with SMTP id j26mr17416154wre.93.1562099731858; 
 Tue, 02 Jul 2019 13:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
In-Reply-To: <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 2 Jul 2019 22:35:16 +0200
Message-ID: <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
Subject: Re: [PATCH 2/4] efi/libstub: detect panel-id
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YiKm32fbrJXvadhbbH8R2AC30oRr6R/vtBXdk9UU6tg=;
 b=rouFNaQrAD+LVzdQfwSGl8KyN3XCFATAsscS1nSiY3nqrVKn88L+2X9hpP8G0LkkWC
 NbXBVmKrNM2i/FYXzVyY65owea83CsnsL2EYq3GhtYm+wIktVkTqWtRAWOulqc+2Eijb
 tNZhEVAQRLz89yF0sk+uF/rQSzJNULI8c49x9De777zT65pYsUUSurWdrSNR9lmy2NEt
 9eY0VkqUb2j+lxdkUSL9dhgUIzql3NanYjEhvjtxJVfIfVj1EIEm0MIgXIiUzfQXV33O
 rHDGqg4EVcvtwueBiup5u0kebQrjrGClyg1D+nX2fPJPU7N/NtWIDb7JpF1b7OEh92lu
 QbyA==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 linux-efi <linux-efi@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Steve Capper <steve.capper@arm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Julien Thierry <julien.thierry@arm.com>, Alexander Graf <agraf@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Leif Lindholm <leif.lindholm@linaro.org>, freedreno@lists.freedesktop.org,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyIEp1bCAyMDE5IGF0IDIyOjI2LCBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2
ZWxAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIDMwIEp1biAyMDE5IGF0IDIyOjM2LCBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IFJvYiBD
bGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPiA+Cj4gPiBPbiBzbmFwZHJhZ29uIGFhcmNo
NjQgbGFwdG9wcywgYSAnVUVGSURpc3BsYXlJbmZvJyB2YXJpYWJsZSBpcyBwcm92aWRlZAo+ID4g
dG8gY29tbXVuaWNhdGUgc29tZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZGlzcGxheS4gIENydXRp
YWxseSBpdCBoYXMgdGhlCj4gPiBwYW5lbC1pZCwgc28gdGhlIGFwcHJvcHJpYXRlIHBhbmVsIGRy
aXZlciBjYW4gYmUgc2VsZWN0ZWQuICBSZWFkIHRoaXMKPiA+IG91dCBhbmQgc3Rhc2ggaW4gL2No
b3Nlbi9wYW5lbC1pZCBzbyB0aGF0IGRpc3BsYXkgZHJpdmVyIGNhbiB1c2UgaXQgdG8KPiA+IHBp
Y2sgdGhlIGFwcHJvcHJpYXRlIHBhbmVsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBDbGFy
ayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KPgo+IEhpIFJvYiwKPgo+IEkgdW5kZXJzdGFuZCB3
aHkgeW91IGFyZSBkb2luZyB0aGlzLCBidXQgdGhpcyAqcmVhbGx5KiBiZWxvbmdzIGVsc2V3aGVy
ZS4KPgo+IFNvIHdlIGFyZSBkZWFsaW5nIHdpdGggYSBwbGF0Zm9ybSB0aGF0IHZpb2xhdGVzIHRo
ZSBVRUZJIHNwZWMsIHNpbmNlCj4gaXQgZG9lcyBub3QgYm90aGVyIHRvIGltcGxlbWVudCB2YXJp
YWJsZSBzZXJ2aWNlcyBhdCBydW50aW1lIChiZWNhdXNlCj4gTVMgbGV0IHRoZSB2ZW5kb3IgZ2V0
IGF3YXkgd2l0aCB0aGlzKS4KPgoKVG8gY2xhcmlmeSwgdGhlIGFib3ZlIHJlbWFyayBhcHBsaWVz
IHRvIHBvcHVsYXRpbmcgdGhlIERUIGZyb20gdGhlIE9TCnJhdGhlciB0aGFuIGZyb20gdGhlIGZp
cm13YXJlLgoKPiBGaXJzdCBvZiBhbGwsIHRvIHBhc3MgZGF0YSBiZXR3ZWVuIHRoZSBFRkkgc3R1
YiBhbmQgdGhlIE9TIHByb3Blciwgd2UKPiBzaG91bGQgdXNlIGEgY29uZmlndXJhdGlvbiB0YWJs
ZSByYXRoZXIgdGhhbiBhIERUIHByb3BlcnR5LCBzaW5jZSB0aGUKPiBmb3JtZXIgaXMgQUNQSS9E
VCBhZ25vc3RpYy4gQWxzbywgSSdkIGxpa2UgdGhlIGNvbnN1bWVyIG9mIHRoZSBkYXRhIHRvCj4g
YWN0dWFsbHkgaW50ZXJwcmV0IGl0LCBpLmUuLCBqdXN0IGR1bXAgdGhlIHdob2xlIG9wYXF1ZSB0
aGluZyBpbnRvIGEKPiBjb25maWcgdGFibGUgaW4gdGhlIHN0dWIsIGFuZCBkbyB0aGUgcGFyc2lu
ZyBpbiB0aGUgT1MgcHJvcGVyLgo+Cj4gSG93ZXZlciwgSSBhbSBub3QgdGhyaWxsZWQgYXQgYWRk
aW5nIGNvZGUgdG8gdGhlIHN0dWIgdGhhdAo+IHVuY29uZGl0aW9uYWxseSBsb29rcyBmb3Igc29t
ZSB2YXJpYWJsZSB3aXRoIHNvbWUgbWFnaWMgbmFtZSBvbiBhbGwKPiBBUk0vYXJtNjQgRUZJIHN5
c3RlbXMsIHNvIHRoaXMgd2lsbCBuZWVkIHRvIGxpdmUgdW5kZXIgYSBLY29uZmlnCj4gb3B0aW9u
IHRoYXQgZGVwZW5kcyBvbiBBUk02NCAoYW5kIGRvZXMgbm90IGRlZmF1bHQgdG8geSkKPgoKLi4u
IGJ1dCBzYXZpbmcgdmFyaWFibGVzIGF0IGJvb3QgdGltZSBmb3IgY29uc3VtcHRpb24gYXQgcnVu
dGltZSBpcwpzb21ldGhpbmcgdGhhdCB3ZSB3aWxsIGxpa2VseSBzZWUgbW9yZSBvZiBpbiB0aGUg
ZnV0dXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
