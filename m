Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601E20F8A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 22:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F358897D7;
	Thu, 16 May 2019 20:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B112897D7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 20:18:28 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d4so3101046qkc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 13:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=tdK4E9Lx+sp3620vom4ttzKTlo5fje2KIVxduFaRmGo=;
 b=KfgQHBNZuZj1QYESHWHfj2N+D9Nr6990SA4Q+dlZCdZkDGTxbrvDQOXIA6sdNofjlH
 YJAC9uC54+7ufjW+jZicGpCmA9q7hJpCOpiSuYm30DF35MG8WwpW239IkN6JPJ7NgWVo
 IBhiDR4gU64UPwav1LbNpYZuLBe9tLzYmOiCotqdDJpAozUYVDr7MP5y0ey1hSYJhZLu
 miF9xk4hwvWPHnfeO1z2GaVoQCA84GrKEJ5Cgh9BquD/Etvfhwr/Aw3+D5MqOGHtBHLw
 0QilRjAU/G+JR/Um7ZJrgneysi1ZHsvuzGF84n6cGmnvZEa98NXPbFEy0vZitiEgytPx
 0IDg==
X-Gm-Message-State: APjAAAVAnlzVuXZhixdhtscwq+55NFM6JJxitU4N3mi2kRH8mavF4LWM
 h7yI6oMev/hWKHiKI1IGKPCBlPhcg2JP7w==
X-Google-Smtp-Source: APXvYqyaocMeWgez8AwXmjVQFCAGXG7caFemw5sZLILualmUbRnS8JMDuvv483CBNlnyrXfs3DUYLQ==
X-Received: by 2002:a05:620a:1019:: with SMTP id
 z25mr35071875qkj.46.1558037907608; 
 Thu, 16 May 2019 13:18:27 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id f35sm3730609qte.71.2019.05.16.13.18.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 13:18:26 -0700 (PDT)
