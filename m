Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F78290B51
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 20:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314DD89450;
	Fri, 16 Oct 2020 18:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD0E89189
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 18:34:22 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n15so3294130otl.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YjEtrYWM+WpdQq5rIA7Cd/jyyjiG9wZFmhoaoHRZ7kE=;
 b=jiImXk5hrhGQ0IWyjxH5N3WPRCnEJhLQ1Ofct0jdl3kYtYfBzOjopzIOhph2ww5ucE
 bHhNCDtjcpingtyfYKihX6S+h49vcZ+57/mKBJMBnpSaFGOunjMInAJrhuiJC8xS0+0x
 nQx95ph8OkadXjGH87uOJL3IrLwB7jDi2JndU/cK2wsIArZW6NkgnXZBo/gu/xYTnY++
 U0i0NQlZXBlsZ/MAUnzcch+FDez1RL6gniJ/Zd6vijE31oclp1Z9GhhyynOWkttp1WUq
 auKq9WKFoTJOuh2S5SZD1gBtou+YoQDnccq5BKI+JpBz7DZZgaLAM9TWWpk3MSQqbKCE
 P3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YjEtrYWM+WpdQq5rIA7Cd/jyyjiG9wZFmhoaoHRZ7kE=;
 b=VPJ+RkrcBsACFivd1xhv0G75B7E8CjhAPIWwpFfOdlFlrPokh4543TvvQFv4RpLbEW
 w2BBda40jqDhqvSlyzJAAdFs93z5ncXgr/wuqwboQ9MVTGxpLeIfO1cEGPTUA3EeYpUq
 pouXbv4VL7P+m2iHbI2jZbo4Msu8XBT2iEg4WZRbbNCO/JbB5pI08+M85DfolO6R6iOR
 wuj78UJJc4W3hpQ6ePw6o3DcLsG6VAXsnDXRDivgfJsWj3pLL4ZxWdPbUHR/qCEi4E98
 0gNYZ25D7J+pLdRPoGb6AkSHT6TDCrSv/E31YX49MgYUnbcwMBqlfSqKlSW47MMIjdu2
 GvEQ==
X-Gm-Message-State: AOAM5317VNgebIdxB/FIFvtHJPnL9O4ncnDq8KiWmEsPPViCeOSNZihC
 t0bicXmvfOGFTwoGfUvd1Pd5gmqwWFq/mHd2SY2OJQ==
X-Google-Smtp-Source: ABdhPJw7tjr1fm5GouHDD8zGthbFcVsfrvoic1jX6NFUO/r4ZCIcCnfQDkNxyGdlbwILCV5qg9V+t5ILDyD+A5ctrzQ=
X-Received: by 2002:a9d:2d81:: with SMTP id g1mr3513164otb.352.1602873261398; 
 Fri, 16 Oct 2020 11:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200827123627.538189-1-gregkh@linuxfoundation.org>
 <3d8de519-65b3-123b-8ace-e820982884e0@labbott.name>
 <20201016082945.GA1722359@kroah.com>
In-Reply-To: <20201016082945.GA1722359@kroah.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 16 Oct 2020 11:34:09 -0700
Message-ID: <CALAqxLWtrnYizdDVAQMqy1JmeZ5jUCko1XKaEtAd0zoV6oj0aQ@mail.gmail.com>
Subject: Re: [PATCH] staging: ion: remove from the tree
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Christoph Hellwig <hch@infradead.org>,
 Android Kernel Team <kernel-team@android.com>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Hridya Valsaraju <hridya@google.com>,
 Laura Abbott <laura@labbott.name>, Shuah Khan <shuah@kernel.org>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTYsIDIwMjAgYXQgMToyOSBBTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDI3LCAyMDIwIGF0
