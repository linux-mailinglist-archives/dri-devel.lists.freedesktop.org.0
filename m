Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCF9A247
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 23:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFEE6EB20;
	Thu, 22 Aug 2019 21:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256786EB20
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 21:39:11 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8CD0387648
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 21:39:10 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id b9so7928814qti.20
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 14:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=e9WY9jrwVW0BcfyRUxVezDy69OF0ObsctHC3kcFPMUY=;
 b=SCG4hazuqLJ2sONNOttVtZjWUQksvopIdnYd2vrCHRv5cRh4nEBE2ebAGl3Ts1doNh
 uuIVEOHTdjVW64QEYBjf+vowbY207lPD43YUDHTCFSHuswXYC6mzgE1rJfrPAEd5CLfH
 yIkA5qmO5aLvbjxwKSwup+psuT0KP6uC9oa2qLi2+oMNu/GJ5q+KhmcGMSez2VmEpLme
 y+es5UYtlB3AIPMCCAm/FS9b5zwVUd+TOE/cmr0Kl3JCtaURpA3Fdy5SJRwrcIpODP/S
 fEkI69WXmIKO4YYpLRwas5+1mmuEP6gK4kjuyn+aH0dbS14kT4QpRjmd0lTVnzW2Q0Kh
 86rQ==
X-Gm-Message-State: APjAAAX9BjNHzmitOShd0GqbAF/mVszmuo75K9LOqdwE5GjQuQddNuD0
 qzOCISyRralI4LhDKuK4Ca9hCqo3O48rPuhVWxqOZirsGLhHYvJ3jxCG2zy1PN3nqTVUIj3kswb
 xMiqQdyDOOFr5BtHusLW+tzbdUx4A
X-Received: by 2002:a37:4f8a:: with SMTP id d132mr1213433qkb.292.1566509949784; 
 Thu, 22 Aug 2019 14:39:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXURFaKyWhtwyEw5+lFFYq6eUp7PiF+YQ4pI/4etyVblT3YsbQ3TZe8jlG+jSYcYq8mz1CtQ==
X-Received: by 2002:a37:4f8a:: with SMTP id d132mr1213421qkb.292.1566509949522; 
 Thu, 22 Aug 2019 14:39:09 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id o34sm519286qtc.61.2019.08.22.14.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 14:39:09 -0700 (PDT)
Message-ID: <3c6774152dff5a1fbb4e7ed9e4c3111b0db6c0bc.camel@redhat.com>
Subject: Re: [PATCH v4 0/5] MST DSC support in drm-mst
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Date: Thu, 22 Aug 2019 17:39:07 -0400
In-Reply-To: <20190822135741.12923-1-David.Francis@amd.com>
References: <20190822135741.12923-1-David.Francis@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3RpbGwgaW4gdGhlIHByb2Nlc3Mgb2YgcmV2aWV3aW5nIHRoaXMsIGJ1dCBvbmUgbWlub3IgY2hh
bmdlIHRoYXQgc2hvdWxkIGJlCmRvbmUgb24gYWxsIG9mIHRoZSBwYXRjaGVzICh3aGljaCBJIGRp
ZG4ndCBub3RpY2UgYmVmb3JlLCB3aG9vcHMpOgoKczpkcm0vZHAtbXN0OmRybS9kcF9tc3Q6ZwoK
T24gVGh1LCAyMDE5LTA4LTIyIGF0IDA5OjU3IC0wNDAwLCBEYXZpZCBGcmFuY2lzIHdyb3RlOgo+
IEFkZCBuZWNlc3Nhcnkgc3VwcG9ydCBmb3IgTVNUIERTQy4KPiAoRGlzcGxheSBTdHJlYW0gQ09t
cHJlc3Npb24gb3ZlciBNdWx0aS1TdHJlYW0gVHJhbnNwb3J0KQo+IAo+IHY0OiBTcGxpdCBwYXRj
aHNldCBhbmQgcmViYXNlIG9udG8gZHJtLXRpcAo+IAo+IERhdmlkIEZyYW5jaXMgKDUpOgo+ICAg
ZHJtL2RwLW1zdDogQWRkIFBCTiBjYWxjdWxhdGlvbiBmb3IgRFNDIG1vZGVzCj4gICBkcm0vZHAt
bXN0OiBQYXJzZSBGRUMgY2FwYWJpbGl0eSBvbiBNU1QgcG9ydHMKPiAgIGRybS9kcC1tc3Q6IEFk
ZCBNU1Qgc3VwcG9ydCB0byBEUCBEUENEIFIvVyBmdW5jdGlvbnMKPiAgIGRybS9kcC1tc3Q6IEZp
bGwgYnJhbmNoLT5udW1fcG9ydHMKPiAgIGRybS9kcC1tc3Q6IEFkZCBoZWxwZXJzIGZvciBxdWVy
eWluZyBhbmQgZW5hYmxpbmcgTVNUIERTQwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1
eF9kZXYuYyAgICAgIHwgIDEyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMg
ICAgICAgfCAgMTAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8
IDI0MyArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fZHBfbXN0
X2hlbHBlci5oICAgICAgIHwgICA4ICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjYwIGluc2VydGlv
bnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
