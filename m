Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BCFFB461
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731286ED06;
	Wed, 13 Nov 2019 15:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EDE6ED6B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:55:13 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-ZYnAzHnmNkWNrBS_JKOB4Q-1; Wed, 13 Nov 2019 10:54:08 -0500
Received: by mail-wr1-f71.google.com with SMTP id f8so1830709wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 07:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PtLhOUxe8xXSfRRflBaPWfqIH48pI2XLThNebY/441U=;
 b=mJPzXqiH8Z982mltNfTpOFAx7085nTM0cDw+QEqZ4KzdDTcw6GZ2/gkMDAUXVYznSI
 2Ub/WydHczs7PbI4jFEOrF8XN+xV5BSAzYIgTgZTm+pr3m5wOpomh9DKjO8GwiHNHRhR
 Jkx6cLBiR52/a8h2RtiZbxE32ODKJb65MtfLpVUVlb0/PyQoPdbLQOw9Hxew63bQjQyA
 34VxYhMyQ+YTBUUoyQq/TK95wSq08KwsF3o9cORVaRt+Gzjxf4Z4W+mg7dq2rKcAlPA1
 EisP6/dmMgVK6pCIaG7lkyK0qjyKhJvW28ojN3KFa7Bm/tVpCWAVuX3EMb7L5CLtufyE
 pRng==
X-Gm-Message-State: APjAAAVB9KHMyyv+d4SXnLGxalI+ZmzhsiMNeb7VSbAqebxEhZRVKeoe
 1iiOtRzVDXZiPlJ3HFNw0YOd/SvvgbEQ9Hy+m75vfzd51yypUif7Fpqpxd/LZH8ufkf/R5uKBr2
 AZYr8THIYqoL34sgyjf4Jo38bYg/X
X-Received: by 2002:a05:600c:3cc:: with SMTP id
 z12mr3679952wmd.151.1573660446683; 
 Wed, 13 Nov 2019 07:54:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqz01OxUgI2MbS4dFk59AuBL/5QOwKAE0/tUUSXeRr18yFeSY/N4OklTllX+gUu3LjM0UkWHkA==
X-Received: by 2002:a05:600c:3cc:: with SMTP id
 z12mr3679931wmd.151.1573660446433; 
 Wed, 13 Nov 2019 07:54:06 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id q15sm2816744wmq.0.2019.11.13.07.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2019 07:54:05 -0800 (PST)
Subject: Re: [PATCH 12/12] drm/connector: Hookup the new drm_cmdline_mode
 panel_orientation member
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-13-hdegoede@redhat.com>
 <20191112094712.GH23790@phenom.ffwll.local>
 <13ce5629-045a-7d70-ecfa-7acdfada9d1f@redhat.com>
 <CAKMK7uHHNz6TZViHEk9ycNp752jSQoqV=WHBoTnUh_e10a-_EQ@mail.gmail.com>
 <82a1ef3f-6c13-1a3e-e8d8-827f5fad9e46@redhat.com>
 <CAKMK7uE0ofNnZcyOiWA+Nytgd=U=tgRvfUH-FYupEa-fgvyfgQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c7c3f4b7-78a3-2911-4bcb-15306cf5983c@redhat.com>
