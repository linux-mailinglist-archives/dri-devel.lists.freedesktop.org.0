Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED328ED66
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24D26EC1F;
	Thu, 15 Oct 2020 07:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077AA6EAD3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 16:47:34 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id w17so6021056ilg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 09:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+iJ8voxUfch6P7wdEAm2+D41sOm6IW7HJo1t/j7JMv8=;
 b=ssyOmFkX4SKgdjYHndfa4OBDZjnWFp5tCczf6RLNExa7dhzGxFxhOWADqXVpauAMTv
 T/s2ry2iCyF2FuWHVXebCqmQsO5DBx49noshXeombaMyQz25iMN5RQtJ13tKZsWVcRle
 sEs/ZA/akUA/kkrCHd9dcmNoyDCXm5c968+ivVaofB80fHWWZj8lgNZvheMIjhEur2nt
 XaPDT5v+qA1qRPBh1fOoMJq7lpu8i1yPoBjZ33ZHg5CoAdtUfYJzf/m23wjl3suq5kSN
 lyoRNS+rPlSkO4tQzPxmHHleyhkktRh1Yok2ieH5OMVb4JAmSaxqTLCl1QrXJCPXpSjW
 SshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+iJ8voxUfch6P7wdEAm2+D41sOm6IW7HJo1t/j7JMv8=;
 b=bbn36tO5rSwpI3evkEEbRyADDJKxkdE2Dqm47RvngzMKinUIC4iHFXZTBbaVgGIoVt
 ItRw16pcA7/139s/Ard0+G0Y2u2SRa8atoqBnNfV2NKkUg8wbaLCJH8km1KS561yDMMt
 Jjmgr6UunvqfNkCEWYejAhPxKJ3Lcl0tGckLD1+oeCefk2VHhBmISehlajC7Nes3YB06
 6ZLdj/4fyeCWawrVTWLpjd4hCpRO97nC9Eon72uE3Vyy5sHEXhr0Hi6qklGGdyyZIDx4
 KE/ixGfOX7xOYHTuFboUI1UXVqICg5U8icCqq4i+BKC3nkOTrFA6E5QfCNJO6/Fk80o8
 J7Dg==
X-Gm-Message-State: AOAM532GzLoRJ9CC9gwvYT13RwKtcJrMMpwwljlK8J8LEZkyJ/GIgbrM
 XXWvMY2Vq6EP+zZQm9eOnRlKUamjJdEHk1c7BQoiC7P5H5k=
X-Google-Smtp-Source: ABdhPJy9vgAGYpXdpv0uf2hp1SXdndgC51mZLSAjGXH1Gg6X3SROo0oXi4LSM/YqHR5iN6uSqOAlNay7qymDiLUx49c=
X-Received: by 2002:a92:c5af:: with SMTP id r15mr41169ilt.88.1602694053274;
 Wed, 14 Oct 2020 09:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201013181924.4143303-1-fparent@baylibre.com>
 <20201013181924.4143303-2-fparent@baylibre.com>
 <CAAOTY__BrDVBTib1J2GHXw-ppin+_Ody6Kv93ads82ycBG725w@mail.gmail.com>
 <CAOwMV_wskn9RiWsX44xL8CFTX-3coS9+bXaJxK8y4eBBOr0z_Q@mail.gmail.com>
