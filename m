Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD114C193
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 21:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A356E459;
	Wed, 19 Jun 2019 19:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8C06E459
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 19:36:18 +0000 (UTC)
Date: Wed, 19 Jun 2019 19:36:12 +0000
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Subject: KMS documentation for userspace
Message-ID: <13b7wY-2xuVr-7VBZKIUaV5hr_T03akw4sBL_zlsLRxksg5UZGpAYRKSq8_VmBRAvODmSISqGda2YU332G9O9IaJluDJFsc6R8uWkQeQT1o=@emersion.fr>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emersion.fr; s=protonmail; t=1560972975;
 bh=aT0pnSnrITNezU7RLijPKfBGnltqmViVSMkcFZCN/z8=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=rXeHTlkwOYwIk0I9MeM1IXUS5CEOBRWADgiMtwReXpl3nyZjMk/sHdO7zoPPgS6PQ
 OmqZwOSqQ9tQi3AYCHs8fi5c9gY5t7eF3epl9QLxdeDLe/2a+/FdRFJcf/u/g6kg1Q
 zveyyAKRzrJqoj41n+hjVvVq3/8WoZY3+4/G+mmE=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKV2l0aCBXYXlsYW5kIGNvbXBvc2l0b3JzIGFuZCBEUk0gbGVhc2VzLCB0aGUgbnVt
YmVyIG9mIERSTSB1c2Vyc3BhY2UKcHJvZ3JhbXMgaGFzIGluY3JlYXNlZCAoYW5kIHdpbGwgcHJv
YmFibHkgY29udGludWUgdG8gaW5jcmVhc2UpLgpIb3dldmVyIGl0J3MgYmVlbiBwcmV0dHkgaGFy
ZCB0byBmaW5kIGdvb2QgRFJNIGRvY3MgZm9yIHVzZXJzcGFjZS4KClRoZSByZXNvdXJjZXMgY3Vy
cmVudGx5IGF2YWlsYWJsZSBhcmU6CgotIFRoZSBrZXJuZWwgZG9jcywgYWx0aG91Z2ggb25seSB0
aGUgaGlnaCBsZXZlbCBvdmVydmlldyBpcyB1c2VmdWwgdG8KICB1c2Vyc3BhY2UuCi0gVXNlci1j
b250cmlidXRlZCB0dXRvcmlhbHMsIGxpa2UgWzFdIGFuZCBbMl0uCi0gVG8gaGVscCB1c2Vyc3Bh
Y2UgdW5kZXJzdGFuZCBoYXJkd2FyZSBjYXBhYmlsaXRpZXMgYW5kIGxpbWl0YXRpb25zLAogIEkn
dmUgcmVjZW50bHkgc3RhcnRlZCBhIERSTSBkYXRhYmFzZSBkdW1wIHByb2plY3QgWzNdLgoKKEFu
eXRoaW5nIGVsc2UgSSd2ZSBtaXNzZWQ/KQoKV2Ugc3RpbGwgbGFjayBkb2NzIHRoYXQgZGVzY3Jp
YmUgaG93IHRvIHByb3Blcmx5IHVzZSB0aGUgS01TIEFQSSBhbmQKdGhlIEtNUyBwcm9wZXJ0aWVz
LiBUaGVyZSBpcyBhIGRlcHJlY2F0ZWQgbGlzdCBhdCBbNF0sIGFuZCBhbm90aGVyIGxpc3QKbWl4
ZWQgd2l0aCBrZXJuZWwgc3RydWN0cyBhdCBbNV0uIFRoaXMgaXMgbm90IGdyZWF0IGZvciB1c2Vy
c3BhY2UKZGV2ZWxvcGVycy4KClNvIEkgd2FudGVkIHRvIGtub3cgaWYgdGhlcmUncyBpbnRlcmVz
dCBmcm9tIHRoZSBrZXJuZWwgY29tbXVuaXR5IHRvCm1haW50YWluIGRvY3VtZW50YXRpb24gZm9y
IHVzZXJzcGFjZT8gT3Igc2hvdWxkIHVzZXJzcGFjZSBtYWludGFpbiBpdHMKb3duIGRvY3Mgb2Yg
dGhlIGtlcm5lbCBBUEk/CgpJIGRvbid0IGtub3cgd2hhdCB3b3VsZCBiZSB0aGUgYmVzdCBwbGFj
ZSBmb3IgdGhlc2UgZG9jcy4gSWYgdGhleSBsaXZlCmluIGtlcm5lbCBkb2MgY29tbWVudHMsIHRo
ZW4gcmVmZXJlbmNlcyB0byBrZXJuZWwgZnVuY3Rpb25zIGFuZApndWlkZWxpbmVzIGZvciBrZXJu
ZWwgZGV2cyB3aWxsIGFwcGVhciAoanVzdCBsaWtlIGluIHRoZSBjdXJyZW50IGRvY3MpLgpJZiB0
aGV5IGxpdmUgb3V0c2lkZSBvZiB0aGUga2VybmVsIHNvdXJjZSBjb2RlIG9yIG91dHNpZGUgb2Yg
dGhlIGtlcm5lbAp0cmVlLCB0aGV5IG1pZ2h0IGdldCBvdXRkYXRlZC4KClRob3VnaHRzPwoKVGhh
bmtzLAoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vYXNjZW50MTIvZHJtX2RvYwpbMl06IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kYW5pZWxzL2ttcy1xdWFkcwpbM106IGh0dHBzOi8v
ZHJtZGIuZW1lcnNpb24uZnIvCls0XTogaHR0cHM6Ly8wMS5vcmcvbGludXhncmFwaGljcy9nZngt
ZG9jcy9kcm0vZ3B1L2RybS1rbXMuaHRtbCNzdGFuZGFyZC1jb25uZWN0b3ItcHJvcGVydGllcwpb
NV06IGh0dHBzOi8vMDEub3JnL2xpbnV4Z3JhcGhpY3MvZ2Z4LWRvY3MvZHJtL2dwdS9kcm0ta21z
Lmh0bWwjZXhpc3Rpbmcta21zLXByb3BlcnRpZXMKCi0tClNpbW9uIFNlcgpodHRwczovL2VtZXJz
aW9uLmZyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
