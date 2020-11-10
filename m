Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C432AD2A4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 10:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CABC88647;
	Tue, 10 Nov 2020 09:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230A089948
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 09:41:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so2337493wmm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 01:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FpGYJhDvWK5QFQyGVGzTwx199bOezzbp8yUQnaBAqhA=;
 b=z1FkXYMrjZ61/g5+TiA3+uQbcP0BwaGKojKYZqoprO1EpyKXxFED8yggOxudY+WSfn
 ofbwOQSsVmAN2CwuTFWmrdeb3XfsFBdxtI2yitO1vEMjZXuOh5FTAx4L9L+9TXE9xEh5
 ETeVhj9TKHMBlglBmUgRq/G1hBrvINoTsfF36vnDxXKP29niGmsVYrAa+6Igc2DCJtfM
 +JVDxu1jrfdlpXrOuive05LAgGh+2RxnKq6Atce+JA4hSUzCkyS+F2jOwHMMM0Ur6JI1
 811Goaf1fdH+uzMu4qeylrud5JCOQT5FRFyLYwgzP5d8ieCENuD1EeKIWtqc1J/U3YgU
 xxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=FpGYJhDvWK5QFQyGVGzTwx199bOezzbp8yUQnaBAqhA=;
 b=T5waJnjpVQTz1wE2TIFiEw/o0hqJTPdCB+JrStnZnaz4fXlloqIlPOHc7gSEgjKLtn
 dV2Gt4pJaK6xg6NK2MEmW5msI0XSFz70Tocc8elEFJfl9XqP9XB6iefBItULM5kEVBVt
 7hWf3SKfHrjxz6mFbptfQ2vY2UBEa/5EVQ48tQxP1yPLf1sdZQp9I2FD1KHCWzZz/1gk
 Jn50EWmybtf9lHTFssiExV5llE5CuedZL1rikUzr4V9z6R0Q7+BxFKAoO3Igo5y8biSw
 Hli1MFXx+/jGTdH+t6HOvZBDaNUx6n2seJoYbs+bkDy3XiEfqunLbaDNLX8Gtola69lc
 b80g==
X-Gm-Message-State: AOAM532T/g9WbyQAkNIqmG01DYv5ctjumO6VyGvyY6bpBaGy13QvW1+q
 /u5BGqIu8c7i/pQAayGYuNztbw==
X-Google-Smtp-Source: ABdhPJz9GPiQ64tc5Xh9sXsmgb4hk4Z94zN9LrviqA4mXIdYOneWhbgIHv0Sezdp554Cwip1SzZtHw==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr3699025wmg.3.1605001273758;
 Tue, 10 Nov 2020 01:41:13 -0800 (PST)
Received: from dell ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id u203sm1408076wme.32.2020.11.10.01.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 01:41:13 -0800 (PST)
Date: Tue, 10 Nov 2020 09:41:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 15/20] drm/radeon/r600d: Move 'rc600_*' prototypes into
 shared header
Message-ID: <20201110094111.GG2063125@dell>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-16-lee.jones@linaro.org>
 <CADnq5_NvitEQWH3Z+5EgOH3zJn=P5YTqwHQo4LLQLi0Hj0Dpww@mail.gmail.com>
 <20201110072242.GF2063125@dell>
 <20201110090247.GB2027451@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110090247.GB2027451@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMCBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
PiA+IHRoZSAqZC5oIGhlYWRlcnMgYXJlIHN1cHBvc2VkIHRvIGp1c3QgYmUgaGFyZHdhcmUgZGVm
aW5pdGlvbnMuICBJJ2QKPiA+ID4gcHJlZmVyIHRvIGtlZXAgZHJpdmVyIHN0dWZmIG91dCBvZiB0
aGVtLgo+ID4gCj4gPiBUaGF0J3MgZmluZSAoSSBkaWQgd29uZGVyIGlmIHRoYXQgd2VyZSB0aGUg
Y2FzZSkuCj4gPiAKPiA+IEkgbmVlZCBhbiBhbnN3ZXIgZnJvbSB5b3UgYW5kIFNhbSB3aGV0aGVy
IEkgY2FuIGNyZWF0ZSBuZXcgaGVhZGVycy4KPiA+IAo+ID4gRm9yIG1lLCBpdCBpcyB0aGUgcmln
aHQgdGhpbmcgdG8gZG8uCj4gCj4gUGxlYXNlIGZvbGxvdyB0aGUgYWR2aWNlIG9mIEFsZXggZm9y
IHRoZSByYWRlb24gZHJpdmVyLgoKR3JlYXQuICBUaGFua3MgZm9yIHJlc29sdmluZyB0aGlzIFNh
bS4KCldpbGwgZml4IGFsbCBvY2N1cnJlbmNlcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
U2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