IDA5OjMxOjI3QU0gLTA0MDAsIExhdXJhIEFiYm90dCB3cm90ZToKPiA+IE9uIDgvMjcvMjAgODoz
NiBBTSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gPiBUaGUgSU9OIGFuZHJvaWQgY29k
ZSBoYXMgbG9uZyBiZWVuIG1hcmtlZCB0byBiZSByZW1vdmVkLCBub3cgdGhhdCB3ZQo+ID4gPiBk
bWEtYnVmIHN1cHBvcnQgbWVyZ2VkIGludG8gdGhlIHJlYWwgcGFydCBvZiB0aGUga2VybmVsLgo+
ID4gPgo+ID4gPiBJdCB3YXMgdGhvdWdodCB0aGF0IHdlIGNvdWxkIHdhaXQgdG8gcmVtb3ZlIHRo
ZSBpb24ga2VybmVsIGF0IGEgbGF0ZXIKPiA+ID4gdGltZSwgYnV0IGFzIHRoZSBvdXQtb2YtdHJl
ZSBBbmRyb2lkIGZvcmsgb2YgdGhlIGlvbiBjb2RlIGhhcyBkaXZlcmdlZAo+ID4gPiBxdWl0ZSBh
IGJpdCwgYW5kIGFueSBBbmRyb2lkIGRldmljZSB1c2luZyB0aGUgaW9uIGludGVyZmFjZSB1c2Vz
IHRoYXQKPiA+ID4gZm9ya2VkIHZlcnNpb24gYW5kIG5vdCB0aGlzIGluLXRyZWUgdmVyc2lvbiwg
dGhlIGluLXRyZWUgY29weSBvZiB0aGUKPiA+ID4gY29kZSBpcyBhYmFuZG9uZGVkIGFuZCBub3Qg
dXNlZCBieSBhbnlvbmUuCj4gPiA+Cj4gPiA+IENvbWJpbmUgdGhpcyBhYmFuZG9uZWQgY29kZWJh
c2Ugd2l0aCB0aGUgbmVlZCB0byBtYWtlIGNoYW5nZXMgdG8gaXQgaW4KPiA+ID4gb3JkZXIgdG8g
a2VlcCB0aGUga2VybmVsIGJ1aWxkaW5nIHByb3Blcmx5LCB3aGljaCB0aGVuIGNhdXNlcyBtZXJn
ZQo+ID4gPiBpc3N1ZXMgd2hlbiBtZXJnaW5nIHRob3NlIGNoYW5nZXMgaW50byB0aGUgb3V0LW9m
LXRyZWUgQW5kcm9pZCBjb2RlLCBhbmQKPiA+ID4geW91IGVuZCB1cCB3aXRoIHR3byBkaWZmZXJl
bnQgZ3JvdXBzIG9mIHBlb3BsZSAodGhlIGluLWtlcm5lbC10cmVlCj4gPiA+IGRldmVsb3BlcnMs
IGFuZCB0aGUgQW5kcm9pZCBrZXJuZWwgZGV2ZWxvcGVycykgd2hvIGFyZSBib3RoIGFubm95ZWQg
YXQKPiA+ID4gdGhlIGN1cnJlbnQgc2l0dWF0aW9uLiAgQmVjYXVzZSBvZiB0aGlzIHByb2JsZW0s
IGp1c3QgZHJvcCB0aGUgaW4ta2VybmVsCj4gPiA+IGNvcHkgb2YgdGhlIGlvbiBjb2RlIG5vdywg
YXMgaXQncyBub3QgdXNlZCwgYW5kIGlzIG9ubHkgY2F1c2luZyBwcm9ibGVtcwo+ID4gPiBmb3Ig
ZXZlcnlvbmUgaW52b2x2ZWQuCj4gPiA+Cj4gPiA+IENjOiAiQXJ2ZSBIasO4bm5ldsOlZyIgPGFy
dmVAYW5kcm9pZC5jb20+Cj4gPiA+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiA+ID4gQ2M6IENocmlzdGlhbiBCcmF1bmVyIDxjaHJpc3RpYW5AYnJh
dW5lci5pbz4KPiA+ID4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4K
PiA+ID4gQ2M6IEhyaWR5YSBWYWxzYXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+ID4gPiBDYzog
Sm9lbCBGZXJuYW5kZXMgPGpvZWxAam9lbGZlcm5hbmRlcy5vcmc+Cj4gPiA+IENjOiBKb2huIFN0
dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPiA+ID4gQ2M6IExhdXJhIEFiYm90dCA8bGF1
cmFAbGFiYm90dC5uYW1lPgo+ID4gPiBDYzogTWFydGlqbiBDb2VuZW4gPG1hY29AYW5kcm9pZC5j
b20+Cj4gPiA+IENjOiBTaHVhaCBLaGFuIDxzaHVhaEBrZXJuZWwub3JnPgo+ID4gPiBDYzogU3Vt
aXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KPiA+ID4gQ2M6IFN1cmVuIEJhZ2hk
YXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4gPiA+IENjOiBUb2RkIEtqb3MgPHRram9zQGFu
ZHJvaWQuY29tPgo+ID4gPiBDYzogZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmcKPiA+ID4gQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4KPiA+IFdlIGRpc2N1c3NlZCB0aGlzIGF0
IHRoZSBBbmRyb2lkIE1DIG9uIE1vbmRheSBhbmQgdGhlIHBsYW4gd2FzIHRvCj4gPiByZW1vdmUg
aXQgYWZ0ZXIgdGhlIG5leHQgTFRTIHJlbGVhc2UuCj4KPiBBcyA1LjEwIHdpbGwgYmUgdGhlIG5l
eHQgTFRTIHJlbGVhc2UsIEkgaGF2ZSBub3cgbWVyZ2VkIGl0IHRvIG15Cj4gInRlc3RpbmciIGJy
YW5jaCB0byBnbyBpbnRvIDUuMTEtcmMxLgoKU291bmRzIGdyZWF0ISBUaGFua3Mgc28gbXVjaCBm
b3Igd2FpdGluZyBhIGJpdCBvbiB0aGlzLCBJIHJlYWxseSBhcHByZWNpYXRlIGl0IQotam9obgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
