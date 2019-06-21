Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3BB4E11B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 09:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006CE6E81C;
	Fri, 21 Jun 2019 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A0E6E7FD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:07:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 131so4907608ljf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 23:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9yu4HSEFQB/5s0MGFMv/v6edNeSRElBvgtV5j+2Bf54=;
 b=thVjzY+YgDZM7RgD94K8p/dquxUjsZJWj+FwOG31yM0Utxfmy5tjFXEwZ2fDcvVg5c
 PWmj9wxlWtWKAY/eekH7aQb+LX8lKpB4DRj62bZA3axK6Zfhyps1Lh0HuM8sRlFlpuL+
 fxfry9ddOY55Js41xqVHDvQ5rmDSVGD6NMBaf6h8Fsnqr7LZGy3d1hbXIhhF1TjdKSr0
 Ikp/NzvqUr0OMbIU+EIbd6Sfi4UVzQyX21fGjshaEmTU1CzDQbjzHpF7uZA+6WTUK6Iy
 jKByiU9D8hitLVnYy9gD5boilJ3m3dsWZH4M/YT83KTwMz6r4FFIWIJqtEiqY/XhbHcM
 cycQ==
X-Gm-Message-State: APjAAAXXm3tzIl1MmA1dhVFRncuXqeWvDMHnHCniVXtc7XDtC8pAI3TL
 rNE71eGw2vXeQVuKYHOfmfPBDSuHieM=
X-Google-Smtp-Source: APXvYqz70rba/60VvzCtKCMldsJa3mPAW8wapGf5E6NQg7x9A3zSqZflWZHAENAARTuGV9unp0ns9A==
X-Received: by 2002:a2e:635d:: with SMTP id x90mr62800460ljb.140.1561097272288; 
 Thu, 20 Jun 2019 23:07:52 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
 by smtp.gmail.com with ESMTPSA id p27sm248692lfh.8.2019.06.20.23.07.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 23:07:52 -0700 (PDT)
Date: Fri, 21 Jun 2019 09:07:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm: Permit video-buffers writecombine mapping for MIPS
Message-ID: <20190621060749.chc6fbvlnvghr7c7@mobilestation>
References: <20190423123122.32573-1-fancer.lancer@gmail.com>
 <20190617134729.pd24boyqe2viyihm@mobilestation>
 <20190618195204.GC25413@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618195204.GC25413@art_vandelay>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 21 Jun 2019 07:22:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9yu4HSEFQB/5s0MGFMv/v6edNeSRElBvgtV5j+2Bf54=;
 b=lkdEM7vacGyFN0Z4NzAZmljsOeH3j7T8awktE+e9fFfsgbp2Z8BY8puUgycrbCT6/p
 zk+lIF36ElExZ5YZukqh75W9kxz25S+PIUepwjwrO8eX7iWvNmBznVIDbZtBUMsjld6N
 /n+f5bTzg5R5lKicFa+M4Rlio7uW2kt/RUEiyFgVxSBqIF/BVsZNDrdFDxEykyyQk9CA
 i6uSQ5AuF+VsdiBqBAES3Ck11nNMswESSlpjMXkjADxKr9l5OfKZ4fHwJNEXkFXkPwjj
 lofvGlYQjRdNYFDc1d84OprmyUnUoKYGcmD3cMDn7SMi0AvHYkXUw2jxt0sSfr/zyb47
 gl8w==
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
Cc: "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Paul Burton <paul.burton@mips.com>,
 Huang Rui <ray.huang@amd.com>, Ralf Baechle <ralf@linux-mips.org>,
 James Hogan <jhogan@kernel.org>, Junwei Zhang <Jerry.Zhang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gU2VhbiwKCk9uIFR1ZSwgSnVuIDE4LCAyMDE5IGF0IDAzOjUyOjA0UE0gLTA0MDAsIFNl
