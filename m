Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04262B6FA
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081676E20D;
	Mon, 27 May 2019 13:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0DF6E20D;
 Mon, 27 May 2019 13:49:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u78so3391068wmu.5;
 Mon, 27 May 2019 06:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hKmWbxQcsUMlzPsi91vx3IreUGSUr6LXOqcfSNu/oSI=;
 b=GnAed9qs5oKlXyuC+B3Qs0LewfP5vbHcSzURM+Q4YctE7LyN+44REZvjWh4YKilZrH
 qNR8A0eOqbNc3LXgeHOr2aUhaRv7toZ6QiGS0rG43cImh2guqbbJvqIfgDDllzCwTM00
 7uVpd6gCjlqTqSWwbRsZAFvdQ4sJyiEK5Y9FiTNYxWej/mF+MsHPudUiF4Xw6F3lzflE
 M3cgFa6V2hNvQaQpONpIf/cNtC1WVSfJZ1JiMlqfQkckp2LBHpUELIutK+p/xbLO+Wh1
 Gzx6S4AzJ8CGe5YRSgdnGxd4BWoqYY+I3yb16cMBDGGwr9NUSXFC39/FIQFbGS8wiU2G
 xyYQ==
X-Gm-Message-State: APjAAAX/JdbBLN8qWaadmUiJ5gN5yub0F6CL2fqI9ucLKiUXksLwWk0z
 vXOcgpFCYQrvRmfZbqz11S4eJ6qF
X-Google-Smtp-Source: APXvYqxUTgnvSOR8oDyUt9l3ADRrJiEWJOBXyBuP2q6Dte8LHsZqAL+kScambimrrHctvaSnGgpVIQ==
X-Received: by 2002:a1c:e90c:: with SMTP id q12mr4375443wmc.128.1558964958155; 
 Mon, 27 May 2019 06:49:18 -0700 (PDT)
