Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D68AFF2A6C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 10:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EC46F3BD;
	Thu,  7 Nov 2019 09:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3154A6F3BD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:20:24 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-MyGlsVe9NQSEiO4rS_fr1w-1; Thu, 07 Nov 2019 04:20:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 653B1477;
 Thu,  7 Nov 2019 09:20:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15F0B6090A;
 Thu,  7 Nov 2019 09:20:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 15D8E16E08; Thu,  7 Nov 2019 10:20:16 +0100 (CET)
Date: Thu, 7 Nov 2019 10:20:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 6/9] drm/ast: Add primary plane
Message-ID: <20191107092016.3chteuq6a5cro2nb@sirius.home.kraxel.org>
References: <20191107083404.6852-1-tzimmermann@suse.de>
 <20191107083404.6852-7-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191107083404.6852-7-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MyGlsVe9NQSEiO4rS_fr1w-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573118423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXVo8CRhS0IMraRPzBbYBD5GOarCHTVb57AckYaZ4bY=;
 b=CJgzHlvUBoQ8psniVxwL3fJ0xxWYovBckqR3LbdrT/nlna0a/aqXEXr38CYbSv3lJZvZxs
 41GhOs3U09tNZ68xSiyEKb8gBcVtHIWlMVPjQvIH0zImvcc6Nd7gHoT4LtTIgdvu+BMBt1
 02gVd9PFxxIw+0/0JKjdLX3GO3AU3wQ=
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
Cc: airlied@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDk6MzQ6MDFBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gTGlrZSB0aGUgb3JpZ2luYWwgbW9kZS1zZXR0aW5nIGNvZGUsIHRoZSBwcmlt
YXJ5IHBsYW5lIHN1cHBvcnRzIFhSR0I4ODgsCj4gUkdCNTY1IGFuZCBDOC4gVGhlIHBsYW5lIGl0
c2VsZiBvbmx5IHBpbnMgQk9zIGFuZCBzZXRzIHRoZSBiYXNlIGFkZHJlc3MKPiBhbmQgc2Nhbmxp
bmUgb2Zmc2V0LiBUaGUgbW9kZS1zZXR0aW5nIGNvZGUgd2lsbCBiZSBsb2NhdGVkIGluIHRoZSBD
UlRDJ3MKPiBhdG9taWMgaGVscGVycy4KPiAKPiB2MjoKPiAJKiBkb24ndCBzZXQgcGxhbmUgY2Fs
bC1iYWNrIGZ1bmN0aW9ucyB0byBOVUxMIGV4cGxpY2l0bHkKPiAJKiBkZWZpbmUgcGxhbmUgZm9y
bWF0IGFycmF5IGluIGdsb2JhbCBzY29wZQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
