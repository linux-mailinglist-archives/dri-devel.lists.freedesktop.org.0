Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2672EB5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FA56E530;
	Wed, 24 Jul 2019 12:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20846E49C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:31:00 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k20so87771815ios.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AaokkSIB8T6rCvGVztgZrAXJru2rWZPyc4+sjVG3Rlg=;
 b=IRG3+xQXGtba7JNMj/yUVtZ/W6E4nIu58v64hCI0gh2BC5YsdcwD4eYxgU6C/x87Fq
 pH4KDGUOTS+fIBjjpJLKtXB/CboPcNagqUU0rSsXWAOlEl1s9HCKm4hw3CIi3eJkA0F/
 /5YAFl6z4YDP317/JUNCWAOEB4vFqvV+nolg2/Zrajn0+eipfGmSPXMKc9SCG+GB7gR0
 GJqorJAOhAscmhGvzRhE98DEC+ZgipeWx+aitUCFF0TJYLPP2i2/aUu7Gm0hRcGV/iUb
 25Tu2ZkE6JGdx9G1d8b2Cjzu7+aFDsFjFgdGymkY5e6cd+JUcHEd2626Mw9PHEu6fWtw
 bXtQ==
X-Gm-Message-State: APjAAAUIbh1VGc1yk4aJzJHmOxZCnW3ZiGplZo/HzDmmxuJckPxDCj6N
 j054zcxZ99LYl2GkBFIPxxxNzJdFbNt7WnfGMh626g==
X-Google-Smtp-Source: APXvYqxSlDUBj64fQa2XUD/GFRZKvTb+/OT1nJmyxCu9j1MOu5lLRDAbNSt995Cq9Nvar/xA7x1tOCdXOH7MllC/CCs=
X-Received: by 2002:a6b:b556:: with SMTP id e83mr73258880iof.94.1563957059834; 
 Wed, 24 Jul 2019 01:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000001a51c4058ddcb1b6@google.com>
 <CACT4Y+ZGwKP+f4esJdx60AywO9b3Y5Bxb4zLtH6EEkaHpP6Zag@mail.gmail.com>
 <5d37433a832d_3aba2ae4f6ec05bc3a@john-XPS-13-9370.notmuch>
In-Reply-To: <5d37433a832d_3aba2ae4f6ec05bc3a@john-XPS-13-9370.notmuch>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 24 Jul 2019 10:30:48 +0200
Message-ID: <CACT4Y+ZbPmRB9T9ZzhE79VnKKD3+ieHeLpaDGRkcQ72nADKH_g@mail.gmail.com>
Subject: Re: kernel panic: stack is corrupted in pointer
To: John Fastabend <john.fastabend@gmail.com>
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AaokkSIB8T6rCvGVztgZrAXJru2rWZPyc4+sjVG3Rlg=;
 b=K3qMn/OeMIMWIjZ9ESuP3Mbr2IoaW+ya8WAVIZo7hVgWKsF0wYm4Zs/WY23VkHpiHz
 MSQiPrS0LExa2cu+qH0917BNNinG4hma4fEuEj+kdN5TQinrpXignDNCLsQpJmuweYbh
 6IjgBg1BHpDTKB+LYWKwCgHAUjwP1nkunkhPmtgtsZJILj1FNJZwZ4Xs63kGZRh+oba1
 xuteJ2KnBlW2GP2ukGM6O2WFyOVJpQTI+hdTREb3XE4i6W44X/jKWY0Om1te6XcY7d0b
 abTSzaWlVNvcp2hucBZx303o5SzyTNvW3qNcMo/BN4bTdm32VK9nUm2gLD3cp6/0DWM9
 iwOA==
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
Cc: Marco Elver <elver@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Alexei Starovoitov <ast@kernel.org>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, DRI <dri-devel@lists.freedesktop.org>,
 netdev <netdev@vger.kernel.org>, alexander.deucher@amd.com,
 syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>,
 leo.liu@amd.com, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgNzoyNiBQTSBKb2huIEZhc3RhYmVuZCA8am9obi5mYXN0