Received: from arch-x1c3 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net.
 [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id b12sm14117567wmg.27.2019.05.27.06.49.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 27 May 2019 06:49:17 -0700 (PDT)
Date: Mon, 27 May 2019 14:47:52 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190527134752.GI15067@arch-x1c3>
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527131143.GN21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527131143.GN21222@phenom.ffwll.local>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=hKmWbxQcsUMlzPsi91vx3IreUGSUr6LXOqcfSNu/oSI=;
 b=R3/qIO0kXvt5/yTqgRE8laHuVAIGlycFUN2F5GIAqcNPa5HDNm2wCvpQ6lfgEAZZ0z
 Bdg3INiPQQnOwBd1lrzi+ooKGEQXYYtzO0GFcl8vWSbJ37GQYP7rvhhIEDyFcGcZLIfs
 +dzimqaRkPn+RiNF1zvkBKThptkThv33aQdSJ7wa5OSrF50wi4cHDVsCpO8eR8mggUpg
 JI/yKvvclKYmlPVc2kpQWx1ik9njG3wxKed1CP44Da6lOHUZoPLLDdCG5LCGBTK2d50+
 fkHoW5Wb220lEOdbo43xpILLx0fKWaB9u9GkbBLsBR6hyH7pJsrUgX2x9iAffkAiguMU
 rl1Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yNywgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIE1heSAyNywgMjAx
OSBhdCAwOToxNzoyOUFNICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiBGcm9tOiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gCj4gPiBDdXJyZW50bHkg
b25lIGNhbiBjaXJjdW12ZW50IERSTV9BVVRILCB3aGVuIHRoZSBpb2N0bCBpcyBleHBvc2VkIHZp
YSB0aGUKPiA+IHJlbmRlciBub2RlLiBBIHNlZW1pbmdseSBkZWxpYmVyYXRlIGRlc2lnbiBkZWNp
c2lvbi4KPiA+IAo+ID4gSGVuY2Ugd2UgY2FuIGRyb3AgdGhlIERSTV9BVVRIIGFsbCB0b2dldGhl
ciAoZGV0YWlscyBpbiBmb2xsb3ctdXAgcGF0Y2gpCj4gPiB5ZXQgbm90IGFsbCB1c2Vyc3BhY2Ug
Y2hlY2tzIGlmIGl0J3MgYXV0aGVudGljYXRlZCwgYnV0IGluc3RlYWQgdXNlcwo+ID4gdW5jb21t
b24gYXNzdW1wdGlvbnMuCj4gPiAKPiA+IEFmdGVyIGRheXMgb2YgZGlnZ2luZyB0aHJvdWdoIGdp
dCBsb2cgYW5kIHRlc3RpbmcsIG9ubHkgYSBzaW5nbGUgKGFiKXVzZQo+ID4gd2FzIHNwb3R0ZWQg
LSB0aGUgTWVzYSBSQURWIGRyaXZlciwgdXNpbmcgdGhlIEFNREdQVV9JTkZPIGlvY3RsIGFuZAo+
ID4gYXNzdW1pbmcgdGhhdCBmYWlsdXJlIGltcGxpZXMgbGFjayBvZiBhdXRoZW50aWNhdGlvbi4K
PiAKPiBNYXliZSBjb3JyZWN0aW9uIGhlcmU6IElkIGRvZXMgbm90IGNhcmUgYWJvdXQgYXV0aGVu
dGljYXRpb24gYXQgYWxsLiBJdAo+IHdhbnRzIHRvIGZpZ3VyZSBvdXQgd2hldGhlciBpdCBoYXMg
YWNjZXNzIHRvIG1vZGVzZXQgcmVzb3VyY2VzLCB3aGljaCBpcwo+IHNvbWV0aGluZyBlbnRpcmVs
eSBkaWZmZXJlbnQsIGJ1dCBoYXBwZW5lZCB0byBtYXRjaCBpbiBhbWRncHUncyBjYXNlLgo+IApJ
dCBmZWVscyBsaWtlIHdlIGhhdmUgY29uZmxhdGVkIHRoZSB0d28gKHBlcmhhcHMgZHVlIHRvIGhp
c3RvcmljYWwKcmVhc29ucykgYW5kIEknbSBub3QgMTAwJSBzdXJlIHdoaWNoIG9uZSB0aGUgQU1E
R1BVIGNvZGUgaW5zcGVjdHMuCgpIb3cgYWJvdXQ6CgpIZW5jZSB3ZSBjYW4gZHJvcCB0aGUgRFJN
X0FVVEggYWxsIHRvZ2V0aGVyIChkZXRhaWxzIGluIGZvbGxvdy11cCBwYXRjaCkKeWV0IHRoYXQg
Y2F1c2UgYSByZWdyZXNzaW9uIGluIHNvbWUgdXNlcnNwYWNlLCB3aGVuIGl0IGNvbmZsYXRlcyB0
aGUKYXV0aGVudGljYXRpb24gc3RhdHVzIHdpdGggYWNjZXNzIHRvIG1vZGVzZXQgcmVzb3VyY2Vz
LgoKQWZ0ZXIgZGF5cyBvZiBkaWdnaW5nIHRocm91Z2ggZ2l0IGxvZyBhbmQgdGVzdGluZywgb25s
eSBhIHNpbmdsZSAoYWIpdXNlCndhcyBzcG90dGVkIC0gdGhlIE1lc2EgUkFEViBkcml2ZXIsIHVz
aW5nIHRoZSBBTURHUFVfSU5GTyBpb2N0bC4KCj4gPiBBZmZlY3RlZCB2ZXJzaW9ucyBhcmU6Cj4g
PiAgLSB0aGUgd2hvbGUgMTguMi54IHNlcmllcywgd2hpY2ggaXMgRU9MCj4gPiAgLSB0aGUgd2hv
bGUgMTguMy54IHNlcmllcywgd2hpY2ggaXMgRU9MCj4gPiAgLSB0aGUgMTkuMC54IHNlcmllcywg
cHJpb3IgdG8gMTkuMC40Cj4gCj4gSG0gSSB0aGluayBJJ20gYmxpbmQsIEknbSBub3Qgc2VlaW5n
IHRoZSBmaXggbWVyZ2VkIHRvIG1lc2EgbWFzdGVyLiBTdGlsbAo+IHRoZXJlIG9uIGdpdGxhYjoK
PiAKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhL2Jsb2IvbWFzdGVy
L3NyYy9hbWQvdnVsa2FuL3JhZHZfZGV2aWNlLmMjTDI5MQo+IAo+IFdoYXQgYW0gSSBtaXNzaW5n
Pwo+IApPcHRlZCBmb3IgYSBzaW1wbGUsIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiBzZWUgY29tbWl0
CmM5NjJhNzhmMTgyODRlMjk3MTMwMWJmNjhjOWM2MDUwMGNhMzk4ZTQKClRoaXMgd2F5LCB0aGUg
c2FtZSBjaGVjayBpczoKIC0gZW5mb3JjZWQgd2hlcmUgaXQncyB1c2VkCiAtIHByZXNlbnQgZm9y
IGFsbCBNZXNhIFZ1bGthbiBkcml2ZXJzCgoKV2lsbCBpbmNsdWRlIHRoZSBzaGEgKyBjb21taXQg
dGl0bGUgZm9yIHYyLgoKPiA+IEFkZCBhIHNwZWNpYWwgcXVpcmsgZm9yIHRoYXQgY2FzZSwgdGh1
cyB3ZSBjYW4gZHJvcCBEUk1fQVVUSCBiaXRzIGFzCj4gPiBtZW50aW9uZWQgZWFybGllci4KPiA+
IAo+ID4gU2luY2UgYWxsIHRoZSBhZmZlY3RlZCB1c2Vyc3BhY2UgaXMgRU9MLCB3ZSBhbHNvIGFk
ZCBhIGtjb25maWcgb3B0aW9uCj4gPiB0byBkaXNhYmxlIHRoaXMgcXVpcmsuCj4gPiAKPiA+IFRo
ZSB3aG9sZSBhcHByb2FjaCBpcyBpbnNwaXJlZCBieSBEUklWRVJfS01TX0xFR0FDWV9DT05URVhU
Cj4gPiAKPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4g
PiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gQ2M6
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+
IFNpZ25lZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+
Cj4gCj4gQXNpZGUgZnJvbSB0aGUgbml0cyBJIHRoaW5rIHJlYXNvbmFibGUgYXBwcm9hY2guCgpH
cmVhdCwgZ2xhZCB0byBoZWFyLiBOb3cgYWxsIHdlIG5lZWQgaXMgdG8gYnJpYmVeV2NvbnZpbmNl
IENocmlzdGlhbi4KClRoYW5rcwpFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
