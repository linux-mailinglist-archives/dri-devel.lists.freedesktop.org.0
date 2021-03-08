Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F53318AA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 21:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1D76E880;
	Mon,  8 Mar 2021 20:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62A56E87F;
 Mon,  8 Mar 2021 20:36:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFC356528C;
 Mon,  8 Mar 2021 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615235771;
 bh=O+ReejtrMNWcuVeWBL3/zizI1ocIx5X8IPr5cVw5odU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UsishFHmgYq4gqoLzPe7/0HfymkKidldhsQxayU9LGPHyXNaFtAReSlczUxY01Av7
 DvWHhQnM0t9VoUxx9p+RDGprQ0XFtv4tDP9pH3+kybBbLfoKBzOPnG5nntkhX6NXaQ
 GCFezQS0TdKVSsvaB5qMyn3yrxWCCRG9BkP2rC72s5A9j2g5pVAJWKpYTUlvmJwS/Q
 gQAPef1SIO4y1+vZeTQOH7ufUNIWLkZB0o06xiCMJ7XYqLefuj9ZU/x2C1r8mW4co6
 psuVApxGl7Fcdscblz12nlcUOWHS8zhVvTS2zRKTU1RlT2DsQov4R8UTfE+KhILeSH
 plJZ8sZXrqx4A==
Received: by mail-ot1-f46.google.com with SMTP id f33so10530287otf.11;
 Mon, 08 Mar 2021 12:36:10 -0800 (PST)
X-Gm-Message-State: AOAM531Kt1bDuqq+D2evK8c/yDWjRn89yLoshBmolsBghxWcLAbZqtUp
 1F8XU+7jQ/yH5psRmgip+7rpxVUiUYWmCZBtUZQ=
X-Google-Smtp-Source: ABdhPJwhe07CSGqsH4YO3B+zF8XwArdCOWpQFjHD+UZjHl0ykK/P8SF/czSLKjLwOHz1A80bokLqfLYncAJ+h+A0ctM=
X-Received: by 2002:a9d:6341:: with SMTP id y1mr6074155otk.210.1615235770221; 
 Mon, 08 Mar 2021 12:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20210308153359.2513446-1-arnd@kernel.org>
 <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
 <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
 <92a6c999-c20a-2311-4e31-209a2d9229ed@amd.com>
 <CAK8P3a1SRubvaPzn2020Nc_SsL8xBW7ODGOGtF_4UYASGqTq-w@mail.gmail.com>
 <f2829f2e-6498-53d4-93fa-1613e988803f@amd.com>
 <71d1bd79-881c-062c-0b41-4be0cdf3c4d5@gmail.com>
