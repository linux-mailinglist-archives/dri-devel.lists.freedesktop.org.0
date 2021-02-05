Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D82413112E9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 21:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBE66E905;
	Fri,  5 Feb 2021 20:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C54E6E905
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 20:57:52 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id r23so7502497ljh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 12:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UUDqQnCKLG8KlWlCervJ1Pe6jRg7p+GmbjcM8bmlEX4=;
 b=hTuP4Xe0dt/q3oqh3WxdK8WGoQT5bwOWppy5lDWL0FJ79OTi34QaAq8VYfekwNprHi
 EDjGv5SLiNbttTG655zTOIlrIIHFuaJSq9aH08B5xUiltpXV8YGSBlyoE46ETKttc7CU
 NsDx4vC4wV2WJ3/kUgTEuUHNC7jKOvtRUgyuTeA1OotbHdC2YE2xg/2X9A1hhKDya3nc
 ByKBhpokGuNoQKZ6EhdpW9y+mODbabMBJ0VYWswu1rVFb+wDlJFxApcm7nH6lLmA+bwE
 EOLx0jc0appDILj7MhFkuYQPHEBqKMJuKlR5Ii6rQA+pK8PEyTmH+0Vg3n7BT/uVVuqg
 rg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UUDqQnCKLG8KlWlCervJ1Pe6jRg7p+GmbjcM8bmlEX4=;
 b=IwiUyVB7BrXP/BVX5IyxAEBqbrdwjUvcCa4rwAuzhyN9hi1WGfeWMDklPx8UKxELSQ
 E2iWUYD+URYBjeDIXKw2aW7pkPql1TRlWQhNnnjPsgOPbxRYKo4c650xYvm5N53/NFYR
 hrU94knNK8BGS+28eWVKapApythbYS2awBJ00HxInJacEmfQvEeI1f/bPTcLVMk5MQum
 sk2astM+NB/rFMLJYXsq/myE++sRuA/LxUFBw9SVUHO7ol8+iqkINZ6mMGy8zv2gqfhq
 lLwRSWMVysXCXFZbdf4eASAONQWwDYQLaBMjZ4bTvlp/Eg+R8PStkqwco3tczOk0KeaO
 s4dw==
X-Gm-Message-State: AOAM533Wb8qQqYCt2aBFNxsSkZbIs1kENdgui2N5wuDRLiDrfH58SXcZ
 U4cc5hRRjgQcxVCg+kpQZO5edk04VCMBiPLIeIxAmQ==
X-Google-Smtp-Source: ABdhPJxLRfs8FH8bDIRywnbs42yMG9zKgx3Ds5nJMGF16QcPzaNxGXYCaRQqdYXCd6YTt9yxw5HXYLW3omFCA4RPLzI=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr3858868ljw.333.1612558670803; 
 Fri, 05 Feb 2021 12:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <0864e2a8-3a44-e7db-828f-abdac7c64471@amd.com>
In-Reply-To: <0864e2a8-3a44-e7db-828f-abdac7c64471@amd.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 5 Feb 2021 12:57:38 -0800
Message-ID: <CALAqxLXfK0eYGXDqsyfvMUzu6dxOb56WOe07ZsTayi3j1bT51g@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 0/7] Generic page pool & deferred freeing for
 system dmabuf heap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBGZWIgNSwgMjAyMSBhdCAyOjM2IEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gQW0gMDUuMDIuMjEgdW0gMDk6MDYgc2NocmllYiBK
b2huIFN0dWx0ejoKPiA+IElucHV0IHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQuIFRlc3Rp
bmcgYXMgd2VsbCwgYXMgSSBkb24ndAo+ID4gaGF2ZSBhbnkgZGV2ZWxvcG1lbnQgaGFyZHdhcmUg
dGhhdCB1dGlsaXplcyB0aGUgdHRtIHBvb2wuCj4KPiBXZSBjYW4gZWFzaWx5IGRvIHRoZSB0ZXN0
aW5nIGFuZCB0aGUgZ2VuZXJhbCBpZGVhIHNvdW5kcyBzb2xpZCB0byBtZS4KPgoKVGhhbmtzIHNv
IG11Y2ggYWdhaW4gZm9yIHRoZSBmZWVkYmFjayEKCj4gSSBzZWUgdGhyZWUgbWFqb3IgdGhpbmdz
IHdlIG5lZWQgdG8gY2xlYW4gdXAgaGVyZS4KPiAxLiBUaGUgbGljZW5zaW5nLCB5b3UgYXJlIG1v
dmluZyBmcm9tIEJTRC9NSVQgdG8gR1BMMi4KClllYSwgdGhpcyBtYXkgYmUgc3RpY2t5LCBhcyBp
dCdzIG5vdCBqdXN0IGNvZGUgcmUtdXNlZCBmcm9tIG9uZSBkdWFsCmxpY2Vuc2VkIGZpbGUsIGJ1
dCBjb21iaW5hdGlvbiBvZiBHUEwyIHdvcmssIHNvIGFkdmljZSBoZXJlIHdvdWxkIGJlCmFwcHJl
Y2lhdGVkLgoKPiAyLiBEb24ndCBhZGQgYW55IG5ldyBvdmVyaGVhZCB0byB0aGUgVFRNIHBvb2ws
IGVzcGVjaWFsbHkgYWxsb2NhdGluZyBhCj4gcHJpdmF0ZSBvYmplY3QgcGVyIHBhZ2UgaXMgYSBu
by1nby4KClRoaXMgd2lsbCBuZWVkIHNvbWUgbW9yZSBzZXJpZXMgcmV3b3JrIHRvIHNvbHZlLiBJ
J3ZlIGdvdCBzb21lIGlkZWFzLApidXQgd2UnbGwgc2VlIGlmIHRoZXkgd29yay4KCj4gMy4gV2hh
dCBhcmUgeW91IGRvaW5nIHdpdGggdGhlIHJlY2xhaW0gc3R1ZmYgYW5kIHdoeT8KCkFzIEkgbWVu
dGlvbmVkLCBpdCdzIGEgaG9sZG92ZXIgZnJvbSBlYXJsaWVyIGNvZGUsIGFuZCBJJ20gaGFwcHkg
dG8KZHJvcCBpdCBhbmQgZGVmZXIgdG8gb3RoZXIgYWNjb3VudGluZy9zdGF0cyBkaXNjdXNzaW9u
cyB0aGF0IGFyZQpvbmdvaW5nLgoKPiA0LiBLZWVwaW5nIHRoZSBkb2N1bWVudGF0aW9uIHdvdWxk
IGJlIG5pY2UgdG8gaGF2ZS4KClRydWUuIEkgZGlkbid0IHNwZW5kIG11Y2ggdGltZSB3aXRoIGRv
Y3VtZW50YXRpb24sIGFzIEkgd29ycmllZCBmb2xrcwptYXkgaGF2ZSBkaXNhZ3JlZWQgd2l0aCB0
aGUgd2hvbGUgYXBwcm9hY2guIEknbGwgd29yayB0byBpbXByb3ZlIGl0CmZvciB0aGUgbmV4dCBn
byBhcm91bmQuCgpUaGFua3Mgc28gbXVjaCBhZ2FpbiBmb3IgdGhlIHJldmlldyBhbmQgZmVlZGJh
Y2shIEkgcmVhbGx5IGFwcHJlY2lhdGUKeW91ciB0aW1lIGhlcmUuCi1qb2huCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
