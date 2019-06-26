Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51756D8A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 17:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3830B6E472;
	Wed, 26 Jun 2019 15:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3490A6E472
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 15:21:46 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id v129so1816818vsb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g1WoiNs87nQK9QbBU1rQEEy+HWEPbvMu2TeOn2wpqCA=;
 b=KuUVH+DtBGUV3mmkI6slWao+mA8kYTyA44EiycHxJMzOH2gbHllddKwLxDiqEE2Wb8
 WPcFP5V09oyKujtz/zBAFHGZu0BcNC+xceCU+1aekY6KctAhwo8vD1zGsTF4ptufD06m
 B35EBG+1H3651UqTeJsTSNItj6gzfQDYuX0hW8Ta1KH5F5DAflPuijdrMtcfnIKvtjzr
 hX3ZU/8pMDyKTlGQEtUesDYd5AcDWKXbqHMJFruw2FKvqECIellSuvF/BylI47S1FBd7
 RLx/YVi8RD7Op9HXvRsg0mxEFLayhUSI4FZ4bLFp902padQ+HW1fo2/Vz/4cV593FHwu
 x3MQ==
X-Gm-Message-State: APjAAAWFMzqSr6WS//0TDV4H2baWx1d6IGl6GQi6sRjhZFwUqHkMke7D
 D1XS7TTQ9hST2VtXeNOtA0Z/vMT0CjA4RUOCT2IcqgrSHIU=
X-Google-Smtp-Source: APXvYqxw8fncY8bBpb9KXEpPj1uz29QACY3aL7boGNe88VQcgp9vnrthuAsh0IxCFznSXfdwqRma+kAlbvJIWwiVKDA=
X-Received: by 2002:a67:8a46:: with SMTP id m67mr3412654vsd.160.1561562505753; 
 Wed, 26 Jun 2019 08:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190219132101.27196-1-josef@lusticky.cz>
 <20190626125754.GD23428@ravnborg.org>
In-Reply-To: <20190626125754.GD23428@ravnborg.org>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef@lusticky.cz>
Date: Wed, 26 Jun 2019 17:21:09 +0200
Message-ID: <CAMqqaJH=Zv2zvLYKGPteA-yMoWL40+WM7huGVgkoNxdsveb3yQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add DRM panel driver for Ilitek ILI9341 based panels
 in parallel RGB mode
To: Sam Ravnborg <sam@ravnborg.org>, robh@kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lusticky.cz; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g1WoiNs87nQK9QbBU1rQEEy+HWEPbvMu2TeOn2wpqCA=;
 b=ZblHjlV34EaZ4iBVmJHCUaLi/9B2j4f3xdvCEzits5ap6OqSgX6E8RnYNT5czJjkUd
 AITBUR+4H93TEZHu7rEtBBhQsGlw+rGe3k6t6+exWfoVJ7bs9B7BU1+C1SRgBmlGsgsj
 +C2T9h6MZkZXjuK5MC+p6Fkefd4ub/DhTL9PSTDV8T4mXYOKiTfcMLWUchaBcle5gnar
 L+pgdd71ZFfzUk/tsZUGMRSN+obldS93xr2ZrDumwQ3IF6sDjaU9P0kb8B1yTM1te6gU
 2BLQFKYiv2G9fYE7DgG3v0Nj51qq+j0Cvtn/mVzXTc7dpCRoUPoPN7lYMCTJ1pKy0t4U
 +mpg==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gU2FtLCBSb2IsCnRoYW5rIHlvdSBib3RoIGZvciBjb21tZW50cy4KCkkndmUgYWxyZWFk
