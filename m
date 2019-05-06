Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A7146DE
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 10:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CA8893D5;
	Mon,  6 May 2019 08:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A138893D5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 08:57:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0FBEE81E0D;
 Mon,  6 May 2019 08:57:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A38D67C421;
 Mon,  6 May 2019 08:56:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A5A1F16E0A; Mon,  6 May 2019 10:56:58 +0200 (CEST)
Date: Mon, 6 May 2019 10:56:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Robert Foss <robert.foss@collabora.com>
Subject: Re: [PATCH] drm/virtio: Remove redundant return type
Message-ID: <20190506085658.bgbzefnvpez2k6zm@sirius.home.kraxel.org>
References: <20190503163804.31922-1-robert.foss@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503163804.31922-1-robert.foss@collabora.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 06 May 2019 08:57:00 +0000 (UTC)
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDY6Mzg6MDRQTSArMDIwMCwgUm9iZXJ0IEZvc3Mgd3Jv
dGU6Cj4gdmlydGlvX2dwdV9mZW5jZV9lbWl0KCkgYWx3YXlzIHJldHVybnMgMCwgc2luY2UgaXQK
PiBoYXMgbm8gZXJyb3IgcGF0aHMuCj4gCj4gQ29uc2VxdWVudGx5IG5vIGNhbGxzIGZvciB2aXJ0
aW9fZ3B1X2ZlbmNlX2VtaXQoKQo+IHVzZSB0aGUgcmV0dXJuIHZhbHVlLCBhbmQgaXQgY2FuIGJl
IHJlbW92ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEZvc3MgPHJvYmVydC5mb3NzQGNv
bGxhYm9yYS5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgoKRG9lc24ndCBhcHBseSBjbGVhbmx5IHRvIGRybS1taXNjLW5leHQsIHBy
b2JhYmx5IGNvbmZsaWN0cyB3aXRoIG9uZSBvZgp0aGUgb3RoZXIgdmlydGlvIGZlbmNlIHBhdGNo
ZXMganVzdCBwdXNoZWQuICBDYW4geW91IHJlYmFzZSBhbmQgcmVzZW5kPwoKdGhhbmtzLAogIEdl
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