In-Reply-To: <CAOwMV_wskn9RiWsX44xL8CFTX-3coS9+bXaJxK8y4eBBOr0z_Q@mail.gmail.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 14 Oct 2020 18:47:22 +0200
Message-ID: <CAOwMV_wpsh=c0r7U-FM6ffz_Sq3HD9PJKoDv+auyhV2ER8_pVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2h1bi1LdWFuZywKCk9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDY6MjUgUE0gRmFiaWVuIFBh
cmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGkgQ2h1bi1LdWFuZywKPgo+
IE9uIFdlZCwgT2N0IDE0LCAyMDIwIGF0IDM6MDAgUE0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpLCBGYWJpZW46Cj4gPgo+ID4gRmFiaWVu
IFBhcmVudCA8ZnBhcmVudEBiYXlsaWJyZS5jb20+IOaWvCAyMDIw5bm0MTDmnIgxNOaXpSDpgLHk
uIkg5LiK5Y2IMjoxOeWvq+mBk++8mgo+ID4gPgo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgSERNSSBv
biBNVDgxNjcuIEhETUkgb24gTVQ4MTY3IGlzIHNpbWlsYXIgdG8KPiA+ID4gTVQ4MTczL01UMjcw
MSBleGVjcHQgZm9yIHRoZSB0d28gcmVnaXN0ZXJzOiBTWVNfQ0ZHMUMgYW5kIFNZU19DRkcyMAo+
ID4KPiA+IEkgdGhpbmsgeW91IHNob3VsZCBkcm9wIHRoaXMgc2VyaWVzLiBBY2NvcmRpbmcgdG8g
TWVkaWF0ZWsgSERNSQo+ID4gYmluZGluZyBkb2N1bWVudCBbMV0sIHRoZSBzZWNvbmQgcGFyYW1l
dGVyIG9mIG1lZGlhdGVrLHN5c2Nvbi1oZG1pIGlzCj4gPiB0aGUgcmVnaXN0ZXIgb2Zmc2V0LiBJ
IHRoaW5rIHlvdSBjb3VsZCBzZXQgcmVnaXN0ZXIgb2Zmc2V0IHRvIDB4ODAwCj4gPiBmb3IgbXQ4
MTY3Lgo+IE9rLCB0aGFuayB5b3UuIEkgd2lsbCB0cnkgaXQuCgpUaGFua3MsIGl0IHdvcmtzLiBE
cm9wcGluZyB0aGlzIHNlcmllcy4KCj4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssaGRt
aS50eHQ/aD12NS45Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4K
PiA+ID4gLS0tCj4gPiA+Cj4gPiA+IENoYW5nZWxvZzoKPiA+ID4gdjI6IGZpeCBuYW1lIG9mIHBk
YXRhIHN0cnVjdHVyZQo+ID4gPgo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgICAgICB8IDcgKysrKysrKwo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pX3JlZ3MuaCB8IDIgKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gPiA+IGluZGV4
IDU3MzcwYzAzNjQ5Ny4uNDg0ZWE5Y2Q2NTRhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYwo+ID4gPiBAQCAtMTgzNSw5ICsxODM1LDE2IEBAIHN0YXRpYyBzdHJ1
Y3QgbXRrX2hkbWlfZGF0YSBtdDgxNzNfaGRtaV9kcml2ZXJfZGF0YSA9IHsKPiA+ID4gICAgICAg
ICAuc3lzX2NmZzIwID0gSERNSV9TWVNfQ0ZHMjAsCj4gPiA+ICB9Owo+ID4gPgo+ID4gPiArc3Rh
dGljIHN0cnVjdCBtdGtfaGRtaV9kYXRhIG10ODE2N19oZG1pX2RyaXZlcl9kYXRhID0gewo+ID4g
PiArICAgICAgIC5zeXNfY2ZnMWMgPSBNVDgxNjdfSERNSV9TWVNfQ0ZHMUMsCj4gPiA+ICsgICAg
ICAgLnN5c19jZmcyMCA9IE1UODE2N19IRE1JX1NZU19DRkcyMCwKPiA+ID4gK307Cj4gPiA+ICsK
PiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kcm1faGRtaV9vZl9p
ZHNbXSA9IHsKPiA+ID4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1o
ZG1pIiwKPiA+ID4gICAgICAgICAgIC5kYXRhID0gJm10ODE3M19oZG1pX2RyaXZlcl9kYXRhIH0s
Cj4gPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctaGRtaSIsCj4g
PiA+ICsgICAgICAgICAuZGF0YSA9ICZtdDgxNjdfaGRtaV9kcml2ZXJfZGF0YSB9LAo+ID4gPiAg
ICAgICAgIHt9Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaV9yZWdzLmgKPiA+ID4gaW5kZXggMjA1MGJhNDViMjNhLi5hMGY5YzM2N2Q3YWEgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9yZWdzLmgK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX3JlZ3MuaAo+ID4g
PiBAQCAtMTk1LDYgKzE5NSw3IEBACj4gPiA+ICAjZGVmaW5lIEdFTl9SR0IgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICgwIDw8IDcpCj4gPiA+Cj4gPiA+ICAjZGVmaW5lIEhETUlfU1lT
X0NGRzFDICAgICAgICAgMHgwMDAKPiA+ID4gKyNkZWZpbmUgTVQ4MTY3X0hETUlfU1lTX0NGRzFD
ICAweDgwMAo+ID4gPiAgI2RlZmluZSBIRE1JX09OICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMCkKPiA+ID4gICNkZWZpbmUgSERNSV9SU1QgICAgICAgICAgICAgICAgICAgICAg
IEJJVCgxKQo+ID4gPiAgI2RlZmluZSBBTkxHX09OICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBCSVQoMikKPiA+ID4gQEAgLTIxMSw2ICsyMTIsNyBAQAo+ID4gPiAgI2RlZmluZSBIVFBM
R19QSU5fU0VMX09GRiAgICAgICAgICAgICAgQklUKDMwKQo+ID4gPiAgI2RlZmluZSBBRVNfRUZV
U0VfRU5BQkxFICAgICAgICAgICAgICAgQklUKDMxKQo+ID4gPiAgI2RlZmluZSBIRE1JX1NZU19D
RkcyMCAgICAgICAgIDB4MDA0Cj4gPiA+ICsjZGVmaW5lIE1UODE2N19IRE1JX1NZU19DRkcyMCAg
MHg4MDQKPiA+ID4gICNkZWZpbmUgREVFUF9DT0xPUl9NT0RFX01BU0sgICAgICAgICAgICgzIDw8
IDEpCj4gPiA+ICAjZGVmaW5lIENPTE9SXzhCSVRfTU9ERSAgICAgICAgICAgICAgICAgICAgICAg
ICgwIDw8IDEpCj4gPiA+ICAjZGVmaW5lIENPTE9SXzEwQklUX01PREUgICAgICAgICAgICAgICAo
MSA8PCAxKQo+ID4gPiAtLQo+ID4gPiAyLjI4LjAKPiA+ID4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
