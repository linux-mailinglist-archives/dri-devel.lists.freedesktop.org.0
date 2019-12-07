Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39C115A69
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 01:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B916FAC6;
	Sat,  7 Dec 2019 00:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDCC6FAC6
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 00:53:24 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-GgZbmhvrPxi54mp7YW8voA-1; Fri, 06 Dec 2019 19:53:20 -0500
Received: by mail-qt1-f198.google.com with SMTP id h26so4867788qtn.16
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2019 16:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=KvHW1O+Ud5XpFwu0Bypdel0zf/z/YB/B2hAdzc5k20Q=;
 b=f6R77962+b6TQZU5VlqptTSHIv50x/ElCme66gIqw/Z9R+dF9sToh9yX+BmjhfX4he
 hA+V2oaMMwD4WM/o6krY281N6oOu6fxjTHVEZSYO+RjD5tqkYgvlsRyHOxFHE3z/tbCq
 aH/8L1I69UZVn6WFMufBYm3fk5Z6Xq3ZBL4zTjmv7yxwSxxI4q6e24PtpLLZvDMB7C/3
 Uy0hVj11Yq4IunDx5ot9SAHnlxFyPfyDvcpZrOwg9PWLcleVn0Wx3eDMdpThgdW1G2Oc
 goH55EswT/k8SkAmWdk4SCzubQxbNROp8Z97cZMuEfpxkKPHhsZ1wZ1X8NL4yFcXHokw
 doJg==
X-Gm-Message-State: APjAAAVoBUA3Eoijj//9oz62DNrcsiGani3pw4BJgv/rsOeNIHdrloGp
 rHcL+XfxhMPgxBCl4UcBKDLGh21mquQuLAkVEcm2g0IDJudBH3rf4FpoXhQRh4XaLfCqR4Lvs3Q
 Akhb2zX+YH2h0R5C8pSB4A30ScTIf
X-Received: by 2002:a05:620a:1270:: with SMTP id
 b16mr16454868qkl.109.1575680000069; 
 Fri, 06 Dec 2019 16:53:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdh20W+FoMYWkupdI4hLwinMd2yJg+mAEd8gyDgHVdWZrfIs5BJnIfVCAFc2eWbl6+b+aa7A==
X-Received: by 2002:a05:620a:1270:: with SMTP id
 b16mr16454855qkl.109.1575679999861; 
 Fri, 06 Dec 2019 16:53:19 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x57sm7164691qtk.58.2019.12.06.16.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 16:53:18 -0800 (PST)
Message-ID: <e66797033e52cb9495e6df7802e2928eead70bf3.camel@redhat.com>
Subject: Re: [PATCH v8 17/17] drm/amd/display: Trigger modesets on MST DSC
 connectors
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Fri, 06 Dec 2019 19:53:17 -0500
In-Reply-To: <20191203143530.27262-18-mikita.lipski@amd.com>
References: <20191203143530.27262-1-mikita.lipski@amd.com>
 <20191203143530.27262-18-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31)
MIME-Version: 1.0
X-MC-Unique: GgZbmhvrPxi54mp7YW8voA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1575680003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvHW1O+Ud5XpFwu0Bypdel0zf/z/YB/B2hAdzc5k20Q=;
 b=Q41lkgFDfVW28Jv5Le0UZ6GPOOVw7UeQ1aHXJPslccxBBkeIvccqqQH4jHeZ79WxVgW8LV
 bY0wElIEgbrpFdGsUkvpd9YMSEM2R7vRFtsSxTbH6m/GvKk2A17mmB+M8GHegnPgZGiR2W
 lQVCEw8oqzatTN+X8536XErWL6pdLxw=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <David.Francis@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTItMDMgYXQgMDk6MzUgLTA1MDAsIG1pa2l0YS5saXBza2lAYW1kLmNvbSB3cm90ZToKPiBGcm9t
OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4gCj4gV2hlbmV2ZXIgYSBj
b25uZWN0b3Igb24gYW4gTVNUIG5ldHdvcmsgaXMgYXR0YWNoZWQsIGRldGFjaGVkLCBvcgo+IHVu
ZGVyZ29lcyBhIG1vZGVzZXQsIHRoZSBEU0MgY29uZmlncyBmb3IgZWFjaCBzdHJlYW0gb24gdGhh
dAo+IHRvcG9sb2d5IHdpbGwgYmUgcmVjYWxjdWxhdGVkLiBUaGlzIGNhbiBjaGFuZ2UgdGhlaXIg
cmVxdWlyZWQKPiBiYW5kd2lkdGgsIHJlcXVpcmluZyBhIGZ1bGwgcmVwcm9ncmFtbWluZywgYXMg
dGhvdWdoIGEgbW9kZXNldAo+IHdhcyBwZXJmb3JtZWQsIGV2ZW4gaWYgdGhhdCBzdHJlYW0gZGlk
IG5vdCBjaGFuZ2UgdGltaW5nLgo+IAo+IFRoZXJlZm9yZSwgd2hlbmV2ZXIgYSBjcnRjIGhhcyBk
cm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldCwKPiBmb3IgZWFjaCBjcnRjIHRoYXQgc2hhcmVz
IGEgTVNUIHRvcG9sb2d5IHdpdGggdGhhdCBzdHJlYW0gYW5kCj4gc3VwcG9ydHMgRFNDLCBhZGQg
dGhhdCBjcnRjIChhbmQgYWxsIGFmZmVjdGVkIGNvbm5lY3RvcnMgYW5kCj4gcGxhbmVzKSB0byB0
aGUgYXRvbWljIHN0YXRlIGFuZCBzZXQgbW9kZV9jaGFuZ2VkIG9uIGl0cyBzdGF0ZQo+IAo+IHYy
OiBEbyB0aGlzIGNoZWNrIG9ubHkgb24gTmF2aSBhbmQgYmVmb3JlIGFkZGluZyBjb25uZWN0b3Jz
Cj4gYW5kIHBsYW5lcyBvbiBtb2Rlc2V0dGluZyBjcnRjcwo+IAo+IENjOiBMZW8gTGkgPHN1bnBl
bmcubGlAYW1kLmNvbT4KPiBDYzogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IERhdmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5jb20+Cj4gLS0tCj4gIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDMzICsrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
Ywo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+
IGluZGV4IDJhYzNhMmYwYjQ1Mi4uOTA5NjY1NDI3MTEwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gQEAgLTc5MzAsNiAr
NzkzMCwyOSBAQCBkbV9kZXRlcm1pbmVfdXBkYXRlX3R5cGVfZm9yX2NvbW1pdChzdHJ1Y3QKPiBh
bWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0
YXRpYyBpbnQgYWRkX2FmZmVjdGVkX21zdF9kc2NfY3J0Y3Moc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlLAo+IHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiArewo+ICsJc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcjsKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25u
X3N0YXRlOwo+ICsJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSBOVUxM
Owo+ICsJaW50IGk7Cj4gKwlmb3JfZWFjaF9uZXdfY29ubmVjdG9yX2luX3N0YXRlKHN0YXRlLCBj
b25uZWN0b3IsIGNvbm5fc3RhdGUsIGkpIHsKPiArCQlpZiAoY29ubl9zdGF0ZS0+Y3J0YyAhPSBj
cnRjKQo+ICsJCQljb250aW51ZTsKPiArCj4gKwkJYWNvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9j
b25uZWN0b3IoY29ubmVjdG9yKTsKPiArCQlpZiAoIWFjb25uZWN0b3ItPnBvcnQpCj4gKwkJCWFj
b25uZWN0b3IgPSBOVUxMOwo+ICsJCWVsc2UKPiArCQkJYnJlYWs7Cj4gKwl9Cj4gKwo+ICsJaWYg
KCFhY29ubmVjdG9yKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCXJldHVybiBkcm1fZHBfbXN0X2Fk
ZF9hZmZlY3RlZF9kc2NfY3J0Y3Moc3RhdGUsICZhY29ubmVjdG9yLT5tc3RfbWdyKTsKPiArfQo+
ICsKPiAgLyoqCj4gICAqIGFtZGdwdV9kbV9hdG9taWNfY2hlY2soKSAtIEF0b21pYyBjaGVjayBp
bXBsZW1lbnRhdGlvbiBmb3IgQU1EZ3B1IERNLgo+ICAgKiBAZGV2OiBUaGUgRFJNIGRldmljZQo+
IEBAIC03OTgyLDYgKzgwMDUsMTYgQEAgc3RhdGljIGludCBhbWRncHVfZG1fYXRvbWljX2NoZWNr
KHN0cnVjdCBkcm1fZGV2aWNlCj4gKmRldiwKPiAgCWlmIChyZXQpCj4gIAkJZ290byBmYWlsOwo+
ICAKPiArCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9OQVZJMTApIHsKPiArCQlmb3JfZWFj
aF9vbGRuZXdfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgY3J0Yywgb2xkX2NydGNfc3RhdGUsCj4gbmV3
X2NydGNfc3RhdGUsIGkpIHsKPiArCQkJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0
KG5ld19jcnRjX3N0YXRlKSkgewo+ICsJCQkJcmV0ID0gYWRkX2FmZmVjdGVkX21zdF9kc2NfY3J0
Y3Moc3RhdGUsIGNydGMpOwo+ICsJCQkJaWYgKHJldCkKPiArCQkJCQlnb3RvIGZhaWw7Cj4gKwkJ
CX0KPiArCQl9Cj4gKwl9Cj4gKwo+ICAJZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUoc3Rh
dGUsIGNydGMsIG9sZF9jcnRjX3N0YXRlLAo+IG5ld19jcnRjX3N0YXRlLCBpKSB7Cj4gIAkJaWYg
KCFkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkgJiYKPiAgCQkg
ICAgIW5ld19jcnRjX3N0YXRlLT5jb2xvcl9tZ210X2NoYW5nZWQgJiYKLS0gCkNoZWVycywKCUx5
dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
