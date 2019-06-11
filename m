Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F83C587
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A4489154;
	Tue, 11 Jun 2019 08:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF98D89154
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:04:36 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so18612862edr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 01:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=1VpP4BQl0scWmMIfvVrIwxl9EaLNPQUpAZnq/R1E08A=;
 b=Sm2Nl3PHAtgCPpMrBORAxPAZYgKDFKNpZEben31oFObYwUjG7GCpJOY77F/N8Tu/4P
 GD6q8wZzNH+fw37dAjqCveIgIG5n1Pel0NVOGFAutUHXYmn4XBiYJcJgncDnM8DRKDnX
 RyseH4a1HLCJktYHTB2DBXdq0wIiZt8FqCfL1MKfNXLACL8bNkRZbkhN5TL8wDyTr2bT
 7oZtjki1FSL5qfD3bVZL/bhgn3DOlyff14Xs6jtcMxuZ1jKm1ehVaoLvrWjvdiS55pqQ
 /gZ0eAmcWmQ3Oizc21Inw1xSTkycKKrTPB6AX/GKn9+z2j2hZFcut9cOw0i36zq3Nlfw
 XF8w==
X-Gm-Message-State: APjAAAXHBHquzzbpCvcwo0IW2smfHi5SoBL6NymFt3fgV2z5xEBnCrfZ
 kgaEsNaLfcRN+rStGScL44DC3A==
X-Google-Smtp-Source: APXvYqxTt4reyZxOwFM7gpLn44B2/syN7stLMXz/LTQgDQdiH76jkBmOlBKjhtvaB3E/mb8+p5bIJQ==
X-Received: by 2002:a17:906:ad86:: with SMTP id
 la6mr44226340ejb.43.1560240275503; 
 Tue, 11 Jun 2019 01:04:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y11sm3576596edj.96.2019.06.11.01.04.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 01:04:34 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:04:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: syzbot <syzbot+2ff1e7cb738fd3c41113@syzkaller.appspotmail.com>
Subject: Re: WARNING in bpf_jit_free
Message-ID: <20190611080431.GP21222@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+2ff1e7cb738fd3c41113@syzkaller.appspotmail.com>, 
 airlied@linux.ie, ast@kernel.org, bpf@vger.kernel.org,
 daniel@iogearbox.net, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, hawk@kernel.org,
 jakub.kicinski@netronome.com, john.fastabend@gmail.com,
 kafai@fb.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maxime.ripard@bootlin.com,
 netdev@vger.kernel.org, paul.kocialkowski@bootlin.com,
 songliubraving@fb.com, syzkaller-bugs@googlegroups.com,
 wens@csie.org, xdp-newbies@vger.kernel.org, yhs@fb.com
References: <000000000000e92d1805711f5552@google.com>
 <000000000000381684058ace28e5@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000381684058ace28e5@google.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=1VpP4BQl0scWmMIfvVrIwxl9EaLNPQUpAZnq/R1E08A=;
 b=ZIa8H2Jy5lWKWQz1TT7B/cBLsAJV/t0RUOsjzlAUmvjxv48OR/2G2Z3xwj89VqyCSC
 Y7NCdLF+j+Zb7j9MlTsh2N8qAd9mQSkTkGybODE0RYNXFT6BGqim8aTZFx8ccV9Ema2X
 VHizYVWLs+TJqJRySt+NsoMrmPz7kLRDwVbHA=
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
Cc: xdp-newbies@vger.kernel.org, songliubraving@fb.com,
 jakub.kicinski@netronome.com, hawk@kernel.org, daniel@iogearbox.net,
 syzkaller-bugs@googlegroups.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 dri-devel@lists.freedesktop.org, kafai@fb.com, paul.kocialkowski@bootlin.com,
 maxime.ripard@bootlin.com, wens@csie.org, netdev@vger.kernel.org, yhs@fb.com,
 bpf@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDQ6MjI6MDZBTSAtMDcwMCwgc3l6Ym90IHdyb3RlOgo+
