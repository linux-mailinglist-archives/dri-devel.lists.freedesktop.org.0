Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF123CDC09
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2617F6E46F;
	Mon,  7 Oct 2019 07:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AB76E0A8
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 12:33:55 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-01.back.ox.d0m.de by smtp-ox.front (RZmta 44.28.0 AUTH)
 with ESMTPSA id i07086v96CWqeEb
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 6 Oct 2019 14:32:52 +0200 (CEST)
Date: Sun, 6 Oct 2019 14:32:52 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 jitao.shi@mediatek.com
Message-ID: <218822936.516770.1570365172065@webmail.strato.com>
In-Reply-To: <4df984a5-a917-753e-5870-7453f3d5438e@gmail.com>
References: <1570216148-22802-1-git-send-email-uli@fpond.eu>
 <4df984a5-a917-753e-5870-7453f3d5438e@gmail.com>
Subject: Re: [PATCH v19 0/2] PS8640 MIPI-to-eDP bridge
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev20
X-Originating-IP: 85.212.38.149
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1570365232; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=+jNs+aIhzCrlui+txGTHIfOIsQHf0wQLk5jIMpzux4g=;
 b=pio4+ByQOLJFaAH4cPLi1ojQ9vJMbkCJimLZ92l+GOv5KhUZesC+gzeGnPN8DabGeX
 MYdBFwjq2Hc4lphGA//IcTbtPjlCwILPOsyiELHPiWMrQU+9YbW0garyuqNVRTbeQkmE
 2O22rZc/1yP1JiWeAdWWqM1xslp9/zqt8fpsOT2HZWocrfsCkj/lhLsSmJWweyKs8qyg
 SoffsBzNpl4a0X8ip+hE/BYFU691Q4VAdlnEmOoSeTPbnd5WdEERijGb6jCqX8EJwJ4u
 LH9vBxa5oWdrtuev8mAbxL9aTSbhECV0HeLwVbiL8Do4ZRZGr53oiRSOKBaqNo7xeyQX
 fiew==
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
Cc: mark.rutland@arm.com, stonea168@163.com, ajaykumar.rs@samsung.com,
 architt@codeaurora.org, vpalatin@chromium.org, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, seanpaul@chromium.org,
 eddie.huang@mediatek.com, rahul.sharma@samsung.com, kernel@pengutronix.de,
 galak@codeaurora.org, enric.balletbo@collabora.com, andy.yan@rock-chips.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gT2N0b2JlciA1LCAyMDE5IGF0IDE6MTYgUE0gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gCj4gSGkgVWxpLAo+IAo+IE9uIDA0LzEwLzIw
MTkgMjE6MDksIFVscmljaCBIZWNodCB3cm90ZToKPiA+IEhpIQo+ID4gCj4gPiBUaGlzIGRyaXZl
ciBzZWVtcyB0byBoYXZlIGZhbGxlbiBieSB0aGUgd2F5c2lkZSBiZWNhdXNlLCB3aGlsZSBvdGhl
cndpc2UKPiA+IGZpbmUsIGl0IGhhcyBhIGZpcm13YXJlIHVwZGF0ZSBmZWF0dXJlIHRoYXQgcmVx
dWlyZXMgYSBibG9iIHRoYXQgaXMgbm90IGluCj4gPiB0aGUgbGludXgtZmlybXdhcmUgcmVwby5b
MV0KPiA+IAo+ID4gV2hhdGV2ZXIgdGhlIGNhdXNlIGZvciB0aGF0IG1heSBiZSwgdGhlIHVwZGF0
ZSBjb2RlIGlzIGVudGlyZWx5IG9wdGlvbmFsCj4gPiAobXkgY2hpcCB3b3JrcyBmaW5lIHdpdGgg
d2hhdGV2ZXIgZmlybXdhcmUgaXMgY3VycmVudGx5IGluc3RhbGxlZCksIHNvIEkKPiA+IGhhdmUg
cmVtb3ZlZCBpdCBpbiBvcmRlciB0byBnZXQgdGhpcyBtZXJnZWQgYWZ0ZXIgYWxsLiBJIGhhdmUg
YWxzbwo+ID4gZm9sbG93ZWQgdmFyaW91cyB0cml2aWFsIEFQSSBjaGFuZ2VzIHRoYXQgaGF2ZSBw
aWxlZCB1cCBzaW5jZSAyMDE2OyBzZWUKPiA+IHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIGRl
dGFpbHMuCj4gPiAKPiA+IEknbSB1c2luZyB0aGlzIGRyaXZlciBvbiBhbiBBY2VyIENocm9tZWJv
b2sgUjEzICgiRWxtIik7IHNlZQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3VsaS9rZXJuZWwvdHJl
ZS9lbG0td29ya2luZy01LjQuCj4gPiAKPiAKPiBUaGFua3MgZm9yIHlvdXIgZWZmb3J0IHRvIGdl
dCB0aGluZ3MgdXBzdHJlYW0uCj4gSSBqdXN0IHRyaWVkIHlvdXIgYnJhbmNoIG9uIG15IFIxMy4g
SSBoYWQgdG8gZG8gYSB0cml2aWFsIGNvbmZpZyBjaGFuZ2UgSSBoYWQgdG8KPiBkbywgYXMgSSBk
b24ndCBoYXZlIGFuZCBjYXJlIGFib3V0IHRoZSBibHVldG9vdGggRlcgcmlnaHQgbm93LgoKVGhh
bmsgeW91IGZvciB0ZXN0aW5nIQoKPiBCdXQgYWZ0ZXIgdGhhdCBteSBzY3JlZW4ga2VlcHMgYmxh
Y2suIEkgd2FzIGFibGUgdG8gYnVpbGQgYW5kIGJvb3QKPiBlbG0td29ya2luZy01LjMgYW5kIGVs
bS13b3JraW5nLTUuMi4KPiAKPiBVbmZvcnR1bmF0bGV5IEkgZG9uJ3QgaGF2ZSBhIHNlcmlhbCBj
b25zb2xlIG9uIHRoZSBDaHJvbWVib29rLCBzbyBpdCdzIGRpZmZpY3VsdAo+IHRvIGZpbmQgb3V0
IHdoZXJlIGl0IGhhbmdzLiBDYW4geW91IHBsZWFzZSBkb3VibGUgY2hlY2sgaWYgeW91ciBuZXcK
PiBlbG0td29ya2luZy01LjQgYWN0dWFsbHkgcmVhbGx5IHdvcmtzPwoKTm8sIGl0IGRvZXNuJ3Qu
IDooIEl0IHNlZW1zIEkgZm9yZ290IHRvIHJ1biBta2ltYWdlL3ZidXRpbF9rZXJuZWwgd2hlbiB0
ZXN0aW5nLi4uCkkgaGF2ZSBwdXNoZWQgYSBmaXggdG8gdGhlIGVsbS13b3JraW5nLTUuNCB0cmVl
LCBhbmQgSSB3aWxsIHNlbmQgYSB2MjAgdG9tb3Jyb3cuIFNvcnJ5IGZvciB0aGUgaW5jb252ZW5p
ZW5jZS4KCkNVClVsaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
