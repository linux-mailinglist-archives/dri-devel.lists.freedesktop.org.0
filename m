Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837DBD56B4
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 17:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2283889D83;
	Sun, 13 Oct 2019 15:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083E389D83
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 15:56:21 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z19so32196967ior.0
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 08:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/Ip8+Jxgd0rwhnDB/VueXGj42PNw7fZm2CTH/h8LA0=;
 b=FjfpNdc1ZJasIeZQ/mG4eXiWPGXkXHAlgkULPnU+5S8V11tDXr2MEwVCZSD6MeFHub
 JYmtWFRfC6j81bJCx0qGTupnqmYwcph4ZfbfwC8zHFejW3q7GakuuIUwAQDAFk0+FtP/
 RI6jOFf02TSi2RdkYZ56qBWXzL1YJNBB1pobOBu51fBCLVcAZ2s1nna6xO3EeMEV9DAd
 WtkwFqICLIGuseEZ/H+CqxlZKxnOPcLsXijnUh/M+rszAyqaY2TpsCBbTMZ4MgFENDCx
 YR5pLVMxLdIV4moGjoFgdvxM40ayH9M+FTH9rH01iCtwJpy90uAYwiQJejF3DK2r2RTR
 lVjA==
X-Gm-Message-State: APjAAAWj45J+QB/mDARD+1ydyKg4q15aJIRRDsNA8pinHEBKkmB3nPUY
 zYGdsg/qurlIdkzQp1IDSFWAA7kUT7maxPCh0FyCDA==
X-Google-Smtp-Source: APXvYqwmSVFuQ3GFsuRZS3O4VKiiy3+iPXNr/Rrh2XRbTKykEf2L7RTXUXG2yXe9DRPmJV1QDLo8BJypHPQgdllTf4g=
X-Received: by 2002:a05:6638:3a6:: with SMTP id
 z6mr15738134jap.33.1570982180198; 
 Sun, 13 Oct 2019 08:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191002122542.8449-1-tomi.valkeinen@ti.com>
