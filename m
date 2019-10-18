Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFADD124
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E2589BF3;
	Fri, 18 Oct 2019 21:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B91A89BF3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:23:38 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-WAV2qddoPlG6p9SfLoPFSA-1; Fri, 18 Oct 2019 17:23:36 -0400
Received: by mail-qt1-f199.google.com with SMTP id s14so7219733qtn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CB72lsJbZD9NRZdHYwBH9scaXwH3H2ow00hJFlC1mnw=;
 b=ddZedm8S9VA5V/1AME4gyvFKQ8ZfwJH8HnTjmvaMsZD8APFqGZDmVHFOC/A8FnN+in
 xV69dowRtH8i4OV3k32UK1rMD13DeGCtRd+KbsbhBEJTZIvwY7eNY17gZ2gKlPWhUSw+
 2HeKRfFa+9SkFjKO9yKw662w4dp37b51TM9JT5IOU6p7MdWWpbYz8dPz45DO5Pm53GHF
 SrmPKKTyM+0u/q9wKtu7x3YiaZhhY5D/xQBfWrpWs9WKFkSuxQ0xMGeMoSxWPW50djIw
 aoixT9wjeauZjWL4wWOKBIk+in+U8VXzrAkCSl9pFGx7aTiJc9qEoyduOsX+Ktg6dWkk
 TI9Q==
X-Gm-Message-State: APjAAAW3e+sHc/KchxonW0PtVb37lCx5IEAVV2lHf4BtBME3q6iGbZnz
 djMohSQ8lJooIoSvaYD+cIbVTuk7Qm5QY/MmJQ9n8sBRTc1GZerWsh4V4KagLGXY4aBlFysw+T9
 xKG+G4xwDjj6uF1L1C26czLlk9kuH
X-Received: by 2002:ad4:538b:: with SMTP id i11mr11422526qvv.211.1571433815621; 
 Fri, 18 Oct 2019 14:23:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIy7eeQp0vWIqB82InMIPijNBrs4qtEVCP+QNVu0uwbi3JAnfcs0bBFFUw0vdm3solpcx3Lw==
X-Received: by 2002:ad4:538b:: with SMTP id i11mr11422508qvv.211.1571433815363; 
 Fri, 18 Oct 2019 14:23:35 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 56sm7255510qty.15.2019.10.18.14.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:23:34 -0700 (PDT)
Message-ID: <8a8b77ee72e3c032b49a1f26630db35f208786f8.camel@redhat.com>
Subject: Re: [PATCH 05/15] drm/dp: Add
 drm_dp_alternate_scrambler_reset_cap() helper
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:23:34 -0400
In-Reply-To: <20191015143509.1104985-6-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-6-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: WAV2qddoPlG6p9SfLoPFSA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571433817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Ess8tLHTTuzaR0MInTXutzkZI8aVY0f6XdLAFOyySQ=;
 b=aQTCrn+ao8x3m5SONy2ag+dqWNGZgMSw3yXnWJqF0X3xDMsteix7Ylx25y2gYLpRf9auZZ
 +YnHm3cof/N2a8XLR6UO0w9Vqa7esYkCQJ8W/Yc3JNicLUfN5L90Fsc4Pb9ifAMqPLX8h2
 XGlCb55w384VzHOt0UryzTCqYjTiBsY=
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTAtMTUgYXQgMTY6MzQgKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gQWRkIGEgaGVscGVyIHRvIGNoZWNr
IGlmIHRoZSBzaW5rIHN1cHBvcnRzIHRoZSBlRFAgYWx0ZXJuYXRlIHNjcmFtYmxlcgo+IHJlc2V0
IHZhbHVlIG9mIDB4ZmZmZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJl
ZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggfCA3
ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKPiBpbmRleCA3ZmY3YmYwZTc0MmQuLjdhNTM3ZmZjMmZiMSAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVs
cGVyLmgKPiBAQCAtMTI5MCw2ICsxMjkwLDEzIEBAIGRybV9kcF9jaGFubmVsX2NvZGluZ19zdXBw
b3J0ZWQoY29uc3QgdTgKPiBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKPiAgCXJldHVybiBk
cGNkW0RQX01BSU5fTElOS19DSEFOTkVMX0NPRElOR10gJiBEUF9DQVBfQU5TSV84QjEwQjsKPiAg
fQo+ICAKPiArc3RhdGljIGlubGluZSBib29sCj4gK2RybV9kcF9hbHRlcm5hdGVfc2NyYW1ibGVy
X3Jlc2V0X2NhcChjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKPiArewo+ICsJ
cmV0dXJuIGRwY2RbRFBfRURQX0NPTkZJR1VSQVRJT05fQ0FQXSAmCj4gKwkJCURQX0FMVEVSTkFU
RV9TQ1JBTUJMRVJfUkVTRVRfQ0FQOwo+ICt9Cj4gKwo+ICAvKgo+ICAgKiBEaXNwbGF5UG9ydCBB
VVggY2hhbm5lbAo+ICAgKi8KLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
