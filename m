Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952BFE472
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 19:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64A06EA24;
	Fri, 15 Nov 2019 18:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163F06EA22
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 18:00:27 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-frcQRTARMcibu00qQ2JCnA-1; Fri, 15 Nov 2019 13:00:25 -0500
Received: by mail-qt1-f198.google.com with SMTP id v92so7011451qtd.18
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 10:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=AJiQDTDDlT5FX+WsJZ7Qu/BwOhHmRpRRwiD+skElJ5Q=;
 b=QNQFfYGYfT8h2AHttOHVQ1SA0whpdSnbXQnb8/hphWsQvf6bzgixknU39Br8n5I079
 7rEXBvDUFxa5HUU0j0nCj+zKUgmnUOjuyxHxAa5w7dg8tF8qXNeXdH3ve/yzI1XhcAL4
 SvfliXU+WcnYvIGZNaSTOg+H6YM3p4DCmLD909HeTMcwoGSWkR7a13Sp2sQxqNrpL8PC
 Eietp2fNUSpyb+L0yQdBm9StX29s9tglQyTsgbWeov7zmK6lvw81+GPx5IrV9GuAEUeh
 IBjHMUz16skxxQW+6VLmD3Ih6HlIiBKP2P3ZY0CQ6XV0XSflC/qNq20G+PNKdtAmCDKH
 cHHg==
X-Gm-Message-State: APjAAAVRYaOzGOu9SipqNgpncqOWmVfnEpumKjEqMFBCL2CQkEhg95Dm
 F725DyQgZ6mS4dkLq+u06GfukMNEAlfSAML/TXL+xi1y9D6bjGpGPZ3FQ3+87jaP9STTMh+TmaG
 hJzxtIa9xRzW71UirAMwYKONxpgSr
X-Received: by 2002:ae9:de07:: with SMTP id s7mr13045513qkf.89.1573840824839; 
 Fri, 15 Nov 2019 10:00:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5CaJW6+FaHmMO6eJIo3r+qp2UZlaTndxQe1DE7BXw9+06kqHPt8xyGDbWHBqrjNcKPBGd7g==
X-Received: by 2002:ae9:de07:: with SMTP id s7mr13045489qkf.89.1573840824600; 
 Fri, 15 Nov 2019 10:00:24 -0800 (PST)
