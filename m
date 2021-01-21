Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528382FFE84
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C526E9BB;
	Fri, 22 Jan 2021 08:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1195 seconds by postgrey-1.36 at gabe;
 Thu, 21 Jan 2021 10:20:19 UTC
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAC889654
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 10:20:19 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DLyYw37yGz9v6LH;
 Thu, 21 Jan 2021 11:00:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gZx8YCs2vO5j; Thu, 21 Jan 2021 11:00:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DLyYw1bykz9v6L8;
 Thu, 21 Jan 2021 11:00:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 644DE8B7FC;
 Thu, 21 Jan 2021 11:00:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GUfPkvtK1UQx; Thu, 21 Jan 2021 11:00:21 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51AC08B771;
 Thu, 21 Jan 2021 11:00:20 +0100 (CET)
Subject: Re: [PATCH 02/13] module: add a module_loaded helper
To: Christoph Hellwig <hch@lst.de>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-3-hch@lst.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <844a7fc3-2cba-46d2-fd4e-e5fe16b08573@csgroup.eu>
Date: Thu, 21 Jan 2021 11:00:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121074959.313333-3-hch@lst.de>
Content-Language: fr
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoKTGUgMjEvMDEvMjAyMSDDoCAwODo0OSwgQ2hyaXN0b3BoIEhlbGx3aWcgYSDDqWNyaXQgOgog
PiBBZGQgYSBoZWxwZXIgdGhhdCB0YWtlcyBtb2R1bGVzX211dGV4IGFuZCB1c2VzIGZpbmRfbW9k
dWxlIHRvIGNoZWNrIGlmIGEKID4gZ2l2ZW4gbW9kdWxlIGlzIGxvYWRlZC4gIFRoaXMgcHJvdmlk
ZXMgYSBiZXR0ZXIgYWJzdHJhY3Rpb24gZm9yIHRoZSB0d28KID4gY2FsbGVycywgYW5kIGFsbG93
cyB0byB1bmV4cG9ydCBtb2R1bGVzX211dGV4IGFuZCBmaW5kX21vZHVsZS4KID4KID4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CiA+IC0tLQogPiAgIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCAgNyArLS0tLS0tCiA+ICAgaW5jbHVkZS9saW51
eC9tb2R1bGUuaCAgICAgICAgICB8ICAzICsrKwogPiAgIGtlcm5lbC9tb2R1bGUuYyAgICAgICAg
ICAgICAgICAgfCAxNCArKysrKysrKysrKystLQogPiAgIGtlcm5lbC90cmFjZS90cmFjZV9rcHJv
YmUuYyAgICAgfCAgNCArLS0tCiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKID4KCiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21vZHVs
ZS5oIGIvaW5jbHVkZS9saW51eC9tb2R1bGUuaAogPiBpbmRleCA3YTBiY2I1YjFmZmNjZC4uYjQ2
NTRmOGE0MDgxMzQgMTAwNjQ0CiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbW9kdWxlLmgKID4gKysr
IGIvaW5jbHVkZS9saW51eC9tb2R1bGUuaAogPiBAQCAtNTg5LDYgKzU4OSw5IEBAIHN0YXRpYyBp
bmxpbmUgYm9vbCB3aXRoaW5fbW9kdWxlKHVuc2lnbmVkIGxvbmcgYWRkciwgY29uc3Qgc3RydWN0
IG1vZHVsZSAqbW9kKQogPiAgIC8qIFNlYXJjaCBmb3IgbW9kdWxlIGJ5IG5hbWU6IG11c3QgaG9s
ZCBtb2R1bGVfbXV0ZXguICovCiA+ICAgc3RydWN0IG1vZHVsZSAqZmluZF9tb2R1bGUoY29uc3Qg
Y2hhciAqbmFtZSk7CiA+ICAgKy8qIENoZWNrIGlmIGEgbW9kdWxlIGlzIGxvYWRlZC4gKi8KID4g
K2Jvb2wgbW9kdWxlX2xvYWRlZChjb25zdCBjaGFyICpuYW1lKTsKCk1heWJlIG1vZHVsZV9pc19s
b2FkZWQoKSB3b3VsZCBiZSBhIGJldHRlciBuYW1lLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
