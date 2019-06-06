Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C137F3B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 23:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCA789956;
	Thu,  6 Jun 2019 21:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F9A898E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 21:07:03 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j19so4372914qtr.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 14:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6VzT2b5KE6SRaaT7i8ZO2MXs5Yi4DEtKT+QzwZhXFds=;
 b=XYofxU0QoyBgBQCEzhWUco0CA+dp134E8bgf/cdKn7yD1u8tojAKiYKU4XVuTLpyGn
 ZCtyJ3mK7APpQeNn9WqnG/MqQV1PcnsvJv6GNydf5vkYUFa8aUSwLgYUxiisIBT82Q4r
 WceqEYOeV5cn19bDzgAq+T1J2qHY/YQoq05PGYvfhT4IqkKGrPTfI9+Q2jpdZmtDIOx/
 pl1pLKocovb43sFcHGxgTb7tDYLB87c+vbZwbLTcXM+jeJuD26kZ9kEcbi8UP9VZhL0h
 e4GePTXnyt8bIEYvqnKSrFh7ffm6SL30/nqY3W+6IBGF6vayqP3HMN7viESRvcWnI9WF
 18Hw==
X-Gm-Message-State: APjAAAUOccEbynB+wAG2XXq+fN0/2/uCX+BF/FHLRY+3ZJJ/Y20Ru3Jq
 W0qXINnHgVCZi2uGBOMAZ2qFpQ==
X-Google-Smtp-Source: APXvYqwR/srw87dL6p5GI9hh3gzFGdu1FZ/5NDHCo0wNbUvkmDiQYwPIjnwd7kprs27Q3g09f+gZdQ==
X-Received: by 2002:ac8:5315:: with SMTP id t21mr32971442qtn.229.1559855222856; 
 Thu, 06 Jun 2019 14:07:02 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id m27sm72851qtc.16.2019.06.06.14.07.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 14:07:02 -0700 (PDT)
Message-ID: <8737a8c7130d5035069bc9b73f524ea6059a762a.camel@redhat.com>
Subject: Re: [PATCH 2/7] drm/dp_mst: Register AUX devices for MST ports
From: Lyude Paul <lyude@redhat.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Thu, 06 Jun 2019 17:07:01 -0400
In-Reply-To: <1acd58fd-a5e8-0f07-709a-902ea67ba760@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <1558019883-12397-3-git-send-email-sunpeng.li@amd.com>
 <3e237f325a98b044231661886329a808d6701146.camel@redhat.com>
 <a387faf3-2375-f7a8-1508-d7b4464ee2b3@amd.com>
 <c04bed17d1da34ee355f711283c68d0dc3e0da77.camel@redhat.com>
 <2dce5d6ea4fe1c082a14962ed21568dbfd743d70.camel@redhat.com>
 <1acd58fd-a5e8-0f07-709a-902ea67ba760@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
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

