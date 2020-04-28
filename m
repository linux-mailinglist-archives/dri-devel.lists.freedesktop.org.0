Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F31BBDED
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB1589F4F;
	Tue, 28 Apr 2020 12:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E160089E5B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 01:54:41 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id x2so18769346ilp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Dn5FsFHXDoP63PfOK+hSyyadWEoDt1vFl68jXDW6Zcs=;
 b=DIysdPazFDSPjWrk9J98X+PHbjtukRlthArlsiKuuAdwBzWfCicMgBuJ0xfyvX7NQA
 OWgWZ8KUgpqJQgeK8x61TqtaPo+WcfYOyCM+yzAW3UUIRconylO19z25qm6WYlx0mmM1
 sbTETGjjaQ0hsRQFPAGzSo/6+tDT7W0hc+/uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Dn5FsFHXDoP63PfOK+hSyyadWEoDt1vFl68jXDW6Zcs=;
 b=QLhMx5Vs9bD6FuZXEXvDNz8QOKW/ND0WvVDjIsRXw3JynLFCYtlLiXPY/TOVud9tMP
 MYqkuUonPkz+2Lr/QtzHOTYZjtH7UnKhkv6tDrDR7E7EJvVBcxrwNRQiyRFgGtbxJwh9
 H5Ew62b1xLhOYRiLJFYaEbj4huzeRjBgWSrr36iTRIP+a7NkPkkogL4ZnSd5LGXe1Ls9
 2MjYg5EbnYIRtuIAdO7xanqezP3Iwo7ojY/KO1ZJd7kTz5JD0h4cwAdOlAp8tKAOEeFa
 SQ0hl5HgGVIvLnKyP0s0xaGOyWa9dCb5mz+jxt/bvBUJwoDOS/WVhbnJoDGdw0QfjtYU
 l/Xg==
X-Gm-Message-State: AGi0PuY+eLHM5FT3B9obMUjlbepFDfk5id/xBzETjx6Jks/DHVi4mRK/
 pa3ZezgCg3cAyGybWrCJjN3LqmL5ogZpxg9I
X-Google-Smtp-Source: APiQypLo0JwQJjPLDun3PRPfaJF/xnJ1viK7UqlB3ox14VpMg4VECz9FkCSmJr80p1ORfBNvjW1drA==
X-Received: by 2002:a92:c6c4:: with SMTP id v4mr22110715ilm.18.1588038880816; 
 Mon, 27 Apr 2020 18:54:40 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id f1sm5522876iog.46.2020.04.27.18.54.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 18:54:39 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id z2so21127559iol.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 18:54:39 -0700 (PDT)
X-Received: by 2002:a6b:9088:: with SMTP id
 s130mr23613954iod.122.1588038879127; 
 Mon, 27 Apr 2020 18:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
In-Reply-To: <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
From: "Anand K. Mistry" <amistry@chromium.org>
Date: Tue, 28 Apr 2020 11:54:28 +1000
X-Gmail-Original-Message-ID: <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
Message-ID: <CAATStaNwCyveF-fmrT=1m-BJh=8WOyaffFzVsC_Lo_rFkm6Z=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyNiBBcHIgMjAyMCBhdCAxODowNCwgQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEFuYW5kOgo+Cj4gQW5hbmQgSyBNaXN0cnkgPGFt
aXN0cnlAY2hyb21pdW0ub3JnPiDmlrwgMjAyMOW5tDTmnIgyMOaXpSDpgLHkuIAg5LiL5Y2IMjow
OeWvq+mBk++8mgo+ID4KPiA+IElmIGRtYV9tYXBfc2coKSBtZXJnZXMgcGFnZXMgd2hlbiBjcmVh
dGluZyB0aGUgbWFwcGluZywgb25seSB0aGUgZmlyc3QKPiA+IGVudHJpZXMgd2lsbCBoYXZlIGEg
dmFsaWQgc2dfZG1hX2FkZHJlc3MoKSBhbmQgc2dfZG1hX2xlbigpLCBmb2xsb3dlZCBieQo+ID4g
ZW50cmllcyB3aXRoIHNnX2RtYV9sZW4oKSA9PSAwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
YW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dl
bS5jCj4gPiBpbmRleCBiMDRhM2MyYjExMWUwOS4uZjhmZDhiOThjMzBlM2QgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiA+IEBAIC0yMjQsNiArMjI0LDkg
QEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ID4KPiA+ICAgICAgICAgZXhwZWN0ZWQgPSBzZ19kbWFf
YWRkcmVzcyhzZy0+c2dsKTsKPiA+ICAgICAgICAgZm9yX2VhY2hfc2coc2ctPnNnbCwgcywgc2ct
Pm5lbnRzLCBpKSB7Cj4gPiArICAgICAgICAgICAgICAgaWYgKCFzZ19kbWFfbGVuKHMpKQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJl
ICdjb250aW51ZScKCnNjYXR0ZXJsaXN0LmggaGFzIHRoZSBjb21tZW50OgovKgogKiBUaGVzZSBt
YWNyb3Mgc2hvdWxkIGJlIHVzZWQgYWZ0ZXIgYSBkbWFfbWFwX3NnIGNhbGwgaGFzIGJlZW4gZG9u
ZQogKiB0byBnZXQgYnVzIGFkZHJlc3NlcyBvZiBlYWNoIG9mIHRoZSBTRyBlbnRyaWVzIGFuZCB0
aGVpciBsZW5ndGhzLgogKiBZb3Ugc2hvdWxkIG9ubHkgd29yayB3aXRoIHRoZSBudW1iZXIgb2Yg
c2cgZW50cmllcyBkbWFfbWFwX3NnCiAqIHJldHVybnMsIG9yIGFsdGVybmF0aXZlbHkgc3RvcCBv
biB0aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgd2hpY2gKICogaXMgMC4KICovCgpTbyBicmVha2lu
ZyBvbiB0aGUgZmlyc3Qgc2dfZG1hX2xlbihzZykgPT0gMCBhcHBlYXJzIHRvIGJlIChvbmUgb2Yp
CnRoZSBkb2N1bWVudGVkIGFwcHJvYWNoLgoKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+
ID4gKwo+ID4gICAgICAgICAgICAgICAgIGlmIChzZ19kbWFfYWRkcmVzcyhzKSAhPSBleHBlY3Rl
ZCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJzZ190YWJsZSBpcyBu
b3QgY29udGlndW91cyIpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZB
TDsKPiA+IC0tCj4gPiAyLjI2LjEuMzAxLmc1NWJjM2ViN2NiOS1nb29nCj4gPgo+ID4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
