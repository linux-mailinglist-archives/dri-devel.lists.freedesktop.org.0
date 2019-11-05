Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D28EFA24
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C35F6E8C2;
	Tue,  5 Nov 2019 09:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D106E8C2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:53:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-WlC0szv5NpyJ_Qwq_1Fb_Q-1; Tue, 05 Nov 2019 04:52:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 635ED477;
 Tue,  5 Nov 2019 09:52:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EFA1600D3;
 Tue,  5 Nov 2019 09:52:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 37E0F16E08; Tue,  5 Nov 2019 10:52:55 +0100 (CET)
Date: Tue, 5 Nov 2019 10:52:55 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/9] drm/ast: Add cursor plane
Message-ID: <20191105095255.4xaleqww4i4246gg@sirius.home.kraxel.org>
References: <20191028154928.4058-1-tzimmermann@suse.de>
 <20191028154928.4058-9-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028154928.4058-9-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: WlC0szv5NpyJ_Qwq_1Fb_Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572947581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ducN659ntguO3h1Kw+y8NijCaFqRxFoDJu0PzBO48xM=;
 b=Zm2oNxc1aYmler0d4+liHPeJOZHXi3XtfTQX6b/KsV8YtdgxwU1CpvsVudh2xVRTyOOwgx
 KRuNjxwLqxuYIRkDve/G+LWOTJSyHLP3FIHc9gU8NJXVNdbJie8oTOTrrg3mjldHIUHsEM
 PFD+abzL+DBXRwRQ+X4cfZzDsIkh8fI=
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
Cc: airlied@redhat.com, chen@aspeedtech.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDQ6NDk6MjdQTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGN1cnNvciBwbGFuZSB1c2VzIGFuIGludGVybmFsIGZvcm1hdCBvZiBB
UkdCNDQ0NC4gVG8gdXNlcnNwYWNlLCB3ZQo+IGFubm91bmNlIEFSR0I4ODg4IGFuZCBkbyB0aGUg
dHJhbnNmb3JtYXRpb24gaW50ZXJuYWxseS4KClNhbWUgY29tbWVudHMgYXMgb24gcGF0Y2ggNi85
IChwcmltYXJ5IHBsYW5lIC4uLikKCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
