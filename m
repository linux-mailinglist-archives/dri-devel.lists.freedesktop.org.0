Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088135D50E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 19:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460AF89FE6;
	Tue,  2 Jul 2019 17:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DB989FE3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 17:12:48 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so28004545eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 10:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoF0sNAlHbB2PqfJBA1jXMj4w92+gZnPePjTu0uUobU=;
 b=XovFYcbL2Pef2BjAZL24MkzyhQw6fSYXr3U0HZECskfYnYea9byWvAVhHLJGIS78Y8
 lRDNf6+RAFt3BPutt958SaFrOwNPFlkye+2yygfR0tGCUj/k4eULjHDglAN4No4V7BA+
 7RAoyBF9dLSH86nI3E+6Y5ZppDaWJ4nv+WhxSZRPMGaM3/PWEq+1rMeRvNnc9FswHo8K
 olVzCUaNkrE5upUyiGKfXOLm+BMKbzmXs78Ve7FP1iUtUOfzW/becJR2kHxt3rNte/AK
 nTyx45iBcLC/3Mg7QEtVMFP2mcQYxDsilwBUfkaI/BTshUzA0rr3zx22MK8ydBbLCndr
 VbIw==
X-Gm-Message-State: APjAAAWtNcbZKQTXlGqzzA2dSi+E/uete8ofBuj56moTAA5ynOK68C+Z
 Q4Csqfa0av65cSIE3iqoMPDVXtB4iO+MDgUe2WJ9/D26o0k=
X-Google-Smtp-Source: APXvYqzkSu8z9mFY0i8yVY+FT2wCAAtApNeEZpub+8q71O42jEyUwtmm/AGgFEProRchS7okyCoM++zAFylZVEj7Kw0=
X-Received: by 2002:a17:906:85d4:: with SMTP id
 i20mr30449571ejy.256.1562087567246; 
 Tue, 02 Jul 2019 10:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190702154419.20812-1-robdclark@gmail.com>
 <20190702154419.20812-4-robdclark@gmail.com>
 <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
In-Reply-To: <CAOCk7NrXko8xR1Ovg6HrP2ZpS83mjZoOWdae-mq_QJMRzeENLQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Jul 2019 10:12:31 -0700
Message-ID: <CAF6AEGsUve1NnzF2kEeW0jwgXnxZTgFaHbq-c-+CKru1jS9tWg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: correct dsi mode_flags
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XoF0sNAlHbB2PqfJBA1jXMj4w92+gZnPePjTu0uUobU=;
 b=bHw55XaQGroF0ylnI35AGP91jmUT5NGLszLbt34h7hJdpUsA1e6tQQINu1L4phDSOr
 YQKxzV3xlxNsLK2qMjdBeknXnaEuUGAut8p4ynSaVCPcHPbzknLqhsv34RUxlHcfWx6o
 E10RM4Yp/m1E4sQ5sidfuvWHhiOf8+J4QoDpqwxjv9bSZBGk1b1yy82+IAjxvnCirYYy
 HhkxpNHrM9UMQggtDzhbmV+fesNi+DGCHw0S9u45uzgtc/A7BJoZte8xmxv8VTm/7o2I
 qlfUSD+o38eQxz3FG17pdj+1qlK4mx+NngoI0rMsBtqAS3jkDcauyL3TkK+IUt4EcYGN
 UWUQ==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMiwgMjAxOSBhdCAxMDowOSBBTSBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5o
dWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAyLCAyMDE5IGF0IDk6NDYgQU0g
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gPgo+ID4gTm90aWNlZCB3aGlsZSBjb21w
YXJpbmcgcmVnaXN0ZXIgZHVtcCBvZiBob3cgYm9vdGxvYWRlciBjb25maWd1cmVzIERTSQo+ID4g
dnMgaG93IGtlcm5lbCBjb25maWd1cmVzLiAgSXQgc2VlbXMgdGhlIGJyaWRnZSBzdGlsbCB3b3Jr
cyBlaXRoZXIgd2F5LAo+ID4gYnV0IGZpeGluZyB0aGlzIGNsZWFycyB0aGUgJ0NIQV9EQVRBVFlQ
RV9FUlInIGVycm9yIHN0YXR1cyBiaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJr
IDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS1zbjY1ZHNpODYuYyB8IDMgKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1
ZHNpODYuYwo+ID4gaW5kZXggYTZmMjc2NDhjMDE1Li5jOGZiNDVlN2IwNmQgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCj4gPiBAQCAtMzQyLDggKzM0Miw3IEBA
IHN0YXRpYyBpbnQgdGlfc25fYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
KQo+ID4gICAgICAgICAvKiBUT0RPOiBzZXR0aW5nIHRvIDQgbGFuZXMgYWx3YXlzIGZvciBub3cg
Ki8KPiA+ICAgICAgICAgZHNpLT5sYW5lcyA9IDQ7Cj4gPiAgICAgICAgIGRzaS0+Zm9ybWF0ID0g
TUlQSV9EU0lfRk1UX1JHQjg4ODsKPiA+IC0gICAgICAgZHNpLT5tb2RlX2ZsYWdzID0gTUlQSV9E
U0lfTU9ERV9WSURFTyB8IE1JUElfRFNJX01PREVfVklERU9fU1lOQ19QVUxTRSB8Cj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCB8IE1JUElfRFNJ
X01PREVfVklERU9fSFNFOwo+ID4gKyAgICAgICBkc2ktPm1vZGVfZmxhZ3MgPSBNSVBJX0RTSV9N
T0RFX1ZJREVPOwo+Cj4gRGlkIHlvdSBjaGVjayB0aGlzIGFnYWluc3QgdGhlIGRhdGFzaGVldD8g
IFBlciBteSByZWFkaW5nLCBFT1RfUEFDS0VUCj4gYW5kIFZJREVPX0hTRSBhcHBlYXIgdmFsaWQu
ICBJIGRvbid0IGtub3cgYWJvdXQgVklERU9fU1lOQ19QVUxTRS4KClRoZSBFT1QgZmxhdCBpcyBi
YWRseSBuYW1lZDoKCi8qIGRpc2FibGUgRW9UIHBhY2tldHMgaW4gSFMgbW9kZSAqLwojZGVmaW5l
IE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCAgICBCSVQoOSkKCkkgY2FuIGRvdWJsZSBjaGVjayBv
dXQgSFNFLCBidXQgdGhpcyB3YXMgb25lIG9mIHRoZSBzZXR0aW5nCmRpZmZlcmVuY2VzIGJldHdl
ZW4gYm9vdGxvYWRlciBhbmQga2VybmVsCgpCUiwKLVIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
