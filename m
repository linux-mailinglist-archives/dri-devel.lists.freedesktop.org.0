Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B01CEC01
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 20:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6136E673;
	Mon,  7 Oct 2019 18:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671F06E162
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 18:35:10 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ED5303680A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 18:35:09 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id o34so16167018qtf.22
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 11:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DTzJgj8lOnF6nPaOYuQDCDQJ3WcNkGbHe0aG10fzyBc=;
 b=QrvWhBnCkX73JHNOvCvCr88s5KJFZdt5w4AZq3J1OxuZ9NiwnN4bKIwl1IB1r9tu43
 CXNBFOf8xFXWsQsK1MBB9WlexUhrn1OEXhAAOnVgC2bokjjgm80FBZ+myFqgxUKd13ec
 exKXyqWOH/4YtJWfZ4x1x+mtzKoO8p2JAKo6O1Vs71roLFoeoz23BK1W1HjoZ3TtIOdl
 KWgwCwdb6jmDSrb8p7TDgdLe+qvsnsacDYPA3dmuRxMT6qPsMubGRcKGSciBoexhO4PS
 nct37DM5Q+5O7o93AkggAhZf1aIWCWouhTEh3QhD0eJGqqZ6kAdMyNy+t4wbZk82Y4q9
 yGRg==
X-Gm-Message-State: APjAAAVJ3dfso+hWPns8vifb+epf6l1BovTAyVOZbA7cJjqpIsmeZo2W
 WTU8aiBjrQAGAhIdOd0QPelv8Mo1Luw7IKBWtACwPi4qsITPA2lqSz/BXuF7FiomiDd9jvhpehu
 Wnv0ZpuYfKpiUhnol+AlGUnQ3oI6y
X-Received: by 2002:ac8:6650:: with SMTP id j16mr12702480qtp.4.1570473309324; 
 Mon, 07 Oct 2019 11:35:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgecP3wR9qiYhE2XoZghpS/9ZwBEAGROF9BAEtPhfxXFU8hbG5wZKmjKvs5/nOUxCgfDZRFQ==
X-Received: by 2002:ac8:6650:: with SMTP id j16mr12702447qtp.4.1570473308994; 
 Mon, 07 Oct 2019 11:35:08 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id v4sm7824368qkj.28.2019.10.07.11.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 11:35:08 -0700 (PDT)
Message-ID: <f8226ad38e282370e9c7023c039fead48fac63bc.camel@redhat.com>
Subject: Re: [PATCH v1 1/2] drm_dp_cec: drop use of drmP.h
From: Lyude Paul <lyude@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Date: Mon, 07 Oct 2019 14:35:07 -0400
In-Reply-To: <20191007171224.1581-2-sam@ravnborg.org>
References: <20191007171224.1581-1-sam@ravnborg.org>
 <20191007171224.1581-2-sam@ravnborg.org>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBNb24sIDIwMTkt
MTAtMDcgYXQgMTk6MTIgKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiBkcm1QLmggaXMgZGVw
cmVjYXRlZCBhbmQgd2lsbCBiZSBkZWxldGVkLgo+IFJlcGxhY2UgdXNlIHdpdGggcHJvcGVyIGhl
YWRlci4KPiAKPiBEaXZpZGUgaGVhZGVyIGluY2x1ZGVzIGluIGJsb2NrcyB3aGlsZSB0b3VjaGlu
ZyB0aGVzZS4KPiAKPiBCdWlsZCB0ZXN0ZWQgd2l0aCB2YXJpb3VzIGFyY2h0ZWN0dXJlcyBhbmQg
Y29uZmlncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Cj4gRml4ZXM6IGFlODViMGRmMTI0ZjY5MjggKCJkcm1fZHBfY2VjOiBhZGQgY29ubmVjdG9y
IGluZm8gc3VwcG9ydC4iKQo+IENjOiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVrbUBnb29n
bGUuY29tPgo+IENjOiBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KPiBD
YzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdn
c0ByZWRoYXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2NlYy5jIHwgNiAr
KysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfY2VjLmMKPiBpbmRleCBiNDU3YzE2YzNhOGIuLjNhYjI2MDlmOWVjNyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2NlYy5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9jZWMuYwo+IEBAIC04LDEwICs4LDEyIEBACj4gICNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgo+ICsKPiArI2luY2x1ZGUgPG1lZGlhL2NlYy5oPgo+ICsKPiAgI2luY2x1
ZGUgPGRybS9kcm1fY29ubmVjdG9yLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgo+
ICAjaW5jbHVkZSA8ZHJtL2RybV9kcF9oZWxwZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+
Cj4gLSNpbmNsdWRlIDxtZWRpYS9jZWMuaD4KPiAgCj4gIC8qCj4gICAqIFVuZm9ydHVuYXRlbHkg
aXQgdHVybnMgb3V0IHRoYXQgd2UgaGF2ZSBhIGNoaWNrZW4tYW5kLWVnZyBzaXR1YXRpb24KLS0g
CkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
