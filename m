Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E110C82E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 12:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D206E7D3;
	Thu, 28 Nov 2019 11:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C939F6E7D3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 11:48:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-81ar-GonMKuj_Br98nsBIQ-1; Thu, 28 Nov 2019 06:48:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 314C31005502;
 Thu, 28 Nov 2019 11:48:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9AD25D9E1;
 Thu, 28 Nov 2019 11:48:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C80AA1E0; Thu, 28 Nov 2019 12:48:09 +0100 (CET)
Date: Thu, 28 Nov 2019 12:48:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 2/5] udmabuf: allow userspace to set map attributes
Message-ID: <20191128114809.ukvsmuvzssxctvoe@sirius.home.kraxel.org>
References: <20191126011056.67928-1-gurchetansingh@chromium.org>
 <20191126011056.67928-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191126011056.67928-2-gurchetansingh@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 81ar-GonMKuj_Br98nsBIQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574941697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nktFguJTdhpX1W78dX5HiJxUSwjwhdGSXAnLvNLq2pU=;
 b=Q5cRUmY8TZ3BI8g/BiBKWhgBJzFS3c3srhigoCNUn10nHrDuZhy43AMd7c/qFxD08X70e7
 H0zQX9/HamgCNhprIzq11wz6Tqug6RqWWyszMkjMMddWKxbZStFxuSKVEPvCPPKecn+xHN
 5VXQKMmzAAhbdvWtmRdhbO3Aswf/oIw=
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
Cc: hch@lst.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC91ZG1hYnVmLmggYi9pbmNs
dWRlL3VhcGkvbGludXgvdWRtYWJ1Zi5oCj4gaW5kZXggNDZiNjUzMmVkODU1Li5mOTA4MzFmMmJi
MGQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaAo+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9saW51eC91ZG1hYnVmLmgKPiBAQCAtNiw2ICs2LDggQEAKPiAgI2luY2x1ZGUg
PGxpbnV4L2lvY3RsLmg+Cj4gIAo+ICAjZGVmaW5lIFVETUFCVUZfRkxBR1NfQ0xPRVhFQwkweDAx
Cj4gKyNkZWZpbmUgVURNQUJVRl9GTEFHU19XQwkweDAyCj4gKyNkZWZpbmUgVURNQUJVRl9GTEFH
U19OT05DQUNIRUQgMHgwNAo+ICAKPiAgc3RydWN0IHVkbWFidWZfY3JlYXRlIHsKPiAgCV9fdTMy
IG1lbWZkOwoKVGhpcyBpcyBhIHVhcGkgY2hhbmdlIGFuZCBzaG91bGQgZ28gdG8gYSBzZXBhcmF0
ZSBwYXRjaCwKY2xlYXJseSBmbGFnZ2luZyB0aGF0IGluICRzdWJqZWN0LgoKKG5ldyBwb2xpY3kg
YnkgYWlybGllZCBmb3IgdGhlIGRybSB0cmVlKS4KCk90aGVyd2lzZSB0aGUgc2VyaWVzIGxvb2tz
IGdvb2QgdG8gbWUuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
