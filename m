Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5A100485
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 12:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77A46E497;
	Mon, 18 Nov 2019 11:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A82F6E499
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 11:42:07 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-4dlM98s6NiC6OYyWQN7DVg-1; Mon, 18 Nov 2019 06:42:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2097F107ACE5;
 Mon, 18 Nov 2019 11:42:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBA7F2935A;
 Mon, 18 Nov 2019 11:42:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BA18916E2D; Mon, 18 Nov 2019 12:41:59 +0100 (CET)
Date: Mon, 18 Nov 2019 12:41:59 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 14/15] sample/vfio-mdev/mbocs: Remove dma_buf_k(un)map
 support
Message-ID: <20191118114159.vi3cpfkj2qaqkuav@sirius.home.kraxel.org>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-15-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191118103536.17675-15-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4dlM98s6NiC6OYyWQN7DVg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574077326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwMdwNiUvTdAk1yLeIgbUXoa8gGnHM2LkDasXwZuJ7g=;
 b=PME4ye59jOzi7om6DWyVBSVHeAgNcfNWWcu7Az/du4NWoUJgg7/qxJcdZQe0FPWTfwkQJp
 lYxvwJFGkbBZxt0gwTjQ1YDNsK4yLnkS4GnCpFwALcxlVHqtwwzCwcFjRajBT5bpxREe0X
 c9bClGtS1gMfMAeF4xcEcpX9qWYjyVI=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTE6MzU6MzVBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBObyBpbi10cmVlIHVzZXJzIGxlZnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IEtpcnRpIFdhbmtoZWRlIDxr
d2Fua2hlZGVAbnZpZGlhLmNvbT4KPiBDYzoga3ZtQHZnZXIua2VybmVsLm9yZwo+IC0tCj4gQWNr
IGZvciBtZXJnaW5nIHRoaXMgdGhyb3VnaCBkcm0gdHJlZXMgdmVyeSBtdWNoIGFwcHJlY2lhdGVk
Lgo+IC1EYW5pZWwKCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
CmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
