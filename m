Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7BCB52D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EFE6EABA;
	Fri,  4 Oct 2019 07:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFD46E13A;
 Wed,  2 Oct 2019 17:07:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v17so7739102wml.4;
 Wed, 02 Oct 2019 10:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b5t7DfaGuIJVfpW/6AOvG6x/d8yqj3D8O6SWcaOz/1Y=;
 b=WjOj2Su3jca6FUbRXGozrD/GRtDZsjPCfVGbZjJOhcBfvaRrq1a5fy+Tm33BgnhnrS
 1yXPaFgfW8ZL9aOi6Ru8IHgQyOJqfhWqR5iDBpL8gS1ojmOmNR1HowI6X1AwcI1TKYof
 /kno8XUNbD771dqch916Ve1sIN/YkZdPmpLUKp5LhJN0efpNubLP15ZY3AyK8iDWs+rH
 giEubqqTgeiw3B9tCeR5Jjif6njiYeMtQGcDPEiBWwyHfQRNkuplVWRZoO8gdVUxD9o+
 qzOQibU0chtSEZZHJ5ULllsicrfHKRlnN7PnlgsaALfx2ROtP5OynRgIfy7FM3rWeduN
 9awA==
X-Gm-Message-State: APjAAAUjiqzGS+ny60NWsu5v6356lDmb4ItrHvD9OD+wxErHT6VPb3VD
 /fYWfelx5J8xSyIVYpFBwBc=
X-Google-Smtp-Source: APXvYqzX5fLQw5wWj0pE3+sGCTmrFgoY5C9x3lumrbZ+x3yvpHDxD1HoY1ykVnkw0yAf0S1/X3xOxQ==
X-Received: by 2002:a7b:c34e:: with SMTP id l14mr3397429wmj.123.1570036055644; 
 Wed, 02 Oct 2019 10:07:35 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id c10sm31832408wrf.58.2019.10.02.10.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 10:07:34 -0700 (PDT)
Date: Wed, 2 Oct 2019 10:07:33 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 6/6] [RESEND] drm/amdgpu: work around llvm bug #42576
Message-ID: <20191002170733.GB1076951@archlinux-threadripper>
References: <20191002120136.1777161-7-arnd@arndb.de>
 <20191002165137.15726-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002165137.15726-1-ndesaulniers@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b5t7DfaGuIJVfpW/6AOvG6x/d8yqj3D8O6SWcaOz/1Y=;
 b=jh17YPqpYrcU+CwePtEtDIfsCOK8JgI4JAEbOUfoN2nARPGX8zArPgMQCz+q57PDBi
 M24gQg5rQIj9pwthmeqeIp5ZSRSSAQsYPSk0tB3fajGWtDrThDnUyQDxniNuJATOf3th
 lnq/SDOi/snhoJBXP54CCqWjASa8VtKSGcpYDYCkQWUqUFF5iNVK6+6jiIzuMuftJh1B
 zJKT6dWzuV43g0BkNI19E3oP9NYC2oCYfbtcP9RQO9Mdex3fYemknycTMXvTzziu8T2l
 ksqsz9qhsEqnDHCtxf04twdJTYCrTUSLnr5ZRAaguVUHRmZ0GHZaS9CKTUk2tTus+dEe
 cuFw==
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
Cc: arnd@arndb.de, le.ma@amd.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDk6NTE6MzdBTSAtMDcwMCwgJ05pY2sgRGVzYXVsbmll
cnMnIHZpYSBDbGFuZyBCdWlsdCBMaW51eCB3cm90ZToKPiA+IEFwcGFyZW50bHkgdGhpcyBidWcg
aXMgc3RpbGwgcHJlc2VudCBpbiBib3RoIHRoZSByZWxlYXNlZCBjbGFuZy05Cj4gPiBhbmQgdGhl
IGN1cnJlbnQgZGV2ZWxvcG1lbnQgdmVyc2lvbiBvZiBjbGFuZy0xMC4KPiA+IEkgd2FzIGhvcGlu
ZyB3ZSB3b3VsZCBub3QgbmVlZCBhIHdvcmthcm91bmQgaW4gY2xhbmctOSssIGJ1dAo+ID4gaXQg
c2VlbXMgdGhhdCB3ZSBkby4KPiAKPiBJIHRoaW5rIEknZCByYXRoZXI6Cj4gMS4gbWFyayBBTURH
UFUgQlJPS0VOIGlmIENDX0lTX0NMQU5HLiBUaGVyZSBhcmUgbnVtZXJvdXMgb3RoZXIgaXNzdWVz
IGJ1aWxkaW5nCj4gICAgYSB3b3JraW5nIGRyaXZlciBoZXJlLgoKVGhlIG9ubHkgcmVhc29uIEkg
YW0gbm90IHRocmlsbGVkIGFib3V0IHRoaXMgaXMgd2Ugd2lsbCBsb3NlIG91dCBvbgp3YXJuaW5n
IGNvdmVyYWdlIHdoaWxlIHRoZSBjb21waWxlciBidWcgZ2V0cyBmaXhlZC4gSSB0aGluayB0aGUg
QU1ER1BVCmRyaXZlcnMgaGF2ZSBiZWVuIHRoZSBzaW5nbGUgYmlnZ2VzdCBzb3VyY2Ugb2YgY2xh
bmcgd2FybmluZ3MuCgpJIHRoaW5rIHNvbWV0aGluZyBsaWtlOgoKZGVwZW5kcyBvbiBDQ19JU19H
Q0MgfHwgKENDX0lTX0NMQU5HICYmIENPTVBJTEVfVEVTVCkKCndvdWxkIGVuZCB1cCBhdm9pZGlu
ZyB0aGUgcnVudGltZSBpc3N1ZXMgYW5kIGdpdmUgdXMgd2FybmluZyBjb3ZlcmFnZS4KVGhlIG9u
bHkgaXNzdWUgaXMgdGhhdCB3ZSB3b3VsZCBzdGlsbCBuZWVkIHRoaXMgcGF0Y2guLi4KCkNoZWVy
cywKTmF0aGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