YWJlbmRAZ21haWwuY29tPiB3cm90ZToKPgo+IERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4gPiBPbiBX
ZWQsIEp1bCAxNywgMjAxOSBhdCAxMDo1OCBBTSBzeXpib3QKPiA+IDxzeXpib3QrNzlmNWYwMjgw
MDVhNzdlY2I2YmJAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEhlbGxvLAo+ID4gPgo+ID4gPiBzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBjcmFzaCBvbjoK
PiA+ID4KPiA+ID4gSEVBRCBjb21taXQ6ICAgIDE0MzhjZGU3IEFkZCBsaW51eC1uZXh0IHNwZWNp
ZmljIGZpbGVzIGZvciAyMDE5MDcxNgo+ID4gPiBnaXQgdHJlZTogICAgICAgbGludXgtbmV4dAo+
ID4gPiBjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cu
dHh0P3g9MTM5ODgwNTg2MDAwMDAKPiA+ID4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PTM0MzBhMTUxZTE0NTIzMzEKPiA+ID4gZGFzaGJv
YXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD03OWY1ZjAy
ODAwNWE3N2VjYjZiYgo+ID4gPiBjb21waWxlcjogICAgICAgZ2NjIChHQ0MpIDkuMC4wIDIwMTgx
MjMxIChleHBlcmltZW50YWwpCj4gPiA+IHN5eiByZXBybzogICAgICBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS94L3JlcHJvLnN5ej94PTExMWZjOGFmYTAwMDAwCj4gPgo+ID4gRnJvbSB0
aGUgcmVwcm8gaXQgbG9va3MgbGlrZSB0aGUgc2FtZSBicGYgc3RhY2sgb3ZlcmZsb3cgYnVnLiAr
Sm9obgo+ID4gV2UgbmVlZCB0byBkdXAgdGhlbSBvbnRvIHNvbWUgY2Fub25pY2FsIHJlcG9ydCBm
b3IgdGhpcyBidWcsIG9yIHRoaXMKPiA+IGJlY29tZXMgdW5tYW5hZ2VhYmxlLgo+Cj4gRml4ZXMg
aW4gYnBmIHRyZWUgc2hvdWxkIGZpeCB0aGlzLiBIb3BlZnVsbHksIHdlIHdpbGwgc3F1YXNoIHRo
aXMgb25jZSBmaXhlcwo+IHBlcmNvbGF0ZSB1cC4KPgo+ICNzeXogdGVzdDogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2JwZi9icGYuZ2l0CgpDb29sISBXaGF0
IGlzIHRoZSBmaXg/CldlIGRvbid0IG5lZWQgdG8gd2FpdCBmb3IgdGhlIGZpeCB0byBwZXJjb2xh
dGUgdXAgKGFuZCB0aGVuIGRvd24KdG9vISkuIHN5emJvdCBncmFjZWZ1bGx5IGhhbmRsZXMgd2hl
biBhIHBhdGNoIGlzIG5vdCB5ZXQgcHJlc2VudApldmVyeXdoZXJlIChpdCBoYXBwZW5zIGFsbCB0
aGUgdGltZSkuCgpCdHcsIHRoaXMgd2FzIGR1ZSB0byBhIHN0YWNrIG92ZXJmbG93LCByaWdodD8g
T3Igc29tZXRoaW5nIGVsc2U/CldlIGFyZSB0cnlpbmcgdG8gbWFrZSBLQVNBTiBjb25maWd1cmF0
aW9uIGRldGVjdCBzdGFjayBvdmVyZmxvd3MgdG9vLApzbyB0aGF0IGl0IGRvZXMgbm90IGNhdXNl
IGhhdm9jIG5leHQgdGltZS4gQnV0IGl0IHR1cm5zIG91dCB0byBiZQpub24tdHJpdmlhbCBhbmQg
b3VyIGN1cnJlbnQgYXR0ZW1wdCBzZWVtcyB0byBmYWlsOgpodHRwczovL2dyb3Vwcy5nb29nbGUu
Y29tL2ZvcnVtLyMhdG9waWMva2FzYW4tZGV2L0loWXY3UVloTGZZCgoKPiA+ICNzeXogZHVwOiBr
ZXJuZWwgcGFuaWM6IGNvcnJ1cHRlZCBzdGFjayBlbmQgaW4gZHB1dAo+ID4KPiA+ID4gVGhlIGJ1
ZyB3YXMgYmlzZWN0ZWQgdG86Cj4gPiA+Cj4gPiA+IGNvbW1pdCA5NmE1ZDhkNDkxNWYzZTI0MWVi
YjQ4ZDVkZWNkZDExMGFiOWM3ZGNmCj4gPiA+IEF1dGhvcjogTGVvIExpdSA8bGVvLmxpdUBhbWQu
Y29tPgo+ID4gPiBEYXRlOiAgIEZyaSBKdWwgMTMgMTU6MjY6MjggMjAxOCArMDAwMAo+ID4gPgo+
ID4gPiAgICAgIGRybS9hbWRncHU6IE1ha2Ugc3VyZSBJQiB0ZXN0cyBmbHVzaGVkIGFmdGVyIElQ
IHJlc3VtZQo+ID4gPgo+ID4gPiBiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBw
c3BvdC5jb20veC9iaXNlY3QudHh0P3g9MTRhNDYyMDA2MDAwMDAKPiA+ID4gZmluYWwgY3Jhc2g6
ICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTE2YTQ2MjAw
NjAwMDAwCj4gPiA+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS94L2xvZy50eHQ/eD0xMmE0NjIwMDYwMDAwMAo+ID4gPgo+ID4gPiBJTVBPUlRBTlQ6IGlmIHlv
dSBmaXggdGhlIGJ1ZywgcGxlYXNlIGFkZCB0aGUgZm9sbG93aW5nIHRhZyB0byB0aGUgY29tbWl0
Ogo+ID4gPiBSZXBvcnRlZC1ieTogc3l6Ym90Kzc5ZjVmMDI4MDA1YTc3ZWNiNmJiQHN5emthbGxl
ci5hcHBzcG90bWFpbC5jb20KPiA+ID4gRml4ZXM6IDk2YTVkOGQ0OTE1ZiAoImRybS9hbWRncHU6
IE1ha2Ugc3VyZSBJQiB0ZXN0cyBmbHVzaGVkIGFmdGVyIElQCj4gPiA+IHJlc3VtZSIpCj4gPiA+
Cj4gPiA+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBzdGFjay1wcm90ZWN0b3I6IEtlcm5l
bCBzdGFjayBpcyBjb3JydXB0ZWQgaW46Cj4gPiA+IHBvaW50ZXIrMHg3MDIvMHg3NTAgbGliL3Zz
cHJpbnRmLmM6MjE4Nwo+ID4gPiBTaHV0dGluZyBkb3duIGNwdXMgd2l0aCBOTUkKPiA+ID4gS2Vy
bmVsIE9mZnNldDogZGlzYWJsZWQKPiA+ID4KPiA+ID4KPiA+ID4gLS0tCj4gPiA+IFRoaXMgYnVn
IGlzIGdlbmVyYXRlZCBieSBhIGJvdC4gSXQgbWF5IGNvbnRhaW4gZXJyb3JzLgo+ID4gPiBTZWUg
aHR0cHM6Ly9nb28uZ2wvdHBzbUVKIGZvciBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHN5emJvdC4K
PiA+ID4gc3l6Ym90IGVuZ2luZWVycyBjYW4gYmUgcmVhY2hlZCBhdCBzeXprYWxsZXJAZ29vZ2xl
Z3JvdXBzLmNvbS4KPiA+ID4KPiA+ID4gc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGJ1
ZyByZXBvcnQuIFNlZToKPiA+ID4gaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3N0YXR1cyBmb3IgaG93
IHRvIGNvbW11bmljYXRlIHdpdGggc3l6Ym90Lgo+ID4gPiBGb3IgaW5mb3JtYXRpb24gYWJvdXQg
YmlzZWN0aW9uIHByb2Nlc3Mgc2VlOiBodHRwczovL2dvby5nbC90cHNtRUojYmlzZWN0aW9uCj4g
PiA+IHN5emJvdCBjYW4gdGVzdCBwYXRjaGVzIGZvciB0aGlzIGJ1ZywgZm9yIGRldGFpbHMgc2Vl
Ogo+ID4gPiBodHRwczovL2dvby5nbC90cHNtRUojdGVzdGluZy1wYXRjaGVzCj4KPgo+IC0tCj4g
WW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0
aGUgR29vZ2xlIEdyb3VwcyAic3l6a2FsbGVyLWJ1Z3MiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJl
IGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQg
YW4gZW1haWwgdG8gc3l6a2FsbGVyLWJ1Z3MrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4K
PiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBz
Lmdvb2dsZS5jb20vZC9tc2dpZC9zeXprYWxsZXItYnVncy81ZDM3NDMzYTgzMmRfM2FiYTJhZTRm
NmVjMDViYzNhJTQwam9obi1YUFMtMTMtOTM3MC5ub3RtdWNoLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
