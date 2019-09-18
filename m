Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715FBB6F18
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 23:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46137A665;
	Wed, 18 Sep 2019 21:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Wed, 18 Sep 2019 21:55:54 UTC
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941A97A686
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 21:55:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 30F1F6DA;
 Wed, 18 Sep 2019 17:49:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 18 Sep 2019 17:49:15 -0400
X-ME-Sender: <xms:WqaCXT4s9ZoLx1xy826Sj_ltqwvo0rSAm2lkWGny5oCFUL0m38Kt6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefgrhhitgcu
 gfhnghgvshhtrhhomhcuoegvrhhitgesvghnghgvshhtrhhomhdrtghhqeenucfkphepke
 durdelkedrheejrddutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvrhhitgesvghn
 ghgvshhtrhhomhdrtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:WqaCXTJh45CV8QKf0t6omfuA7VlPynDBTPNeasBNMwZVL9GMxt0LLQ>
 <xmx:WqaCXTzxfIkZJHrMEf1ovlReSH8Fwp3w1atoKXz-2735tYx4vs4wyA>
 <xmx:WqaCXXeMOSVOl8ErCdwRNw1Pm8f2uvhOJMusq0uL6-B1YRMmDH9fQg>
 <xmx:WqaCXXcE-wj09-a365rSInPZ6OVBujkOKQlVazVDHfiW7UWK_TyOMw4PbpU>
