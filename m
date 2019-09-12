Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F38B0E7E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 14:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF6989DE5;
	Thu, 12 Sep 2019 12:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA9A89DE5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 12:03:31 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b80so16850897oii.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 05:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dAter5ihnXBTYAaNi7sEgCFPygX/nf9VCuXJNZdSmN4=;
 b=RnW/WVPM+q7laaAvO+YXXsVS6prHXM1Ri1qoEE/qJHFp1b6TEyztMELftgEhlhsM2/
 cSwSb2f6m3hHtyQD/y8dKmIn+NFD25IEonNvKzWRZk/ogBcPFRM4+hyqTPAfWTh7i8r5
 tsBRY6SgBOg1uKm3Nlh4jOVaaqE/PZzmtm/oHltgitRNgxJvn2eKTI12mrifO0s30rje
 gLcDe6L6qNSdTgMt6wamug6rK0ZVKQG+jzsaETlIug/g1EMi+R4WzFSaWHlXXfuSJcfk
 joqSNyhf8loL6WPWKLYFGK8aE4rY6O8ILxZ5tg+c/bCrOU/qiHCupSgRAJ258a9vLa7n
 KYuA==
X-Gm-Message-State: APjAAAU9C2A3phvH6/pWbFbgPXaBaeR7GWJp82sWn6Rf01mqTy8pS8bA
 aWJBlg7ow6G7on2Xfi6psSaX+jde44/ByZ7ZU60=
X-Google-Smtp-Source: APXvYqw55cL6ePYgoRX18n3lZWVAOJ6JGFgMAqg89yEN1I4+ZAJCYO//k48A8xejhV1Hkp+i0JBiIeRvlGS3MrUySD0=
X-Received: by 2002:a05:6808:8e3:: with SMTP id
 d3mr7841555oic.153.1568289810430; 
 Thu, 12 Sep 2019 05:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
In-Reply-To: <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Sep 2019 14:03:19 +0200
Message-ID: <CAMuHMdVYqx_znkMbwCVyA6WH8-0uOotL3wXCTkvyXG1=i9W-ng@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLAoKT24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMTI6MjYgUE0gS2llcmFuIEJpbmdo
YW0KPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4gKHB1
bGxpbmcgaW4gK0dlZXJ0IGZvciBoaXMgb3BpbmlvbiBvbiBjb21wYXRpYmxlIHN0cmluZyB1c2Fn
ZXMpCj4KPiBPbiAxMi8wOS8yMDE5IDExOjAwLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6PiBIZWxs
byEKPiA+IE9uIDExLjA5LjIwMTkgMjI6MjUsIEtpZXJhbiBCaW5naGFtIHdyb3RlOgo+ID4+IEFk
ZCBkaXJlY3Qgc3VwcG9ydCBmb3IgdGhlIHI4YTc3OTgwIChWM0gpLgo+ID4+Cj4gPj4gVGhlIFYz
SCBzaGFyZXMgYSBjb21tb24sIGNvbXBhdGlibGUgY29uZmlndXJhdGlvbiB3aXRoIHRoZSByOGE3
Nzk3MAo+ID4+IChWM00pIHNvIHRoYXQgZGV2aWNlIGluZm8gc3RydWN0dXJlIGlzIHJldXNlZC4K
PiA+Cj4gPiAgICBEbyB3ZSByZWFsbHkgbmVlZCB0byBhZGQgeWV0IGFub3RoZXIgY29tcGF0aWJs
ZSBpbiB0aGlzIGNhc2U/Cj4gPiBJIGp1c3QgYWRkZWQgcjhhNzc5NzAgdG8gdGhlIGNvbXBhdGli
bGUgcHJvcCBpbiB0aGUgcjhhNzc5ODAgRFQuIFRoYXQncyB3aHkKPiA+IGEgcGF0Y2ggbGlrZSB0
aGlzIG9uZSBkaWRuJ3QgZ2V0IHBvc3RlZCBieSBtZS4KPgo+IEl0J3Mgbm90IGp1c3QgYWJvdXQg
dGhlIGNvbXBhdGlibGUgc3RyaW5nIGZvciBtZSBoZXJlLAo+Cj4gVGhlcmUgaXMgbm8gaW5kaWNh
dGlvbiBpbiB0aGUgZHJpdmVyIHRoYXQgaXQgc3VwcG9ydHMgdGhlIHI4YTc3OTgwLCBhbmQKPiBu
byBjb21tZW50IGluIHRoZSBkcml2ZXIgdG8gZXhwbGFpbiB0aGF0IHRoZSByOGE3Nzk4MCBpcyBz
aGFyZWQgYnkgdGhlCj4gcjhhNzc5NzAuCj4KPiBUaGlzIHBhdGNoIG1ha2VzIHRoYXQgZXhwbGlj
aXQgYXQgdGhlIGRyaXZlci4KPgo+IEFsc28gLSBJIGFtIGNvbnNpZGVyaW5nIHNlbmRpbmcgYSBw
YXRjaCAodGhhdCBJJ3ZlIGFscmVhZHkgY3JlYXRlZAo+IGFueXdheSkgdG8gcmVtb3ZlIHRoZSBy
OGE3Nzk3MCByZWZlcmVuY2UgZnJvbSB0aGUKPgo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3OTgwLmR0c2kgZmlsZS4KPgo+IFRoaXMgaXMgdGhlICpvbmx5KiBub24gcjhhNzc5
ODAgcmVmZXJlbmNlIGluIHRoaXMgZmlsZSwgc28gaXQgc2VlbXMgdmVyeQo+IG91dCBvZiBwbGFj
ZS4KCkFncmVlZC4KCj4gSW4gZmFjdCBtb3JlIHNvIHRoYW4gdGhhdCAtIGV4Y2VwdCBmb3IgYSBz
ZWVtaW5nbHkgZ2xhcmluZyB0eXBvLCB0aGF0Cj4gSSdsbCBpbnZlc3RpZ2F0ZSBhbmQgc2VuZCBh
IHBhdGNoIGZvciBuZXh0LCB0aGlzIGlzIHRoZSAqb25seSogY3Jvc3Mtc29jCj4gY29tcGF0aWJs
ZSByZWZlcmVuY2U6Cj4KPiAjIS9iaW4vc2gKPgo+IGZpbGVzPXI4YTc3Ki5kdHNpCj4KPiBmb3Ig
ZiBpbiAkZmlsZXM7Cj4gZG8KPiAgICAgICAgIHNvYz1gYmFzZW5hbWUgJGYgLmR0c2kgfCBzZWQg
J3MvLS4qLy8nYAo+ICAgICAgICAgZWNobyAiRjogJGYgc29jOiAkc29jIjsKPgo+ICAgICAgICAg
IyBGaW5kIGFsbCByZWZlcmVuY2VzIHRvIGFsbCBzb2NzLCB0aGVuIGhpZGUgJ3RoaXMnIHNvYwo+
ICAgICAgICAgZ3JlcCByOGE3NyAkZiB8IGdyZXAgLXYgJHNvYwoKVGhpcyBoaWRlcyB0aGUgY29t
cGxldGUgbGluZS4gIFNvIHlvdSBiZXR0ZXIgdXNlIGUuZy4KCiAgICBzZWQgLWUgInMvJHNvYy9z
b2MvaWciICRmIHwgZ3JlcCAtaSByOGEKCmluc3RlYWQuICBObyBuZXcgb2ZmZW5kZXJzLCB0aG91
Z2guCgo+IGRvbmU7CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3
aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
