Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19563D6949
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 20:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03BC6E598;
	Mon, 14 Oct 2019 18:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8A96E598
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 18:16:13 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d1so17518503ljl.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 11:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AB5JQ/O7JG0ArAm5BxhmGB/H9BuQfrpgLr5qHh7r6bo=;
 b=bFUlV2HEx9YmJ4EvX4QrZw9RC5MgY5OClGK0Mt65HyEzRJNi42bEUJ7H8ZwKZqh82t
 qP84Ty9Qx3mYKfkQSbRP9lH205dTwhGujISby5Ms2VLrGMEC8zFNe8+TKqnhUXbmMrAZ
 jcbddkXZ614V16aMU5YnlOV7SzRwMisct8gSS0U262Wcj52EAmwaQBl+Z1HkxJjs3SVu
 vbaBJIRduSUtrO8lMCQU0ak6qg6MHToLdTRMrt7QmG7k0wdwu0rbJgcLgs0NWKYZq47+
 7zev/GXKKFpW2skDlCOPrB/tQmSQk08gd6buFZSGLiVmhs/cTe78mbcaC5Ak2QBL88Fz
 ufqw==
X-Gm-Message-State: APjAAAVnfHXqsmX1QK3TF8ke6PxNP4TR04ILBrxxgCaVmRSkK5RLh6WB
 USs4zLipHdDKuGmkitiHP0Zo+1RC+z497LvQIzAOXA==
X-Google-Smtp-Source: APXvYqzubD2q+lo+wiCpMfIWcjR+395MtvsvYrKtYkeIx63wti5yuf6LERcV7C1IHomrUIEwrisBayD+lNaiLbD/N44=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr11590406ljo.223.1571076971843; 
 Mon, 14 Oct 2019 11:16:11 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 15 Oct 2019 04:16:00 +1000
Message-ID: <CAPM=9txm6udXT9KtW=ROVMf2xRjd4sbPN9OPEQ--taP2vi-mmQ@mail.gmail.com>
Subject: [RFC] new uapi policy for drm
To: dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AB5JQ/O7JG0ArAm5BxhmGB/H9BuQfrpgLr5qHh7r6bo=;
 b=FcMcOdmkz7zXbtB4oqJb594stQqWnj6OB7zUq4cd1gZPkc/i7ws4d/i3VaPb4R/QyL
 dz8f4ndJBam4p5Jw35eBnWlaIsj7mqgKSrWkbOz28i0qYJgE3q/wDo8FEqHgCyWJ80PK
 4aLhRyjHZURgNfXt0LjchKZaezGFbXyWTn8MtU9JNSsCg/4YwgLwhDpqTwkf5h88SjEQ
 rTDpi6u8xl36+HgKZunsmo2N3voC3u7TvOUtgARbZxIqnewJcO2pKhY0wCOMGxS8NBnv
 SneGg5vqo+S0jh0bnJz0+Aczm7zylxdBIWg/q2ycF8dMMFlUVf6MB07wGzMhpqMcTcLv
 aryQ==
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

