Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 608E97D5DF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 08:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6CC6E392;
	Thu,  1 Aug 2019 06:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FD86E392
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 06:52:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B76BE1108;
 Thu,  1 Aug 2019 06:52:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-54.ams2.redhat.com
 [10.36.116.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 782825C205;
 Thu,  1 Aug 2019 06:52:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2572011AAA; Thu,  1 Aug 2019 08:52:07 +0200 (CEST)
Date: Thu, 1 Aug 2019 08:52:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC 3/6] udmabuf: enforce access flags
Message-ID: <20190801065207.lsdfrrgfoatdeugv@sirius.home.kraxel.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
 <20190801022517.1903-4-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801022517.1903-4-gurchetansingh@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 01 Aug 2019 06:52:08 +0000 (UTC)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAgc3RhdGljIGludCBtbWFwX3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1Ziwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpCj4gIHsKPiAgCXN0cnVjdCB1ZG1hYnVmICp1YnVmID0gYnVmLT5w
cml2Owo+ICsJcGdwcm90X3QgcGdwcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdz
KTsKPiAgCj4gIAlpZiAoKHZtYS0+dm1fZmxhZ3MgJiAoVk1fU0hBUkVEIHwgVk1fTUFZU0hBUkUp
KSA9PSAwKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAKPiArCWlmICh1YnVmLT5mbGFncyAmIFVE
TUFCVUZfRkxBR1NfUFJPVF9OT05FKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWlmICgo
dWJ1Zi0+ZmxhZ3MgJiBVRE1BQlVGX0ZMQUdTX1BST1RfUkVBRCkgPT0gMCkKCiJpZiAoKHZtYS0+
dm1fZmxhZ3MgJiBWTV9SRUFEKSA9PSAwKSIgPwoKY2hlZXJzLAogIEdlcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
