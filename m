Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C9113CE7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62C6F5C8;
	Thu,  5 Dec 2019 08:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862526F5C8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:15:51 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-2Et44iuONkagK7l-p1RkBQ-1; Thu, 05 Dec 2019 03:15:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26AC11856A63;
 Thu,  5 Dec 2019 08:15:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7638B19756;
 Thu,  5 Dec 2019 08:15:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3970916E08; Thu,  5 Dec 2019 09:15:44 +0100 (CET)
Date: Thu, 5 Dec 2019 09:15:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/7] drm/udl: Prepare damage handler for simple-pipe KMS
Message-ID: <20191205081544.ablu3irkfxe2u24s@sirius.home.kraxel.org>
References: <20191204132430.16874-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191204132430.16874-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 2Et44iuONkagK7l-p1RkBQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575533750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggGPCA+KuK4mIt5x1ZYi5cwL3r2LhRaoWRE8zESm7C0=;
 b=MOOSq/3pfwpeIy4wcDvEnQbf6lUkn0E8pI44WXq+qIUACEMBKQnTSKXmDhaJteV26ElRoH
 NR9ifOcKyUW0mXDwIZ8t4/+S6+RI5MgCGHm4+Jnp4sxaDf6r/V3cXNz3PlIPYCM2+7kX60
 +RbwhKRRczylbq/bmA9qdI8bKQLuCW4=
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
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDI6MjQ6MjNQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVWRsJ3MgZGFtYWdlLWhhbmRsaW5nIGNvZGUgcmVxdWlyZXMgY2xlYW4gdXAg
YmVmb3JlIHN3aXRjaGluZyB0aGUgZHJpdmVyCj4gdG8gc2ltcGxlLXBpcGUgaGVscGVycy4gUGF0
Y2hlcyAxLCAyIGFuZCA3IHJlbW92ZSB1bnVzZWQgc3RhdGUgdmFyaWFibGVzCj4gYW5kIHN0YXRp
c3RpY3MuIFBhdGNoZXMgMyB0byA1IHJlb3JnYW5pemVzIHRoZSBkYW1hZ2UgaGFuZGxlciB0byBi
ZSBtb3JlCj4gcmVhZGFibGUuIFBhdGNoIDYgbW92ZXMgZG1hLWJ1ZiBiZWdpbi9lbmQgY2FsbHMg
aW50byB0aGUgZGFtYWdlIGhhbmRsZXIsCj4gc28gaXQgd2lsbCBydW4gZHVyaW5nIHBhZ2UtZmxp
cCBhbmRtb2Rlc2V0IG9wZXJhdGlvbnMuCgpOaWNlIGNsZWFudXBzLgoKQWNrZWQtYnk6IEdlcmQg
SG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
