Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF625AE22
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 16:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80C06E928;
	Wed,  2 Sep 2020 14:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96136E928
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 14:59:54 +0000 (UTC)
Date: Wed, 02 Sep 2020 14:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1599058792;
 bh=MJpaePgwZECyFS5Q1LzKLCt6gkFy6aErwtm4ZTkQy4E=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=N4UNzU+j/qWFRZNfK/AMyPi4hACwpuDwooEL4oViiI+edajkvy2X2GfKWHn2b1Ov7
 nyrkrDHcoCmK4zyKU2IiGLS0WGTBl82BJ8DKDUDm8ZLvfm/x1YoZWFV1HEAoQJx7lA
 krakT+cqbva5lXstnxeTyV/E+uFVbr9yCDqSACSvVEPoyeVn+tvhpcV02xkaAjyYwt
 Mp/cF+gtcmd6OBIRAooZ6arS8OO0vdlCZlFEt9C5HNOH94SuoOhDVB5E8diUnatRJx
 3uu9FdFOKpbe+ajKfVunxUGEtDovXDRYIK/llBOSpQSEameerXp7MkPW+r9afy5rL4
 c+frowBEuQ4Ng==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Document that modifiers are always required for
 fb
Message-ID: <55Yt-xRb-j_BnxyoixpIT6a4aOd2-SMetoyIVRBwOBFc98R5A3-gAcYcFo5Sjj-7TcvLdy3669gwn5eCOoOi85A2MlZaUwqpQETei77426A=@emersion.fr>
In-Reply-To: <CAKMK7uGs2vQNf1+=4spQV4aCncOPE4+E7g95xqZ7kcD8pp5bTg@mail.gmail.com>
References: <20200902102440.3621733-1-daniel.vetter@ffwll.ch>
 <t3hHLqZ0yNm5FdxpyJovgjEVzs-OD7qD5nYrYXug8UhkBykhekB0_hOqPltEvFH3daJ3HYtY_3FInv3U5xIHprg1FS7b2SP8fCf48r7DvVg=@emersion.fr>
 <CAKMK7uFztTjjvQvM-toeZv3hps+NMJFXV7s=Dzs5PwG3J+7wjw@mail.gmail.com>
 <ap5W_r98yx5DpM1jFkrof6yWGWPtxbyObFp3iIP1-hm-SD_-Jij72KZK2VhVV2p-34EqdVE6T1JeW4zAgjnNsxv_CtULfvg2ASY3xECXMuY=@emersion.fr>
 <CAKMK7uGs2vQNf1+=4spQV4aCncOPE4+E7g95xqZ7kcD8pp5bTg@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Juston Li <juston.li@intel.com>, Daniel Stone <daniels@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMiwgMjAyMCA0OjI5IFBNLCBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gT24gV2VkLCBTZXAgMiwgMjAyMCBhdCAy
