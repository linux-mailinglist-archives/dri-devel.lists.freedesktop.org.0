Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226EDCFD3E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3F86E82C;
	Tue,  8 Oct 2019 15:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E79D6E82C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:11:49 +0000 (UTC)
Date: Tue, 08 Oct 2019 15:11:39 +0000
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
Message-ID: <v6alE7r1055E0bjQLf4OZU6BUkfL_xfCKvow6LcJEv_PNJnULXbMgN6HdyDw0IzIa9FI9TjgNM2_iBP7xMGD1O30cOZZdzbSwXtuuio3nNw=@emersion.fr>
In-Reply-To: <CAKMK7uG49xQ75MovfKHksq1WLiXj3SHYSjFHAUqg3SDPmrxvvA@mail.gmail.com>
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
 <20190929061549.GA28809@jamwan02-TSP300>
 <3q-AW_DkhdIpH9Ip7_2kdcVNHwdKnhIH4k2PjfN-80KlJ0Qe3jIVH6CxMSQc-niJGdLyzzKsUcXjUyu1z9fTjHwg5-eWvOWbhnblUurueKo=@emersion.fr>
 <20190930100707.178723d1@eldfell.localdomain>
 <20191008095904.GL16989@phenom.ffwll.local>
 <20191008143936.6f49b098@eldfell.localdomain>
 <CAKMK7uG49xQ75MovfKHksq1WLiXj3SHYSjFHAUqg3SDPmrxvvA@mail.gmail.com>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1570547507;
 bh=dUHYc6iJTgMLyTGjVUSDnT/fhkI0o1+JZ8bSkw7hksQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=HPdom3t6NNqz/KFM6RKwJEVkSN1sbn1MuxG8TZBs5XCXGqrvbIEpk36nRC5c/frgV
 fAXtfW7Ujr9fOuybjzzOu+V/Xv5ISZ1zTDIhHjCQ1YFDgYNNuxq0/MDF1Lk3Hz0arW
 NXyGE+kmxPuW9VOwIWihwt/aAlAmSklgVyX5LH3o=
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: nd <nd@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgT2N0b2JlciA4LCAyMDE5IDY6MDMgUE0sIERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4gd3JvdGU6Cgo+ID4gPiA+ID4gSW4gYW55IGNhc2UsIHRoaXMgZG9lc24ndCBj
aGFuZ2UgdGhlIHBhdGNoIGl0c2VsZi4gUHJvYmFibHkgc29tZXRoaW5nIHdvcnRoCj4gPiA+ID4g
PiBtZW50aW9ubmluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gPiA+ID4KPiA+ID4gPiBZZXMs
IHJlY29yZGluZyB0aGVzZSB1c2UgY2FzZXMgd291bGQgYmUgdmVyeSBuaWNlLgo+ID4gPgo+ID4g
PiBUaGVyZSdzIGEgbG90IG1vcmUgaHcgdGhhdCBkb2VzIHRoZSBzYW1lIHRyaWNrcyAocXVhbGNv
bSBpcyBvbmUgZm9yIHN1cmUpLgo+ID4gPiBJbW8gYmVmb3JlIHdlIGVuY29kZSB0aGlzIHdlIHNo
b3VsZCBtYWtlIHN1cmUgdGhhdDoKPiA+ID4gYSkgZXZlcnlvbmUgaXMgaGFwcHkgd2l0aCB0aGlz
IG5ldyB1YXBpCj4gPgo+ID4gU29ycnksIHdoYXQgbmV3IFVBUEk/Cj4gPiBXZSdyZSBqdXN0IHRy
eWluZyB0byBtYWtlIHRoZSBkb2N1bWVudGF0aW9uIG1hdGNoIHdoYXQgY3VycmVudGx5Cj4gPiBo
YXBwZW5zLCByaWdodD8KPgo+IEl0J3Mgc28gbXVjaCBuZXcgdWFwaSB0aGF0IEkndmUgc2VudCBv
dXQgYSBmZXcgcmV2ZXJ0cyBmb3IgNS40IChpdAo+IGxhbmRlZCBpbiB0aGF0IG1lcmdlIHdpbmRv
dykgdG8gdW5kbyB0aGUgc3R1ZmYgdGhlIGFybSBkcml2ZXIgdGVhbSBoYXMKPiBkb25lIChpdCBk
aWRuJ3QgY29tZSB3aXRoIHVzZXJzcGFjZSwgcHJvcGVyIGRpc2N1c3Npb24gb24gZHJpLWRldmVs
LAo+IGRvY3Mgb3IgdGVzdGNhc2VzIGluIGlndCkuIEkgYWxzbyBqdXN0IHNwb3R0ZWQgdGhhdCBh
IGxlZnRvdmVyIGlzIHRoYXQKPiBhcm0va29tZWRhIHN0aWxsIGNvbXB1dGVzIGl0cyBvd24gdmVy
c2lvbiBvZiBub3JtYWxpemVkX3pwb3MsIHdoaWNoCj4gcHJvYmFibHkgc2hvdWxkIGJlIGRpdGNo
ZWQgdG9vIChpdCdzIG5vdCBhY3R1YWxseSBkaWZmZXJlbnQgZnJvbSB0aGUKPiBvbmUgaW4gaGVs
cGVycyB3aXRob3V0IHRoZSByZXZlcnRlZCB1YXBpKS4KPgo+IFNvIHllYWgsIHNlcGFyYXRlIHBh
dGNoIDotKQoKSSBkb24ndCBnZXQgaXQuIERvIHlvdSB3YW50IHRvIHNwbGl0IHRoZSBkb2NzIGNo
YW5nZXMgZm9yIHVzZXItc3BhY2UsCm9ubHkga2VlcGluZyB0aGUgZG9jIGNoYW5nZXMgZm9yIGRy
aXZlcnMgaW4gdGhpcyBwYXRjaD8KClVzZXItc3BhY2UgY291bGQgYWxyZWFkeSBzZWUgZHVwbGlj
YXRlIHpwb3MgYmVjYXVzZSBvZiB0aGUgbm9uLWF0b21pYwpBUEkuIEkgZG9uJ3QgdGhpbmsgdGhp
cyBpbnRyb2R1Y2VzIGEgbmV3IHVBUEkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
