Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB761320EC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902CB899AB;
	Tue,  7 Jan 2020 08:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5289E41
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 12:15:57 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C40CF200008;
 Mon,  6 Jan 2020 12:15:50 +0000 (UTC)
Date: Mon, 6 Jan 2020 13:15:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Subject: Re: [PATCH v2 00/11] Add PX30 LVDS support
Message-ID: <20200106131549.52909d08@xps13>
In-Reply-To: <2064471.Uj1soXtvLx@diego>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
 <1885398.klecWcqSHf@phil> <2064471.Uj1soXtvLx@diego>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa28sCgpIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZSBvbiBNb24s
IDA2IEphbiAyMDIwIDEyOjA5OjE5CiswMTAwOgoKPiBBbSBTb25udGFnLCA1LiBKYW51YXIgMjAy
MCwgMTU6MDU6MjYgQ0VUIHNjaHJpZWIgSGVpa28gU3R1ZWJuZXI6Cj4gPiBBbSBEaWVuc3RhZywg
MjQuIERlemVtYmVyIDIwMTksIDE1OjM4OjQ5IENFVCBzY2hyaWViIE1pcXVlbCBSYXluYWw6ICAK
PiA+ID4gSGVsbG8sCj4gPiA+IAo+ID4gPiBUaGlzIHNlcmllcyBhaW1zIGF0IHN1cHBvcnRpbmcg
TFZEUyBvbiBQWDMwLgo+ID4gPiAKPiA+ID4gQSBmaXJzdCBjb3VwbGUgb2YgcGF0Y2hlcyB1cGRh
dGUgdGhlIGRvY3VtZW50YXRpb24gd2l0aCB0aGUgbmV3Cj4gPiA+IGNvbXBhdGlibGUgYW5kIHRo
ZSBwcmVzZW5jZSBvZiBhIFBIWS4gVGhlbiwgdGhlIGV4aXN0aW5nIFJvY2tjaGlwCj4gPiA+IGRy
aXZlciBpcyBjbGVhbmVkIGFuZCBleHRlbmRlZCB0byBzdXBwb3J0IFBYMzAgc3BlY2lmaWNpdGll
cy4gRmluYWxseSwKPiA+ID4gdGhlIFBYMzAgRFRTSSBpcyB1cGRhdGVkIHdpdGggQ1JUQyByb3V0
ZXMsIHRoZSBEU0kgRFBIWSBhbmQgdGhlIExWRFMKPiA+ID4gSVAgaXRzZWxmLgo+ID4gPiAKPiA+
ID4gQ2hlZXJzLAo+ID4gPiBNaXF1w6hsCj4gPiA+IAo+ID4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+
ID4gPiAqIEFkZGVkIFJvYidzIEFjay4KPiA+ID4gKiBVc2VkICJtdXN0IiBpbnN0ZWFkIG9mICJz
aG91bGQiIGluIHRoZSBiaW5kaW5ncy4KPiA+ID4gKiBQcmVjaXNlZCB0aGF0IHBoeS1uYW1lcyBp
cyBhbiBvcHRpb25hbCBwcm9wZXJ0eSBpbiB0aGUgY2FzZSBvZgo+ID4gPiAgIFBYMzAuCj4gPiA+
ICogUmVuYW1lZCB0aGUgV1JJVEVfRU4gbWFjcm8gaW50byBISVdPUkRfVVBEQVRFIHRvIGJlIGFs
aWduZWQgd2l0aAo+ID4gPiAgIG90aGVyIGZpbGVzLgo+ID4gPiAqIFJlbW92ZWQgZXh0cmEgY29u
ZmlndXJhdGlvbiwgbm90IG5lZWRlZCBmb3IgZ2VuZXJpYyBwYW5lbHMgKHNlZQo+ID4gPiAgIFNh
bmR5IEh1YW5nIGFuc3dlcikuCj4gPiA+ICogRHJvcHBlZCB0aGUgZGlzcGxheS1zdWJzeXN0ZW0g
cm91dGVzICh1c2VsZXNzKS4KPiA+ID4gKiBNZXJnZWQgdHdvIHBhdGNoZXMgdG8gYXZvaWQgcGhh
bmRsZSBpbnRlcmRlcGVuZGVuY2llcyBpbiBncmFwaHMgYW5kCj4gPiA+ICAgaW50ZXJtZWRpYXRl
IGJ1aWxkIGVycm9ycy4KPiA+ID4gCj4gPiA+IE1pcXVlbCBSYXluYWwgKDExKToKPiA+ID4gICBk
dC1iaW5kaW5nczogZGlzcGxheTogcm9ja2NoaXAtbHZkczogRGVjbGFyZSBQWDMwIGNvbXBhdGli
bGUKPiA+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTogcm9ja2NoaXAtbHZkczogRG9jdW1lbnQg
UFgzMCBQSFkKPiA+ID4gICBkcm0vcm9ja2NoaXA6IGx2ZHM6IEZpeCBpbmRlbnRhdGlvbiBvZiBh
ICNkZWZpbmUKPiA+ID4gICBkcm0vcm9ja2NoaXA6IGx2ZHM6IEhhcm1vbml6ZSBmdW5jdGlvbiBu
YW1lcwo+ID4gPiAgIGRybS9yb2NrY2hpcDogbHZkczogQ2hhbmdlIHBsYXRmb3JtIGRhdGEKPiA+
ID4gICBkcm0vcm9ja2NoaXA6IGx2ZHM6IENyZWF0ZSBhbiBSSzMyODggc3BlY2lmaWMgcHJvYmUg
ZnVuY3Rpb24KPiA+ID4gICBkcm0vcm9ja2NoaXA6IGx2ZHM6IEhlbHBlcnMgc2hvdWxkIHJldHVy
biBkZWNlbnQgdmFsdWVzCj4gPiA+ICAgZHJtL3JvY2tjaGlwOiBsdmRzOiBQYWNrIGZ1bmN0aW9u
cyB0b2dldGhlciAgCj4gPiAKPiA+IGFwcGxpZWQgcGF0Y2hlcyAxLTggdG8gZHJtLW1pc2MtbmV4
dAo+ID4gICAKPiA+ID4gICBkcm0vcm9ja2NoaXA6IGx2ZHM6IEFkZCBQWDMwIHN1cHBvcnQgIAo+
ID4gCj4gPiBkcm0tbWlzYy1uZXh0IGlzIGN1cnJlbnRseSBzdGlsbCBhdCA1LjQtcmM0LCBzbyBJ
J2xsIG5lZWQgdG8gZmluZCBvdXQgaG93Cj4gPiB0byBnZXQgbmV3ZXIga2VybmVsIGNoYW5nZXMg
aW4gdGhlcmUsIGFzIHJpZ2h0IG5vdyB3ZSdyZSBtaXNzaW5nCj4gPiB0aGUgUEhZX01PREVfTFZE
UyBjb25zdGFudC4gIAo+IAo+IGFwcGxpZWQgbm93IHRvIGRybS1taXNjLW5leHQgYXMgd2VsbCwg
YWZ0ZXIgZHJtLW1pc2MgbWFpbnRhaW5lcnMgZGlkIHRoZQo+IHJlcXVlc3RlZCBiYWNrLW1lcmdl
IHRvIGdldCB0aGF0IGNvbnN0YW50LgoKR3JlYXQhIFRoYW5rcyBhIGxvdCBmb3IgeW91ciB0aW1l
IQoKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