eSBwcmVwYXJlZCBtb3N0IG9mIHRoZSBjb2RlIGZvciB2MiBvZiB0aGlzIHBhdGNoc2V0LgoKQXQg
dGhlIG1vbWVudCBJIGFtIGludmVzdGlnYXRpbmcsIGlmIGl0J3MgcG9zc2libGUgdG8gdXNlIG1p
cGlfZGJpXyoKZnVuY3Rpb25zIGZvciB0aGUgZGlzcGxheSBpbml0aWFsaXphdGlvbiwKYXMgUm9i
IHN1Z2dlc3RlZCAoIkNhbid0IHlvdSB1c2UgZXhpc3RpbmcgbWlwaV9kYmlfKiBmdW5jdGlvbnMg
aW5zdGVhZApvZiByb2xsaW5nIHlvdXIgb3duPyIpLgoKSSdsbCBwb3N0IHYyIHBhdGNoc2V0IHNv
b24uCgpLaW5kIHJlZ2FyZHMKSm9zZWYKCnN0IDI2LiA2LiAyMDE5IHYgMTQ6NTcgb2Rlc8OtbGF0
ZWwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiBuYXBzYWw6Cj4KPiBIaSBKb3NlZi4K
Pgo+IE9uIFR1ZSwgRmViIDE5LCAyMDE5IGF0IDAyOjIwOjU5UE0gKzAxMDAsIEpvc2VmIEx1c3Rp
Y2t5IHdyb3RlOgo+ID4gVGhlc2UgcGF0Y2hlcyBhZGQgcGFuZWwgZHJpdmVyIGZvciBpbGk5MzQx
LWJhc2VkIHBhbmVscyBpbiBwYXJhbGxlbCBSR0IgbW9kZS4KPiA+IFRoZSBkcml2ZXIgd2FzIGRl
dmVsb3BlZCBmb3IgRGlzcGxleVRlY2ggRFQwMjRDVEZUIExDRCBwYW5lbCBbMV0gd2hpY2ggZmVh
dHVyZXMgSUxJOTM0MSBjaGlwIFsyXS4KPiA+IFRoZSBkcml2ZXIgd2FzIHRlc3RlZCBvbiB0aGUg
QWxsd2lubmVyIEExMyAoc3VuNWkpIHBsYXRmb3JtLgo+ID4KPiA+IFRoZSBkcml2ZXIgc3VwcG9y
dHMgMjQweDMyMCBwaXhlbCByZXNvbHV0aW9uIHdpdGggMTgtYml0IFJHQiAoNiB3aXJlcyBwZXIg
Y29sb3IpCj4gPiBhbmQgU1BJIGNvbnRyb2wgYnVzIHdpdGggRGF0YS9Db21tYW5kIEdQSU8gcGlu
Lgo+ID4KPiA+IFRoZSBEYXRhL0NvbW1hbmQgR1BJTyBpcyBvcHRpb25hbCwgaG93ZXZlciBhdCB0
aGUgbW9tZW50IHRoZSBkcml2ZXIgcmVxdWlyZXMgaXQ6Cj4gPiBUaGUgZGlzcGxheSBpdHNlbGYg
aXMgY2FwYWJsZSBvZiA5LWJpdCBTUEkgd2l0aG91dCB0aGUgRGF0YS9Db21tYW5kIEdQSU8uCj4g
PiBTdXBwb3J0IGZvciBzdWNoIGNvbmZpZ3VyYXRpb24gY2FuIGJlIGFkZGVkIGxhdGVyIHRvIHRo
ZSBkcml2ZXIuCj4gPgo+ID4gT3B0aW9uYWwgSFcgcmVzZXQgZ3BpbyBjYW4gYmUgc3BlY2lmaWVk
LCBvdGhlcndpc2UgU1cgcmVzZXQgY29tbWFuZCBpcyB1c2VkCj4gPiBkdXJpbmcgdGhlIGluaXRp
YWxpemF0aW9uLgo+ID4KPiA+IFRoZSBJTEk5MzQxIGRpc3BsYXlzIGhhdmUgdHdvIGNvbW1hbmQg
c2V0czoKPiA+IExldmVsIDEgY29uZm9ybXMgdG8gTUlQSSBzcGVjcwo+ID4gTGV2ZWwgMiBpcyBv
dXRzaWRlIHRoZSBNSVBJIHNwZWNzIC0gY3VzdG9tIGRlZmluZXMgYXJlIHVzZWQgaW4gdGhlIGRy
aXZlcgo+ID4KPiA+IFRoZSBJTEk5MzQxIHN1cHBvcnRzIHZhcmlvdXMgUkdCIG1vZGVzIChlLmcu
IE5WU1lOQywgREVfTE9XLCBjbG9jayBmcmVxLCBldGMuKSwKPiA+IGhvd2V2ZXIgdmFsdWVzIHRo
YXQgYXJlIHByZXNlbnRlZCBpbiB0aGUgSUxJOTM0MSBkYXRhc2hlZXQgWzJdIGFyZSB1c2VkCj4g
PiBieSB0aGUgZHJpdmVyIGluIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlLgo+ID4KPiA+Cj4gPiBH
ZW5lcmFsIG5vdGUgb24gSUxJOTM0MS1iYXNlZCBkaXNwbGF5czoKPiA+IFRoZSBJTEk5MzQxIGNo
aXAgY2FuIGJlIHVzZWQgaW4gcGFyYWxsZWwgUkdCIHdpdGggU1BJIGNvbnRyb2wKPiA+IG9yIGlu
IFNQSSBvbmx5IG1vZGUgd2hlcmUgdGhlIGltYWdlIGRhdGEgaXRzZWxmIGlzIGFsc28gdHJhbnNm
ZXJyZWQgdmlhIFNQSS4KPiA+IFRoaXMgZHJpdmVyIHN1cHBvcnRzIHBhcmFsbGVsIFJHQiBkaXNw
bGF5cyAtIGl0IHdvcmtzIHdpdGggZGlzcGxheXMgd2lyZWQgd2l0aCAxOC1iaXQgUkdCIGlucHV0
LAo+ID4gaXQgZG9lcyBub3Qgc3VwcG9ydCBTUEkgZGF0YSBtb2RlIChpLmUuIE11bHRpLWlubm8g
bWkwMjgzcXQgb3IgQWRhZnJ1aXQgeXgyNDBxdjI5IGFyZSBub3Qgc3VwcG9ydGVkIGJ5IHRoaXMg
ZHJpdmVyKS4KPiA+IFRoZSBTUEkgZGF0YSBtb2RlIGlzIG5hdHVyYWxseSBtdWNoIHNsb3dlciB0
aGFuIHRoZSBwYXJhbGxlbCBSR0IgbW9kZS4KPiA+Cj4gPiBHZW5lcmFsIG5vdGUgb24gRGlzcGxh
eVRlY2ggRFQwMjRDVEZUIHBhbmVsOgo+ID4gVGhlIHBhbmVsIHN1cHBvcnRzIGRpZmZlcmVudCBj
b25maWd1YXRpb24gb3B0aW9ucyAoMTgvMTYvNi1iaXQgUkdCIG9yIDkvOC1iaXQgU1BJKSBkZXBl
bmRpbmcgb24gdGhlIElNWzA6M10gd2lyaW5nLgo+ID4gVG8ga2VlcCB0aGlzIHBhdGNoIHNtYWxs
IGZvciByZXZlaXcsIGF0IHRoZSBtb21lbnQgb25seSAxOC1iaXQgUkdCIG1vZGUgYW5kIDgtYml0
IFNQSSB3aXRoIERhdGEvQ29tbWFuZCBHUElPCj4gPiBpcyBzdXBwb3J0ZWQgYnkgdGhpcyBkcml2
ZXIuCj4gPgo+ID4KPiA+IEkga2luZGx5IGFzayB5b3UgZm9yIGEgcGF0Y2ggcmV2aWV3Lgo+IERp
ZCB5b3UgZ2V0IGFyb3VuZCB0byBzZW5kIGEgdjIgb2YgdGhpcyBwYXRjaHNldD8KPgo+ICAgICAg
ICAgU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
