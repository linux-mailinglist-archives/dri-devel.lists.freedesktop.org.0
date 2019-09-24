Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B41BC379
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36035898CC;
	Tue, 24 Sep 2019 07:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D9E898CC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:55:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39576A2668F;
 Tue, 24 Sep 2019 07:55:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E67BA5C1B5;
 Tue, 24 Sep 2019 07:55:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B97316E05; Tue, 24 Sep 2019 09:55:38 +0200 (CEST)
Date: Tue, 24 Sep 2019 09:55:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 11/12] drm/mgag200: Reserve video memory for cursor
 plane
Message-ID: <20190924075538.vvg7q2jrderil653@sirius.home.kraxel.org>
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923172753.26593-12-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Tue, 24 Sep 2019 07:55:39 +0000 (UTC)
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
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gKwkvKgo+ICsJICogQXQgdGhlIGhpZ2ggZW5kIG9mIHZpZGVvIG1lbW9yeSwgd2Ug
cmVzZXJ2ZSBzcGFjZSBmb3IKPiArCSAqIGJ1ZmZlciBvYmplY3RzLiBUaGUgY3Vyc29yIHBsYW5l
IHVzZXMgdGhpcyBtZW1vcnkgdG8gc3RvcmUKPiArCSAqIGEgZG91YmxlLWJ1ZmZlcmVkIGltYWdl
IG9mIHRoZSBjdXJyZW50IGN1cnNvci4gSGVuY2UsIGl0J3MKPiArCSAqIG5vdCBhdmFpbGFibGUg
Zm9yIGZyYW1lYnVmZmVycy4KPiArCSAqLwo+ICsJbWRldi0+dnJhbV9mYl9hdmFpbGFibGUgLT0g
MiAqIHNpemU7CgpIbW0sIHRoYXQgbG9va3MgbGlrZSBhIGxlZnRvdmVyIGZyb20gdGhlIHByZXZp
b3VzIHZlcnNpb24gb2YgdGhlIHBhdGNoCnNlcmllcyAuLi4KCmNoZWVycywKICBHZXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
