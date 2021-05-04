Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D13734D7
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 08:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245406E426;
	Wed,  5 May 2021 06:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490906E314;
 Tue,  4 May 2021 23:07:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 3080C1F429CE
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kenneth Graunke <kenneth@whitecape.org>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Subject: Enabling sample_c optimization for Broadwell GPUs
Message-ID: <e99599bf-f503-3227-8361-afcd3d2a098f@collabora.com>
Date: Tue, 4 May 2021 20:07:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 05 May 2021 06:08:04 +0000
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgdGhlcmUsCgpXaGlsZSBicm93c2luZyBhbiBvbGQgZG93bnN0cmVhbSBrZXJuZWwsIEkgZm91
bmQgYSBwYXRjaFswXSB0aGF0IGVuYWJsZXMgCnNhbXBsZV9jIG9wdGltaXphdGlvbnMgYXQgQnJv
YWR3ZWxsIEdQVXMuIFRoZSBtZXNzYWdlIGZyb20gdGhlIHVwc3RyZWFtIApjb21taXQgdGhhdCBl
bmFibGVzIGl0IGZvciBIYXN3ZWxsWzFdIChhbmQgcHJlc3VtYWJseSB3aGVyZSB0aGUgY29kZSAK
YXRbMF0gd2FzIGNvcGllZCBmcm9tKSBzdGF0ZXMgdGhhdCAiWy4uXSBsYXRlciBwbGF0Zm9ybXMg
cmVtb3ZlIHRoaXMgCmJpdCwgYW5kIGFwcGFyZW50bHkgYWx3YXlzIGVuYWJsZSB0aGUgb3B0aW1p
emF0aW9uIi4KCkNvdWxkIHlvdSBjb25maXJtIHRoYXQgQnJvYWR3ZWxsIGFuZCBmb2xsb3dpbmcg
YXJjaGl0ZWN0dXJlcyBlbmFibGUgdGhpcyAKb3B0aW1pemF0aW9uIGJ5IGRlZmF1bHQgKGFuZCB0
aHVzLCBwYXRjaFswXSBpcyBhIG5vLW9wKSwgb3Igc2hvdWxkIEkgCnVwc3RyZWFtIGl0PwoKVGhh
bmtzLAoJQW5kcsOpCgpbMF0gCmh0dHBzOi8vZ2l0aHViLmNvbS9WYWx2ZVNvZnR3YXJlL3N0ZWFt
b3Nfa2VybmVsL2NvbW1pdC8xOTg5OTBmMTNlMWQ5NDI5ODY0YzE3N2Q5NDQxYTY1NTk3NzFjNWUy
CgpbMV0gCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTk0NDExNTkzNDQzNmIxZmY2Y2Y3NzNhOWU5MTIz
ODU4ZWE5ZWYzZGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
