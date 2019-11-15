Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D5FE470
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 19:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959396EA20;
	Fri, 15 Nov 2019 18:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054736EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 18:00:00 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-5Yf5rGMZME-Glj26N6-Kkg-1; Fri, 15 Nov 2019 12:59:56 -0500
Received: by mail-qk1-f198.google.com with SMTP id a13so6876739qkc.17
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=zIwhRDWnCJJEFN72Q3MbsTCt6QLWvEWwN2DwQHlMJ5A=;
 b=An50lNb4kmPTW1aaQ/7u1xBtBDQEp0d5DfQCfti47m/RfUU9Rj0bJLMu5TOfXdiT5Q
 2/ibfmNWTSpHUsIEqK088p0ETFxRub39rN89K/74FqVkgL2mKNeiOotCZbwJkOPqee7j
 7oj1qeP6OBihJFxwxsnSb1GziypEWUKe9/v3Nzf9sVk4xYQMcPWSIzn/tjzz3HnIWEbm
 7NfkrAyRmWfd1uKCr03ABKUywYn82itm/DMgNaEhsRVPxbodZaP0CR1qTuJo35K4VQ+g
 ArkV8MKxOoY1FUq7geLmer46xXjX3+UAMMiS9eBaVEuQoRzbA/UxQE1NfJg7p5s7vPI8
 qkNw==
X-Gm-Message-State: APjAAAU9/+h0jQrVLXeyCa1fCxF0O8RfiAkOTMOqE7zbL8jXlrrUhdlS
 Kb6J4F9bCqo6DxUN+8l/tTsbJGEdTshOIe9HEF7GovM/VciZbgMqyGxs5BzoNFwMerwTNLp8qg7
 bXybY7ogpANZxPvaw/UTp+gWIO50i
X-Received: by 2002:a05:620a:1127:: with SMTP id
 p7mr14064294qkk.250.1573840796452; 
 Fri, 15 Nov 2019 09:59:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYMAIFotzOGV6FKioNGzxfCKSYD6mwDQxAj9pIiReFd95wUFmBVpX+FCnmdzuihBRadEiwHA==
X-Received: by 2002:a05:620a:1127:: with SMTP id
 p7mr14064271qkk.250.1573840796209; 
 Fri, 15 Nov 2019 09:59:56 -0800 (PST)
Received: from malachite.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id o28sm5561283qtk.4.2019.11.15.09.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 09:59:55 -0800 (PST)
Message-ID: <d3da084d1576a2fdd3818b048ff5afd67df052e0.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/nouveau: remove set but not used variable
 'pclks','width'
From: Lyude Paul <lyude@redhat.com>
To: zhengbin <zhengbin13@huawei.com>, bskeggs@redhat.com, airlied@linux.ie, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Fri, 15 Nov 2019 12:59:53 -0500
In-Reply-To: <1573825353-86268-2-git-send-email-zhengbin13@huawei.com>
References: <1573825353-86268-1-git-send-email-zhengbin13@huawei.com>
 <1573825353-86268-2-git-send-email-zhengbin13@huawei.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: 5Yf5rGMZME-Glj26N6-Kkg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573840800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5K0xuMYdWnIleL/t0+6BBUk3U5IJmcKBjaaZJaK21ms=;
 b=GvIKF+pOkYyR2VKxcC4NYT0EuKOIQPN8nVqLkdEJ6W1siSThDnhl+CxddhNxWk0Hpp43a2
 s1jqNy0xp/1/tCs/0Ea/VBBoFgp7V/hrYGVO7gLkH+mT8yJAI8SBQyjx6VH1Na9YCR8Sf/
 7jkoBo1yeB2DzxcWO+yRNvM5VjlJg8w=
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
dS9kaXNwbnYwNC9hcmIuYzogSW4gZnVuY3Rpb24gbnYwNF9jYWxjX2FyYjoKPiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnYwNC9hcmIuYzo1OToyMTogd2FybmluZzogdmFyaWFibGUgcGNs
a3Mgc2V0Cj4gYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+IGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jOiBJbiBmdW5jdGlvbiBudjA0X2NhbGNf
YXJiOgo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0L2FyYi5jOjU4OjIxOiB3YXJu
aW5nOiB2YXJpYWJsZSB3aWR0aCBzZXQKPiBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4gCj4gSXQgaXMgaW50cm9kdWNlZCBieSBjb21taXQgNmVlNzM4NjEwZjQxICgi
ZHJtL25vdXZlYXU6Cj4gQWRkIERSTSBkcml2ZXIgZm9yIE5WSURJQSBHUFVzIiksIGJ1dCBuZXZl
ciB1c2VkLAo+IHNvIHJlbW92ZSBpdC4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVs
a2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogemhlbmdiaW4gPHpoZW5nYmluMTNAaHVh
d2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmMg
fCA2ICsrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9h
cmIuYwo+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJiLmMKPiBpbmRleCAz
NjI0OTU1Li45ZDRhMmQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjA0L2FyYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvYXJi
LmMKPiBAQCAtNTMsOCArNTMsOCBAQCBzdHJ1Y3QgbnZfc2ltX3N0YXRlIHsKPiAgc3RhdGljIHZv
aWQKPiAgbnYwNF9jYWxjX2FyYihzdHJ1Y3QgbnZfZmlmb19pbmZvICpmaWZvLCBzdHJ1Y3QgbnZf
c2ltX3N0YXRlICphcmIpCj4gIHsKPiAtCWludCBwYWdlbWlzcywgY2FzLCB3aWR0aCwgYnBwOwo+
IC0JaW50IG52Y2xrcywgbWNsa3MsIHBjbGtzLCBjcnRwYWdlbWlzczsKPiArCWludCBwYWdlbWlz
cywgY2FzLCBicHA7Cj4gKwlpbnQgbnZjbGtzLCBtY2xrcywgY3J0cGFnZW1pc3M7Cj4gIAlpbnQg
Zm91bmQsIG1jbGtfZXh0cmEsIG1jbGtfbG9vcCwgY2JzLCBtMSwgcDE7Cj4gIAlpbnQgbWNsa19m
cmVxLCBwY2xrX2ZyZXEsIG52Y2xrX2ZyZXE7Cj4gIAlpbnQgdXNfbSwgdXNfbiwgdXNfcCwgY3J0
Y19kcmFpbl9yYXRlOwo+IEBAIC02NSwxMSArNjUsOSBAQCBudjA0X2NhbGNfYXJiKHN0cnVjdCBu
dl9maWZvX2luZm8gKmZpZm8sIHN0cnVjdAo+IG52X3NpbV9zdGF0ZSAqYXJiKQo+ICAJbnZjbGtf
ZnJlcSA9IGFyYi0+bnZjbGtfa2h6Owo+ICAJcGFnZW1pc3MgPSBhcmItPm1lbV9wYWdlX21pc3M7
Cj4gIAljYXMgPSBhcmItPm1lbV9sYXRlbmN5Owo+IC0Jd2lkdGggPSBhcmItPm1lbW9yeV93aWR0
aCA+PiA2Owo+ICAJYnBwID0gYXJiLT5icHA7Cj4gIAljYnMgPSAxMjg7Cj4gCj4gLQlwY2xrcyA9
IDI7Cj4gIAludmNsa3MgPSAxMDsKPiAgCW1jbGtzID0gMTMgKyBjYXM7Cj4gIAltY2xrX2V4dHJh
ID0gMzsKPiAtLQo+IDIuNy40Cj4gCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
