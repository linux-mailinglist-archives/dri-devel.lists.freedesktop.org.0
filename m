Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A997CDA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 16:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C866E432;
	Wed, 21 Aug 2019 14:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07966E432
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:26:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95746AE3F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 14:26:33 +0000 (UTC)
Date: Wed, 21 Aug 2019 16:26:32 +0200
From: Stefan Dirsch <sndirsch@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: Weird behaviour (GLX extension missing) in X11 forwarding since
 xorg-server 1.20 ...
Message-ID: <20190821142632.GA3351@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

SGkKCkknbSB3b25kZXJpbmcsIHdoZXRoZXIgdGhpcyBoYXBwZW5zIHRvIGV2ZXJ5Ym9keSB1c2lu
ZyB4b3JnLXNlcnZlciAxLjIwCigxLjIwLjMgaW4gbXkgY2FzZSkuCgpXaGVuIHVzaW5nIFgxMSBm
b3J3YXJkaW5nIHZpYSBzc2gKCiAgc3NoIC1YIDxyZW1vdGVtYWNoaW5lPgoKKERJU1BMQVk9bG9j
YWxob3N0OjEwLjApCgp0aGUgbGlzdCBvZiBhdmFpbGFibGUgZXh0ZW5zaW9ucyB3aGVuIHJ1bm5p
bmcgeGRweWluZm8gaXMgbGltaXRlZCB0bwoKWy4uLl0KbnVtYmVyIG9mIGV4dGVuc2lvbnM6ICAg
IDIKICAgIEJJRy1SRVFVRVNUUwogICAgWEMtTUlTQwpkZWZhdWx0IHNjcmVlbiBudW1iZXI6ICAg
IDAKCldoZW4gcnVubmluZyB4ZHB5aW5mbyBsb2NhbCAoRElTUExBWT06MCkgaXQncyBjb21wbGV0
ZToKClsuLi5dCm51bWJlciBvZiBleHRlbnNpb25zOiAgICAyOQogICAgQklHLVJFUVVFU1RTCiAg
ICBDb21wb3NpdGUKICAgIERBTUFHRQogICAgRE9VQkxFLUJVRkZFUgogICAgRFBNUwogICAgRFJJ
MgogICAgRFJJMwogICAgR0xYCiAgICBHZW5lcmljIEV2ZW50IEV4dGVuc2lvbgogICAgTUlULVND
UkVFTi1TQVZFUgogICAgTUlULVNITQogICAgUHJlc2VudAogICAgUkFORFIKICAgIFJFQ09SRAog
ICAgUkVOREVSCiAgICBTRUNVUklUWQogICAgU0hBUEUKICAgIFNZTkMKICAgIFgtUmVzb3VyY2UK
ICAgIFhDLU1JU0MKICAgIFhGSVhFUwogICAgWEZyZWU4Ni1ER0EKICAgIFhGcmVlODYtVmlkTW9k
ZUV4dGVuc2lvbgogICAgWElORVJBTUEKICAgIFhJbnB1dEV4dGVuc2lvbgogICAgWEtFWUJPQVJE
CiAgICBYVEVTVAogICAgWFZpZGVvCiAgICBYVmlkZW8tTW90aW9uQ29tcGVuc2F0aW9uCmRlZmF1
bHQgc2NyZWVuIG51bWJlcjogICAgMApbLi4uXQoKVGhpcyBoYXBwZW5zIGV2ZW4gaWYgeW91IHNz
aCB0byB0aGUgc2FtZSBsb2NhbCBtYWNoaW5lLiBDYW4gYW55Ym9keSByZXByb2R1Y2UKdGhpcz8g
SXMgdGhpcyBhIGtub3duIGlzc3VlLiBTaW5jZSBub3cgR0xYIGV4dGVuc2lvbiBpcyBtaXNzaW5n
IEkgY2FuJ3QgcnVuCmFueSBHTCBhcHBsaWNhdGlvbiBhbnkgbG9uZ2VyIHZpYSBzc2ggLi4uCgpU
aGlzIHN0aWxsIHdvcmtzIHdpdGggeG9yZy1zZXJ2ZXIgMS4xOSBmb3IgbWUuCgpUaGFua3MsClN0
ZWZhbgoKUHVibGljIEtleSBhdmFpbGFibGUKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbiBEaXJzY2ggKFJlcy4gJiBEZXYuKSAgIFNV
U0UgTElOVVggR21iSApUZWw6IDA5MTEtNzQwIDUzIDAgICAgICAgICAgICBNYXhmZWxkc3RyYcOf
ZSA1CkZBWDogMDkxMS03NDAgNTMgNDc5ICAgICAgICAgIEQtOTA0MDkgTsO8cm5iZXJnCmh0dHA6
Ly93d3cuc3VzZS5kZSAgICAgICAgICAgIEdlcm1hbnkgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU1VTRSBMaW51eCBHbWJI
LCBHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgKSFJCIDIx
Mjg0IChBRyBOw7xybmJlcmcpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
