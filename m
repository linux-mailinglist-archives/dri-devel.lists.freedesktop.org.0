Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE3133D65
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055F26E875;
	Wed,  8 Jan 2020 08:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157B26E875;
 Wed,  8 Jan 2020 08:43:15 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 77so2830194oty.6;
 Wed, 08 Jan 2020 00:43:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7cWBGOss6IZmXIImkX09JkN+lqirutcjNONiaHMIXk4=;
 b=aOhBr3TitCJNylvPLMxfkUkydTLNgjtV6doBMAmIEV2XaHFoFMX7Nqg/4XKLti8XCK
 1aiCSUAB6yvb19dzc4DMZlNHKum/cZzwjjYGA1d+eY+e9E4AWNsn6u+7AAQu+3x86/So
 +lmpRPkA8BF5Z95Pc3PLpOWzu+A4d6Jeo7vHXJv+9e+V4c5530wjoFOzGG8K+YXSJmvw
 tiW+muZ/rUJo22FBzHyQGmHBIKNonZxp1WiZFvAS2HAjikV677+Ts6Iy0jEkGi9FJ+WI
 6+Anjy4CcXgXnB+t91U+3XQz5Ak6iBQKrkyhjfEaq95qnX/8LFauarg2O0NITYbQRgf2
 c0KQ==
X-Gm-Message-State: APjAAAUHq4RQAnAVTDX3gCCBkup0uzuozK4nX+gSb0B+8clV++wrtsYQ
 r4uzVqMPECIT7oT7CM+0yEEfpfLXnoUfAz0+GbQ=
X-Google-Smtp-Source: APXvYqyLwchytFfBRcGzmYLq5q4p5hvwH1AjnwV9nNk5cX7+q/Njb59ahRoMRaX1Y0RAyipVtDWx7V8ZzLixl6z6dho=
X-Received: by 2002:a9d:6a84:: with SMTP id l4mr3302303otq.145.1578472995351; 
 Wed, 08 Jan 2020 00:43:15 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:43:04 +0100
Message-ID: <CAMuHMdV=-m-eN4rOa=XQhk2oBDZZwgXXMU6RMVQRVsc6ALyeoA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0b3BoZSwKCk9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgOTozNSBBTSBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gd3JvdGU6Cj4gTGUgMDgvMDEvMjAyMCDD
oCAwOToxOCwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdCA6Cj4gPiBPbiBXZWQsIDggSmFu
IDIwMjAgYXQgMDk6MTMsIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+ID4+IE9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgOTowNyBBTSBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+Pj4gT24gVHVlLCBKYW4gNywg
MjAyMCBhdCA1OjUzIFBNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPj4+PiBUaGUgaW9yZWFkOC8xNi8zMigpIGFuZCBvdGhlcnMgaGF2ZSBpbmNvbnNpc3Rl
bnQgaW50ZXJmYWNlIGFtb25nIHRoZQo+ID4+Pj4gYXJjaGl0ZWN0dXJlczogc29tZSB0YWtpbmcg
YWRkcmVzcyBhcyBjb25zdCwgc29tZSBub3QuCj4gPj4+Pgo+ID4+Pj4gSXQgc2VlbXMgdGhlcmUg
aXMgbm90aGluZyByZWFsbHkgc3RvcHBpbmcgYWxsIG9mIHRoZW0gdG8gdGFrZQo+ID4+Pj4gcG9p
bnRlciB0byBjb25zdC4KPiA+Pj4KPiA+Pj4gU2hvdWxkbid0IGFsbCBvZiB0aGVtIHRha2UgY29u
c3Qgdm9sYXRpbGUgX19pb21lbSBwb2ludGVycz8KPiA+Pj4gSXQgc2VlbXMgdGhlICJ2b2xhdGls
ZSIgaXMgbWlzc2luZyBmcm9tIGFsbCBidXQgdGhlIGltcGxlbWVudGF0aW9ucyBpbgo+ID4+PiBp
bmNsdWRlL2FzbS1nZW5lcmljL2lvLmguCj4gPj4KPiA+PiBBcyBteSAidm9sYXRpbGUiIGNvbW1l
bnQgYXBwbGllcyB0byBpb3dyaXRlKigpLCB0b28sIHByb2JhYmx5IHRoYXQgc2hvdWxkIGJlCj4g
Pj4gZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+ID4+Cj4gPj4gSGVuY2Ugd2l0aCBwYXRjaGVz
IDEtNSBzcXVhc2hlZCwgYW5kIGZvciBwYXRjaGVzIDExLTEzOgo+ID4+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4KPiA+IEknbGwg
YWRkIHRvIHRoaXMgb25lIGFsc28gY2hhbmdlcyB0byBpb3JlYWRYX3JlcCgpIGFuZCBhZGQgYW5v
dGhlcgo+ID4gcGF0Y2ggZm9yIHZvbGF0aWxlIGZvciByZWFkcyBhbmQgd3JpdGVzLiBJIGd1ZXNz
IHlvdXIgcmV2aWV3IHdpbGwgYmUKPiA+IGFwcHJlY2lhdGVkIG9uY2UgbW9yZSBiZWNhdXNlIG9m
IGlvcmVhZFhfcmVwKCkKPgo+IHZvbGF0aWxlIHNob3VsZCByZWFsbHkgb25seSBiZSB1c2VkIHdo
ZXJlIGRlZW1lZCBuZWNlc3Nhcnk6Cj4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L2xhdGVzdC9wcm9jZXNzL3ZvbGF0aWxlLWNvbnNpZGVyZWQtaGFybWZ1bC5odG1sCj4KPiBJdCBp
cyBzYWlkOiAiIC4uLiAgYWNjZXNzb3IgZnVuY3Rpb25zIG1pZ2h0IHVzZSB2b2xhdGlsZSBvbgo+
IGFyY2hpdGVjdHVyZXMgd2hlcmUgZGlyZWN0IEkvTyBtZW1vcnkgYWNjZXNzIGRvZXMgd29yay4g
RXNzZW50aWFsbHksCj4gZWFjaCBhY2Nlc3NvciBjYWxsIGJlY29tZXMgYSBsaXR0bGUgY3JpdGlj
YWwgc2VjdGlvbiBvbiBpdHMgb3duIGFuZAo+IGVuc3VyZXMgdGhhdCB0aGUgYWNjZXNzIGhhcHBl
bnMgYXMgZXhwZWN0ZWQgYnkgdGhlIHByb2dyYW1tZXIuIgoKVGhhdCBpcyBleGFjdGx5IHRoZSB1
c2UgY2FzZSBoZXJlOiBhbGwgYWJvdmUgYXJlIGFjY2Vzc29yIGZ1bmN0aW9ucy4KCldoeSB3b3Vs
ZCBpb3JlYWRYKCkgbm90IG5lZWQgdm9sYXRpbGUsIHdoaWxlIHJlYWRZKCkgZG9lcz8KCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