Date: Wed, 13 Nov 2019 16:54:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE0ofNnZcyOiWA+Nytgd=U=tgRvfUH-FYupEa-fgvyfgQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: ZYnAzHnmNkWNrBS_JKOB4Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573660449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98eTGnmsA0ftUCtRWt3mEYenMbW+J1lVV93Z0o1lnE0=;
 b=dh0BmwGI8c0gX560GPbdLXVRG3LHSONwD2tp1GWeKloMeOuc3WGuNVO+Rpjl9luC3Hqhb7
 k1D0fzd6hegJQzvY8sQKGq8n/Hm5HVNwjFLb2T4amStG7Mgqq9tAmxT3n7cTFFaKaoTBb1
 No51HIawLcYCZoqHIyVDQU2FFE3+3/E=
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMi0xMS0yMDE5IDE0OjQ3LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFR1ZSwg
Tm92IDEyLCAyMDE5IGF0IDI6MzkgUE0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiBPbiAxMi0xMS0yMDE5IDE0OjMyLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+Pj4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTE6NDMgQU0gSGFucyBkZSBH
b2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBIaSwKPj4+Pgo+Pj4+
IE9uIDEyLTExLTIwMTkgMTA6NDcsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+IE9uIFN1biwg
Tm92IDEwLCAyMDE5IGF0IDA0OjQxOjAxUE0gKzAxMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+
Pj4+PiBJZiB0aGUgbmV3IHZpZGVvPS4uLiBwYW5lbF9vcmllbnRhdGlvbiBvcHRpb24gaXMgc2V0
IGZvciBhIGNvbm5lY3RvciwgaG9ub3IKPj4+Pj4+IGl0IGFuZCBzZXR1cCBhIG1hdGNoaW5nICJw
YW5lbCBvcmllbnRhdGlvbiIgcHJvcGVydHkgb24gdGhlIGNvbm5lY3Rvci4KPj4+Pj4+Cj4+Pj4+
PiBCdWdMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGx5bW91dGgvcGx5bW91
dGgvbWVyZ2VfcmVxdWVzdHMvODMKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUg
PGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+Pj4+Cj4+Pj4+IERvbid0IHdlIG5lZWQgb25lIG1vcmUg
cGF0Y2ggaGVyZSB0byBjcmVhdGUgdGhlIHBhbmVsIG9yaWVudGF0aW9uIHByb3BlcnR5Cj4+Pj4+
IGlmIHRoZSBkcml2ZXIgZG9lc24ndCBkbyBpdD8gT3RoZXJ3aXNlIHRoaXMgd29uJ3QgaGFwcGVu
LCBhbmQgdXNlcnNwYWNlCj4+Pj4+IGNhbid0IGxvb2sgYXQgaXQgKG9ubHkgdGhlIGludGVybmFs
IGZiZGV2IHN0dWZmLCB3aGljaCBoYXMgaXQncyBvd24KPj4+Pj4gbGltaXRhdGlvbnMgd3J0IHJv
dGF0aW9uKS4KPj4+Pgo+Pj4+IFRoYXQgaXMgd2hhdCBwYXRjaCAxMS8xMiBpcyBmb3IsIHRoYXQg
cGF0Y2ggcmVuYW1lcyBkcm1fY29ubmVjdG9yX2luaXRfcGFuZWxfb3JpZW50YXRpb24KPj4+PiB0
byBkcm1fc2V0X3BhbmVsX29yaWVudGF0aW9uIGFuZCBtYWtlcyBpdCBib3RoIHNldCwgaW5pdCBh
bmQgYXR0YWNoIHRoZSBwcm9wZXJ0eQo+Pj4+ICh1bmxlc3MgY2FsbGVkIHdpdGggRFJNX01PREVf
UEFORUxfT1JJRU5UQVRJT05fVU5LTk9XTiBpbiB3aGljaCBjYXNlIGl0IGlzIGEgbm8tb3ApLgo+
Pj4+Cj4+Pj4gUGF0Y2ggMTEvMTIgYWxzbyBtYWtlcyBkcm1fc2V0X3BhbmVsX29yaWVudGF0aW9u
IGRvIHRoZSBzZXQgb25seSBvbmNlLCB3aGljaCBpcyB3aHkKPj4+PiB0aGUgb3JpZW50YXRpb24g
dG8gc2V0IGlzIG5vdyBwYXNzZWQgaW5zdGVhZCBvZiBzdG9yZWQgZGlyZWN0bHkgaW4gdGhlIGNv
bm5lY3RvciwKPj4+PiBzbyB0aGF0IGEgc2Vjb25kIHNldCBjYWxsIChwYW5lbF9vcmllbnRhdGlv
biBvZiB0aGUgY29ubmVjdG9yIGFscmVhZHkgIT0KPj4+PiBEUk1fTU9ERV9QQU5FTF9PUklFTlRB
VElPTl9VTktOT1dOKSBjYW4gYmUgc2tpcHBlZCwgc28gdGhhdCB0aGUgY21kbGluZSBvdmVycmlk
ZXMKPj4+PiBkcml2ZXIgZGV0ZWNpb24gY29kZSBmb3IgdGhpcy4KPj4+Cj4+PiBPaCwgdGhhdCdz
IHdoYXQgSSBnZXQgZm9yIG5vdCByZWFkaW5nIHRoZSBlbnRpcmUgc2VyaWVzIC4uLiBPbmx5IHJp
c2sKPj4+IHdpdGggdGhhdCBpcyB0aGF0IGRyaXZlcnMgc2V0IHRoaXMgcHJvcGVydHkgYWZ0ZXIg
ZHJpdmVyIGxvYWRpbmcgaXMKPj4+IGRvbmUgLSB3ZSBjYW4ndCBhdHRhY2gvY3JlYXRlIHByb3Bl
cnRpZXMgYWZ0ZXIgZHJtX2Rldl9yZWdpc3Rlci4gQnV0Cj4+PiBJJ3ZlIGFkZGVkIHRoZSBjb3Jy
ZXNwb25kaW5nIFdBUk5fT04gdG8gdGhlc2UsIHNvIHdlIHNob3VsZCBiZSBhbGwKPj4+IGZpbmUg
SSB0aGluay4gU28gbG9va3MgYWxsIGdvb2QgdG8gbWUuCj4+Cj4+IENhbiBJIHRha2UgdGhhdCBh
cyB5b3VyIEFja2VkLWJ5IGZvciB0aGlzIHBhdGNoIGFuZCBwZXJoYXBzIGFsc28gZm9yIDExLzEy
ID8KPiAKPiBVaCBJIGRpZG4ndCByZWFsbHkgcmVhZCB0aGUgZGV0YWlscywgYWNrIGZlZWxzIGEg
Yml0IHRoaW4gdG8gbGFuZCB0aGlzIC4uLgoKT2ssIEkgd2lsbCB3YWl0IGEgYml0IGZvciBvdGhl
cnMgdG8gcmV2aWV3IHRoaXMgdGhlbi4gTm90ZSB0aGF0IE1heGltZSBoYXMKcmV2aWV3ZWQgcGF0
Y2hlcyAxLTksIHdpdGggb25lIHNtYWxsIHJlbWFyayBvbiBwYXRjaCA5IHdoaWNoIEknbSBzdGls
bCBhd2FpdGluZwphbiBhbnN3ZXIgZm9yLiBTbyBtb3N0IG9mIHRoZSBjbWRsaW5lIHBhcnNpbmcg
c3R1ZmYgaGFzIGJlZW4gcmV2aWV3ZWQgYW5kCmlmIHlvdSBhcmUgb2sgd2l0aCB0aGUgbm9uIGNt
ZGxpbmUgcGFyc2luZyBjaGFuZ2VzLi4uCgo+PiBBbHNvIHdoYXQgYWJvdXQgeW91ciByZW1hcmtz
IHRvIDEwLzEyPyAgSSdtIGhhcHB5IHRvIGRvIGEgdjIgd2l0aCBhIG1lbXNldCwKPj4gYXMgc2Fp
ZCBteSBtYWluIHJlYXNvbiBmb3IgZHJvcHBpbmcgdGhlIHNwZWNpZmllZD1mYWxzZSBpbiB0aGUg
ZWFybHkgcGF0aAo+PiBpcyB0aGF0IHdlIG5ldmVyIGluaXQgYnBwX3NwZWNpZmllZCBvciByZWZy
ZXNoX3NwZWNpZmllZCBleHBsaWNpdGx5IHRvIGZhbHNlCj4+IEknbSBhbGwgZm9yIGJlaW5nIGV4
cGxpY2l0IGFib3V0IHRoYXQsIGJ1dCB0aGVuIGxldHMganVzdCB6ZXJvIG91dCB0aGUgZW50aXJl
Cj4+IHBhc3NlZCBpbiBkcm1fY21kbGluZV9tb2RlIHN0cnVjdC4KPiAKPiBIbSB5ZWFoLCBjbGVh
cmluZyBpdCBhbGwgbWlnaHQgYmUgYSBnb29kIGlkZWEuCgpPayBJIHdpbGwgc3VibWl0IGEgdjIg
d2l0aCB0aGlzIGNoYW5nZS4KClJlZ2FyZHMsCgpIYW5zCgoKCgo+Pj4+Pj4gLS0tCj4+Pj4+PiAg
ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8IDcgKysrKysrKwo+Pj4+Pj4gICAg
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y29ubmVjdG9yLmMKPj4+Pj4+IGluZGV4IDQwYTk4NWM0MTFhNi4uNTkxOTE0ZjAxY2Q0IDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+Pj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+Pj4+Pj4gQEAgLTE0MCw2ICsxNDAs
MTMgQEAgc3RhdGljIHZvaWQgZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2RlKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4+Pj4+PiAgICAgICAgICAgICAgICBjb25uZWN0b3It
PmZvcmNlID0gbW9kZS0+Zm9yY2U7Cj4+Pj4+PiAgICAgICAgfQo+Pj4+Pj4KPj4+Pj4+ICsgICAg
aWYgKG1vZGUtPnBhbmVsX29yaWVudGF0aW9uICE9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9O
X1VOS05PV04pIHsKPj4+Pj4+ICsgICAgICAgICAgICBEUk1fSU5GTygic2V0dGluZyBjb25uZWN0
b3IgJXMgcGFuZWxfb3JpZW50YXRpb24gdG8gJWRcbiIsCj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgY29ubmVjdG9yLT5uYW1lLCBtb2RlLT5wYW5lbF9vcmllbnRhdGlvbik7Cj4+Pj4+PiAr
ICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9zZXRfcGFuZWxfb3JpZW50YXRpb24oY29ubmVjdG9y
LAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG1vZGUtPnBhbmVsX29yaWVudGF0aW9uKTsKPj4+Pj4+ICsgICAgfQo+Pj4+Pj4gKwo+Pj4+Pj4g
ICAgICAgIERSTV9ERUJVR19LTVMoImNtZGxpbmUgbW9kZSBmb3IgY29ubmVjdG9yICVzICVzICVk
eCVkQCVkSHolcyVzJXNcbiIsCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3It
Pm5hbWUsIG1vZGUtPm5hbWUsCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICBtb2RlLT54cmVz
LCBtb2RlLT55cmVzLAo+Pj4+Pj4gLS0KPj4+Pj4+IDIuMjMuMAo+Pj4+Pj4KPj4+Pj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+PiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
Pj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo+Pj4+Pgo+Pj4+Cj4+Pgo+Pj4KPj4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
