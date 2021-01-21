Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD20A2FF87E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 00:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643A46E979;
	Thu, 21 Jan 2021 23:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E25A6E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:13:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CABA523A5E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611270801;
 bh=L82o30HXnB+r+O8K3ReoPbDoDul/+56tBIA0cVJ1k7o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HTOCdCskXbs2ygNkKPsG2P/cbDyJwdctxQKe61LEcLxV9yAgYlXmUGknc9aMA733k
 lFEVo5RGDpfHMyCrPK8I4zIkWz8gqhp1sKdmpaC0oCoT0dSpVk2cZQ6IWum8IpG2O1
 Nuf8grls9siIib7NylYx48OvFGZjNapsm4txfvJPNmzqwpc0oXR93FmZqr473CHDQT
 xf+WWTZ3xWTpw9RPiTmsUbc8zOvpLw9KqwE+apkX6ydfRTvzJgoE3aSdxHssYc8A6G
 eOEgBtgfD86bUveAE0nqHDzF6kE6UyAcK80EnXsuA1an5FihgZ+557zMS+EOuTVmj3
 WvX5rUauXdLmA==
Received: by mail-ej1-f52.google.com with SMTP id g12so5023082ejf.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:13:20 -0800 (PST)
X-Gm-Message-State: AOAM530AZLTiEMqqnVgXpiSjQsXZ6GG38YUiyrhVZGmE9xnFHyGpJyAu
 oGBA1gxLypAtO16d1s6n0Bt9QjsbvojZhkkxUQ==
X-Google-Smtp-Source: ABdhPJzG4Ks7WM5fSRNcwNtoBMUhfREE7+DUgbVC917IPz+USYGjYtUsbnVlrkK0juN38OIES4PmwqHxTUNKY+mA6hY=
X-Received: by 2002:a17:906:ada:: with SMTP id
 z26mr1169169ejf.127.1611270799319; 
 Thu, 21 Jan 2021 15:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-4-chunkuang.hu@kernel.org>
 <YAh2JGUUpMcgyke0@ziggy.stardust>
 <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
 <YAk4722oCzcegGdx@ziggy.stardust>
In-Reply-To: <YAk4722oCzcegGdx@ziggy.stardust>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 22 Jan 2021 07:13:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY__S2WMO9sUOP4NaObCdvtRNdLNe3VHrE2RbgHBM-gYosw@mail.gmail.com>
Message-ID: <CAAOTY__S2WMO9sUOP4NaObCdvtRNdLNe3VHrE2RbgHBM-gYosw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/mediatek: Change disp/ddp term to mutex in mtk
 mutex driver
