Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8714EB85E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 21:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8DD6E12C;
	Thu, 31 Oct 2019 20:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41706E0C0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 20:27:57 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-oCMOVQPdPKi9o4m1TXnWsQ-1; Thu, 31 Oct 2019 16:27:53 -0400
Received: by mail-qk1-f197.google.com with SMTP id f27so2341871qkk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 13:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=FxyL8SxiROem6pQi6eZjW2nkkxLY7g93Y/XOiXbosi4=;
 b=IXhFs1OHIx3wEbVsqpFlnsJEhNMlbucwtwum/JoVdSyvSqhesFxtBJmuJ4SvDM/4Tp
 ZO6SbMtmJ9r8ExeS2R7N5daXpH2ye2K0NX4cIWbkwMuv8neapfLBaNOfGC0/p1Q8fn1F
 ojhVDPQSkbMjR+Bge6qSNEQ3A5rl7TD1Re0x1Yyf2x/3tSA6OoL4cjBREN0oylyNKe7+
 Jnyy1zca9Fm4cKiT3PRF0h+O/he72qoZOpwGa+otHZabi5XD62Plua6ahL++skmP6b5x
 zAzfevjQIT1YORm75GN1W2zqOKFk/enOWy9DEOa4Un5gJO49vQVZz2NRV/Wo3tZUtFqd
 Ie4g==
X-Gm-Message-State: APjAAAXQPCk5F/ozXrGuEbLZ45Qjv/0cTs85ZeTIgfjMW519bhyyPafn
 4L7lp/bIzdy4k8MMDoXD8oPtxVHvsj3+xytMCkBZra2MGEvO4n7mno2cr/7flrT6QCNoEmzpjju
 TvdYttEpzvA1Q8Ns7P86DECtTV/PK
X-Received: by 2002:a0c:edc6:: with SMTP id i6mr6650918qvr.198.1572553673314; 
 Thu, 31 Oct 2019 13:27:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqze6OjUQjqc5YEzh5qTIPzu5BfIg4YmnVcqFvWMwOEudU13FR//PdzbyUUFn0bqFXIb8K2RQg==
X-Received: by 2002:a0c:edc6:: with SMTP id i6mr6650897qvr.198.1572553672950; 
 Thu, 31 Oct 2019 13:27:52 -0700 (PDT)
Received: from dhcp-10-20-1-46.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x10sm3600674qtj.25.2019.10.31.13.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 13:27:51 -0700 (PDT)
Message-ID: <c68501cd259c28e9091a153b99ac13cd4139ecca.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: Increase link status size
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 31 Oct 2019 16:27:50 -0400
In-Reply-To: <20191029111006.358963-1-thierry.reding@gmail.com>
References: <20191029111006.358963-1-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: oCMOVQPdPKi9o4m1TXnWsQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572553676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXhJHRnX58sd1D3rlhjTIZyn+z0+NvUkAvXs9kcRVZc=;
 b=S1WonzaJJklGOG3nQGHMIvj3ZRm/sBrA/gxgeqP4W3nzA7qJRLwz6ky7xHR+Bqcgenn9nV
 2pfl0/a5slEd0+QfxsmYaCUgvxNB2JIdCKrQ4bsDDOqGSaQMk27Bm5Ktt4osNZnIRUH4dE
 Bcwnp9JWsgwo3SB1ebVDVmIL+3j8CFY=
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
Cc: coverity-bot <keescook+coverity-bot@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTAtMjkgYXQgMTI6MTAgKzAxMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gVGhlIGN1cnJlbnQgbGluayBzdGF0
dXMgY29udGFpbnMgYnl0ZXMgMHgyMDIgdGhyb3VnaCAweDIwNywgYnV0IHdlIGFsc28KPiB3YW50
IHRvIG1ha2Ugc3VyZSB0byBpbmNsdWRlIHRoZSBEUF9BREpVU1RfUkVRVUVTVF9QT1NUX0NVUlNP
UjIgKDB4MjBjKQo+IHNvIHRoYXQgdGhlIHBvc3QtY3Vyc29yIGFkanVzdG1lbnQgY2FuIGJlIHF1
ZXJpZWQgZHVyaW5nIGxpbmsgdHJhaW5pbmcuCj4gCj4gUmVwb3J0ZWQtYnk6IGNvdmVyaXR5LWJv
dCA8a2Vlc2Nvb2srY292ZXJpdHktYm90QGNocm9taXVtLm9yZz4KPiBBZGRyZXNzZXMtQ292ZXJp
dHktSUQ6IDE0ODczNjYgKCJNZW1vcnkgLSBjb3JydXB0aW9ucyIpCj4gRml4ZXM6IDc5NDY1ZTBm
ZmViOSAoImRybS9kcDogQWRkIGhlbHBlciB0byBnZXQgcG9zdC1jdXJzb3IgYWRqdXN0bWVudHMi
KQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4g
LS0tCj4gSSB2YWd1ZWx5IHJlY2FsbCBvbmNlIGNhcnJ5aW5nIGEgcGF0Y2ggdG8gZG8gdGhpcywg
YnV0IEkgY2FuJ3QgZmluZCBhbnkKPiB0cmFjZSBvZiBpdC4KPiAKPiAgaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5o
IGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gaW5kZXggNTFlY2I1MTEyZWY4Li45NTgx
ZGVjOTAwYmEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gQEAgLTExMjEsNyArMTEyMSw3IEBACj4g
ICNkZWZpbmUgRFBfTVNUX1BIWVNJQ0FMX1BPUlRfMCAwCj4gICNkZWZpbmUgRFBfTVNUX0xPR0lD
QUxfUE9SVF8wIDgKPiAgCj4gLSNkZWZpbmUgRFBfTElOS19TVEFUVVNfU0laRQkgICA2Cj4gKyNk
ZWZpbmUgRFBfTElOS19TVEFUVVNfU0laRQkgICAxMQo+ICBib29sIGRybV9kcF9jaGFubmVsX2Vx
X29rKGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdLAo+ICAJCQkgIGlu
dCBsYW5lX2NvdW50KTsKPiAgYm9vbCBkcm1fZHBfY2xvY2tfcmVjb3Zlcnlfb2soY29uc3QgdTgg
bGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0sCi0tIApDaGVlcnMsCglMeXVkZSBQYXVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
