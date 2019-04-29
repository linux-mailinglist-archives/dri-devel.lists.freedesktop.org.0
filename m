Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD59E4DB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 16:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA32891D4;
	Mon, 29 Apr 2019 14:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54D3891D4;
 Mon, 29 Apr 2019 14:38:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1630D3082B69;
 Mon, 29 Apr 2019 14:37:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B51B2608C2;
 Mon, 29 Apr 2019 14:37:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A6D1811AAA; Mon, 29 Apr 2019 16:37:57 +0200 (CEST)
Date: Mon, 29 Apr 2019 16:37:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Spice-devel] [PATCH] Revert "drm/qxl: drop prime import/export
 callbacks"
Message-ID: <20190429143757.yljjfsgobhi23xnb@sirius.home.kraxel.org>
References: <20190426053324.26443-1-kraxel@redhat.com>
 <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
 <20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
 <CAKMK7uFB8deXDMP9cT634p_dK5LsM37R1v_vGhAEY1ZLZ+WBVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFB8deXDMP9cT634p_dK5LsM37R1v_vGhAEY1ZLZ+WBVA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 29 Apr 2019 14:38:00 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBNb3JlIHVzZWZ1bCB3b3VsZCBiZSBzb21lIHdheSB0byBzaWduYWwgdGhpcyBz
ZWxmLXJlaW1wb3J0IGNhcGFiaWxpdHkKPiA+IHRvIHVzZXJzcGFjZSBzb21laG93LiAgU2VlIERS
TV9QUklNRV9DQVBfTE9DQUwgcGF0Y2guCj4gCj4gVXNlcnNwYWNlIGlzIHN1cHBvc2VkIHRvIHRl
c3Qgd2hldGhlciBpbXBvcnQvZXhwb3J0IHdvcmtzIGZvciBhCj4gc3BlY2lmaWMgY29tYm8sIG5v
dCBibGluZGx5IGFzc3VtZSBpdCBkb2VzIGFuZCB0aGVuIGtlZWwgb3Zlci4gSSB0aGluawo+IHdl
IG5lZWQgdG8gZml4IHRoYXQsIG5vdCBhZGQgbW9yZSBmbGFncyAtIHRoZXJlJ3MgbG90cyBvZiBy
ZWFzb25zIHdoeQo+IGEgZ2l2ZW4gcGFpciBvZiBkZXZpY2VzIGNhbid0IHNoYXJlIGJ1ZmZlcnMg
KGUuZy4gYWxsIHRoZSBjb250aWd1b3VzCj4gYWxsb2NhdGlvbnMgc3R1ZmYgb24gc29jcykuCgpP
ay4gIExldHMgc2NyYXRjaCB0aGUgRFJNX1BSSU1FX0NBUF9MT0NBTCBpZGVhIHRoZW4gYW5kIGJs
YW1lIHVzZXJzcGFjZQppbnN0ZWFkLgoKPiA+IFJpZ2h0IG5vdyBJIGhhdmUgdGhlIGNob2ljZSB0
byBzZXQgRFJNX1BSSU1FX0NBUF97SU1QT1JULEVYUE9SVH0sIGluCj4gPiB3aGljaCBjYXNlIHNv
bWUgdXNlcnNwYWNlIGFzc3VtZXMgaXQgY2FuIGRvIGNyb3NzLWRyaXZlciBleHBvcnQvaW1wb3J0
Cj4gPiBhbmQgdHJpcHMgb3ZlciB0aGF0IG5vdCB3b3JraW5nLiAgT3IgSSBkbyBub3Qgc2V0Cj4g
PiBEUk1fUFJJTUVfQ0FQX3tJTVBPUlQsRVhQT1JUfSwgd2hpY2ggYnJlYWtzIERSSTMgLi4uCj4g
Cj4gWWVhaCB0aGF0J3Mgbm90IGFuIG9wdGlvbi4KCkdvb2QuICBDYW4gSSBnZXQgYW4gYWNrIGZv
ciB0aGlzIHBhdGNoIHRoZW4sIGFzIGl0IHVuYnJlYWtzIERSSTMgd2l0aCBxeGw/Cgp0aGFua3Ms
CiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