T24gVGh1LCAyMDE5LTA2LTA2IGF0IDE5OjQxICswMDAwLCBMaSwgU3VuIHBlbmcgKExlbykgd3Jv
dGU6Cj4gCj4gT24gMjAxOS0wNi0wMyAzOjI4IHAubS4sIEx5dWRlIFBhdWwgd3JvdGU6Cj4gPiA+
IEknbSByZXByb2R1Y2luZyB0aGlzIGp1c3QgYnkgcmVsb2FkaW5nIGk5MTUgb24gYSBtYWNoaW5l
IHdpdGggc29tZSBNU1QKPiA+ID4gZGlzcGxheXMgY29ubmVjdGVkLiBJIHVwbG9hZGVkIGEgY29w
eSBvZiB0aGUgc2NyaXB0IHRoYXQgSSB1c2UgdG8gZG8KPiA+ID4gdGhpcwo+ID4gPiBoZXJlOgo+
ID4gPiAKPiA+ID4gaHR0cHM6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35seXVkZXNzL2FyY2hp
dmUvMDYtMDMtMjAxOS91bmxvYWRncHVtb2Quc2gKPiA+IG9vcHMtYWxtb3N0IGZvcmdvdCB0byBt
ZW50aW9uLiBUaGUgYXJndW1lbnQgeW91IHBhc3MgdG8gbWFrZSBpdCByZWxvYWQKPiA+IGluc3Rl
YWQKPiA+IG9mIGp1c3QgdW5sb2FkaW5nIGlzIC0tcmVsb2FkCj4gPiAKPiAKPiBUaGFua3MgZm9y
IHRoZSBzY3JpcHQhCj4gCj4gU28sIHRoZSB3YXJuaW5nIGhhcyB0byBkbyB3aXRoOgo+IAo+IDEu
IEhhdmluZyB0aGUgYXV4IGRldmljZSBhcyBhIGNoaWxkIG9mIGNvbm5lY3RvciBkZXZpY2UsIGFu
ZAo+IDIuIER1cmluZyBkcml2ZXIgdW5sb2FkLCBkcm1fY29ubmVjdG9yX3VucmVnaXN0ZXIoKSBp
cyBjYWxsZWQgYmVmb3JlCj4gICAgIGRybV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQoKQo+IAo+
IFdoaWNoIG1lYW5zIHRoYXQgY29ubmVjdG9yX3VucmVnaXN0ZXIoKSB3aWxsIHJlY3Vyc2l2ZWx5
IHJlbW92ZSB0aGUKPiBjaGlsZCBhdXggZGV2aWNlLCBiZWZvcmUgcHV0X3BvcnQoKSBjYW4gcHJv
cGVybHkgdW5yZWdpc3RlciBpdC4gQW55Cj4gZnVydGhlciBhdHRlbXB0cyB0byByZW1vdmUgYWZ0
ZXIgdGhlIGZpcnN0IHdpbGwgdGhyb3cgYSAibm90IGZvdW5kIiB3YXJuaW5nLgo+IAo+IENhbGwt
c3RhY2tzIGZvciByZWZlcmVuY2U6Cj4gCj4gICAgKmRybV9jb25uZWN0b3JfdW5yZWdpc3Rlcior
MHgzNy8weDYwIFtkcm1dCj4gICAgZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyX2FsbCsweDMwLzB4
NjAgW2RybV0KPiAgICBkcm1fbW9kZXNldF91bnJlZ2lzdGVyX2FsbCsweGUvMHgzMCBbZHJtXQo+
ICAgIGRybV9kZXZfdW5yZWdpc3RlcisweDljLzB4YjAgW2RybV0KPiAgICBpOTE1X2RyaXZlcl91
bmxvYWQrMHg3My8weDEyMCBbaTkxNV0KPiAKPiAgICBkcm1fZHBfYXV4X3VucmVnaXN0ZXJfZGV2
bm9kZSsweGY1LzB4MTgwIFtkcm1fa21zX2hlbHBlcl0KPiAgICAqZHJtX2RwX21zdF90b3BvbG9n
eV9wdXRfcG9ydCorMHg0ZS8weGYwIFtkcm1fa21zX2hlbHBlcl0KPiAgICBkcm1fZHBfbXN0X3Rv
cG9sb2d5X3B1dF9tc3RiKzB4OTEvMHgxNjAgW2RybV9rbXNfaGVscGVyXQo+ICAgIGRybV9kcF9t
c3RfdG9wb2xvZ3lfbWdyX3NldF9tc3QrMHgxMmIvMHgyYjAgW2RybV9rbXNfaGVscGVyXQo+ICAg
ID8gX19maW5pc2hfc3dhaXQrMHgxMC8weDQwCj4gICAgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jf
ZGVzdHJveSsweDExLzB4YTAgW2RybV9rbXNfaGVscGVyXQo+ICAgIGludGVsX2RwX2VuY29kZXJf
Zmx1c2hfd29yaysweDMyLzB4YjAgW2k5MTVdCj4gICAgaW50ZWxfZGRpX2VuY29kZXJfZGVzdHJv
eSsweDMyLzB4NjAgW2k5MTVdCj4gICAgZHJtX21vZGVfY29uZmlnX2NsZWFudXArMHg1MS8weDJl
MCBbZHJtXQo+ICAgIGludGVsX21vZGVzZXRfY2xlYW51cCsweGM4LzB4MTQwIFtpOTE1XQo+ICAg
IGk5MTVfZHJpdmVyX3VubG9hZCsweGEwLzB4MTIwIFtpOTE1XQo+IAo+IEEgc29sdXRpb24gaXMg
dG8gdW5yZWdpc3RlciB0aGUgYXV4IGRldmljZSBpbW1lZGlhdGVseSBiZWZvcmUgdGhlCj4gY29u
bmVjdG9yIGRldmljZSBpcyB1bnJlZ2lzdGVyZWQgLSBpZiB3ZSBhcmUgdG8ga2VlcCB0aGUgYXV4
IGRldmljZSBhcyBhCj4gY2hpbGQuIEZvbGxvd2luZyBjdXJyZW50IHNjaGVtZSB3aXRoIFNTVCwg
aXQgbG9va3MgbGlrZQo+IGRybV9jb25uZWN0b3JfZnVuY3MtPmVhcmx5X3VucmVnaXN0ZXIoKSBp
cyB0aGUgcmlnaHQgcGxhY2UgdG8gZG8gc28uCj4gVG8ga2VlcCB0aGUgYmFsYW5jZSwgYXV4IHJl
Z2lzdHJhdGlvbiB3aWxsIHRoZW4gaGFwcGVuIGluCj4gZHJtX2Nvbm5lY3Rvcl9mdW5jcy0+bGF0
ZV9yZWdpc3RlcigpLiBUaGlzIHdpbGwgbGVhdmUgdGhlIFNEUAo+IHRyYW5zYWN0aW9uIGhhbmRs
aW5nIHBhcnQgaW4gRFJNIHN0aWxsLCBidXQgcGFzcyB0aGUgcmVzcG9uc2liaWxpdHkgb2YKPiBj
cmVhdGluZyBhbmQgcmVtb3ZpbmcgcmVtb3RlIChmYWtlKSBhdXggZGV2aWNlcyB0byB0aGUgZHJp
dmVyLgo+IAo+IEkgaGF2ZSBhIFdJUCBwYXRjaCBoZXJlIGZvciB5b3UgdG8gdGFrZSBhIGxvb2su
IEl0IHNob3VsZCBhcHBseSBvbiB0b3AKPiBvZiB0aGUgZXhpc3RpbmcgcGF0Y2hzZXQ6Cj4gaHR0
cHM6Ly9wYXN0ZWJpbi5jb20vMVlKWmhMNEMKPiAKClRoaXMgYXBwcm9hY2ggc2VlbXMgZmluZSB0
byBtZSEgSSB3YXMgdGhpbmtpbmcgd2UgbWlnaHQgZW5kIHVwIGRvaW5nIHNvbWV0aGluZwpsaWtl
IHRoaXMuIE15IG9ubHkgdGhvdWdodCBpcyB0aGF0IHdlIGNhbiBwcm9iYWJseSB3cml0ZSB1cCBh
CmRybV9kcF9tc3RfY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoKSBhbmQKZHJtX2RwX21zdF9jb25u
ZWN0b3JfZWFybHlfdW5yZWdpc3RlcigpIHRoYXQgZHJpdmVycyBjYW4gY2FsbCBmcm9tIHRoZWly
CuKGkmxhdGVfcmVnaXN0ZXIoKS/ihpJlYXJseV91bnJlZ2lzdGVyKCkgY2FsbGJhY2tzIHRoYXQg
aGFuZGxlcyBwcmludGluZyB0aGUgZGVidWcKbWVzc2FnZSwgc2V0dGluZyB0aGUgcGFyZW50IGFu
ZCByZWdpc3RlcmluZy91bnJlZ2lzdGVyaW5nIHRoZSBhdXggZGV2aWNlLiBJJ2QKaW1hZ2luZSBz
b21lZGF5IGluIHRoZSBmdXR1cmUgd2UnbGwgcHJvYmFibHkgaGF2ZSBtb3JlIHRoaW5ncyB0byBh
ZGQgdG8gdGhvc2UKY2FsbGJhY2tzIGZvciBtc3QgYXMgd2VsbC4KCj4gSSdkIGxpa2UgdG8gaGVh
ciB5b3VyIHRob3VnaHRzLCBiZWZvcmUgSSBnbyBhbmQgbW9kaWZ5IG90aGVyIGRyaXZlcnMgOikK
PiAKPiBUaGFua3MsCj4gTGVvCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
