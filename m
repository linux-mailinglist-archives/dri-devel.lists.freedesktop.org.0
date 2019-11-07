Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADBF27D4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 07:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12D56EE8B;
	Thu,  7 Nov 2019 06:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BFB6EE8B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 06:55:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-W2zo_04tPHSwrpJxSw0C7w-1; Thu, 07 Nov 2019 01:55:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E76D2800054;
 Thu,  7 Nov 2019 06:55:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78E6E5C299;
 Thu,  7 Nov 2019 06:55:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82CC216E08; Thu,  7 Nov 2019 07:55:30 +0100 (CET)
Date: Thu, 7 Nov 2019 07:55:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 9/9] drm/ast: Enable atomic modesetting
Message-ID: <20191107065530.huhkk6wrsyowqiex@sirius.home.kraxel.org>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-10-tzimmermann@suse.de>
 <20191105095711.nzjlqwjjt57se5rt@sirius.home.kraxel.org>
 <1d81c21e-a6f5-c2a7-11d2-dd6017c58ef5@suse.de>
MIME-Version: 1.0
In-Reply-To: <1d81c21e-a6f5-c2a7-11d2-dd6017c58ef5@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: W2zo_04tPHSwrpJxSw0C7w-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573109736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0kpbr3jSkbG2KM8wRTBQOpx8IupT0HAZ9BSc1Xn7aI=;
 b=eifXAx8r5Wn9WWco9332uqRnRd1UK9u0CNB/IsFgV/VELTPEJG8HRhF9g4iI+wXmzdLNl+
 9VSH5S1zuRSN9MSmHcqMZPd9f367KueVE54J7p+0t2+f+7j/RhOLnB64Y5pofzxbStSE1l
 w/ZerMLamagY9aL7SNHWP5kgHE8DAdY=
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
Cc: airlied@redhat.com, chen@aspeedtech.com, dri-devel@lists.freedesktop.org,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+IEhtbS4gIFByZXR0eSBtdWNoIGEgZHVtbXkgZW5jb2RlciBpbXBsZW1lbnRhdGlvbi4gIE1h
eWJlIGFzdCBpcyBzaW1wbGUKPiA+IGVub3VnaCB0aGF0IHRoZSBzaW1wbGUgcGlwZSBoZWxwZXJz
IGNhbiBkbyB0aGUgdHJpY2s/Cj4gCj4gQXMgRGFuaWVsIHNhaWQsIHNpbXBsZSBwaXBlIGhlbHBl
cnMgZG9uJ3Qgc3VwcG9ydCBjdXJzb3JzLiBJCj4gaW52ZXN0aWdhdGVkIGhpcyBjb21tZW50IG9u
IGEgZW5jb2RlciBoZWxwZXJzIGFuZCBmb3VuZCB0aGF0IG1hbnkKPiBkcml2ZXJzIChpbmNsdWRp
bmcgYXN0KSBvbmx5IGNyZWF0ZSBhbiBlbmNvZGVyIHN0cnVjdHVyZSB3aXRob3V0Cj4gYWRkaXRp
b25hbCBmdW5jdGlvbmFsaXR5Lgo+IAo+IEl0J3MgcHJvYmFibHkgd29ydGggaW50cm9kdWNpbmcg
YSBkZWZhdWx0IGltcGxlbWVudGF0aW9uIGZvciB0aGUKPiBlbmNvZGVyLAoKRWl0aGVyIHRoYXQs
IG9yIG1ha2UgYWxsIHRoZSBjYWxsYmFja3Mgb3B0aW9uYWwgc28gYSBlbmNvZGVyIHdpdGhvdXQK
YWRkaXRpb25hbCBmdW5jdGlvbmFsaXR5IG5lZWRzIG9ubHkgYSBmZXcgbGluZXMgb2YgY29kZS4K
Cj4gYnV0IEknZCBsaWtlIHRvIGRvIHRoYXQgaW4gYSBzZXBhcmF0ZSBwYXRjaCBzZXQuIE9rPwoK
WWVwLCB0aGF0IHRvdGFsbHkgbWFrZXMgc2Vuc2UsIGdpdmVuIHRoYXQgaXQnbGwgcHJvYmFibHkg
YmVjb21lIGEgcGF0Y2gKc2VyaWVzIG9mIGl0cyBvd24gKHdpdGggZHJpdmVyIGNsZWFudXBzIGlu
Y2x1ZGVkKS4KClNvLCBmb3IgdGhpcyBwYXRjaDoKQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
