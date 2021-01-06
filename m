Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18862EC5B4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 22:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFCD89152;
	Wed,  6 Jan 2021 21:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0038929F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609968461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yoHpt4zDYO1k6h9cr2ReVEpkPY4WN/rFBT3ndPAITWY=;
 b=iNUsT846w7EumaaZ10cmntOHiQoJ1z5V8z2yIuvvJDWY/BEidxtsmYgj7I3mILD4ikjn4B
 oV5HH4dexTq2zoE5AGnTCJz4/icv0IlvOa4jb1s7SlaIC3YWKT5VtiLqbAEOm/mSf9gUOy
 Qb43Ws19sFb6+mB+PzWQUoWKr81lKMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-cxn40vahMXeCYY0QVTRpiQ-1; Wed, 06 Jan 2021 16:27:36 -0500
X-MC-Unique: cxn40vahMXeCYY0QVTRpiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44851809DC9;
 Wed,  6 Jan 2021 21:27:35 +0000 (UTC)
Received: from starship (unknown [10.35.206.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 584CA5D9CD;
 Wed,  6 Jan 2021 21:27:33 +0000 (UTC)
Message-ID: <efc25ad84748f8f343e8d13e818af917e73ea4d5.camel@redhat.com>
Subject: Re: Couple of issues with amdgpu on my WX4100
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
Date: Wed, 06 Jan 2021 23:27:32 +0200
In-Reply-To: <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
References: <4df8585ab0aac5abb1e9502d1d7cc49daa2a464f.camel@redhat.com>
 <83f4291c-abe4-2995-b4ba-9f84c9235d14@amd.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Williamson <alwillia@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTAxLTA0IGF0IDEyOjM0ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IEhpIE1heGltLAo+IAo+IEkgY2FuJ3QgaGVscCB3aXRoIHRoZSBkaXNwbGF5IHJlbGF0ZWQg
c3R1ZmYuIFByb2JhYmx5IGJlc3QgYXBwcm9hY2ggdG8gZ2V0IHRoaXMgZml4ZXMgd291bGQgYmUg
dG8gb3BlbiB1cCBhIGJ1ZyB0cmFja2VyIGZvciB0aGlzIG9uIEZETy4KCkRvbmUsIGJ1Z3MgYXJl
IG9wZW5lZApodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8x
NDI5Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzE0MzAK
CkFib3V0IHRoZSBFRElEIGlzc3VlLCB0aGVyZSBkbyBzZWVtIHRvIGJlIGZldyBvcGVuIGJ1Z3Mg
YWJvdXQgaXQsCmJ1dCB3aGF0IGRpZmZlcnMgaW4gbXkgY2FzZSBJIHRoaW5rIGlzIHRoYXQgRURJ
RCBmYWlsdXJlIGhhcHBlbnMKb25seSBvbmNlIGluIGEgd2hpbGUsIHJhdGhlciB0aGF0IGFsd2F5
cywgYW5kIGl0IHNlZW1zIHRvIGJyaW5nCnRoZSB3aG9sZSBkZXZpY2UgZG93bi4KCkJlc3QgcmVn
YXJkcywKCU1heGltIExldml0c2t5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
