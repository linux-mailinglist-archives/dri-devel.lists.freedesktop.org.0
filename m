Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE39211472
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 22:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26976E132;
	Wed,  1 Jul 2020 20:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2EB6E132
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 20:30:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id DEA832A5718
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v9 00/11] Genericize DW MIPI DSI bridge and add i.MX 6
 driver
In-Reply-To: <6400388.H4HLtoO0Qf@diego>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
 <6400388.H4HLtoO0Qf@diego>
Date: Wed, 01 Jul 2020 23:32:18 +0300
Message-ID: <87imf7j7sd.fsf@collabora.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philippe CORNU <philippe.cornu@st.com>, Yannick FERTRE <yannick.fertre@st.com>,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa28sCgpPbiBXZWQsIDAxIEp1bCAyMDIwLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPiBIaSBBZHJpYW4sIAo+IAo+IEFtIERpZW5zdGFnLCA5LiBKdW5pIDIw
MjAsIDE5OjQ5OjQ4IENFU1Qgc2NocmllYiBBZHJpYW4gUmF0aXU6IAo+PiBbUmUtc3VibWl0dGlu
ZyB0byBjYyBkcmktZGV2ZWwsIHNvcnJ5IGFib3V0IHRoZSBub2lzZV0gIEhlbGxvIAo+PiBhbGws
ICB2OSBjbGVhbmx5IGFwcGxpZXMgb24gdG9wIG9mIGxhdGVzdCBuZXh0LTIwMjAwNjA5IHRyZWUu
IAo+IAo+IGF0IGxlYXN0IGl0IGRvZXNuJ3QgYXBwbHkgb24gdG9wIG9mIGN1cnJlbnQgZHJtLW1p
c2MtbmV4dCBmb3IgbWUgCj4gd2hpY2ggSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZC4gCj4gCj4g
TGlrZSBwYXRjaCAyLzExIGRvZXMgCj4gCj4gQEAgLTMxLDYgKzMxLDcgQEAgCj4gICNpbmNsdWRl
IDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPiAKPiAuIAo+ICAjZGVmaW5lIEhXVkVSXzEzMTwtLS0t
PjwtLS0tLS0+PC0tLS0tLT4weDMxMzMzMTAwPC0tLS0+LyogSVAgCj4gIHZlcnNpb24gMS4zMSAq
LyAKPiArI2RlZmluZSBIV1ZFUl8xMzA8LS0tLT48LS0tLS0tPjwtLS0tLS0+MHgzMTMzMzAwMDwt
LS0tPi8qIElQIAo+IHZlcnNpb24gMS4zMCAqLyAuIAo+ICAjZGVmaW5lIERTSV9WRVJTSU9OPC0t
PjwtLS0tLS0+PC0tLS0tLT4weDAwICNkZWZpbmUgCj4gIFZFUlNJT048LS0tLS0tPjwtLS0tLS0+
PC0tLS0tLT48LS0tLS0tPkdFTk1BU0soMzEsIDgpIAo+IAo+IHdoZXJlIHRoZSBmaWxlIGN1cnJl
bnRseSBsb29rcyBsaWtlIAo+IAo+ICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4g
I2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+IAo+ICNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4g
I2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4gI2luY2x1ZGUgCj4gPGRybS9kcm1fbW9kZXMu
aD4gI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4gI2luY2x1ZGUgCj4gPGRybS9kcm1fcHJpbnQuaD4g
Cj4gCj4gI2RlZmluZSBIV1ZFUl8xMzEJCQkweDMxMzMzMTAwCS8qIElQIAo+IHZlcnNpb24gMS4z
MSAqLyAKPiAKPiAjZGVmaW5lIERTSV9WRVJTSU9OCQkJMHgwMCAjZGVmaW5lIFZFUlNJT04gCj4g
R0VOTUFTSygzMSwgOCkgCj4gIAo+IGV2ZW4gaW4gTGludXgtbmV4dCAKPiAgCj4gU28gSSBndWVz
cyBpZGVhbGx5IHJlYmFzZSBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dAoKSSB3aWxsIHNlbmQgYSBy
ZWJhc2Ugb24gdG9wIG9mIGRybS1taXNjLW5leHQgc29vbiAod2l0aCB0aGUgbGFzdCAKRFRTIG5p
dHBpY2sgZml4ZWQgYW5kIHRoZSBsYXRlc3QgYWNrcyBhbmQgcmV2aWV3ZWQtYnkgdGFncyBhZGRl
ZCkuCgpJbiB0aGUgbWVhbnRpbWUgSSBhbHNvIGZvdW5kIHNvbWVvbmUgd2l0aGluIENvbGxhYm9y
YSB3aG8gaGFzIGEgUksgCndpdGggYSBEU0kgcGFuZWwgYW5kIGZvdW5kIGEgYnVnIChsaWtlbHkg
Y2xvY2sgaXMgbm90IGVuYWJsZWQgCmVhcmx5IGVub3VnaCB0byBhY2Nlc3MgdGhlIGNmZyByZWdp
c3RlcnMgdG8gZ2V0IHRoZSB2ZXJzaW9uIGZvciAKcmVnbWFwKS4KCkknbSBzdXBlciBoYXBweSB0
aGlzIGlzIGdldHRpbmcgdGVzdGVkIG9uIFJLLCB0aGFuayB5b3UhCgo+Cj4KPiBUaGFua3MKPiBI
ZWlrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
