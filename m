Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6DEDA84B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353E16EA19;
	Thu, 17 Oct 2019 09:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0476EA19
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 09:29:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1A39010C6352;
 Thu, 17 Oct 2019 09:29:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0BF860872;
 Thu, 17 Oct 2019 09:29:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F0B2311AAA; Thu, 17 Oct 2019 11:29:37 +0200 (CEST)
Date: Thu, 17 Oct 2019 11:29:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 2/2] [RFC] drm/virtgpu: modify uapi with
 stride/layer_stride fix
Message-ID: <20191017092937.itc3bnnkekk6auga@sirius.home.kraxel.org>
References: <20191002014935.33171-1-gurchetansingh@chromium.org>
 <20191002014935.33171-2-gurchetansingh@chromium.org>
 <20191002084942.jnm6brnuadwztonh@sirius.home.kraxel.org>
 <CAAfnVB=NBvsAsFX_iDuqfyS12jp=S=1kXDjvWr8-tFAaN5aEMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAfnVB=NBvsAsFX_iDuqfyS12jp=S=1kXDjvWr8-tFAaN5aEMQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 17 Oct 2019 09:29:39 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAzKSBNYWtlIHN1cmUgaG9zdF9zdHJpZGUgPT0gZ3Vlc3Rfc3RyaWRlIGF0IGFsbG9jYXRpb24g
dGltZQoKPiBGb3IgKDMpLCBzaW5jZSB3ZSBoYXZlIHRvIGRvIHNvbWV0aGluZyBsaWtlCj4gVklS
VElPX0dQVV9DTURfTUVUQURBVEFfUVVFUlkgKG9yIHdoYXRldmVyIHdlIGNhbGwgaXQpIGZvciBW
dWxrYW4gYW5kCj4gemVyby1jb3B5IGFueXdheXMsIHRoaXMgc2VlbWVkIGxpa2UgdGhlIG1vc3Qg
bmF0dXJhbCBjaG9pY2UuCgpZZXAsIGZvciBzaGFyZWQgcmVzb3VyY2VzIGl0IGNlcnRhaW5seSBt
YWtlcyBzZW5zZSB0byBoYXZlIGhvc3QgYW5kCmd1ZXN0IGFncmVlIG9uIHRoZSBzdHJpZGUuICBJ
J2QgdGVuZCB0byBub3QgdG91Y2ggdGhlIGN1cnJlbnQgVFJBTlNGRVIKaW9jdGxzIChhbmQgdmly
dGlvIGNvbW1hbmRzKSB0aG91Z2gsIGJ1dCBpbnRlZ3JhdGUgdGhhdCBpbnRvIHRoZSBibG9iCnJl
c291cmNlIHN1cHBvcnQgaW5zdGVhZC4gIFdlIHByb2JhYmx5IG5lZWQgYmxvYiB0cmFuc2ZlciBp
b2N0bHMgYW5kCnZpcnRpbyBjb21tYW5kcyBhbnl3YXkuCgo+ID4gSSBkb24ndCB0aGluayB3ZSBj
YW4gc2ltcGx5IHVzZSB0aGUgYXJncyBoZXJlIHdpdGhvdXQgY2hlY2tpbmcgd2UKPiBhY3R1YWxs
eSBnb3Qgc29tZXRoaW5nIGZyb20gdXNlcnNwYWNlIC4uLgo+IAo+IENvcnJlY3QgbWUgaWYgSSdt
IHdyb25nLCBidXQgZG9lc24ndCBkcm1faW9jdGwoLi4pIGFscmVhZHkgbWFrZSBzdXJlCj4gdGhh
dCB0aGUgcG9pbnRlciBpcyB0aGUgaW50ZXJzZWN0aW9uIG9mIHRoZSBrZXJuZWwgYW5kIHVzZXJz
cGFjZQo+IHNpemVzLCBzbyB3ZSBjYW4gc2FmZWx5IGFwcGVuZCBkYXRhPyAgaS5lLCBsYXllcl9z
dHJpZGUgYW5kIHN0cmlkZQo+IHdpbGwgYmUgemVybyBmb3Igb2xkIHVzZXIgc3BhY2UgKyBhIG5l
dyBrZXJuZWwuCgpBaCwgcmlnaHQsIEkgZm9yZ290IHRoZSBnZW5lcmljIGRybSBpb2N0bCBjb2Rl
IGRvZXMgdGhhdCBzZXJ2aWNlIGZvciB1cy4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
