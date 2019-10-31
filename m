Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB08EB87F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 21:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DCA6E13D;
	Thu, 31 Oct 2019 20:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E8C6E13D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 20:41:09 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-JDNTb4TBOEavickb9yg1Pg-1; Thu, 31 Oct 2019 16:41:04 -0400
Received: by mail-qk1-f199.google.com with SMTP id 22so2934177qka.23
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 13:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=p6eKaLv3iKa7qgJud9TxZ9yLFlOCSuIIjBGdjokvwSg=;
 b=GkDzNPdA3q4D4ghgQuAYwbbgUkDe6JnaBMMfIO/Q5V5O1OF2C+nuVIiESWl5IMkwuj
 qTkwzSi5SUS+muE1qR9OjPFfbtSnK6qtWra65lBVU0im7Fmt7fiWMjwAMSearsAFGpTl
 UV/yYhXf2mflWfgxx+soq6E9agDeSmtd/kQbELZ7hTNL0MMxRDlL2axI/h7ru6GxvJ6C
 AbcxAnA+GtQMx/zGn4I5/oXoyMnF7SWP2h9091Q/mJzqIEBHwUfwkFN7qctEnULNESqA
 5UzKc7qYxvnDCMSoncnfHuVWQA0DlKY/k4r+D039Bxlc2GfufkXyUwAv34MB7S5o1R5O
 0dbg==
X-Gm-Message-State: APjAAAXmW7BuBMyLK65HJTYXEoPNUyR3mmct1dL/KkUZ0ZQmPu+RkbL1
 EVMyIAsAzcaJLu7LP189gGn61U61qoXiPPwODMGFYbEjXIl7FGKeGaecgkEyNZMfG4w3uDjhq6g
 Y3Dgg+czZNzW0t5s3zcmxVbYq5lQ5
X-Received: by 2002:a0c:95a1:: with SMTP id s30mr6816933qvs.110.1572554464198; 
 Thu, 31 Oct 2019 13:41:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxY6MB5Msd78VZdUn8VRNxdtWrIozbb1ENKzp7VRtWwFnE7WAJPDPMz8sbahJvYTnr+1hh+8A==
X-Received: by 2002:a0c:95a1:: with SMTP id s30mr6816909qvs.110.1572554463926; 
 Thu, 31 Oct 2019 13:41:03 -0700 (PDT)
Received: from dhcp-10-20-1-46.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id p66sm2976514qkd.1.2019.10.31.13.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 13:41:02 -0700 (PDT)
Message-ID: <b780f798c8aa8080aedc733c43a5c706939ddcce.camel@redhat.com>
Subject: Re: [RESEND PATCH] drm/dp: Increase link status size
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 31 Oct 2019 16:41:01 -0400
In-Reply-To: <20191029140312.516266-1-thierry.reding@gmail.com>
References: <20191029140312.516266-1-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: JDNTb4TBOEavickb9yg1Pg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572554468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpfVpgUzydSrNEJti+E1epOk+K1dgvFdkJw4FNDDCao=;
 b=KoEGVnsGBl7pJHgoLdqT05UShOwsGlF/Usns33fMjTFrTMFeDr/QfFznXs/OgQWVWBtOtR
 7krfJS9f2rewz44Qh5pXZ1plj6Zjo80afo1+qUslI2WkvEW98M0ePhoCYbymQ0eBKkvnme
 sb5zMxlK278yRA+22y6RT7dzrfFjkAE=
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
Cc: intel-gfx@lists.freedesktop.org,
 coverity-bot <keescook+coverity-bot@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hvb3BzLCByZXBsaWVkIHRvIHRoZSB3cm9uZyBvbmUKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTktMTAtMjkgYXQgMTU6MDMgKzAxMDAsIFRo
aWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Cj4gCj4gVGhlIGN1cnJlbnQgbGluayBzdGF0dXMgY29udGFpbnMgYnl0ZXMgMHgyMDIg
dGhyb3VnaCAweDIwNywgYnV0IHdlIGFsc28KPiB3YW50IHRvIG1ha2Ugc3VyZSB0byBpbmNsdWRl
IHRoZSBEUF9BREpVU1RfUkVRVUVTVF9QT1NUX0NVUlNPUjIgKDB4MjBjKQo+IHNvIHRoYXQgdGhl
IHBvc3QtY3Vyc29yIGFkanVzdG1lbnQgY2FuIGJlIHF1ZXJpZWQgZHVyaW5nIGxpbmsgdHJhaW5p
bmcuCj4gCj4gUmVwb3J0ZWQtYnk6IGNvdmVyaXR5LWJvdCA8a2Vlc2Nvb2srY292ZXJpdHktYm90
QGNocm9taXVtLm9yZz4KPiBBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE0ODczNjYgKCJNZW1vcnkg
LSBjb3JydXB0aW9ucyIpCj4gRml4ZXM6IDc5NDY1ZTBmZmViOSAoImRybS9kcDogQWRkIGhlbHBl
ciB0byBnZXQgcG9zdC1jdXJzb3IgYWRqdXN0bWVudHMiKQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBi
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+IGluZGV4IDUxZWNiNTExMmVmOC4uOTU4MWRl
YzkwMGJhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+IEBAIC0xMTIxLDcgKzExMjEsNyBAQAo+ICAj
ZGVmaW5lIERQX01TVF9QSFlTSUNBTF9QT1JUXzAgMAo+ICAjZGVmaW5lIERQX01TVF9MT0dJQ0FM
X1BPUlRfMCA4Cj4gIAo+IC0jZGVmaW5lIERQX0xJTktfU1RBVFVTX1NJWkUJICAgNgo+ICsjZGVm
aW5lIERQX0xJTktfU1RBVFVTX1NJWkUJICAgMTEKPiAgYm9vbCBkcm1fZHBfY2hhbm5lbF9lcV9v
ayhjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKPiAgCQkJICBpbnQg
bGFuZV9jb3VudCk7Cj4gIGJvb2wgZHJtX2RwX2Nsb2NrX3JlY292ZXJ5X29rKGNvbnN0IHU4IGxp
bmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdLAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