OjQ5IFBNIFNpbW9uIFNlciBjb250YWN0QGVtZXJzaW9uLmZyIHdyb3RlOgo+Cj4gPiBPbiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAyLCAyMDIwIDI6NDQgUE0sIERhbmllbCBWZXR0ZXIgZGFuaWVsLnZl
dHRlckBmZndsbC5jaCB3cm90ZToKPiA+Cj4gPiA+ID4gSSBzdXBwb3NlIHNvbWV0aGluZyBzaW1p
bGFyIGhhcHBlbnMgaW4gdXNlci1zcGFjZTogZ2JtX2JvX2NyZWF0ZQo+ID4gPiA+IHdpdGhvdXQg
bW9kaWZpZXJzIG5lZWRzIHRvIHByb3Blcmx5IHNldCB0aGUgaW1wbGljaXQgbW9kaWZpZXIsIGll
Lgo+ID4gPiA+IGdibV9ib19nZXRfbW9kaWZpZXIgbmVlZHMgdG8gcmV0dXJuIHRoZSBlZmZlY3Rp
dmUgbW9kaWZpZXIuIElzIHRoaXMKPiA+ID4gPiBzb21ldGhpbmcgYWxyZWFkeSBkb2N1bWVudGVk
Pwo+ID4gPgo+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQgaGFwcGVucywgYnV0IGl0IGhhcyBjb21l
IHVwIGluIGRpc2N1c3Npb25zLiBJdCdzCj4gPiA+IGtpbmRhIGRpZmZlcmVudCBzY2VuYXJpbyB0
aG91Z2g6IGdldGZiMiBpcyBmb3IgY3Jvc3MtY29tcG9zaXRvciBzdHVmZiwKPiA+ID4gZW5hYmxp
bmcgc21vb3RoIHRyYW5zaXRpb25zIGF0IGJvb3QtdXAgYW5kIHdoZW4gc3dpdGNoaW5nLiBTbyB5
b3UgaGF2ZQo+ID4gPiBhIGxlZ2l0IHJlYXNvbiBmb3IgbWl4aW5nIG1vZGlmaWVyLWF3YXJlIHVz
ZXJzcGFjZSB3aXRoCj4gPiA+IG5vbi1tb2RpZmllci1hd2FyZSB1c2Vyc3BhY2UuIEFuZCB0aGUg
bW9kaWZpZXItYXdhcmUgdXNlcnNwYWNlIHdvdWxkCj4gPiA+IGxpa2UgdGhhdCBldmVyeXRoaW5n
IHdvcmtzIHdpdGggbW9kaWZpZXJzIGNvbnNpc3RlbnRseSwgaW5jbHVkaW5nCj4gPiA+IGdldGZi
Mi4gQnV0IGdibSBpcyBqdXN0IHdpdGhpbiBhIHNpbmdsZSBwcm9jZXNzLCBhbmQgdGhhdCBzaG91
bGQKPiA+ID4gZWl0aGVyIHJ1biBhbGwgd2l0aCBtb2RpZmllcnMsIG9yIG5vdCBhdCBhbGwsIHNp
bmNlIHRoZXNlIHdvcmxkcyBqdXN0Cj4gPiA+IGRvbnQgbWl4IHdlbGwuIEhlbmNlIEknbSBub3Qg
c2VlaW5nIG11Y2ggdXNlIGZvciB0aGF0LCAtbW9kZXNldHRpbmcKPiA+ID4gYmVpbmcgYSBjb25m
dXNlZCBtZXNzIG5vbndpdGhzdGFuZGluZyA6LSkKPiA+Cj4gPiBXZWxs4oCmIFRoZXJlJ3MgYWxz
byB0aGUgY2FzZSB3aGVyZSBzb21lIGxlZ2FjeSBXYXlsYW5kIGNsaWVudCB0YWxrcyB0byBhCj4g
PiBtb2RpZmllci1hd2FyZSBjb21wb3NpdG9yLiBnYm1fYm9faW1wb3J0IHdvdWxkIGJlIGNhbGxl
ZCB3aXRob3V0IGEKPiA+IG1vZGlmaWVyLCBidXQgdGhlIGNvbXBvc2l0b3IgZXhwZWN0cyBnYm1f
Ym9fZ2V0X21vZGlmaWVyIHRvIHdvcmsuCj4gPiBBbHNvLCB3bHJvb3RzIHdpbGwgY2FsbCBnYm1f
Ym9fY3JlYXRlIHdpdGhvdXQgYSBtb2RpZmllciB0byBvbmx5IGxldAo+ID4gdGhlIGRyaXZlciBw
aWNrICJzYWZlIiBtb2RpZmllcnMgaW4gY2FzZSBwYXNzaW5nIHRoZSBmdWxsIGxpc3Qgb2YKPiA+
IG1vZGlmaWVycyByZXN1bHRzIGluIGEgYmxhY2sgc2NyZWVuLiBMYXRlciBvbiB3bHJvb3RzIHdp
bGwgY2FsbAo+ID4gZ2JtX2JvX2dldF9tb2RpZmllciB0byBmaWd1cmUgb3V0IHdoYXQgbW9kaWZp
ZXIgdGhlIGRyaXZlciBwaWNrZWQuCj4KPiBnYm1fYm9faW1wb3J0IGlzIGEgZGlmZmVyZW50IHRo
aW5nIGZyb20gZ2JtX2JvX2NyZWF0ZS4gRm9ybWVyIEkgYWdyZWUKPiBzaG91bGQgZmlndXJlIG91
dCB0aGUgcmlnaHQgbW9kaWZpZXJzIChhbmQgSSB0aGluayBpdCBkb2VzIHRoYXQsIGF0Cj4gbGVh
c3Qgb24gaW50ZWwgbWVzYSkuIEZvciBnYm1fYm9fY3JlYXRlIEknbSBub3Qgc3VyZSB3ZSBzaG91
bGQvbmVlZCB0bwo+IHJlcXVpcmUgdGhhdC4KCkkgZ3Vlc3MgdGhlIGNvbXBvc2l0b3Igd2lsbCBq
dXN0IGZvcndhcmQgdGhlIHZhbHVlIHJldHVybmVkIGJ5CmdibV9ib19nZXRfbW9kaWZpZXIgaW4g
YW55IGNhc2UsIHNvIHJldHVybmluZyBJTlZBTElEIHdvdWxkIGJlIGZpbmUKdG9vICh0byBtZWFu
ICJpbXBsaWNpdCBtb2RpZmllciIpLgoKSW4gYm90aCB0aGUgY3JlYXRlIGFuZCBpbXBvcnQgY2Fz
ZXMsIG90aGVyIG1ldGFkYXRhIGxpa2UgcGl0Y2hlcyBhbmQKb2Zmc2V0cyBzaG91bGQgYmUgY29y
cmVjdGx5IHNldCBJIHRoaW5rPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
