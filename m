Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB7EFBFE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 12:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E879C6E9D3;
	Tue,  5 Nov 2019 11:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22196E9D3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 11:05:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-oZyOHXhiMa2n8L-Cz4DsmA-1; Tue, 05 Nov 2019 06:05:25 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E51E800C73;
 Tue,  5 Nov 2019 11:05:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F031001B00;
 Tue,  5 Nov 2019 11:05:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 038DD16E08; Tue,  5 Nov 2019 12:05:22 +0100 (CET)
Date: Tue, 5 Nov 2019 12:05:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/udl: Switch to SHMEM
Message-ID: <20191105110521.zwv35ihnqlmwla3u@sirius.home.kraxel.org>
References: <20191028084549.30243-1-tzimmermann@suse.de>
 <20191028084549.30243-4-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028084549.30243-4-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: oZyOHXhiMa2n8L-Cz4DsmA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572951926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2pI5BuRXYcNU2EoJbNyG1WIRHNPTSyrP8ILy4qDa4I=;
 b=R8VTpZIBR1GB5l4QFxwbGWIeWyKfnlz1SB41zhwc2UvUeMKIRY9aCc8c8qL0IbNBPJfKm/
 8XAQOjnfwhB1PTMm4pM87/ax5yCyfHF2NoYQYTgutmE+s5ZTeR5oaYLbYyRln9AfRxS/1E
 d92abfVHHHX1rHQJuye/NxZIz8k3wVY=
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDk6NDU6NDlBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVWRsJ3MgR0VNIGNvZGUgYW5kIHRoZSBnZW5lcmljIFNITUVNIGFyZSBhbG1v
c3QgaWRlbnRpY2FsLiBSZXBsYWNlCj4gdGhlIGZvcm1lciB3aXRoIFNITUVNLiBUaGUgZG1hYnVm
IHN1cHBvcnQgaW4gdWRsIGlzIGJlaW5nIHJlbW92ZWQKPiBpbiBmYXZvciBvZiB0aGUgZ2VuZXJp
YyBHRU0gUFJJTUUgZnVuY3Rpb25zLgo+IAo+IFRoZSBtYWluIGRpZmZlcmVuY2UgaXMgaW4gdGhl
IGNhY2hpbmcgZmxhZ3MgZm9yIG1tYXAgcGFnZXMuIEJ5Cj4gZGVmYXVsdCwgU0hNRU0gYWx3YXlz
IHNldHMgKHVuY2FjaGVkKSB3cml0ZSBjb21iaW5pbmcuIEluIHVkbCdzCj4gbWVtb3J5IG1hbmFn
ZW1lbnQgY29kZSwgb25seSBpbXBvcnRlZCBidWZmZXJzIHVzZSB3cml0ZSBjb21iaW5pbmcuCj4g
TWVtb3J5IHBhZ2VzIG9mIGxvY2FsbHkgY3JlYXRlZCBidWZmZXIgb2JqZWN0cyBhcmUgbW1hcCdl
ZCB3aXRoCj4gY2FjaGluZyBlbmFibGVkLiBUbyBrZWVwIHRoZSBvcHRpbWl6YXRpb24sIHVkbCBw
cm92aWRlcyBpdHMgb3duCj4gbW1hcCBmdW5jdGlvbiBmb3IgR0VNIG9iamVjdHMgd2hlcmUgaXQg
Zml4ZXMgdXAgdGhlIG1hcHBpbmcgZmxhZ3MuCgpIbW0sIGNvdWxkbid0IHNwb3QgYW55dGhpbmcg
d3JvbmcsIGJ1dCBpdCdzIHJhdGhlciBoYXJkIHRvIHNlZSB0aGUKYWN0dWFsIGNoYW5nZXMgaGVy
ZSAuLi4KCkFueSBjaGFuY2UgdGhhdCBoYXZpbmcgYSBzZXBhcmF0ZSAicmVtb3ZlIGFsbCBkZWFk
IGNvZGUgb2Jzb2xldGVkIGJ5CnNobWVtIGhlbHBlcnMiIHBhdGNoIGhlbHBzPwoKY2hlZXJzLAog
IEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
