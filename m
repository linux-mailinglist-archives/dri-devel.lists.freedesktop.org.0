Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6643308
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3DC892B2;
	Thu, 13 Jun 2019 07:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271EE892B1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 07:00:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B1273B2DD4;
 Thu, 13 Jun 2019 07:00:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6553360C8B;
 Thu, 13 Jun 2019 07:00:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8253211AB8; Thu, 13 Jun 2019 09:00:16 +0200 (CEST)
Date: Thu, 13 Jun 2019 09:00:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 12/13] drm/virtio: drop DRM_AUTH usage from the driver
Message-ID: <20190613070016.sllkspqodporxtvp@sirius.home.kraxel.org>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-12-emil.l.velikov@gmail.com>
 <CACvgo51+WknrTjzEhc6EitJV5EA0f9SXznQMkw3Y_ixPHSOLPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51+WknrTjzEhc6EitJV5EA0f9SXznQMkw3Y_ixPHSOLPQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 13 Jun 2019 07:00:17 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMTE6NTk6MTVBTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIE1vbiwgMjcgTWF5IDIwMTkgYXQgMDk6MTksIEVtaWwgVmVsaWtvdiA8ZW1pbC5s
LnZlbGlrb3ZAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBFbWlsIFZlbGlrb3YgPGVt
aWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4KPiA+IFRoZSBhdXRoZW50aWNhdGlvbiBjYW4g
YmUgY2lyY3VtdmVudGVkLCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSByZW5kZXIKPiA+IG5vZGUu
Cj4gPgo+ID4gRnJvbSB0aGUgZHJpdmVyIFBPViB0aGVyZSBpcyBubyBkaXN0aW5jdGlvbiBiZXR3
ZWVuIHByaW1hcnkgYW5kIHJlbmRlcgo+ID4gbm9kZXMsIHRodXMgd2UgY2FuIGRyb3AgdGhlIHRv
a2VuLgo+ID4KPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+IENj
OiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwo+ID4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgoKQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