Message-ID: <826a1c42cb64df2cd2b1a163f57255bd109b6c18.camel@redhat.com>
Subject: Re: [PATCH 0/7] Add DP MST AUX devices
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 16 May 2019 16:18:25 -0400
In-Reply-To: <2248d762446e824def09699f0ef719b9c90d0dbc.camel@redhat.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <2248d762446e824def09699f0ef719b9c90d0dbc.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hvb3BzLW9uZSBtb3JlIHRoaW5nIEkgZm9yZ290IHRvIG1lbnRpb24uIFRoaXMgaXMganVzdCBw
ZXJzb25hbCBwcmVmZXJlbmNlCmZvciBtZSwgYnV0IGlmIHlvdSdyZSBjY2luZyBtZSBvbiBhbnkg
b2YgdGhlIHBhdGNoZXMgaW4gdGhlIHNlcmllcyBmZWVsIGZyZWUKdG8ganVzdCBkbyBpdCBmb3Ig
YWxsIG9mIHRoZW0uIE1ha2VzIG15IGluYm94IGEgbGl0dGxlIGxlc3MgY29uZnVzaW5nIHRvIGxv
b2sKYXQKCk9uIFRodSwgMjAxOS0wNS0xNiBhdCAxNTo1NCAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBIaSwgY291bGQgd2UgKGFuZCBmb3IgZnV0dXJlIHZlcnNpb25zIG9mIHRoaXMgc2VyaWVz
IGFuZCBvdGhlcnMpIGdldCBhCj4gcmVzcGluCj4gb2YgdGhpcyB0aGF0J3MgYWN0dWFsbHkgcmVi
YXNlZCBhZ2FpbnN0IGRybS10aXA/IFRoYXQgaXMgdGhlIGRlZmFjdG8KPiBzdGFuZGFyZAo+IGJy
YW5jaCB0byBkbyBkZXZlbG9wbWVudCBvbiwgYW5kIG90aGVyd2lzZSBhbnlvbmUgdHJ5aW5nIHRv
IHRlc3QgdGhlc2UKPiBwYXRjaGVzCj4gaGFzIHRvIHJlc29sdmUgbWVyZ2UgY29uZmxpY3RzIChh
bG9uZyB3aXRoIG1haW50YWluZXJzKS4gVGhlIGJyYW5jaCB0aGlzCj4gYXBwZWFycyB0byBiZSBi
YXNlZCBvZmYgb2YgZG9lc24ndCBldmVuIGhhdmUgdGhlIG5ldyBrcmVmIHNjaGVtZSBmb3IgYnJh
bmNoCj4gZGV2aWNlcyBhbmQgcG9ydHMuCj4gCj4gT24gVGh1LCAyMDE5LTA1LTE2IGF0IDExOjE3
IC0wNDAwLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6Cj4gPiBGcm9tOiBMZW8gTGkgPHN1bnBl
bmcubGlAYW1kLmNvbT4KPiA+IAo+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBNU1Qg
QVVYIGRldmljZXMuIAo+ID4gCj4gPiBBIG1vcmUgZGVzY3JpcHRpdmUgJ21zdHBhdGgnIGF0dHJp
YnV0ZSBpcyBhbHNvIGFkZGVkIHRvIE1TVCBjb25uZWN0b3IKPiA+IGRldmljZXMuIEluIGFkZGl0
aW9uLCB0aGUgRFAgYXV4IGRldmljZSBpcyBtYWRlIHRvIGJlIGEgY2hpbGQgb2YgdGhlCj4gPiBj
b3JyZXNwb25kaW5nIGNvbm5lY3RvcidzIGRldmljZSB3aGVyZSBwb3NzaWJsZSAoKikuIFRoaXMg
YWxsb3dzIHVkZXYKPiA+IHJ1bGVzIHRvIHByb3ZpZGUgZGVzY3JpcHRpdmUgc3ltbGlua3MgdG8g
dGhlIEFVWCBkZXZpY2VzLgo+ID4gCj4gPiAoKikgVGhpcyBjYW4gb25seSBiZSBkb25lIG9uIGRy
aXZlcnMgdGhhdCByZWdpc3RlciB0aGVpciBjb25uZWN0b3IgYW5kCj4gPiBhdXggZGV2aWNlcyB2
aWEgZHJtX2Nvbm5lY3Rvcl9yZWdpc3RlcigpIGFuZCBkcm1fZHBfYXV4X3JlZ2lzdGVyKCkKPiA+
IHJlc3BlY3RpdmVseS4gVGhlIGNvbm5lY3RvciBhbHNvIG5lZWRzIHRvIGJlIHJlZ2lzdGVyZWQg
YmVmb3JlIHRoZSBhdXgKPiA+IGRldmljZS4KPiA+IAo+ID4gTGVvIExpICg2KToKPiA+ICAgZHJt
L2RwOiBVc2Ugbm9uLWN5Y2xpYyBpZHIKPiA+ICAgZHJtL2RwLW1zdDogVXNlIGNvbm5lY3RvciBr
ZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50Cj4gPiAgIGRybS9zeXNmczogQWRkIG1zdHBhdGggYXR0
cmlidXRlIHRvIGNvbm5lY3RvciBkZXZpY2VzCj4gPiAgIGRybS9hbWQvZGlzcGxheTogVXNlIGNv
bm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50Cj4gPiAgIGRybS9icmlkZ2UvYW5hbG9n
aXgtYW54Nzh4eDogVXNlIGNvbm5lY3RvciBrZGV2IGFzIGF1eCBkZXZpY2UgcGFyZW50Cj4gPiAg
IGRybS9ub3V2ZWF1OiBVc2UgY29ubmVjdG9yIGtkZXYgYXMgYXV4IGRldmljZSBwYXJlbnQKPiA+
IAo+ID4gVmlsbGUgU3lyasOkbMOkICgxKToKPiA+ICAgZHJtL2RwX21zdDogUmVnaXN0ZXIgQVVY
IGRldmljZXMgZm9yIE1TVCBwb3J0cwo+ID4gCj4gPiAgLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICAgfCAgIDIgKy0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyAgICAgICAgICB8ICAyMiArKy0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfYXV4X2Rldi5jICAgICAgICAgICAgICAgICAgIHwgIDE3ICsrKy0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgICAgICB8
IDEwNgo+ID4gKysrKysrKysrKysrKysrKysrLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9z
eXNmcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjMgKysrKysKPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jICAgICAgICB8ICAgMiArLQo+ID4gIGlu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsK
PiA+ICBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgICAgICAgICAgICAgICB8
ICAgNiArKwo+ID4gIDggZmlsZXMgY2hhbmdlZCwgMTUyIGluc2VydGlvbnMoKyksIDMwIGRlbGV0
aW9ucygtKQo+ID4gCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