In-Reply-To: <20191002122542.8449-1-tomi.valkeinen@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 13 Oct 2019 10:56:09 -0500
Message-ID: <CAHCN7xLjGkLHMWejEk-3vJ-OwzjB+BXtnPWoonh4mAVxbkzMWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: fix max fclk divider for omap36xx
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=S/Ip8+Jxgd0rwhnDB/VueXGj42PNw7fZm2CTH/h8LA0=;
 b=fWNrk6Wcf+1CR3jVL77n57LtxfF1y1ZDj2mm47rK7/Y9WeAIv1x8CeFfrzxDCchZWL
 BE/1a9QgyMg5tnm20+H4PTXgX6g/aMooAtkid42a4OrX/6wwDx1wKv2ZaZBTwf/HaXCp
 8PJ834/B4T3qrwtk9K6atZnNJDqKHfCtCi+BKY/zZutyiKDvGO7XtrVfmVGB2+qel0/n
 ibUKMeEg1f3KhIL+hd5evfvDQQFqaIgF/J7W2p8ZUoN4x+tCmpl7Ceyb54JzrxfgL4bg
 C640oz/u2TELXug7xsIyZPtSUN/RZ9Mo1WZyiEvEcLO+bXCol6HGMqnlUCkB4ZMQSnSE
 v/hw==
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
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA3OjI1IEFNIFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+IHdyb3RlOgo+Cj4gVGhlIE9NQVAzNnh4IGFuZCBBTS9ETTM3eCBUUk1zIHNh
eSB0aGF0IHRoZSBtYXhpbXVtIGRpdmlkZXIgZm9yIERTUyBmY2xrCj4gKGluIENNX0NMS1NFTF9E
U1MpIGlzIDMyLiBFeHBlcmltZW50YXRpb24gc2hvd3MgdGhhdCB0aGlzIGlzIG5vdAo+IGNvcnJl
Y3QsIGFuZCB1c2luZyBkaXZpZGVyIG9mIDMyIGJyZWFrcyBEU1Mgd2l0aCBhIGZsb29kIG9yIHVu
ZGVyZmxvd3MKPiBhbmQgc3luYyBsb3N0cy4gRGl2aWRlcnMgdXAgdG8gMzEgc2VlbSB0byB3b3Jr
IGZpbmUuCj4KPiBUaGVyZSBpcyBhbm90aGVyIHBhdGNoIHRvIHRoZSBEVCBmaWxlcyB0byBsaW1p
dCB0aGUgZGl2aWRlciBjb3JyZWN0bHksCj4gYnV0IGFzIHRoZSBEU1MgZHJpdmVyIGFsc28gbmVl
ZHMgdG8ga25vdyB0aGUgbWF4aW11bSBkaXZpZGVyIHRvIGJlIGFibGUKPiB0byBpdGVyYXRpdmVs
eSBmaW5kIGdvb2QgcmF0ZXMsIHdlIGFsc28gbmVlZCB0byBkbyB0aGUgZml4IGluIHRoZSBEU1MK
PiBkcml2ZXIuCj4KClRvbWksCgpJcyB0aGVyZSBhbnkgd2F5IHlvdSBjYW4gZG8gYSBwYXRjaCBm
b3IgdGhlIEZCIHZlcnNpb24gZm9yIHRoZSBvbGRlcgo0LjkgYW5kIDQuMTQga2VybmVscz8gIEkg
dGhpbmsgdGhleSBhcmUgc3RpbGwgZGVmYXVsdGluZyB0byB0aGUgb21hcGZiCmluc3RlYWQgb2Yg
RFJNLCBzbyB0aGUgdW5kZXJmbG93IGlzc3VlIHN0aWxsIGFwcGVhcnMgYnkgZGVmYXVsdCBhbmQK
dGhlIHBhdGNoIG9ubHkgaW1wYWN0cyB0aGUgRFJNIHZlcnNpb24gb2YgdGhlIGRyaXZlci4gIElm
IG5vdCwgZG8geW91CmhhdmUgYW55IG9iamVjdGlvbnMgaWYgSSBzdWJtaXQgYSBwYXRjaCB0byBz
dGFibGUgZm9yIHRob3NlIHR3byBMVFMKYnJhbmNoZXM/Cgp0aGFua3MsCgphZGFtCj4gU2lnbmVk
LW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiBDYzogQWRh
bSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rzcy5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9kc3MvZHNzLmMKPiBpbmRleCBlMjI2MzI0YWRiNjkuLjRiZGQ2M2I1NzEwMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvZHNzLmMKPiBAQCAtMTA4Myw3ICsxMDgzLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkc3NfZmVhdHVyZXMgb21hcDM0eHhfZHNzX2ZlYXRzID0gewo+Cj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHNzX2ZlYXR1cmVzIG9tYXAzNjMwX2Rzc19mZWF0cyA9IHsKPiAg
ICAgICAgIC5tb2RlbCAgICAgICAgICAgICAgICAgID0gICAgICAgRFNTX01PREVMX09NQVAzLAo+
IC0gICAgICAgLmZja19kaXZfbWF4ICAgICAgICAgICAgPSAgICAgICAzMiwKPiArICAgICAgIC5m
Y2tfZGl2X21heCAgICAgICAgICAgID0gICAgICAgMzEsCj4gICAgICAgICAuZmNrX2ZyZXFfbWF4
ICAgICAgICAgICA9ICAgICAgIDE3MzAwMDAwMCwKPiAgICAgICAgIC5kc3NfZmNrX211bHRpcGxp
ZXIgICAgID0gICAgICAgMSwKPiAgICAgICAgIC5wYXJlbnRfY2xrX25hbWUgICAgICAgID0gICAg
ICAgImRwbGw0X2NrIiwKPiAtLQo+IFRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtr
YWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgo+IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