IHN5emJvdCBoYXMgZm91bmQgYSByZXByb2R1Y2VyIGZvciB0aGUgZm9sbG93aW5nIGNyYXNoIG9u
Ogo+IAo+IEhFQUQgY29tbWl0OiAgICA3OWMzYmEzMiBNZXJnZSB0YWcgJ2RybS1maXhlcy0yMDE5
LTA2LTA3LTEnIG9mIGdpdDovL2Fub25nLi4KPiBnaXQgdHJlZTogICAgICAgdXBzdHJlYW0KPiBj
b25zb2xlIG91dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9
MTIwMWI5NzFhMDAwMDAKPiBrZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20veC8uY29uZmlnP3g9NjA1NjRjYjUyYWIyOWQ1Ygo+IGRhc2hib2FyZCBsaW5rOiBodHRw
czovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9MmZmMWU3Y2I3MzhmZDNjNDExMTMK
PiBjb21waWxlcjogICAgICAgZ2NjIChHQ0MpIDkuMC4wIDIwMTgxMjMxIChleHBlcmltZW50YWwp
Cj4gc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8u
c3l6P3g9MTRhM2JmNTFhMDAwMDAKPiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9yZXByby5jP3g9MTIwZDE5ZjJhMDAwMDAKCkxvb2tpbmcgYXQgdGhlIHJl
cHJvZHVjZXIgSSBkb24ndCBzZWUgYW55IGNhbGxzIHRvIGlvY3RsIHdoaWNoIGNvdWxkIGVuZAp1
cCBhbnl3aGVyZSBpbiBkcm0uCj4gCj4gVGhlIGJ1ZyB3YXMgYmlzZWN0ZWQgdG86Cj4gCj4gY29t
bWl0IDBmZmY3MjRhMzM5MTdhYzU4MWI1ODI1Mzc1ZDBiNTdhZmZlZGVlNzYKPiBBdXRob3I6IFBh
dWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiBEYXRlOiAg
IEZyaSBKYW4gMTggMTQ6NTE6MTMgMjAxOSArMDAwMAo+IAo+ICAgICBkcm0vc3VuNGk6IGJhY2tl
bmQ6IFVzZSBleHBsaWNpdCBmb3VyY2MgaGVscGVycyBmb3IgcGFja2VkIFlVVjQyMiBjaGVjawoK
QW5kIG1vc3QgZGVmaW5pdGVseSBub3QgaW4gZHJtL3N1bjRpLiBZb3UgY2FuIG9ubHkgaGl0IHRo
aXMgaWYgeW91IGhhdmUKc3VuNGkgYW5kIHJ1biBvbiBhcm0sIHdoaWNoIHBlciB5b3VyIGNvbmZp
ZyBpc24ndCB0aGUgY2FzZS4KCnRsZHI7IHNtZWxscyBsaWtlIGJpc2VjdCBnb25lIHdyb25nLgot
RGFuaWVsCgo+IAo+IGJpc2VjdGlvbiBsb2c6ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS94L2Jpc2VjdC50eHQ/eD0xNDY3NTUwZjIwMDAwMAo+IGZpbmFsIGNyYXNoOiAgICBodHRwczov
L3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0xNjY3NTUwZjIwMDAwMAo+IGNv
bnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0x
MjY3NTUwZjIwMDAwMAo+IAo+IElNUE9SVEFOVDogaWYgeW91IGZpeCB0aGUgYnVnLCBwbGVhc2Ug
YWRkIHRoZSBmb2xsb3dpbmcgdGFnIHRvIHRoZSBjb21taXQ6Cj4gUmVwb3J0ZWQtYnk6IHN5emJv
dCsyZmYxZTdjYjczOGZkM2M0MTExM0BzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gRml4ZXM6
IDBmZmY3MjRhMzM5MSAoImRybS9zdW40aTogYmFja2VuZDogVXNlIGV4cGxpY2l0IGZvdXJjYyBo
ZWxwZXJzIGZvcgo+IHBhY2tlZCBZVVY0MjIgY2hlY2siKQo+IAo+IFdBUk5JTkc6IENQVTogMCBQ
SUQ6IDg5NTEgYXQga2VybmVsL2JwZi9jb3JlLmM6ODUxIGJwZl9qaXRfZnJlZSsweDE1Ny8weDFi
MAo+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBwYW5pY19vbl93YXJuIHNldCAuLi4KPiBD
UFU6IDAgUElEOiA4OTUxIENvbW06IGt3b3JrZXIvMDowIE5vdCB0YWludGVkIDUuMi4wLXJjMysg
IzIzCj4gSGFyZHdhcmUgbmFtZTogR29vZ2xlIEdvb2dsZSBDb21wdXRlIEVuZ2luZS9Hb29nbGUg
Q29tcHV0ZSBFbmdpbmUsIEJJT1MKPiBHb29nbGUgMDEvMDEvMjAxMQo+IFdvcmtxdWV1ZTogZXZl
bnRzIGJwZl9wcm9nX2ZyZWVfZGVmZXJyZWQKPiBDYWxsIFRyYWNlOgo+ICBfX2R1bXBfc3RhY2sg
bGliL2R1bXBfc3RhY2suYzo3NyBbaW5saW5lXQo+ICBkdW1wX3N0YWNrKzB4MTcyLzB4MWYwIGxp
Yi9kdW1wX3N0YWNrLmM6MTEzCj4gIHBhbmljKzB4MmNiLzB4NzQ0IGtlcm5lbC9wYW5pYy5jOjIx
OQo+ICBfX3dhcm4uY29sZCsweDIwLzB4NGQga2VybmVsL3BhbmljLmM6NTc2Cj4gIHJlcG9ydF9i
dWcrMHgyNjMvMHgyYjAgbGliL2J1Zy5jOjE4Ngo+ICBmaXh1cF9idWcgYXJjaC94ODYva2VybmVs
L3RyYXBzLmM6MTc5IFtpbmxpbmVdCj4gIGZpeHVwX2J1ZyBhcmNoL3g4Ni9rZXJuZWwvdHJhcHMu
YzoxNzQgW2lubGluZV0KPiAgZG9fZXJyb3JfdHJhcCsweDExYi8weDIwMCBhcmNoL3g4Ni9rZXJu
ZWwvdHJhcHMuYzoyNzIKPiAgZG9faW52YWxpZF9vcCsweDM3LzB4NTAgYXJjaC94ODYva2VybmVs
L3RyYXBzLmM6MjkxCj4gIGludmFsaWRfb3ArMHgxNC8weDIwIGFyY2gveDg2L2VudHJ5L2VudHJ5
XzY0LlM6OTg2Cj4gUklQOiAwMDEwOmJwZl9qaXRfZnJlZSsweDE1Ny8weDFiMAo+IENvZGU6IDAw
IGZjIGZmIGRmIDQ4IDg5IGZhIDQ4IGMxIGVhIDAzIDgwIDNjIDAyIDAwIDc1IDVkIDQ4IGI4IDAw
IDAyIDAwIDAwCj4gMDAgMDAgYWQgZGUgNDggMzkgNDMgNzAgMGYgODQgMDUgZmYgZmYgZmYgZTgg
ZjkgYjUgZjQgZmYgPDBmPiAwYiBlOSBmOSBmZSBmZgo+IGZmIGU4IGJkIDUzIDJkIDAwIGU5IGQ5
IGZlIGZmIGZmIDQ4IDg5IDdkIGUwIGU4Cj4gUlNQOiAwMDE4OmZmZmY4ODgwODg4NmZjYjAgRUZM
QUdTOiAwMDAxMDI5Mwo+IFJBWDogZmZmZjg4ODA4Y2I2YzQ4MCBSQlg6IGZmZmY4ODgwOTA1MWQy
ODAgUkNYOiBmZmZmZmZmZjgxN2FlNjhkCj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZm
ZmZmZmY4MTdiZjBmNyBSREk6IGZmZmY4ODgwOTA1MWQyZjAKPiBSQlA6IGZmZmY4ODgwODg4NmZj
ZDAgUjA4OiAxZmZmZmZmZmYxNGNjYWE4IFIwOTogZmZmZmZiZmZmMTRjY2FhOQo+IFIxMDogZmZm
ZmZiZmZmMTRjY2FhOCBSMTE6IGZmZmZmZmZmOGE2NjU1NDcgUjEyOiBmZmZmYzkwMDAxOTI1MDAw
Cj4gUjEzOiBmZmZmODg4MDkwNTFkMmU4IFIxNDogZmZmZjg4ODBhMGU0MzkwMCBSMTU6IGZmZmY4
ODgwYWU4MzQ4NDAKPiAgYnBmX3Byb2dfZnJlZV9kZWZlcnJlZCsweDI3YS8weDM1MCBrZXJuZWwv
YnBmL2NvcmUuYzoxOTg0Cj4gIHByb2Nlc3Nfb25lX3dvcmsrMHg5ODkvMHgxNzkwIGtlcm5lbC93
b3JrcXVldWUuYzoyMjY5Cj4gIHdvcmtlcl90aHJlYWQrMHg5OC8weGU0MCBrZXJuZWwvd29ya3F1
ZXVlLmM6MjQxNQo+ICBrdGhyZWFkKzB4MzU0LzB4NDIwIGtlcm5lbC9rdGhyZWFkLmM6MjU1Cj4g
IHJldF9mcm9tX2ZvcmsrMHgyNC8weDMwIGFyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlM6MzUyCj4g
S2VybmVsIE9mZnNldDogZGlzYWJsZWQKPiBSZWJvb3RpbmcgaW4gODY0MDAgc2Vjb25kcy4uCj4g
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
