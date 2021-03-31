Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFCF34FFB0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD87F6E1D7;
	Wed, 31 Mar 2021 11:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B186E1D7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 11:48:41 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id u21so29562743ejo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 04:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c6e+fjeESzbScUMz2dNT4nSsDG75G+9lkHHAjRtdllg=;
 b=SAkZkigSCgUz6MpZPDokWoOllrR5dc5CWxYtK9xLMMghjtXZWhXGNJc3ANR9tCFCtW
 7uj9Rpp0CLrRZP+D5eaVtGVGBo7LkDZrwjQpFENLAcyd7z3xXaPiPuizuxa/kjeb3X5N
 r3h+A+jGJkGmWpi3ZxRbywhcycb0JhIwHWw1nGrTm1x0kV+MvQRMQgxe/0y1kZh0mTDj
 IkywrewDSptl0yyuhfBsCPU3m1vHIWaWZXkwW7gOU+Vl63KAB8ht7dBPiK4aPJ1ZzMjx
 GgXGi/kcEQl9VQJ3MBfRonGGitURSM1g1ZhtVf0a9JdwhcYVc5LeCaaTNIzQkaUIbQNM
 slVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c6e+fjeESzbScUMz2dNT4nSsDG75G+9lkHHAjRtdllg=;
 b=REyYXr/rwsm8HJu42t10rK1xV3xT73SJ7eLOUkAzslDnXQJgssCKN2gF1lwz+bIKEX
 /Bvc1rYlz6hcC0F+3OwqK/HZJ9lSIRARB5LWsDaLMwLkk2LCOTKyo2prUL5AjBl8lQ7o
 Dny+2rWMxjPIziCysLSKhVmikMsVBiQ8z64BPPptcxUY2LCl8MT4/0QMVsbelHyDuYhr
 UoaqDaGH1lPIt7eQU8m3kMiMgutviMeQwUJ3m+pc9PsaKXlUqZp4SUXk3scxbhBqWbxY
 EE7Oauc8eWLNs1HfROpibIGUy5NXh2DXHt0RA7Ku94t7QoCatI8bQTzoVgwen22K/sy9
 0CDw==
X-Gm-Message-State: AOAM533Uu/rPQuq76LJ6rEZFLB4JSET4kSFPanHSyQKhYRVVVCIq1HB6
 dUyKP9wDPz4K6HATlJqrqxJZAEBYGaJvYVh9jqs=
X-Google-Smtp-Source: ABdhPJzamtdkHoAj4ITXbQ3SwDzraofMUy9Mm57Qc47jw3Cy7KoUesNg8NSpTY1F9oYoEfaayePgxUxHlOSfZLfOLQc=
X-Received: by 2002:a17:906:d9c9:: with SMTP id
 qk9mr3008487ejb.504.1617191320025; 
 Wed, 31 Mar 2021 04:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210331112137.368641-1-adrien.grassein@gmail.com>
 <20210331112137.368641-2-adrien.grassein@gmail.com>
 <20210331113554.GM2088@kadam>
In-Reply-To: <20210331113554.GM2088@kadam>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Wed, 31 Mar 2021 13:48:29 +0200
Message-ID: <CABkfQAHh5Ee1HcHAyLwG-iOf2q8uo69wHM8UbG6ouiRegyfn7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/bridge: lt8912b: Fix issues found during
 static analysis
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgbWVyLiAzMSBtYXJzIDIwMjEgw6AgMTM6MzYsIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4gYSDDqWNyaXQgOgo+Cj4gT24gV2VkLCBNYXIgMzEsIDIwMjEgYXQgMDE6
MjE6MzdQTSArMDIwMCwgQWRyaWVuIEdyYXNzZWluIHdyb3RlOgo+ID4gLSAgICAgbHQtPmRhdGFf
bGFuZXMgPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMoZW5kcG9pbnQsICJkYXRhLWxhbmVz
Iik7Cj4gPiArICAgICBkYXRhX2xhbmVzID0gb2ZfcHJvcGVydHlfY291bnRfdTMyX2VsZW1zKGVu
ZHBvaW50LCAiZGF0YS1sYW5lcyIpOwo+ID4gICAgICAgb2Zfbm9kZV9wdXQoZW5kcG9pbnQpOwo+
ID4gKyAgICAgaWYgKGRhdGFfbGFuZXMgPCAwKSB7Cj4gPiArICAgICAgICAgICAgIGRldl9lcnIo
bHQtPmRldiwgIiVzOiBCYWQgZGF0YS1sYW5lcyBwcm9wZXJ0eVxuIiwgX19mdW5jX18pOwo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gbHQtPmRhdGFfbGFuZXM7Cj4KPiBUaGlzIG5lZWRzIHRvIGJl
ICJyZXR1cm4gZGF0YV9sYW5lczsiCj4KPiA+ICsgICAgIH0KPiA+ICsgICAgIGx0LT5kYXRhX2xh
bmVzID0gZGF0YV9sYW5lczsKPgo+IEkgcmVhbGx5IGJlbGlldmUgdGhhdCB2NCB3aWxsIGJlIHRo
ZSBwZXJmZWN0IHZlcnNpb24gdGhvdWdoLi4uICA6KQo+CkFoYWgsIG1heWJlLCBsZXQncyBzZWUg
Xl4uCgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
