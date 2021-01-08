Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAA2EF949
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4399D6E0DE;
	Fri,  8 Jan 2021 20:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D496E0DE;
 Fri,  8 Jan 2021 20:34:59 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id 11so10909200oty.9;
 Fri, 08 Jan 2021 12:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7M0YCmEHu5CIrepeBj4TyE7lC8HZna8Bt9bEIhFkg+w=;
 b=H16nH0qzvZKed06io439zey0XEwMylyF38K7O6aSNayFnhq35M1CchxnYvRGrDpegv
 NtfcEndB2YssXdqOttI6BkZ5L4StlNAhqxDC5mJNyXVA2992QXsoc6E9kNN8tlrHckC0
 /JcKFOF6uQNsw18JOefc8WrtopTBTvWEKMR8EMkeGenlnMYojTvo1NSFCtfj6TdvB6UX
 4izxRDXqJT6T0Hg6R/H0s/DSO4vznyBbP1rekbdlFfHQpCGytv9O8tQxehoxOhOE2sam
 FcjehcG9+feIVbxLhZgNd23OI2ADQO/M13+rppXreTSPJqF/ylh7TKkaqrngabA1Y3ql
 4Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7M0YCmEHu5CIrepeBj4TyE7lC8HZna8Bt9bEIhFkg+w=;
 b=L3XIn6Qwlrx4zGdO1TbH5dr1MYu1BsUDZya9upE50DnKmq9qFGTXovK2NURTGJgobO
 4KpceBgiS3WD+mffu1oKVekOFAN+MoC6PYeq8z5LyfNpvOTWxFO+0Q2EtmtBwevLA/R8
 ZLBXfqEUoEbgMoumo25d6+sLdcc6PW2E3RM6aK0ff0cIoJ8IIJV+Cc/st9XKLMHO8cji
 3P3pm3kqqtNnzXLGxGI05HIcpNorvD0NMU53u48MflUE/ib2EJZvfRsalpDtM2Vj8+6L
 QqZwzwacMLnBD8Tr9iscSdQG4pNt2Eme7IyWLlzTMoYFP+nP7eCsDllJCqfSYljfwwMw
 PQcA==
X-Gm-Message-State: AOAM533Mwc/Ex+KiCbp1ofe8ZGsfa9JlzjGmjqyb/Evp4xTWXDA6QHVw
 /NTCJ6+Xm6pj3lPjh0QFxsZYYuHY0VbvxUnlO4x0se6F
X-Google-Smtp-Source: ABdhPJx8SnzY5lS/rofxEhI+zgTdmQPyLxveqpi/jaQiaWQGAcqVTzqOKoMPs+UC4BHaEJZ7n4PW8NfhDOysRj/o0pM=
X-Received: by 2002:a05:6830:1d66:: with SMTP id
 l6mr3791588oti.23.1610138098760; 
 Fri, 08 Jan 2021 12:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-10-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-10-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:34:47 -0500
Message-ID: <CADnq5_N2PuJemMY71672+g7=maNFN2=Ab-JvAni3qOQhokNYBQ@mail.gmail.com>
Subject: Re: [PATCH 09/40] drm/amd/pm/powerplay/hwmgr/vega20_hwmgr: Fix legacy
 function header formatting
To: Lee Jones <lee.jones@linaro.org>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5
L2h3bWdyL3ZlZ2EyMF9od21nci5jOjc4MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnaHdtZ3InIG5vdCBkZXNjcmliZWQgaW4gJ3ZlZ2EyMF9pbml0X3NtY190YWJsZScK
Pgo+IENjOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgo+IENjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBs
aWVkLiAgVGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jIHwgMTEgKysrKystLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCj4gaW5k
ZXggZGE4NDAxMmI3ZmQ1MS4uODc4MTFiMDA1Yjg1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCj4gQEAgLTc3
MSwxMiArNzcxLDExIEBAIHN0YXRpYyBpbnQgdmVnYTIwX3NldHVwX2RlZmF1bHRfZHBtX3RhYmxl
cyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQo+ICB9Cj4KPiAgLyoqCj4gLSogSW5pdGlhbGl6ZXMg
dGhlIFNNQyB0YWJsZSBhbmQgdXBsb2FkcyBpdAo+IC0qCj4gLSogQHBhcmFtICAgIGh3bWdyICB0
aGUgYWRkcmVzcyBvZiB0aGUgcG93ZXJwbGF5IGhhcmR3YXJlIG1hbmFnZXIuCj4gLSogQHBhcmFt
ICAgIHBJbnB1dCAgdGhlIHBvaW50ZXIgdG8gaW5wdXQgZGF0YSAoUG93ZXJTdGF0ZSkKPiAtKiBA
cmV0dXJuICAgYWx3YXlzIDAKPiAtKi8KPiArICogSW5pdGlhbGl6ZXMgdGhlIFNNQyB0YWJsZSBh
bmQgdXBsb2FkcyBpdAo+ICsgKgo+ICsgKiBAaHdtZ3I6ICB0aGUgYWRkcmVzcyBvZiB0aGUgcG93
ZXJwbGF5IGhhcmR3YXJlIG1hbmFnZXIuCj4gKyAqIHJldHVybjogIGFsd2F5cyAwCj4gKyAqLwo+
ICBzdGF0aWMgaW50IHZlZ2EyMF9pbml0X3NtY190YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdy
KQo+ICB7Cj4gICAgICAgICBpbnQgcmVzdWx0Owo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
