Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA7F26D996
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 12:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB596EBA6;
	Thu, 17 Sep 2020 10:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DA66EBA6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:52:06 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id x20so1352759ybs.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=76K6CPrhtELN1ug2yeUGGmfjFjCqi8WV0DZKzgebpoo=;
 b=Ks3kficTCH/45CX0uH6bYIAPxrer83iAr0s4rb2O5H0DxxFKO3W20aVAdJcpJiW7qA
 Vy2Au5IXC8phi5SaYo0a1K4QRk4vQ+smDt/Oh3k/Ay22gWITaYakzAVNCJt99tVcMQh7
 AhWLqhYIifFpc5pt+c82Um6tpYyfUrsOJg5/e9dVj27BR2iFXvOtp9uA9bRx5Uk2UO3P
 m+yDWqAnquGYiIv6B89vodcO+rD16kGQBB9FE3/vAVsRkMRP0nlqLZBdgY5MGMZkyyfG
 SU+V+wsxAtW5d50AvuYCEWy+LHfKAN3Cy2uuoRGiIwccwdWwIY2KLAux9eEphq71wDsN
 h+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=76K6CPrhtELN1ug2yeUGGmfjFjCqi8WV0DZKzgebpoo=;
 b=KYB0OBGI7vrYkT3nXXmcU+2LrIFuFGZBopuZ9ZK4G3PYyG7O8rJSkchZc3xa0joTmm
 jsJ+EhuhqqJ5UaVz425vKy8BzdUXQkn+LiZqF5b0HT70kC5KxfySqICgIZdGK4gYYZu0
 jERya0n/DjmOMaBSP1+OmlIwDg94u3/BS9FtenlZ0XIh9x3Z9tFfxgYOJ0ziQGp2M0qV
 Z/tV76dbWUaWXqWNU+ukMz+P9Ryy7+mEr/xwxYuAH5LKrksHc64Vu1S9XkQX+UGTT3lg
 d5drygmk/sAdXZ4BfxDdSkiL8C5cuP2xLFo7u4LY1AgzeEZsqPGHshegnNpmlTVNVfHS
 oGFQ==
X-Gm-Message-State: AOAM530UTV4bpxldAzmKeNUsDOLcPknaVm6X2S2nzaIO+IAcn1bvv4Eu
 RwOraZIfo9puuFG+6HsbtbApPsjbJC1ty6M/hJE=
X-Google-Smtp-Source: ABdhPJypHTflhkceLfRTSD06zw5wFdymadnsPRBoKok07XOMl9M0lS8zti15PgBU2AUTZGjbj+INPdUHpDWWa0qmnk4=
X-Received: by 2002:a25:5704:: with SMTP id l4mr8447473ybb.435.1600339926195; 
 Thu, 17 Sep 2020 03:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <5315ceb2-8be0-5a12-5d9d-9244ebf17e74@gmail.com>
In-Reply-To: <5315ceb2-8be0-5a12-5d9d-9244ebf17e74@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 17 Sep 2020 20:51:55 +1000
Message-ID: <CACAvsv7HffJYt-58FrDVWCrfD1WQP0-0q=C3JsJXOOhNSZsJYQ@mail.gmail.com>
Subject: Re: Why is nouveau using a separate swap storage?
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNyBTZXAgMjAyMCBhdCAyMDowNiwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgZ3V5cywKPgo+IGp1c3QgYW5v
dGhlciBUVE0gZmVhdHVyZSB3aGljaCBpcyBvbmx5IHVzZWQgYnkgbm91dmVhdS4KPgo+IFdlIGhh
dmUgdGhpcyBiby0+Ym8ucGVyc2lzdGVudF9zd2FwX3N0b3JhZ2UgcG9pbnRlciB3aGljaCBpcyBv
bmx5IHNldCBieQo+IG5vdXZlYXUgdG8gdGhlIEdFTSBmaWxwIGFuZCB1c2VkIHdoZW4gYSBCTyBp
cyBzd2FwcGVkIHRvIGEgc2htZW0gZmlsZS4KPgo+IEFzIGZhciBhcyBJIGNhbiBzZWUgdGhpcyBk
b2Vzbid0IG1ha2UgYW55IHNlbnNlIGF0IGFsbD8gV2hhdCBpcyB0aGUKPiBiYWNrZ3JvdW5kIGhl
cmUuCk5vIHNwZWNpZmljIHJlYXNvbiBJIGNhbiByZW1lbWJlciwgbGlrZWx5IGNhcmdvLWN1bHQg
ZnJvbSB2ZXJ5IHZlcnkKZWFybHkgdmVyc2lvbnMgb2YgVFRNL0dFTSBzdHVmZi4KCkJlbi4KCj4K
PiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