Received: from malachite.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id y7sm3517542qto.84.2019.11.15.10.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 10:00:23 -0800 (PST)
Message-ID: <61430397e4f716061c2a6ddc1ce884cf57d4fb07.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: remove set but not used variable 'mem'
From: Lyude Paul <lyude@redhat.com>
To: zhengbin <zhengbin13@huawei.com>, bskeggs@redhat.com, airlied@linux.ie, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Fri, 15 Nov 2019 13:00:22 -0500
In-Reply-To: <1573825353-86268-3-git-send-email-zhengbin13@huawei.com>
References: <1573825353-86268-1-git-send-email-zhengbin13@huawei.com>
 <1573825353-86268-3-git-send-email-zhengbin13@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: frcQRTARMcibu00qQ2JCnA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573840826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zo6E7FEO+n9FD0TWwK/+eIVHk6CcZD1W7pM6ifyimHA=;
 b=C7IoDfZB4EQnFsWweO6szTNdT4oB7uiGDVfMEvBq5B0o1d0Dz0bW3QsA9T0fSdmMGgoh8Y
 9Gv4jTbtgQ/66fWMS8Q4AxLKQ18ZFPiqJprmSzTnOy+a8BT2NK4H6yTAGwjtzXwR9LtaYv
 KuYktIRmb4GWKSNPEI0WU2/ZuUc0xXU=
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MTEtMTUgYXQgMjE6NDIgKzA4MDAsIHpoZW5nYmluIHdyb3RlOgo+IEZpeGVzIGdjYyAnLVd1bnVz
ZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPiAKPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3R0bS5jOiBJbiBmdW5jdGlvbiBub3V2ZWF1X3ZyYW1fbWFuYWdlcl9uZXc6Cj4g
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYzo2NjoyMjogd2FybmluZzogdmFy
aWFibGUgbWVtIHNldCBidXQKPiBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
PiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jOiBJbiBmdW5jdGlvbiBub3V2
ZWF1X2dhcnRfbWFuYWdlcl9uZXc6Cj4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90
dG0uYzoxMDY6MjI6IHdhcm5pbmc6IHZhcmlhYmxlIG1lbSBzZXQgYnV0Cj4gbm90IHVzZWQgWy1X
dW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gVGhlIGZpcnN0ICdtZW0nIGlzIGludHJvZHVj
ZWQgYnkgY29tbWl0IDljZTUyM2NjM2JmMiAoImRybS9ub3V2ZWF1Ogo+IHNlcGFyYXRlIGJ1ZmZl
ciBvYmplY3QgYmFja2luZyBtZW1vcnkgZnJvbSBudmttIHN0cnVjdHVyZXMiKSwKPiBidXQgbmV2
ZXIgdXNlZCwgc28gcmVtb3ZlIGl0Lgo+IAo+IFRoZSBzZWNvbmQgJ21lbScgaXMgbm90IHVzZWQg
c2luY2UgY29tbWl0IGQ3NzIyMTM0YjgyNSAoImRybS9ub3V2ZWF1Ogo+IHN3aXRjaCBvdmVyIHRv
IG5ldyBtZW1vcnkgYW5kIHZtbSBpbnRlcmZhY2VzIikKPiAKPiBSZXBvcnRlZC1ieTogSHVsayBS
b2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5n
YmluMTNAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV90dG0uYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+IGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+IGluZGV4IDc3YTBjNmEuLjdjYTBh
MjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKPiBAQCAtNjMsMTQg
KzYzLDEyIEBAIG5vdXZlYXVfdnJhbV9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21h
bmFnZXIKPiAqbWFuLAo+ICB7Cj4gIAlzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibyA9IG5vdXZlYXVf
Ym8oYm8pOwo+ICAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2JkZXYoYm8tPmJk
ZXYpOwo+IC0Jc3RydWN0IG5vdXZlYXVfbWVtICptZW07Cj4gIAlpbnQgcmV0Owo+IAo+ICAJaWYg
KGRybS0+Y2xpZW50LmRldmljZS5pbmZvLnJhbV9zaXplID09IDApCj4gIAkJcmV0dXJuIC1FTk9N
RU07Cj4gCj4gIAlyZXQgPSBub3V2ZWF1X21lbV9uZXcoJmRybS0+bWFzdGVyLCBudmJvLT5raW5k
LCBudmJvLT5jb21wLCByZWcpOwo+IC0JbWVtID0gbm91dmVhdV9tZW0ocmVnKTsKPiAgCWlmIChy
ZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAKPiBAQCAtMTAzLDExICsxMDEsOSBAQCBub3V2ZWF1X2dh
cnRfbWFuYWdlcl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyCj4gKm1hbiwKPiAgewo+
ICAJc3RydWN0IG5vdXZlYXVfYm8gKm52Ym8gPSBub3V2ZWF1X2JvKGJvKTsKPiAgCXN0cnVjdCBu
b3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9iZGV2KGJvLT5iZGV2KTsKPiAtCXN0cnVjdCBub3V2
ZWF1X21lbSAqbWVtOwo+ICAJaW50IHJldDsKPiAKPiAgCXJldCA9IG5vdXZlYXVfbWVtX25ldygm
ZHJtLT5tYXN0ZXIsIG52Ym8tPmtpbmQsIG52Ym8tPmNvbXAsIHJlZyk7Cj4gLQltZW0gPSBub3V2
ZWF1X21lbShyZWcpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+IAo+IC0tCj4gMi43
LjQKPiAKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