SSd2ZSBraWNrZWQgdGhpcyBhcm91bmQgaW4gbXkgaGVhZCBvdmVyIHRoZSBwYXN0IGZldyB3ZWVr
cyBidXQgd2FudGVkCnRvIGdldCBzb21lIGZlZWRiYWNrIG9uIHdoZXRoZXIgaXQncyBhIGdvb2Qg
aWRlYSBvciB3aGF0IGltcGFjdCBpdAptaWdodCBoYXZlIHRoYXQgSSBoYXZlbid0IGNvbnNpZGVy
ZWQuCgpXZSBhcmUgZ2V0dGluZyByZXF1ZXN0cyB2aWEgYm90aCBhbWRncHUvYW1ka2ZkIGFuZCBp
OTE1IGZvciBuZXcgdXNlcgpBUElzIGZvciB1c2Vyc3BhY2UgZHJpdmVycyB0aGF0IHRocm93IGNv
ZGUgb3ZlciB0aGUgd2FsbCBpbnN0ZWFkIG9mCmJlaW5nIG9wZW4gc291cmNlIGRldmVsb3BlZCBw
cm9qZWN0cywgYnV0IHdlIGFyZSBhbHNvIHNlZWluZyBpdCBmb3IKYW5kcm9pZCBkcml2ZXJzIGFu
ZCBrbXMgcHJvcGVydGllcywgYW5kIHdlIGhhZCB0aGF0IGk5MTUgY3JhcHB5IGNydGMKYmFja2dy
b3VuZCB0aGluZyB0aGF0IHdhcyBmb3IgQ2hyb21lIGJ1dCBDaHJvbWUgZGlkbid0IHdhbnQgaXQu
CgpOb3cgdGhpcyBwcmVzZW50cyBhIGNvdXBsZSBvZiBpc3N1ZXM6CgphKSB0aGVzZSBwcm9qZWN0
cyBkb24ndCBzZWVtIHRvIHRoYXQgZ29vZCBhdCBmb2xsb3dpbmcgb3VyIGRldmVsb3BtZW50Cmd1
aWRlbGluZXMsIGF2b2lkIGRldmVsb3BpbmcgdXNlcnNwYWNlIGZlYXR1cmVzIGluIHBhcmFsbGVs
IGluIHRoZQpvcGVuIGFuZCBoYXZpbmcgZ29vZCBkZXZlbG9wbWVudCBpbXBsZW1lbnRhdGlvbnMg
YmVmb3JlIHN1Ym1pdHRpbmcKdXBzdHJlYW0uCgpiKSB0aGVzZSBwcm9qZWN0cyBkb24ndCBoYXZl
IGV4cGVyaWVuY2VkIHVzZXJzcGFjZSBkZXZlbG9wZXJzCnJldmlld2luZyB0aGVpciBrZXJuZWwg
dWFwaXMuIE9uZSBiaWcgYWR2YW50YWdlIG9mIGFkZGluZyB1YXBpcyB3aXRoCm1lc2EgZGV2ZWxv
cGVycyBpcyB0aGV5IGhhdmUgYSBsb3Qgb2YgZXhwZXJpZW5jZSBpbiB0aGUgYXJlYSBhcyB3ZWxs
LgoKSXQncyBsZWFkaW5nIG1lIHRvIHRoaW5rIEkgd2FudCB0byBqdXN0IHN0b3AgYWxsIHVhcGkg
c3VibWlzc2lvbnMgdmlhCmRyaXZlciB0cmVlcywgYW5kIGluc3RlYWQgbWFuZGF0ZSB0aGF0IGFs
bCBkcml2ZXIgdWFwaSBjaGFuZ2VzIGFyZQpzZW50IGluIHNlcGFyYXRlIGdpdCBwdWxsIHJlcXVl
c3RzIHRvIGRyaS1kZXZlbCwgSSdkIHRyeSAod2l0aCBzb21lCmhlbHApIHRvIGNhdGNoIGFsbCB1
YXBpIG1vZGlmaWNhdGlvbnMgaW4gbm9ybWFsIHRyZWVzLCBhbmQgcmVmdXNlCnB1bGxzIHRoYXQg
bW9kaWZpZWQgdWFwaS4KCkF0IGxlYXN0IEknbSBjb25zaWRlcmVkIHdyaXRpbmcgdGhlIHNjcmlw
dCBhbmQgcmVmdXNpbmcgYW5kIHB1bGxzIHRoYXQKaGF2ZSBhIHVhcGkgY2hhbmdlIHRoYXQgZG9l
c24ndCBjb250YWluIGEgbGluayB0byB0aGUgdXNlcnNwYWNlCmNoYW5nZXMgcmVxdWlyZWQgZm9y
IGl0IGluIGEgcHVibGljIGRldmVsb3BlZCByZXBvLgoKVGhvdWdodHM/CgpEYXZlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
