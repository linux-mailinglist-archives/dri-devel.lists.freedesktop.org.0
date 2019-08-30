Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A180A2F4E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 08:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E99F6E239;
	Fri, 30 Aug 2019 06:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A376E239
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 06:01:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 46D1B85542;
 Fri, 30 Aug 2019 06:01:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 010C85D9D3;
 Fri, 30 Aug 2019 06:01:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 38A4616E05; Fri, 30 Aug 2019 08:01:11 +0200 (CEST)
Date: Fri, 30 Aug 2019 08:01:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v9 00/18] drm/virtio: switch from ttm to gem shmem helpers.
Message-ID: <20190830060111.3jsnupggl2pf3ojb@sirius.home.kraxel.org>
References: <20190829103301.3539-1-kraxel@redhat.com>
 <CAPaKu7QH0PBLZT0xn3EOJ=d_ee6Q7bKTCqjpMZitizDVSOXenw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QH0PBLZT0xn3EOJ=d_ee6Q7bKTCqjpMZitizDVSOXenw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 30 Aug 2019 06:01:12 +0000 (UTC)
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDQ6NDQ6NDlQTSAtMDcwMCwgQ2hpYS1JIFd1IHdyb3Rl
Ogo+IFRoZSBzZXJpZXMgaXMKPiAKPiAgIFJldmlld2VkLWJ5OiBDaGlhLUkgV3UgPG9sdmFmZmVA
Z21haWwuY29tPgoKVGhhbmtzLgoKPiBIb3dldmVyIEkgcmFuIGludG8gYSBkZWFkbG9jayB3aXRo
IG9uZSBHUFUtaGVhdnkgYXBwLiAgV2hlbiBJIGV4aXRzCj4gVW5pZ2luZSBWYWxsZXkgYmVuY2ht
YXJrIHdpdGggY3RybC1jLCB0aGUgZW50aXJlIGRyaXZlciBsb2NrcyB1cAo+IHByb2JhYmx5IDgg
b3V0IG9mIDEwIHRpbWVzIG9uIG15IG1hY2hpbmUuICBXaGVuIHRoYXQgaGFwcGVucywKPiB2aXJ0
aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jIGRvZXMgbm90IHJldHVybiBhbmQgaXMgYmxvY2tlZCBp
bnNpZGUKPiB2aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVlLgo+IAo+IEl0IHNlZW1zLCB3aGVuIHRo
ZSB2cSBiZWNvbWVzIGZ1bGwgb3IgbmVhciBmdWxsIGJldHdlZW4gcmVjbGFpbV92YnVmcwo+IGFu
ZCB2aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVlLCB2aXJ0aW9fZ3B1X2FycmF5X3B1dF9mcmVlIGNh
biBub3QgZnJlZQo+IGFsbCBvZiB0aGUgb2JqZWN0cyBiZWNhdXNlIGVhY2ggY2FsbCB0byB2aXJ0
aW9fZ3B1X2ZyZWVfb2JqZWN0IG5lZWRzCj4gdG8gYWRkIHNldmVyYWwgY29tbWFuZHMgdG8gdnEu
ICBPbmUgb2YgdGhlIGNhbGxzIGVuZHMgdXAgYmVpbmcgYmxvY2tlZAo+IGF0ICJ3YWl0X2V2ZW50
KHZnZGV2LT5jdHJscS5hY2tfcXVldWUsIC4uLikiLgoKUHJvYmFibHkgaXQgaXMgc2ltcGx5IHRo
ZSBsYXJnZSBudW1iZXIgb2Ygb2JqZWN0cyByZWxlYXNlZCBhdCBvbmNlIHdoZW4Ka2lsbGluZyB0
aGUgYmVuY2htYXJrIHdoaWNoIGNhdXNlcyB0aGUgcXVldWUgdG8gZmlsbCB1cC4KCmNoZWVycywK
ICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
