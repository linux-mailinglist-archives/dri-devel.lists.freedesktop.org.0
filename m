Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A1AD830D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 23:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DC06E895;
	Tue, 15 Oct 2019 21:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCA76E895
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 21:51:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB5C9324;
 Tue, 15 Oct 2019 23:51:19 +0200 (CEST)
Date: Wed, 16 Oct 2019 00:51:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [GIT PULL FOR v5.5] R-Car DU changes
Message-ID: <20191015215116.GF19403@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1571176279;
 bh=Ef6KXme7VjYK6BcsiRDl4E4EQ8Ersvt2m7L3j+DugXA=;
 h=Date:From:To:Cc:Subject:From;
 b=BkJdmZNBOTO0SG7Ugc38o516AotVuybJkIlzaO3ZQZ5inDAMd+wKoOMzPZnjFaatv
 kWome5zJSZ7dX6cKeExd1kpzIbGtqxCiWe8BjPjgm3v7tDWYlyuT3suCoEsTtk0Hzd
 cCvG0BHmwQxorxmuTodFzIYHeaUEe2qgKxZcu+yA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgN2VkMDkzNjAyZTBl
MWI2MGEwZmMwNzRhOTY5MjY4N2U3ZDJiNzIzZDoKCiAgTWVyZ2UgdGFnICdkcm0tbWlzYy1uZXh0
LTIwMTktMTAtMDktMicgb2YgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1t
aXNjIGludG8gZHJtLW5leHQgKDIwMTktMTAtMTEgMDk6MzA6NTMgKzEwMDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vbGludXh0di5vcmcvcGluY2hh
cnRsL21lZGlhLmdpdCB0YWdzL2R1LW5leHQtMjAxOTEwMTYKCmZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byBmM2EzNmQ0Njk2MjFlNTJhMDQzOTI4MjBmYTk2YmM0ZjJhOWQyOWU3OgoKICBk
dC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhczogQWRkIHI4YTc3NGIxIHN1cHBvcnQgKDIwMTkt
MTAtMTYgMDA6Mjg6MzIgKzAzMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gUi1DYXIgRFUgc3VwcG9ydCBmb3IgUjhB
Nzc0QjEgU29DCi0gUi1DYXIgRFUgZml4ZXMgZm9yIEgyIEVTMi4wIGFuZCBsYXRlciByZXZpc2lv
bnMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KQmlqdSBEYXMgKDUpOgogICAgICBkdC1iaW5kaW5nczogZGlzcGxheTogcmVu
ZXNhczogZHU6IERvY3VtZW50IHRoZSByOGE3NzRiMSBiaW5kaW5ncwogICAgICBkcm06IHJjYXIt
ZHU6IEFkZCBSOEE3NzRCMSBzdXBwb3J0CiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5l
c2FzOiBsdmRzOiBEb2N1bWVudCByOGE3NzRiMSBiaW5kaW5ncwogICAgICBkcm06IHJjYXItZHU6
IGx2ZHM6IEFkZCByOGE3NzRiMSBzdXBwb3J0CiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBy
ZW5lc2FzOiBBZGQgcjhhNzc0YjEgc3VwcG9ydAoKR2VlcnQgVXl0dGVyaG9ldmVuICgxKToKICAg
ICAgZHJtOiByY2FyX2x2ZHM6IEZpeCBjb2xvciBtaXNtYXRjaGVzIG9uIFItQ2FyIEgyIEVTMi4w
IGFuZCBsYXRlcgoKSmFjb3BvIE1vbmRpICgxKToKICAgICAgZHJtOiByY2FyLWR1OiBrbXM6IEV4
cGFuZCBjb21tZW50IGluIHZzcHMgcGFyc2luZyByb3V0aW5lCgogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL3JlbmVzYXMsZHctaGRtaS50eHQgICAgfCAgMSArCiAuLi4vYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCAgICAgICB8ICAxICsKIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQgICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgICAgICAgICAgICAgIHwgMzAgKysrKysrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyAgICAgICAg
ICAgICAgfCAgNiArKysrLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgICAg
ICAgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwg
NjEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