YW4gUGF1bCB3cm90ZToKPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwNDo0NzozMFBNICswMzAw
LCBTZXJnZSBTZW1pbiB3cm90ZToKPiA+IEhlbGxvIGZvbGtzLAo+ID4gCj4gPiBBbnkgdXBkYXRl
cyBvZiB0aGlzIHBhdGNoIHN0YXR1cz8gSXQgaGFzIGJlZW4gaGVyZSBmb3IgYWJvdXQgdHdvIG1v
bnRocy4KPiA+IAo+IAo+IFNvcnJ5IGZvciB0aGUgbWl4dXAsIGxvb2tzIGxpa2UgdGhpcyBvbmUg
anVzdCBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4gSSd2ZQo+IGFwcGxpZWQgaXQgdG8gZHJtLW1p
c2MtbmV4dCB3aXRoIHRoZSBhdHRhY2hlZCBBY2sgYW5kIFJldmlldy4KPiAKCkdyZWF0ISBUaGFu
ayB5b3UuCgpSZWdhcmRzLAotU2VyZ2V5Cgo+IFNlYW4KPiAKPiAKPiA+IFJlZ2FyZHMsCj4gPiAt
U2VyZ2V5Cj4gPiAKPiA+IE9uIFR1ZSwgQXByIDIzLCAyMDE5IGF0IDAzOjMxOjIyUE0gKzAzMDAs
IFNlcmdlIFNlbWluIHdyb3RlOgo+ID4gPiBTaW5jZSBjb21taXQgNGIwNTBiYTdhNjZjICgiTUlQ
UzogcGd0YWJsZS5oOiBJbXBsZW1lbnQgdGhlCj4gPiA+IHBncHJvdF93cml0ZWNvbWJpbmUgZnVu
Y3Rpb24gZm9yIE1JUFMiKSBhbmQgY29tbWl0IGM0Njg3YjE1YTg0OCAoIk1JUFM6IEZpeAo+ID4g
PiBkZWZpbml0aW9uIG9mIHBncHJvdF93cml0ZWNvbWJpbmUoKSIpIHdyaXRlLWNvbWJpbmUgdm1h
IG1hcHBpbmcgaXMKPiA+ID4gYXZhaWxhYmxlIHRvIGJlIHVzZWQgYnkga2VybmVsIHN1YnN5c3Rl
bXMgZm9yIE1JUFMuIEluIHBhcnRpY3VsYXIgdGhlCj4gPiA+IHVuY2FjaGVkIGFjY2VsZXJhdGVk
IGF0dHJpYnV0ZSBpcyByZXF1ZXN0ZWQgdG8gYmUgc2V0IGJ5IGlvcmVtYXBfd2MoKQo+ID4gPiBt
ZXRob2QgYW5kIGJ5IGdlbmVyaWMgUENJIG1lbW9yeSBwYWdlcy9yYW5nZXMgbWFwcGluZyBtZXRo
b2RzLiBUaGUgc2FtZQo+ID4gPiBpcyBkb25lIGJ5IHRoZSBkcm1faW9fcHJvdCgpL3R0bV9pb19w
cm90KCkgZnVuY3Rpb25zIGluIGNhc2UgaWYKPiA+ID4gd3JpdGUtY29tYmluZSBmbGFnIGlzIHNl
dCBmb3Igdm1hJ3MgcGFzc2VkIGZvciBtYXBwaW5nLiBCdXQgZm9yIHNvbWUKPiA+ID4gcmVhc29u
IHRoZSBwZ3Byb3Rfd3JpdGVjb21iaW5lKCkgbWV0aG9kIGNhbGxpbmcgaXMgaWZkZWZlZCB0byBi
ZSBhCj4gPiA+IHBsYXRmb3JtLXNwZWNpZmljIHdpdGggTUlQUyBzeXN0ZW0gYmVpbmcgbWFya2Vk
IGFzIGxhY2tpbmcgb2Ygb25lLiBBdCB0aGUKPiA+ID4gdmVyeSBsZWFzdCBpdCBkb2Vzbid0IHJl
ZmxlY3QgdGhlIGN1cnJlbnQgTUlQUyBwbGF0Zm9ybSBpbXBsZW1lbnRhdGlvbi4KPiA+ID4gU28g
aW4gb3JkZXIgdG8gaW1wcm92ZSB0aGUgRFJNIHN1YnN5c3RlbSBwZXJmb3JtYW5jZSBvbiBNSVBT
IHdpdGggVUNBCj4gPiA+IG1hcHBpbmcgZW5hYmxlZCwgd2UgbmVlZCB0byBoYXZlIHBncHJvdF93
cml0ZWNvbWJpbmUoKSBjYWxsZWQgZm9yIGJ1ZmZlcnMsCj4gPiA+IHdoaWNoIG5lZWQgc3RvcmUg
b3BlcmF0aW9ucyBiZWluZyBjb21iaW5lZC4gSW4gY2FzZSBpZiBwYXJ0aWN1bGFyIE1JUFMKPiA+
ID4gY2hpcCBkb2Vzbid0IHN1cHBvcnQgdGhlIFVDQSBhdHRyaWJ1dGUsIHRoZSBtYXBwaW5nIHdp
bGwgZmFsbCBiYWNrIHRvCj4gPiA+IG5vbmNhY2hlZC4KPiA+ID4gCj4gPiA+IENjOiBSYWxmIEJh
ZWNobGUgPHJhbGZAbGludXgtbWlwcy5vcmc+Cj4gPiA+IENjOiBQYXVsIEJ1cnRvbiA8cGF1bC5i
dXJ0b25AbWlwcy5jb20+Cj4gPiA+IENjOiBKYW1lcyBIb2dhbiA8amhvZ2FuQGtlcm5lbC5vcmc+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZhZGltIFYuIFZsYXNvdiA8dmFkaW0udmxhc292QHQtcGxh
dGZvcm1zLnJ1Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNl
ckBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV92bS5jICAg
ICAgICAgIHwgNSArKystLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5j
IHwgNCArKy0tCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Zt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZtLmMKPiA+ID4gaW5kZXggYzMzMDEwNDZkZmFhLi41
MDE3OGRjNjQwNjAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdm0uYwo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZtLmMKPiA+ID4gQEAgLTYyLDcgKzYyLDgg
QEAgc3RhdGljIHBncHJvdF90IGRybV9pb19wcm90KHN0cnVjdCBkcm1fbG9jYWxfbWFwICptYXAs
Cj4gPiA+ICAJLyogV2UgZG9uJ3Qgd2FudCBncmFwaGljcyBtZW1vcnkgdG8gYmUgbWFwcGVkIGVu
Y3J5cHRlZCAqLwo+ID4gPiAgCXRtcCA9IHBncHJvdF9kZWNyeXB0ZWQodG1wKTsKPiA+ID4gIAo+
ID4gPiAtI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVm
aW5lZChfX3Bvd2VycGNfXykKPiA+ID4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVk
KF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19wb3dlcnBjX18pIHx8IFwKPiA+ID4gKyAgICBkZWZp
bmVkKF9fbWlwc19fKQo+ID4gPiAgCWlmIChtYXAtPnR5cGUgPT0gX0RSTV9SRUdJU1RFUlMgJiYg
IShtYXAtPmZsYWdzICYgX0RSTV9XUklURV9DT01CSU5JTkcpKQo+ID4gPiAgCQl0bXAgPSBwZ3By
b3Rfbm9uY2FjaGVkKHRtcCk7Cj4gPiA+ICAJZWxzZQo+ID4gPiBAQCAtNzMsNyArNzQsNyBAQCBz
dGF0aWMgcGdwcm90X3QgZHJtX2lvX3Byb3Qoc3RydWN0IGRybV9sb2NhbF9tYXAgKm1hcCwKPiA+
ID4gIAkJdG1wID0gcGdwcm90X3dyaXRlY29tYmluZSh0bXApOwo+ID4gPiAgCWVsc2UKPiA+ID4g
IAkJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+ID4gPiAtI2VsaWYgZGVmaW5lZChfX3Nw
YXJjX18pIHx8IGRlZmluZWQoX19hcm1fXykgfHwgZGVmaW5lZChfX21pcHNfXykKPiA+ID4gKyNl
bGlmIGRlZmluZWQoX19zcGFyY19fKSB8fCBkZWZpbmVkKF9fYXJtX18pCj4gPiA+ICAJdG1wID0g
cGdwcm90X25vbmNhY2hlZCh0bXApOwo+ID4gPiAgI2VuZGlmCj4gPiA+ICAJcmV0dXJuIHRtcDsK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+ID4gPiBpbmRleCA4OTVkNzdkNzk5ZTQu
LjlmOTE4Yjk5MmY3ZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdXRpbC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+
ID4gPiBAQCAtNTM5LDEzICs1MzksMTMgQEAgcGdwcm90X3QgdHRtX2lvX3Byb3QodWludDMyX3Qg
Y2FjaGluZ19mbGFncywgcGdwcm90X3QgdG1wKQo+ID4gPiAgCQl0bXAgPSBwZ3Byb3Rfbm9uY2Fj
aGVkKHRtcCk7Cj4gPiA+ICAjZW5kaWYKPiA+ID4gICNpZiBkZWZpbmVkKF9faWE2NF9fKSB8fCBk
ZWZpbmVkKF9fYXJtX18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pIHx8IFwKPiA+ID4gLSAgICBk
ZWZpbmVkKF9fcG93ZXJwY19fKQo+ID4gPiArICAgIGRlZmluZWQoX19wb3dlcnBjX18pIHx8IGRl
ZmluZWQoX19taXBzX18pCj4gPiA+ICAJaWYgKGNhY2hpbmdfZmxhZ3MgJiBUVE1fUExfRkxBR19X
QykKPiA+ID4gIAkJdG1wID0gcGdwcm90X3dyaXRlY29tYmluZSh0bXApOwo+ID4gPiAgCWVsc2UK
PiA+ID4gIAkJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+ID4gPiAgI2VuZGlmCj4gPiA+
IC0jaWYgZGVmaW5lZChfX3NwYXJjX18pIHx8IGRlZmluZWQoX19taXBzX18pCj4gPiA+ICsjaWYg
ZGVmaW5lZChfX3NwYXJjX18pCj4gPiA+ICAJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+
ID4gPiAgI2VuZGlmCj4gPiA+ICAJcmV0dXJuIHRtcDsKPiA+ID4gLS0gCj4gPiA+IDIuMjEuMAo+
ID4gPiAKPiAKPiAtLSAKPiBTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBD
aHJvbWl1bSBPUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
