Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2EE4497
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 09:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212516E8BF;
	Fri, 25 Oct 2019 07:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DDB6E8BF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:35:04 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s1so1120898wro.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 00:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=HGXfWKZmZRCSo6+nSvPE8t2SGIonOMV9wnp0CGvzAak=;
 b=bEKQyf9VvpyGYxaDgeISmTLiAGJLiH2pAwamv8A6zmAPxgwKmIEMYr1Y2+Fne7GZ1i
 emTe78gWVrLDqmut9HDwU+o6qdNngGOjQA3HAB1embIqzaO6VpZAOsYmEBnqvH5+znhw
 OKBtsiCshcPhlyA7ZLDPqw9MB0tuCvzEluihRrRovAww0+lfaoyqAY9EDAibg9NEEQhX
 UkN/01OLw2WjLFaHbeIp/gYr5XmMYeeA4PPYGzZkTzP8cA7QpX2wXAFMlRiNvEZVawaG
 h8wiT//oU7DgGSiDQzrcYoD03fs3oIdF5jJ2v+cuFPFxzkj6gEl8UVpIKqx6fP1Z2sHk
 cfHg==
X-Gm-Message-State: APjAAAWjXO6qcluKb+b0wj38mk8lrb81WzutxmrSONq01bEAF9FvzzZT
 S0utnOWsR9JXFRdZUC6iSwvvcQ==
X-Google-Smtp-Source: APXvYqwPt7x8veDncU01hWDTQ8lkApb771YiLVgasuhkhAU08Ds7MYjaM+BSSAiVOOHxL9jBUwMLUw==
X-Received: by 2002:a5d:6651:: with SMTP id f17mr1549878wrw.175.1571988902967; 
 Fri, 25 Oct 2019 00:35:02 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v128sm1760659wmb.14.2019.10.25.00.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:35:02 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:35:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bhanusree <bhanusreemahesh@gmail.com>
Subject: Re: [PATCH 1/2] drm/gpu: Fix Missing blank line after declarations
Message-ID: <20191025073500.GN11828@phenom.ffwll.local>
References: <1571984833-4596-1-git-send-email-bhanusreemahesh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571984833-4596-1-git-send-email-bhanusreemahesh@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HGXfWKZmZRCSo6+nSvPE8t2SGIonOMV9wnp0CGvzAak=;
 b=Qnsoq+ZHb8kKYOZbbTJoMghtLY2EH/29blGNCzLJ+CunakXDKSbINbzkrERS8n5NLx
 DgWkhTF3NB7zx01Xzj+Dcd1Bt9ZCPMOwAj9uZk7zledGWYVwJJrsiANc2UNQvJ5+676z
 Lqj/65d9L7/7rKZHJgGD9qDgetB7FGsrWphRs=
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NTc6MTNBTSArMDUzMCwgQmhhbnVzcmVlIHdyb3Rl
Ogo+IC1JbnNlcnQgYSBibGFuayBsaW5lIGFmdGVyIHRoZSBkZWNsYXJhdGlvbnMuCj4gLUlzc3Vl
IGZvdW5kIHVzaW5nIGNoZWNrcGF0Y2gucGwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCaGFudXNyZWUg
PGJoYW51c3JlZW1haGVzaEBnbWFpbC5jb20+CgpBcHBsaWVkLCB0aGFua3MgZm9yIHlvdXIgcGF0
Y2guCi1EYW5pZWwKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYyB8IDIgKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKPiBp
bmRleCBlNTc0MjYxLi4xMmY4ZDFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y2FjaGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYwo+IEBAIC05Miw2ICs5
Miw3IEBAIGRybV9jbGZsdXNoX3BhZ2VzKHN0cnVjdCBwYWdlICpwYWdlc1tdLCB1bnNpZ25lZCBs
b25nIG51bV9wYWdlcykKPiAgCj4gICNlbGlmIGRlZmluZWQoX19wb3dlcnBjX18pCj4gIAl1bnNp
Z25lZCBsb25nIGk7Cj4gKwo+ICAJZm9yIChpID0gMDsgaSA8IG51bV9wYWdlczsgaSsrKSB7Cj4g
IAkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwYWdlc1tpXTsKPiAgCQl2b2lkICpwYWdlX3ZpcnR1YWw7
Cj4gQEAgLTE1Nyw2ICsxNTgsNyBAQCBkcm1fY2xmbHVzaF92aXJ0X3JhbmdlKHZvaWQgKmFkZHIs
IHVuc2lnbmVkIGxvbmcgbGVuZ3RoKQo+ICAJaWYgKHN0YXRpY19jcHVfaGFzKFg4Nl9GRUFUVVJF
X0NMRkxVU0gpKSB7Cj4gIAkJY29uc3QgaW50IHNpemUgPSBib290X2NwdV9kYXRhLng4Nl9jbGZs
dXNoX3NpemU7Cj4gIAkJdm9pZCAqZW5kID0gYWRkciArIGxlbmd0aDsKPiArCj4gIAkJYWRkciA9
ICh2b2lkICopKCgodW5zaWduZWQgbG9uZylhZGRyKSAmIC1zaXplKTsKPiAgCQltYigpOwo+ICAJ
CWZvciAoOyBhZGRyIDwgZW5kOyBhZGRyICs9IHNpemUpCj4gLS0gCj4gMi43LjQKPiAKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
