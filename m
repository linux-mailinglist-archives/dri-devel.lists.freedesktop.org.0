Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18006499F9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED816E0E6;
	Tue, 18 Jun 2019 07:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E2889225
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:47:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id r15so6538102lfm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 06:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O9iaokS7chRIdty8YXJ6Ys/2JY44g91hT9zsHpjPuBg=;
 b=GPUoV7ADPLGjNDCPz50oO+qfBTN83WYsBp7JWJvtRWc8ZXvtnTjavgg9OOGC+7JxwT
 eYiCi7G7TjVThZdDrgsZCYhyA0DIK3Tq2mgTJNDMo+8+ZPCUpPv0ls2ITPHqkgxuNBq+
 NdGCUpmVoXexgek9ynzrhc+8Qxjd4fzddt42fjtwwe2Y93SpaFuEtrH0zQJK74eYYCsi
 qHJ7FIsCNxU2JHbEPZTO6jl6Bt7HHShSNo6poPsmizyGpG9AtfuVGQCwHiswBchT+iyW
 DjP/9mIdEuf8Td23IZJBQ2iyEe5HrO6QYRZ2NHDgwsVLSn7sNBHyyYxbRnFHUrnkE3ZD
 hNHQ==
X-Gm-Message-State: APjAAAUVwgk5TqlL+bWWJN3Edb5EuYiWEr+T/mJhhaqmTyuk28gN1xPY
 ngweGSxxCJGsotd68M7vJws=
X-Google-Smtp-Source: APXvYqzAO3WcughOQWS36ZmjwboEnCZX7eu0ToKYcUhEpInYmxfUni6YOBAbjr+vbOs3ie2xT0neQg==
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr6757lfi.130.1560779253032;
 Mon, 17 Jun 2019 06:47:33 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
 by smtp.gmail.com with ESMTPSA id 16sm1770779lfy.21.2019.06.17.06.47.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 06:47:32 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:47:30 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm: Permit video-buffers writecombine mapping for MIPS
Message-ID: <20190617134729.pd24boyqe2viyihm@mobilestation>
References: <20190423123122.32573-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423123122.32573-1-fancer.lancer@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O9iaokS7chRIdty8YXJ6Ys/2JY44g91hT9zsHpjPuBg=;
 b=ESL7h+x6npOVGuO1kDUltOllyumhp7aW8zxRpnbwR0R2IlDD38Dae7N2KYdDOJImep
 K/sS0rRKbpjTMcUW79gCdah0eMKQWlb8Mis1BA/PaWyeE+bOwvh2JWeUvq+5JwtC3wPA
 Kq7fTe2eZuukZ4CDSgVrVbuIjAk9Yx6Eh57AmxYWdY8MQkMRaJURdDS5VWQHuQ4x8vvK
 HSVyzSWOrko7q/YJarrvddjHG/6eVXDCF4whEpkr9xXo1bmQ/YBvO01t1JiWAsOVrabS
 Nzoz/QthCrZF56BH3bSZ9jNfdfFEF+6F63VnFr3rDxSi0EJx4VJ3o8nZ6Lt+4s91jq4B
 kWcw==
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
 James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gZm9sa3MsCgpBbnkgdXBkYXRlcyBvZiB0aGlzIHBhdGNoIHN0YXR1cz8gSXQgaGFzIGJl
