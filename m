Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59F2AEE9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFAB89780;
	Mon, 27 May 2019 06:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0029389780
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 06:47:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7983C3086215;
 Mon, 27 May 2019 06:47:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
 [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F67660BEC;
 Mon, 27 May 2019 06:47:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 604DB16E08; Mon, 27 May 2019 08:47:43 +0200 (CEST)
Date: Mon, 27 May 2019 08:47:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tyler Slabinski <tslabinski@slabity.net>
Subject: Re: PROBLEM: VirtIO DRM driver crashes when setting specific 16.16
 fixed-point property values
Message-ID: <20190527064743.kooeycqfj7t22iwt@sirius.home.kraxel.org>
References: <CAOoxD-tWknshQLXFzyv2t1CVhfK0SCNec=6MVij9q6kQAVzY=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOoxD-tWknshQLXFzyv2t1CVhfK0SCNec=6MVij9q6kQAVzY=g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 27 May 2019 06:47:49 +0000 (UTC)
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDI6NDY6NTBQTSAtMDQwMCwgVHlsZXIgU2xhYmluc2tp
IHdyb3RlOgo+IFZpcnRJTyBEUk0gZHJpdmVyIGNyYXNoZXMgd2hlbiBzZXR0aW5nIHNwZWNpZmlj
IDE2LjE2IGZpeGVkLXBvaW50Cj4gcHJvcGVydHkgdmFsdWVzCj4gCj4gV2hlbiBydW5uaW5nIGEg
dmlydHVhbCBtYWNoaW5lIHdpdGggYSBWaXJ0SU8gR1BVLCBpdCdzIHBvc3NpYmxlIHRvCj4gY3Jh
c2ggdGhlIGVudGlyZSBWTSBieSBzZXR0aW5nIHRoZSB2YWx1ZSBvZiBhIDE2LjE2IGZpeGVkLXBv
aW50Cj4gcHJvcGVydHkgdG8gYW55IHZhbHVlIGJlbG93IDY1NTM2ICgxLjAgaW4gMTYuMTYgZm9y
bWF0IG9yIDB4MDAwMTAwMDApLgo+IEFzIGEgc3BlY2lmaWMgZXhhbXBsZSwgc2V0dGluZyB0aGUg
U1JDX1cgcHJvcGVydHkgb24gYSBwbGFuZSBEUk0KPiBvYmplY3QgdG8gYSB2YWx1ZSBvZiAzMDAw
MCB3aWxsIGNhdXNlIHRoZSBWTSB0byBoYXJkLXNodXRkb3duLgoKRG8geW91IGhhdmUgYSBxZW11
IHN0YWNrdHJhY2U/Cgp0aGFua3MsCiAgR2VyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
