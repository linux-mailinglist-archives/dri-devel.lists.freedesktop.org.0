Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BE4F129
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 01:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7E06E939;
	Fri, 21 Jun 2019 23:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75526E939;
 Fri, 21 Jun 2019 23:28:43 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r16so7997434wrl.11;
 Fri, 21 Jun 2019 16:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2sRz3jImaIcarByNIkSmOAFWuyo4oVjpo2KyaygqSJM=;
 b=V/cVE3vzQHMH/EY0OOWiseX3fTXQKsoWdMYCvJz4uIKqlNmLPYleDFnRZheyFn8orY
 +MWgSuOPoHDc9Lz3/OJGNOKJmJWrAJTc+zQAC+8VX36jcOwHedf9E9z+EQ+f1VhlIqGl
 K23Y4ALZq8zfUOFVjPB665eJD3DugVC4aj4sPJ41x/6echRvWms8tYy9BPDB1T+w2EgC
 D8hW9xkBG3WlHzqMH2HzPZD0nzzkvZYZRHtpkstjJywz+0gkiCMXWo6Id7WZ+RkL37Bw
 VHaBbmtWqrOsT/emS+iCflcyb2FNWOKKNxx4a/e2BdQjYJ66TKH0O+eEcuUUW5bBRT5o
 a2XA==
X-Gm-Message-State: APjAAAVVrSTgYbRu8Ml28y+5yhdDM3lp3Puf3SNut8W6bfEzroO6/M3e
 +P1yea/5ea3X/Gd7peDwNaZXUYovDtyB66eNuleNaT6I
X-Google-Smtp-Source: APXvYqwnjUOz0nH+FSA2YU/g03vSOiaNZudNx6glOz6d1SK4xQn+evycd+kPxTWM9YiR7WC7CrWt4Cr/X5/p5+5fjI8=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr3737696wrn.142.1561159722570; 
 Fri, 21 Jun 2019 16:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jun 2019 19:28:30 -0400
Message-ID: <CADnq5_N1zk4gQA2cwQ60-KjE6DszyK8Kqvzk3hse7+Q8mbibYA@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm: Aspect ratio fixes
To: Ville Syrjala <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2sRz3jImaIcarByNIkSmOAFWuyo4oVjpo2KyaygqSJM=;
 b=WFRtoD74o+UbuXlZ+ivHD2Vn3u7fGNKJwl5380RJ3toQboRfPdU4piSjlDFYTYhKWN
 kEgLdSLclzGf/ZSvWqgp0VwlTqMWQKdS3l3jyPPgQ5xq4Bkd5omMAqlh2lVMsWbyhmX2
 p9t4jLckG+sogI8QTrxixkrEPz8Dkheko8syJ+UsJlVl3bz65suer5tdedZCIBZHdlmd
 qBVm1xUyqZBH/q7PeZ039EKa8txJ2ASf0nliTORcMGj3jCylGvXUG5rVqbpmzLHEU1rL
 5lE/+J7+9XWBAzdaOF/ABdbHG2PHslYA0S4k8REWzDwQ4MhTIDcz2TL8NupYy9MhCHgg
 AhgQ==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMTA6MjYgQU0gVmlsbGUgU3lyamFsYQo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IElsaWEgcG9pbnRlZCBvdXQgc29tZSBv
ZGRiYWxsIGNyYXAgaW4gdGhlIGk5MTUgYXNwZWN0IHJhdGlvIGhhbmRsaW5nLgo+IFdoaWxlIGxv
b2tpbmcgYXQgdGhhdCBJIG5vdGljZWQgYSBidW5jaCBvZiBmYWlsIGluIHRoZSBjb3JlIGFzIHdl
bGwuCj4gVGhpcyBzZXJpZXMgYWltcyB0byBmaXggaXQgYWxsLgo+Cj4gQ2M6IElsaWEgTWlya2lu
IDxpbWlya2luQGFsdW0ubWl0LmVkdT4KPgo+IFZpbGxlIFN5cmrDpGzDpCAoNSk6Cj4gICBkcm06
IERvIG5vdCB1c2UgYml0d2lzZSBPUiB0byBzZXQgcGljdXJlX2FzcGVjdF9yYXRpbwo+ICAgZHJt
OiBEbyBub3QgYWNjZXB0IGdhcmJhZ2UgbW9kZSBhc3BlY3QgcmF0aW8gZmxhZ3MKPiAgIGRybTog
V0FSTiBvbiBpbGxlZ2FsIGFzcGVjdCByYXRpbyB3aGVuIGNvbnZlcnRpbmcgYSBtb2RlIHRvIHVt
b2RlCgpQYXRjaGVzIDEtMzoKUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KCj4gICBkcm0vaTkxNTogRG8gbm90IG92ZXJyaWRlIG1vZGUncyBhc3Bl
Y3QgcmF0aW8gd2l0aCB0aGUgcHJvcCB2YWx1ZSBOT05FCj4gICBkcm0vaTkxNTogRHJvcCByZWR1
bmRhbnQgYXNwZWMgcmF0aW8gcHJvcCB2YWx1ZSBpbml0aWFsaXphdGlvbgo+Cj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYyAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKystLS0tLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgfCAgNSArKy0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYyB8ICA0ICstLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IC0t
Cj4gMi4yMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