ZW4gaGVyZSBmb3IgYWJvdXQgdHdvIG1vbnRocy4KClJlZ2FyZHMsCi1TZXJnZXkKCk9uIFR1ZSwg
QXByIDIzLCAyMDE5IGF0IDAzOjMxOjIyUE0gKzAzMDAsIFNlcmdlIFNlbWluIHdyb3RlOgo+IFNp
bmNlIGNvbW1pdCA0YjA1MGJhN2E2NmMgKCJNSVBTOiBwZ3RhYmxlLmg6IEltcGxlbWVudCB0aGUK
PiBwZ3Byb3Rfd3JpdGVjb21iaW5lIGZ1bmN0aW9uIGZvciBNSVBTIikgYW5kIGNvbW1pdCBjNDY4
N2IxNWE4NDggKCJNSVBTOiBGaXgKPiBkZWZpbml0aW9uIG9mIHBncHJvdF93cml0ZWNvbWJpbmUo
KSIpIHdyaXRlLWNvbWJpbmUgdm1hIG1hcHBpbmcgaXMKPiBhdmFpbGFibGUgdG8gYmUgdXNlZCBi
eSBrZXJuZWwgc3Vic3lzdGVtcyBmb3IgTUlQUy4gSW4gcGFydGljdWxhciB0aGUKPiB1bmNhY2hl
ZCBhY2NlbGVyYXRlZCBhdHRyaWJ1dGUgaXMgcmVxdWVzdGVkIHRvIGJlIHNldCBieSBpb3JlbWFw
X3djKCkKPiBtZXRob2QgYW5kIGJ5IGdlbmVyaWMgUENJIG1lbW9yeSBwYWdlcy9yYW5nZXMgbWFw
cGluZyBtZXRob2RzLiBUaGUgc2FtZQo+IGlzIGRvbmUgYnkgdGhlIGRybV9pb19wcm90KCkvdHRt
X2lvX3Byb3QoKSBmdW5jdGlvbnMgaW4gY2FzZSBpZgo+IHdyaXRlLWNvbWJpbmUgZmxhZyBpcyBz
ZXQgZm9yIHZtYSdzIHBhc3NlZCBmb3IgbWFwcGluZy4gQnV0IGZvciBzb21lCj4gcmVhc29uIHRo
ZSBwZ3Byb3Rfd3JpdGVjb21iaW5lKCkgbWV0aG9kIGNhbGxpbmcgaXMgaWZkZWZlZCB0byBiZSBh
Cj4gcGxhdGZvcm0tc3BlY2lmaWMgd2l0aCBNSVBTIHN5c3RlbSBiZWluZyBtYXJrZWQgYXMgbGFj
a2luZyBvZiBvbmUuIEF0IHRoZQo+IHZlcnkgbGVhc3QgaXQgZG9lc24ndCByZWZsZWN0IHRoZSBj
dXJyZW50IE1JUFMgcGxhdGZvcm0gaW1wbGVtZW50YXRpb24uCj4gU28gaW4gb3JkZXIgdG8gaW1w
cm92ZSB0aGUgRFJNIHN1YnN5c3RlbSBwZXJmb3JtYW5jZSBvbiBNSVBTIHdpdGggVUNBCj4gbWFw
cGluZyBlbmFibGVkLCB3ZSBuZWVkIHRvIGhhdmUgcGdwcm90X3dyaXRlY29tYmluZSgpIGNhbGxl
ZCBmb3IgYnVmZmVycywKPiB3aGljaCBuZWVkIHN0b3JlIG9wZXJhdGlvbnMgYmVpbmcgY29tYmlu
ZWQuIEluIGNhc2UgaWYgcGFydGljdWxhciBNSVBTCj4gY2hpcCBkb2Vzbid0IHN1cHBvcnQgdGhl
IFVDQSBhdHRyaWJ1dGUsIHRoZSBtYXBwaW5nIHdpbGwgZmFsbCBiYWNrIHRvCj4gbm9uY2FjaGVk
Lgo+IAo+IENjOiBSYWxmIEJhZWNobGUgPHJhbGZAbGludXgtbWlwcy5vcmc+Cj4gQ2M6IFBhdWwg
QnVydG9uIDxwYXVsLmJ1cnRvbkBtaXBzLmNvbT4KPiBDYzogSmFtZXMgSG9nYW4gPGpob2dhbkBr
ZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFZhZGltIFYuIFZsYXNvdiA8dmFkaW0udmxhc292
QHQtcGxhdGZvcm1zLnJ1Pgo+IFNpZ25lZC1vZmYtYnk6IFNlcmdlIFNlbWluIDxmYW5jZXIubGFu
Y2VyQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV92bS5jICAgICAgICAg
IHwgNSArKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCA0ICsrLS0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdm0uYwo+IGluZGV4IGMzMzAxMDQ2ZGZhYS4uNTAxNzhkYzY0MDYwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdm0u
Ywo+IEBAIC02Miw3ICs2Miw4IEBAIHN0YXRpYyBwZ3Byb3RfdCBkcm1faW9fcHJvdChzdHJ1Y3Qg
ZHJtX2xvY2FsX21hcCAqbWFwLAo+ICAJLyogV2UgZG9uJ3Qgd2FudCBncmFwaGljcyBtZW1vcnkg
dG8gYmUgbWFwcGVkIGVuY3J5cHRlZCAqLwo+ICAJdG1wID0gcGdwcm90X2RlY3J5cHRlZCh0bXAp
Owo+ICAKPiAtI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwg
ZGVmaW5lZChfX3Bvd2VycGNfXykKPiArI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQo
X194ODZfNjRfXykgfHwgZGVmaW5lZChfX3Bvd2VycGNfXykgfHwgXAo+ICsgICAgZGVmaW5lZChf
X21pcHNfXykKPiAgCWlmIChtYXAtPnR5cGUgPT0gX0RSTV9SRUdJU1RFUlMgJiYgIShtYXAtPmZs
YWdzICYgX0RSTV9XUklURV9DT01CSU5JTkcpKQo+ICAJCXRtcCA9IHBncHJvdF9ub25jYWNoZWQo
dG1wKTsKPiAgCWVsc2UKPiBAQCAtNzMsNyArNzQsNyBAQCBzdGF0aWMgcGdwcm90X3QgZHJtX2lv
X3Byb3Qoc3RydWN0IGRybV9sb2NhbF9tYXAgKm1hcCwKPiAgCQl0bXAgPSBwZ3Byb3Rfd3JpdGVj
b21iaW5lKHRtcCk7Cj4gIAllbHNlCj4gIAkJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+
IC0jZWxpZiBkZWZpbmVkKF9fc3BhcmNfXykgfHwgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVk
KF9fbWlwc19fKQo+ICsjZWxpZiBkZWZpbmVkKF9fc3BhcmNfXykgfHwgZGVmaW5lZChfX2FybV9f
KQo+ICAJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+ICAjZW5kaWYKPiAgCXJldHVybiB0
bXA7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+IGluZGV4IDg5NWQ3N2Q3OTllNC4uOWY5
MThiOTkyZjdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwo+IEBAIC01MzksMTMg
KzUzOSwxMyBAQCBwZ3Byb3RfdCB0dG1faW9fcHJvdCh1aW50MzJfdCBjYWNoaW5nX2ZsYWdzLCBw
Z3Byb3RfdCB0bXApCj4gIAkJdG1wID0gcGdwcm90X25vbmNhY2hlZCh0bXApOwo+ICAjZW5kaWYK
PiAgI2lmIGRlZmluZWQoX19pYTY0X18pIHx8IGRlZmluZWQoX19hcm1fXykgfHwgZGVmaW5lZChf
X2FhcmNoNjRfXykgfHwgXAo+IC0gICAgZGVmaW5lZChfX3Bvd2VycGNfXykKPiArICAgIGRlZmlu
ZWQoX19wb3dlcnBjX18pIHx8IGRlZmluZWQoX19taXBzX18pCj4gIAlpZiAoY2FjaGluZ19mbGFn
cyAmIFRUTV9QTF9GTEFHX1dDKQo+ICAJCXRtcCA9IHBncHJvdF93cml0ZWNvbWJpbmUodG1wKTsK
PiAgCWVsc2UKPiAgCQl0bXAgPSBwZ3Byb3Rfbm9uY2FjaGVkKHRtcCk7Cj4gICNlbmRpZgo+IC0j
aWYgZGVmaW5lZChfX3NwYXJjX18pIHx8IGRlZmluZWQoX19taXBzX18pCj4gKyNpZiBkZWZpbmVk
KF9fc3BhcmNfXykKPiAgCXRtcCA9IHBncHJvdF9ub25jYWNoZWQodG1wKTsKPiAgI2VuZGlmCj4g
IAlyZXR1cm4gdG1wOwo+IC0tIAo+IDIuMjEuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