Received: from engestrom.ch (cpc141428-brnt4-2-0-cust106.4-2.cable.virginm.net
 [81.98.57.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 102A180060;
 Wed, 18 Sep 2019 17:49:10 -0400 (EDT)
Date: Wed, 18 Sep 2019 22:49:08 +0100
From: Eric Engestrom <eric@engestrom.ch>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] libdrm: Convert to Android.mk to Android.bp
Message-ID: <20190918214908.bnzhcs5sgnkslafb@engestrom.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917191536.19105-1-john.stultz@linaro.org>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=engestrom.ch; h=
 date:from:to:cc:subject:message-id:mime-version:content-type
 :content-transfer-encoding:in-reply-to; s=fm2; bh=yNVYHwyGttFolc
 dtf+JD3fELHBUYizdTym/aOF1ZS4M=; b=lwkj/xmTGOO61KpL/oLNgRlEixijO0
 lHQ+aNp2RGHEbkaTJAjGROZdJE3rkC3NalpYZ01NWAcraRJGCUPr7aSAmGwLcfHP
 YcKZy+1sgcznNTr+/J89jmntG9NGHIjesx7YYalqzLuaKrmODtFBvP3alrwimpar
 JK+S1EdSR4YmZL+ZHKmjWoKX2iFKvWB0BevRh2xKAjK7GD8y0Gj8u3ZhtzWQJUZc
 LaQu7CIFdKk6dfSD5uLqqexh6xDcN77ZTCU3RUlN6t1ywwJmO5BdPV/nP4n/csdU
 1hZwvurza/XI9ilNWBdg33F+2PcoQNNdzxvEFUl8YaVx1v88PzgFUDQw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yNVYHwyGttFolcdtf+JD3fELHBUYizdTym/aOF1ZS4M=; b=WgbSzxBJ
 SPUeyabOptzceRPrCa6edN0Wq7s9MyZLCO0s7e7DSJHulM6ImNWRuMywH4zlT07U
 Hx8o6U1+sapDJaUeRMgKL1GUxyA3RatwWRxQHBe1zu7xt8YQr9ZGdfCmjqCIvoi7
 ldyZr9eLG3Z6Fq2LHehl97DMSNV+0UVUQCQ1isd4EVrQMCwNiVfqvwtQP7QArVwB
 VMD//XFl+VQc2+SGvkIan7fogJQFucoko9OzbDwpttUHhWPljpVSHnQEoHUGQuOp
 3x2D1gstvQhNIGrZUpAPWFRHvATHij+hJBBxR6MssJ+9FkIKveeC/N1fbQ8YPJid
 PCLz58PZar0xBw==
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>, dri-devel@lists.freedesktop.org,
 Eric Anholt <anholt@google.com>, Sean Paul <seanpaul@chromium.org>,
 Dan Willemsen <dwillemsen@google.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjAxOS0wOS0xNyAxOToxNTozNiArMDAwMCwgSm9obiBTdHVsdHogd3JvdGU6
Cj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBkZXByZWNhdGVkIEFuZHJvaWQubWsgZmlsZXMgYW5k
IHJlcGxhY2VzCj4gdGhlbSB3aXRoIEFuZHJvaWQuYnAgZmlsZXMuCj4gCj4gVGhpcyBpcyBuZWVk
ZWQgaW4gb3JkZXIgdG8gYnVpbGQgbGliZHJtL21hc3RlciBhZ2FpbnN0IHJlY2VudAo+IEFuZHJv
aWQgcmVsZWFzZXMgYW5kIEFPU1AvbWFzdGVyLCBhcyBzb21lIG9mIHRoZSBUcmVibGUgYnVpbGQK
PiBvcHRpb25zIHJlcXVpcmVkIHNpbmNlIEFuZHJvaWQgTyBjYW5ub3QgYmUgZXhwcmVzc2VkIGlu
Cj4gQW5kb3JpZC5tayBmaWxlcy4KPiAKPiBQYXRjaCBvcmlnaW5hbGx5IGJ5IERhbiBXaWxsZW1z
ZW4gd2l0aCBmaXhlcyBmb2xkZWQgaW4gYnk6Cj4gIEplcnJ5IFpoYW5nLCBFbGlvdHQgSHVnaGVz
IGFuZCBteXNlbGYuCj4gCj4gV2l0aCB0aGlzIGNoYW5nZSwgdGhlIG9ubHkgcGF0Y2hlcyBjYXJy
aWVkIGJ5IEFuZHJvaWQgZm9yIGxpYmRybQo+IHdvdWxkIGJlIHRoZSBnZXJyaXQgT1dORVJTIG1l
dGEtZGF0YSBmaWxlLgo+IAo+IENjOiBNYXVybyBSb3NzaSA8aXNzb3Iub3J1YW1AZ21haWwuY29t
Pgo+IENjOiBDaGloLVdlaSBIdWFuZyA8Y3dodWFuZ0BhbmRyb2lkLXg4Ni5vcmc+Cj4gQ2M6IFJv
YmVydCBGb3NzIDxyb2JlcnQuZm9zc0Bjb2xsYWJvcmEuY29tPgo+IENjOiBUYXBhbmkgUMOkbGxp
IDx0YXBhbmkucGFsbGlAaW50ZWwuY29tPgo+IENjOiBDaGloLVdlaSBIdWFuZyA8Y3dodWFuZ0Bh
bmRyb2lkLXg4Ni5vcmc+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9y
YS5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IENjOiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Cj4gQ2M6IEVyaWMgQW5ob2x0IDxhbmhvbHRA
Z29vZ2xlLmNvbT4KPiBDYzogSml5b25nIFBhcmsgPGppeW9uZ0Bnb29nbGUuY29tPgo+IENjOiBB
bGlzdGFpciBTdHJhY2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gQ2M6IERhbiBXaWxsZW1z
ZW4gPGR3aWxsZW1zZW5AZ29vZ2xlLmNvbT4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz4KPiBDYzogVmlzaGFsIEJob2ogPHZpc2hhbC5iaG9qQGxpbmFyby5vcmc+
Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Cj4g
LS0tCj4gSSBrbm93IGxhc3QgdGltZSB0aGlzIHdhcyBwcm9wb3NlZCwgdGhlcmUgd2FzIHNvbWUg
Y29uY2VybiBhYm91dAo+IG1haW50YWluaW5nIHN1cHBvcnQgZm9yIG9sZCBBT1NQIHJlbGVhc2Vz
IC0gYW5kIHdoaWxlIHdlIGNvdWxkCj4gc3RpbGwgc3VwcG9ydCBib3RoIHdpdGggQW5kcm9pZC5t
ayB0aGF0IHdhcyBhIGZhaXIgY29uY2Vybi4KPiAKPiBIb3dldmVyLCBub3cgdGhhdCBpdCBpcyBh
IHJlcXVpcmVtZW50IGZvciBuZXdlciByZWxlYXNlcywgSSdkCj4gY29udGVuZCB0aGF0IGJlaW5n
IGFibGUgdG8gYnVpbGQvdGVzdCBsaWJkcm0vbWFzdGVyIGFnYWluc3QKPiBBT1NQL21hc3RlciBh
bmQgcmVjZW50IHJlbGVhc2VzIGlzIG1vcmUgdmFsdWFibGUgdGhlbiBzb2xleQo+IG1haW50YWlu
aW5nIHN1cHBvcnQgZm9yIG9sZCBhbmQgdW5zdXBwb3J0ZWQgQW5kcm9pZCByZWxlYXNlcy4KCkFj
a2VkLWJ5OiBFcmljIEVuZ2VzdHJvbSA8ZXJpY0Blbmdlc3Ryb20uY2g+CgpCdXQgdG8gYmUgY2xl
YXIsIHdoYXQncyB0aGUgZWFybGllc3QgYW5kcm9pZCB2ZXJzaW9uIHRoYXQgc3VwcG9ydHMKYmx1
ZXByaW50PyAobWlnaHQgYmUgd29ydGggYWRkaW5nIHRoYXQgdG8gdGhlIGNvbW1pdCBtZXNzYWdl
KQoKPiAKPiBTbyBJIHdhbnRlZCB0byBzdWJtaXQgdGhpcyBhZ2FpbiBmb3IgZGlzY3Vzc2lvbi4K
PiAKPiB0aGFua3MKPiAtam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
