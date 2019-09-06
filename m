Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528ACABC57
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 17:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864A66E2E1;
	Fri,  6 Sep 2019 15:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392B6E2E1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 15:26:39 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u13so5373493lfm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 08:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=npUbO0rmQp+Kfk5wVtAOpQajJ0kp4mOuR0envTfRUWM=;
 b=uAbCpvwo+3VweTrn09OfwCB7nfOXgOiyk3WodNeXcQRv6Zn68ouSoj3ElNOXnjfrQa
 xiWOV6a19I45knJuSpfUlg4J6ENJkzReJsYGD4yApieL8dbsUHg/c3q7qcJUl3SHcGzh
 /4EJAEoH4LjNra6fsa5Sy+itTUFqgzQmM/Bbt/llf5+kQqubXcl2rZsSqAKDlR9mkNkI
 izlLmyBsaMM+bmvFAwQz/jre9A+yhn3zVRGCqwy/YN+WBFDPIycGmJtrzLoaPfQ+pw99
 n3A7ZS6UBpFg5niD3PexfOFZVfXRbzCyARrwtoDFBZJnxN/B1fPdU5RwbFCusNqLU5zS
 YRiA==
X-Gm-Message-State: APjAAAXA9Wv2yZ6HQDklJNYOwGk6RKqpX38Ev0Fc8LeHHFi4EZiSnvBr
 cndOn8Y6lq0lbvbDxFbOi/TVMMq2whUiUZPnyAmfJaMd
X-Google-Smtp-Source: APXvYqxA0kFp6rz14KmfF7+Do+Rh+sPVqwwmBfCiQPVs/pURSfs8Lrb1fsloDSm+8oNp9RlABgMfWxJqtP3LZBIoTRU=
X-Received: by 2002:a19:4a10:: with SMTP id x16mr7311434lfa.126.1567783597828; 
 Fri, 06 Sep 2019 08:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190906144459.16025-1-daniel.vetter@ffwll.ch>
 <CAKMK7uEFv+8Qx9+Gs8a=GmN+LEgaxF1zbvw_42-soM8z1AeK1Q@mail.gmail.com>
In-Reply-To: <CAKMK7uEFv+8Qx9+Gs8a=GmN+LEgaxF1zbvw_42-soM8z1AeK1Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 6 Sep 2019 16:26:15 +0100
Message-ID: <CAPj87rPYspgsxwxynM5Sc_O8t=o3Mag8UEHKAKRSFQWWUUEFHQ@mail.gmail.com>
Subject: Re: [PATCH] drm/blend: Define the direction of Z position values
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=npUbO0rmQp+Kfk5wVtAOpQajJ0kp4mOuR0envTfRUWM=;
 b=pNDRCHbpyjCrQnUVMlln3SoNpgM9jrlE4sK/FoXcofPCYgGXbyinQsO6i27IeiFxvB
 XYVOE5KwwTrgrngDcqDd/SNlXN/BoTMlnpBEwTAyOjwjP+YOiJm9XtFsNyHgbamX006D
 ruEuNtPVehugdZTzv2azZK8Ix6EyAlYQO1sMm4IynW7PouBco33j1Hqn7ijvxPj0d1uJ
 0Ug85lJRzkkVwX9wfMqIl3fiBNG+qHv3V5UWYPLDg1YTPVjekVGtayGnQp2zwMSWrvBN
 9Z1UALDdloPRaRsmCSotytYZ35BU1iB0BKsI56AlCMVG1y/SN1WLyGCFSJDir7H+939d
 nTDQ==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA2IFNlcCAyMDE5IGF0IDE2OjE5LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPiB3cm90ZToKPiBPbiBGcmksIFNlcCA2LCAyMDE5IGF0IDQ6NDUgUE0gRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6Cj4gPiBXZSBmb3Jnb3QgdGhh
dC4KPiA+Cj4gPiBQcm9vZiBpcyB0aGUgb25lIGlndCB0ZXN0Y2FzZSB3ZSBoYXZlOgo+ID4KPiA+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy9ibG9iL21h
c3Rlci90ZXN0cy9rbXNfYXRvbWljLmMjTDI4MAo+ID4KPiA+IFdoaWxlIGF0IGl0IGFsc28gZG9j
dW1lbnQgdGhhdCB3ZSBoYXZlIGltbXV0YWJsZSB6cG9zIHByb3BlcnRpZXMgaW4KPiA+IHNvbWUg
Y2FzZXMuCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5l
bkBjb2xsYWJvcmEuY29tPgo+ID4gQ2M6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBj
b2xsYWJvcmEuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFs
YW5lbkBjb2xsYWJvcmEuY29tPgo+ID4gQ2M6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0
LmVkdT4KPiA+IEFja2VkLWJ5OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
Pgo+IEZyb20gaXJjOiBSZXZpZXdlZC1ieTogRGFuaWVsIFN0b25lIDxkYW5pZWxzQGNvbGxhYm9y
YS5jb20+CgpBbmQgZnJvbSBtYWlsIGFsc28uCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
