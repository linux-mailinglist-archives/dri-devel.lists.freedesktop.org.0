Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A80AFD793
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5256E0DC;
	Fri, 15 Nov 2019 08:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D21E6EE42
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 17:29:42 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k13so4204364pgh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 09:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:cc:from:subject:to
 :user-agent:date;
 bh=CcYQV1LmmMin4KfNUQWfqXUn7x+pyW1iTl5f3vQ+Lhw=;
 b=HIpJJkzJ3x9hOIHRqgglUXR79MOgG6z3qC3e2T95uIe07rKSpS5KOcRUUDnimwXGlr
 csSYjtVRo/wMnvGCyTsw8rUEgBPRyxbRpksryMMHjH7lfp6CX1PAZmDeqNPetzPN3QE2
 hY43GPIPCf95Wp+CqdoxUVAZHNTdmRghQ8jX4v0nm3eEOZahjSFBogtyJ1v8BTTyg9aD
 7fRCiktLyFssnuv51Dylj0MYPucySz45nuI1ol06EPh0iTJNQYyv4uKqxWskzhEkQypu
 QxgYzfRzBpJkfjPY41WcuvXckSNf1IdxRZAq2DSkwQM5PGhY5fPK6S3/S2yMfyr0Z7PK
 yBkQ==
X-Gm-Message-State: APjAAAVkOjTLRkgMGrMOWxax5G7LhnFSDltj3WrXpEH7LcSW2xPFsG+V
 r0b3saVbDf02R0Tigka2yq1anQ==
X-Google-Smtp-Source: APXvYqzty8fGyHYZm9ySVIF8pi9T97dNqEd99tGhmW7ag+BB8smmNExV5fwEnlcaxmxVHJRlf+vtew==
X-Received: by 2002:aa7:8256:: with SMTP id e22mr12167282pfn.247.1573752582247; 
 Thu, 14 Nov 2019 09:29:42 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id i71sm6900213pfe.103.2019.11.14.09.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 09:29:41 -0800 (PST)
Message-ID: <5dcd8f05.1c69fb81.bdd4.2b0a@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <1573710976-27551-1-git-send-email-dhar@codeaurora.org>
References: <1573710976-27551-1-git-send-email-dhar@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [v2] msm: disp: dpu1: add support to access hw irqs regs
 depending on revision
To: Shubhashree Dhar <dhar@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
User-Agent: alot/0.8.1
Date: Thu, 14 Nov 2019 09:29:40 -0800
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:cc:from:subject:to:user-agent:date;
 bh=CcYQV1LmmMin4KfNUQWfqXUn7x+pyW1iTl5f3vQ+Lhw=;
 b=NxMGYSTtBK4i5RPqbguGXItXdVNjv2nYm1/iGpCOqRIVhhVH6vf7946u7XMPm25GJA
 q7nWJkt3+Xf/XDjNbHKHgXjXTbJHCI69Wm000ian3oAhz2GlGBNz1DTe9WXQgjh7aurH
 DMoXuOTRdgV6nuAZHMYwbqnm9praYO+bqeVas=
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBTaHViaGFzaHJlZSBEaGFyICgyMDE5LTExLTEzIDIxOjU2OjE2KQo+IEN1cnJlbnQg
Y29kZSBhc3N1bWVzIHRoYXQgYWxsIHRoZSBpcnFzIHJlZ2lzdGVycyBvZmZzZXRzIGNhbiBiZQo+
IGFjY2Vzc2VkIGluIGFsbCB0aGUgaHcgcmV2aXNpb25zOyB0aGlzIGlzIG5vdCB0aGUgY2FzZSBm
b3Igc29tZQo+IHRhcmdldHMgdGhhdCBzaG91bGQgbm90IGFjY2VzcyBzb21lIG9mIHRoZSBpcnEg
cmVnaXN0ZXJzLgoKV2hhdCBoYXBwZW5zIGlmIHdlIHJlYWQgdGhlIGlycSByZWdpc3RlcnMgdGhh
dCB3ZSAic2hvdWxkIG5vdCBhY2Nlc3MiPwpEb2VzIHRoZSBzeXN0ZW0gcmVzZXQ/IEl0IHdvdWxk
IGJlIGVhc2llciB0byBtYWtlIHRob3NlIHJlZ2lzdGVycyByZXR1cm4KMCB3aGVuIHJlYWQgaW5k
aWNhdGluZyBubyBpbnRlcnJ1cHQgYW5kIGlnbm9yZSB3cml0ZXMgc28gdGhhdCBldmVyeXRoaW5n
CmtlZXBzIHdvcmtpbmcgd2l0aG91dCBoYXZpbmcgdG8gc2tpcCByZWdpc3RlcnMuCgo+IFRoaXMg
Y2hhbmdlIGFkZHMgdGhlIHN1cHBvcnQgdG8gc2VsZWN0aXZlbHkgcmVtb3ZlIHRoZSBpcnFzIHRo
YXQKPiBhcmUgbm90IHN1cHBvcnRlZCBpbiBzb21lIG9mIHRoZSBodyByZXZpc2lvbnMuCj4gCj4g
Q2hhbmdlLUlkOiBJNjA1MmI4MjM3YjcwM2ExYTllZGQ1Mzg5M2UwNGY3YmQ3MjIyM2RhMQoKUGxl
YXNlIHJlbW92ZSB0aGVzZSBiZWZvcmUgc2VuZGluZyB1cHN0cmVhbS4KCj4gU2lnbmVkLW9mZi1i
eTogU2h1Ymhhc2hyZWUgRGhhciA8ZGhhckBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuYyAgICB8ICAxICsKPiAgZHJp
dmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuaCAgICB8ICAzICsrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfaHdfaW50ZXJydXB0cy5jIHwgMjIg
KysrKysrKysrKysrKysrKystLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfaHdfaW50ZXJydXB0cy5oIHwgIDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmggYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfaHdfY2F0YWxvZy5oCj4gaW5kZXggZWM3NmI4NjguLmRlZjhhM2YgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2cuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nLmgKPiBAQCAt
NjQ2LDYgKzY0Niw3IEBAIHN0cnVjdCBkcHVfcGVyZl9jZmcgewo+ICAgKiBAZG1hX2Zvcm1hdHMg
ICAgICAgIFN1cHBvcnRlZCBmb3JtYXRzIGZvciBkbWEgcGlwZQo+ICAgKiBAY3Vyc29yX2Zvcm1h
dHMgICAgIFN1cHBvcnRlZCBmb3JtYXRzIGZvciBjdXJzb3IgcGlwZQo+ICAgKiBAdmlnX2Zvcm1h
dHMgICAgICAgIFN1cHBvcnRlZCBmb3JtYXRzIGZvciB2aWcgcGlwZQo+ICsgKiBAbWRzc19pcnFz
ICAgICAgICAgIEJpdG1hcCB3aXRoIHRoZSBpcnFzIHN1cHBvcnRlZCBieSB0aGUgdGFyZ2V0CgpI
bW0gcHJldHR5IHN1cmUgdGhlcmUgbmVlZHMgdG8gYmUgYSBjb2xvbiBzbyB0aGF0IGtlcm5lbC1k
b2MgY2FuIG1hdGNoCnRoaXMgYnV0IG1heWJlIEknbSB3cm9uZy4KCj4gICAqLwo+ICBzdHJ1Y3Qg
ZHB1X21kc3NfY2ZnIHsKPiAgICAgICAgIHUzMiBod3ZlcnNpb247Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