To: Matthias Brugger <matthias.bgg@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0Meac
iDIx5pelIOmAseWbmyDkuIvljYg0OjE55a+r6YGT77yaCj4KPiBPbiBUaHUsIEphbiAyMSwgMjAy
MSBhdCAwNzo0Njo0NEFNICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIE1hdHRo
aWFzOgo+ID4KPiA+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDm
lrwgMjAyMeW5tDHmnIgyMeaXpSDpgLHlm5sg5LiK5Y2IMjoyN+Wvq+mBk++8mgo+ID4gPgo+ID4g
PiBPbiBUaHUsIEphbiAwNywgMjAyMSBhdCAwNzoxNzoyN0FNICswODAwLCBDaHVuLUt1YW5nIEh1
IHdyb3RlOgo+ID4gPiA+IEZyb206IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gPiA+ID4K
PiA+ID4gPiBtdGsgbXV0ZXggaXMgdXNlZCBieSBib3RoIGRybSBhbmQgbWRwIGRyaXZlciwgc28g
Y2hhbmdlIGRpc3AvZGRwIHRlcm0gdG8KPiA+ID4gPiBtdXRleCB0byBzaG93IHRoYXQgaXQncyBh
IGNvbW1vbiBkcml2ZXIgZm9yIGRybSBhbmQgbWRwLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBD
aHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgIDMwICstLQo+ID4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgfCAgIDIgKy0KPiA+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggIHwgICAyICstCj4g
PiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYyAgICB8IDMwNSArKysr
KysrKysrKystLS0tLS0tLS0tLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19tdXRleC5oICAgIHwgIDI2ICstCj4gPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTgyIGluc2Vy
dGlvbnMoKyksIDE4MyBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiBbLi4uXQo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMKPiA+ID4gPiBpbmRleCAxYzhhMjUzZjQ3ODgu
Ljk4YTA2MGJmMjI1ZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX211dGV4LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X211dGV4LmMKPiA+ID4gWy4uLl0KPiA+ID4gPgo+ID4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBkZHBfZHJpdmVyX2R0X21hdGNoW10gPSB7Cj4gPiA+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG11dGV4X2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ID4g
PiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLWRpc3AtbXV0ZXgiLAo+
ID4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQyNzAxX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4g
KyAgICAgICAuZGF0YSA9ICZtdDI3MDFfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAg
IHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLWRpc3AtbXV0ZXgiLAo+ID4gPiA+IC0g
ICAgICAgLmRhdGEgPSAmbXQyNzEyX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4gKyAgICAgICAu
ZGF0YSA9ICZtdDI3MTJfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAgIHsgLmNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRpc3AtbXV0ZXgiLAo+ID4gPiA+IC0gICAgICAgLmRh
dGEgPSAmbXQ4MTY3X2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4gKyAgICAgICAuZGF0YSA9ICZt
dDgxNjdfbXV0ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTczLWRpc3AtbXV0ZXgiLAo+ID4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQ4
MTczX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ID4gKyAgICAgICAuZGF0YSA9ICZtdDgxNzNfbXV0
ZXhfZHJpdmVyX2RhdGF9LAo+ID4gPiA+ICAgICAgIHt9LAo+ID4gPiA+ICB9Owo+ID4gPiA+IC1N
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkZHBfZHJpdmVyX2R0X21hdGNoKTsKPiA+ID4gPiArTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgbXV0ZXhfZHJpdmVyX2R0X21hdGNoKTsKPiA+ID4KPiA+ID4g
SSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIGluIGEgZm9sbG93LXVwIHBhdGNoIHRvIHVwZGF0
ZSB0aGUgYmluZGluZwo+ID4gPiB0byB1c2UgIm1lZGlhdGVrLG10MjcwMS1tdXRleCIgdG8gcmVm
bGVjdCB0aGF0IG11dGV4IGlzIHVzZWQgZm9yIGRybSBhbmQKPiA+ID4gbWRwIGRyaXZlci4gTWFr
ZSBzZW5zZT8KPiA+Cj4gPiBZZXMsIGl0IG1ha2Ugc2Vuc2UuIEkgd291bGQgdHJ5IHRvIHVwZGF0
ZSB0aGUgYmluZGluZywgYnV0IEkgd29uZGVyCj4gPiBkZXZpY2UgdHJlZSBzaG91bGQgYmUgYmFj
a3dhcmQgY29tcGF0aWJsZT8gTGV0J3MgZGlzY3VzcyBpbiB0aGF0Cj4gPiBmb2xsb3ctdXAgcGF0
Y2hlcy4KPiA+Cj4KPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIHdlIHdpbGwgbmVlZCB0byBrZWVw
IHRoZSBvZl9kZXZpY2VfaWQgZW50cmllcyBmb3IKPiB0aGUgb2xkIGJpbmRpbmcgaW4gdGhlIGRy
aXZlciAoc28gdGhhdCBvbGQgRFRzIHN0aWxsIHdvcmspIHdoaWxlIHdlCj4gc2hvdWxkIGVuZm9y
Y2UgdGhlIG5ldyBiaW5kaW5nLiBJJ20gbm90IHN1cmUgaWYgdGhlIHlhbWwgaGFzIGEgb3B0aW9u
Cj4gZm9yIG91dC1vZi1kYXRlIGNvbXBhdGlibGVzLgoKT0ssIEkgd291bGQgZG8gaXQgc28gYW5k
IHJlbW92ZSBvdXQtZi1kYXRlIGNvbXBhdGlibGVzIGluIHlhbWwgYXQKZmlyc3QgdG8gc2VlIGFu
eSBmZWVkYmFjay4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gUmVnYXJkcywKPiBNYXR0aGlh
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
