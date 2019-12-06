Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D7C114EAE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 11:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848986F9A7;
	Fri,  6 Dec 2019 10:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEC36F9A7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 10:04:34 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-oygkoRwHNyOe1GOdZnBtvw-1; Fri, 06 Dec 2019 05:04:31 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 424ED800D54;
 Fri,  6 Dec 2019 10:04:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C388710013D9;
 Fri,  6 Dec 2019 10:04:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0EE3B16E18; Fri,  6 Dec 2019 11:04:26 +0100 (CET)
Date: Fri, 6 Dec 2019 11:04:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Flag all G200 SE A machines as broken wrt
 <startadd>
Message-ID: <20191206100426.anifpqwckuutxxt4@sirius.home.kraxel.org>
References: <20191206081901.9938-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191206081901.9938-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: oygkoRwHNyOe1GOdZnBtvw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575626673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgnlzYKY1pFjNDboGEtQCPK9Swg2wnly8q0hWXylDHw=;
 b=W8Tx5zlr46pN5HbchFZNAiRczIWeOrcOdbc5i1I821J1beGlUCjz7hC0el5W/8/R9P749n
 IJQwxmeUpdQY0Fzth9v5KVae6L2OdId6toN/66H5l3M1RsdVPXX2Enqaw+rwi4k1LYclUY
 64mT5sLf4jHpFjN/8KF4a3OrizqL5Rk=
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
Cc: stable@vger.kernel.org, john.p.donnelly@oracle.com,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 airlied@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBTZXZlcmFsIE1HQSBHMjAwIFNFIG1hY2hpbmVzIGRvbid0IHJlc3BlY3QgdGhlIHZhbHVlIG9m
IHRoZSBzdGFydGFkZAo+IHJlZ2lzdGVyIGZpZWxkLiBBZnRlciBtb3JlIGZlZWRiYWNrIG9uIGFm
ZmVjdGVkIG1hY2hpbmVzLCBuZWl0aGVyIFBDSQo+IHN1YnZlbmRvciBJRCBub3IgdGhlIGludGVy
bmFsIElEIHNlZW0gdG8gaGludCB0b3dhcmRzIHRoZSBidWcuIEFsbAo+IGFmZmVjdGVkIG1hY2hp
bmVzIGhhdmUgYSBQQ0kgSUQgb2YgMHgwNTIyIChpLmUuLCBHMjAwIFNFIEEpLiBJdCB3YXMKPiBk
ZWNpZGVkIHRvIGZsYWcgYWxsIEcyMDAgU0UgQSBtYWNoaW5lcyBhcyBicm9rZW4uCgo+IC0JeyBQ
Q0lfVkVORE9SX0lEX01BVFJPWCwgMHg1MjIsIFBDSV9WRU5ET1JfSURfU1VOLCAweDQ4NTIsIDAs
IDAsCj4gKwl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUyMiwgUENJX0FOWV9JRCwgUENJX0FO
WV9JRCwgMCwgMCwKPiAgCQlHMjAwX1NFX0EgfCBNR0FHMjAwX0ZMQUdfSFdfQlVHX05PX1NUQVJU
QUREfSwKPiAtCXsgUENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTIyLCBQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lELCAwLCAwLCBHMjAwX1NFX0EgfSwKCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
