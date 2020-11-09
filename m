Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF442AC587
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D386389261;
	Mon,  9 Nov 2020 19:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAC9891BF;
 Mon,  9 Nov 2020 19:54:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v5so688267wmh.1;
 Mon, 09 Nov 2020 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=blMIJqfyn+uYrIFhsDadDE528X0wnbKqoGnhBSRDkeM=;
 b=u5xWIKC81MwGnxL3ZjOcHeoE1X2iT8RKWt/1qo7ewqCC7mQzZtP4agtlhLt+Xv3ruY
 Uqa330apvJSitaJJG0zCSGiyktUKXBfP6w/3IlF1Jo1NxBINNCIhYd1CXg1oOSeBq11R
 kB61Te1dsOTwoa2vpAV4dNXU6uJeazJ8yZGYMSse1eS2hLj6cuwfhl2JLj/gqEQzjCio
 1QS4DSVw0MiI08NFaL36g858sQ/n61UPXXTxQyddILRnVaNCuzmHphfscz5avJZ+zOXI
 Ta9JOVzDO9+4V8XYpMsHhM71tpJzfa8fJatHcwX0HDHm+a32ST+bweskKKQgMYUppdBh
 qGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=blMIJqfyn+uYrIFhsDadDE528X0wnbKqoGnhBSRDkeM=;
 b=ATh3PoSDXxqVjoQ3HZyXBd1eG8zBfFE21DKnpMwsKCBLFWc22ZbMDsIr5tAlixAIiY
 qxzUvqXve+XTNNN7hksnR2/Ws4yyBeE6F4VF6hnVz/F6xmn1RII1MnMPzUMrNhqAMAw/
 zOhzSZ5EnkYp8VrXqYDcZPaVxcmhDuSnOlN9YFPpkF5TTuFHvl2iiuAklvZBfopbebus
 dZz/O0khd7rqE1bXTDHWToOPZB/RITcwZsrVS1519Gf7rvKoFv0tlsiiYf5T4q74Kra0
 ICpJblDbk946CM80tZquzho7dqZJDH2GIW084Z8OcrmbKCNLi9DBicJdHRNGgXsHJ8eQ
 VjpQ==
X-Gm-Message-State: AOAM531h6mbg/RzWamkioT2jjqU60Wa3FopYemK5inUSXLEf5joyiZDj
 Naka+7/JCaMiF7o4As/HfabHySFVEc5Vl5Mf+g1Qa8fQH0w=
X-Google-Smtp-Source: ABdhPJwBfuZyATovbM1IuUQM7O9GPHy39nSVLi118te05KekkpRznL9TPLcotUXqnnlLAjOq/3YWZAYPQzHgpZpgxV0=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr820881wmb.39.1604951662293;
 Mon, 09 Nov 2020 11:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-15-lee.jones@linaro.org>
In-Reply-To: <20201106214949.2042120-15-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2020 14:54:11 -0500
Message-ID: <CADnq5_M=9pDypu7r9R8Y3fuC0Oz6+uu68ybLpG+gog=v-8taGg@mail.gmail.com>
Subject: Re: [PATCH 14/19] drm/amd/amdgpu/amdgpu_device: Provide documentation
 for 'reg_addr' params
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA0OjUwIFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
OjU5NDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmVnX2FkZHInIG5v
dCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9kZXZpY2VfaW5kaXJlY3RfcnJlZycKPiAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjYyNDogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAncmVnX2FkZHInIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9k
ZXZpY2VfaW5kaXJlY3RfcnJlZzY0Jwo+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNl
bXdhbEBsaW5hcm8ub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5r
cyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDMwMGZjYWRlNGEy
YjEuLjYzMzc0ZDEyZTAwZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCj4gQEAgLTU4NSw2ICs1ODUsNyBAQCB2b2lkIGFtZGdwdV9tbV93ZG9vcmJl
bGw2NChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIGluZGV4LCB1NjQgdikKPiAgICog
QGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+ICAgKiBAcGNpZV9pbmRleDogbW1pbyByZWdp
c3RlciBvZmZzZXQKPiAgICogQHBjaWVfZGF0YTogbW1pbyByZWdpc3RlciBvZmZzZXQKPiArICog
QHJlZ19hZGRyOiBpbmRpcmVjdCByZWdpc3RlciBhZGRyZXNzIHRvIHJlYWQgZnJvbQo+ICAgKgo+
ICAgKiBSZXR1cm5zIHRoZSB2YWx1ZSBvZiBpbmRpcmVjdCByZWdpc3RlciBAcmVnX2FkZHIKPiAg
ICovCj4gQEAgLTYxNSw2ICs2MTYsNyBAQCB1MzIgYW1kZ3B1X2RldmljZV9pbmRpcmVjdF9ycmVn
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBw
b2ludGVyCj4gICAqIEBwY2llX2luZGV4OiBtbWlvIHJlZ2lzdGVyIG9mZnNldAo+ICAgKiBAcGNp
ZV9kYXRhOiBtbWlvIHJlZ2lzdGVyIG9mZnNldAo+ICsgKiBAcmVnX2FkZHI6IGluZGlyZWN0IHJl
Z2lzdGVyIGFkZHJlc3MgdG8gcmVhZCBmcm9tCj4gICAqCj4gICAqIFJldHVybnMgdGhlIHZhbHVl
IG9mIGluZGlyZWN0IHJlZ2lzdGVyIEByZWdfYWRkcgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