In-Reply-To: <71d1bd79-881c-062c-0b41-4be0cdf3c4d5@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 8 Mar 2021 21:35:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2CB2CyNyZcDwB5BRiO-qDLrK2tjdM24K-pQhbH+0VZZA@mail.gmail.com>
Message-ID: <CAK8P3a2CB2CyNyZcDwB5BRiO-qDLrK2tjdM24K-pQhbH+0VZZA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Philip Yang <philip.yang@amd.com>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgOCwgMjAyMSBhdCA5OjEyIFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPiBBbSAwOC4wMy4yMSB1bSAyMTowMiBz
Y2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+ID4gQW0gMjAyMS0wMy0wOCB1bSAyOjMzIHAubS4gc2No
cmllYiBBcm5kIEJlcmdtYW5uOgoKPiA+IEkgZG9uJ3Qgd2FudCB0byBjcmVhdGUgYSBoYXJkIGRl
cGVuZGVuY3kgb24gQU1EX0lPTU1VX1YyIGlmIEkgY2FuIGF2b2lkCj4gPiBpdCwgYmVjYXVzZSBp
dCBpcyBvbmx5IHJlYWxseSBuZWVkZWQgZm9yIGEgc21hbGwgbnVtYmVyIG9mIEFNRCBBUFVzLCBh
bmQKPiA+IGV2ZW4gdGhlcmUgaXQgaXMgbm93IG9wdGlvbmFsIGZvciBtb3JlIHJlY2VudCBvbmVz
Lgo+ID4KPiA+IElzIHRoZXJlIGEgYmV0dGVyIHdheSB0byBhdm9pZCBidWlsZCBmYWlsdXJlcyB3
aXRob3V0IGNyZWF0aW5nIGEgaGFyZAo+ID4gZGVwZW5kZW5jeT8KPgo+IFdoYXQgeW91IG5lZWQg
aXMgdGhlIHNhbWUgdHJpY2sgd2UgdXNlZCBmb3IgQUdQIG9uIHJhZGVvbi9ub3V2ZWF1Ogo+Cj4g
ZGVwZW5kcyBvbiBBTURfSU9NTVVfVjIgfHwgIUFNRF9JT01NVV9WMgo+Cj4gVGhpcyB3YXkgd2hl
biBBTURfSU9NTVVfVjIgaXMgYnVpbGQgYXMgYSBtb2R1bGUgRFJNX0FNREdQVSB3aWxsIGJlIGJ1
aWxkCj4gYXMgYSBtb2R1bGUgYXMgd2VsbC4gV2hlbiBpdCBpcyBkaXNhYmxlZCBjb21wbGV0ZWx5
IHdlIGRvbid0IGNhcmUuCgpOb3RlIHRoYXQgdGhpcyB0cmljayBvbmx5IHdvcmtzIGlmIHlvdSBw
dXQgaXQgaW50byB0aGUgRFJNX0FNREdQVSBLY29uZmlnIG9wdGlvbgppdHNlbGYsIHNpbmNlIHRo
YXQgZGVjaWRlcyBpZiB0aGUgZHJpdmVyIGlzIGJ1aWx0LWluIG9yIGEgbG9hZGFibGUgbW9kdWxl
LiBJZgpIU0FfQU1EIGlzIGRpc2FibGVkLCB0aGF0IGRlcGVuZGVuY3kgaXMgbm90IHJlYWxseSBu
ZWNlc3NhcnkuCgpUaGUgdmVyc2lvbiBJIHN1Z2dlc3RlZCAgLS0gYWRkaW5nICJkZXBlbmRzIG9u
IEFNRF9JT01NVV9WMj15IHx8CkRSTV9BTURHUFU9bSIgdG8gdGhlIEhTQV9BTUQgb3B0aW9uIC0t
IG1pZ2h0IGJlIHNsaWdodGx5IG5pY2VyCnNpbmNlIGl0IGxldHMgeW91IHN0aWxsIGJ1aWxkIGEg
a2VybmVsIHdpdGggRFJNX0FNREdQVT15IGFuZApBTURfSU9NTVVfVjI9bSwgYnV0IHdpdGhvdXQg
dGhlIEhTQV9BTUQuCgpJIGNhbiBzZW5kIGEgcGF0Y2ggd2l0aCBlaXRoZXIgb2YgdGhvc2UgdHdv
IG9wdGlvbnMgdG8gcmVwbGFjZSBteQpvcmlnaW5hbCBwYXRjaC4KCj4gPiAgICBUaGUgZG9jdW1l
bnRhdGlvbiBpbgo+ID4gRG9jdW1lbnRhdGlvbi9rYnVpbGQva2NvbmZpZy1sYW5ndWFnZS5yc3Qg
c3VnZ2VzdHMgdXNpbmcgaWYKPiA+IChJU19SRUFDSEFCTEUoQ09ORklHX0FNRF9JT01NVV9WMikp
IHRvIGd1YXJkIHRob3NlIHByb2JsZW1hdGljIGZ1bmN0aW9uCj4gPiBjYWxscy4gSSB0aGluayBt
b3JlIGdlbmVyYWxseSwgd2UgY291bGQgZ3VhcmQgYWxsIG9mIGtmZF9pb21tdS5jIHdpdGgKPiA+
Cj4gPiAgICAgICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX0FNRF9JT01NVV9WMikKPiA+Cj4gPiBB
bmQgdXNlIHRoZSBzYW1lIGNvbmRpdGlvbiB0byBkZWZpbmUgdGhlIHN0dWJzIGluIGtmZF9pb21t
dS5oLgoKVGhpcyB3b3VsZCBmaXggdGhlIGNvbXBpbGUtdGltZSBlcnJvciwgYnV0IGl0J3MgYWxz
byB0aGUgb25lIEknZCBsZWFzdApyZWNvbW1lbmQgb3V0IG9mIGFsbCB0aGUgb3B0aW9ucywgYmVj
YXVzZSB0aGF0IGNhdXNlcyB0aGUgZHJpdmVyIHRvCnNpbGVudGx5IG5vdCB3b3JrIGFzIGV4cGVj
dGVkLiBUaGlzIHNlZW1zIGV2ZW4gd29yc2UgdGhhbiBmYWlsaW5nCnRoZSBidWlsZC4KCiAgICAg
ICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
