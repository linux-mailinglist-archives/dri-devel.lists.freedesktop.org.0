Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9893A0543
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 16:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B9289CF3;
	Wed, 28 Aug 2019 14:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239A489CF3;
 Wed, 28 Aug 2019 14:47:21 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id i128so129942vsc.7;
 Wed, 28 Aug 2019 07:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7A9yYU3luA2+ju3PjD62zWc22casje8mEzYzGeTdz4Q=;
 b=an1cBiSZVy1hFjizpznhU0jxPKFAbhefQEbke5Q4qQvishUNy0wxk2RBlIHHxZqhoE
 PAvIUsIpeuJVLEC0GllYQE5PYatrLb+0rki8+JFZ2nCa3jEhUFkJEMA6Y4aNGSxghzxs
 C1jiAruMNZDiOGCC5cZoMFAqJ5lShulQY85ZqcnQBnuU+tEYQyuu6CmVNn1LNYHLmNyd
 H7gWf+HzuXJduIlJGJsg+/epXsurtZyT3EZK8HmYd1iU5poeUdGLhpfRUCGiB0CqALaL
 8WzLrvCRKDdtriewtFkL8+S8IhLSz26XL9rSzNP55p2qnEKr1YzGkjG9L6HL7wKIr7XC
 U6pw==
X-Gm-Message-State: APjAAAVmwqnyN6LFsNTTaYgJ8yYcmBeE+k6MPfwOBebZLW/++MfxXopO
 jQX0+KpCa7ATik/7/0qktRed77SFEqBPu9ZvzF4=
X-Google-Smtp-Source: APXvYqyiTIc+AD7vZFTOsFebGPVuaA2TFNpp4kAbVI2psd8PMlGZjIPIGvg/oKlTIIPj8jaTgptbQQcnSU7zuwLk5/g=
X-Received: by 2002:a67:cf05:: with SMTP id y5mr2546090vsl.18.1567003640150;
 Wed, 28 Aug 2019 07:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-6-oleg.vasilev@intel.com>
 <CAKb7UviahO6HWbxOoLyqN2X6WFw_GyucQuMs7Wj-MrKVNP1n_g@mail.gmail.com>
 <20190828143821.GD7482@intel.com>
In-Reply-To: <20190828143821.GD7482@intel.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 28 Aug 2019 10:47:08 -0400
Message-ID: <CAKb7Uvg=5BrQmLsq_=Cv1D_-baQ_crWRDePbnXXKy-jCVXtvsA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v3 5/7] drm/nouveau: utilize subconnector
 property for DP
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMTA6MzggQU0gVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBh
dCAwOTozNjo1MEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IFRoaXMgc2hvdWxkIHBy
b2JhYmx5IGJlIGZpeGVkIHRvIGFjY291bnQgZm9yIHRoZSBzY2VuYXJpbyB3aGVyZSBhbgo+ID4g
SERNSSBjb25uZWN0b3IgaXMgcGx1Z2dlZCBkaXJlY3RseSBpbnRvIHRoZSBEUCsrIHBvcnQuIEkg
ZG9uJ3QgdGhpbmsKPiA+IHRoZSBkcC5zdWJjb25uZWN0b3IgcHJvcGVydHkgd2lsbCBiZSB2YWxp
ZCBpbiB0aGF0IGNhc2UuCj4gPiAoVW5mb3J0dW5hdGVseSBJIGRvbid0IHJlbWVtYmVyIGhvdyBv
bmUgZGV0ZWN0cyB0aGF0IHBhcnRpY3VsYXIKPiA+IHNpdHVhdGlvbi4pCj4KPiBPbmUgbWF5IG9y
IG1heSBub3QgYmUgYWJsZSB0byBkZXRlY3QgaXQgdmVyeSB3ZWxsLiBJJ3ZlIHNlZW4gZG9uZ2xl
cwo+IHRoYXQgYXV0b21hZ2ljYWxseSBjaGFuZ2UgdGhlIERGUCB0eXBlIGZyb20gRFArKyB0byBE
UC9IRE1JIGRlcGVuZGluZwo+IG9uIHdoYXQncyBwbHVnZ2VkIGluLCBhbmQgSSd2ZSBhbHNvIHNl
ZW4gZG9uZ2xlcyB0aGF0IGxlYXZlIHRoZSBERlAKPiB0eXBlIHRvIERQKysuCgpXZWxsLCBvdXIg
aW50ZXJuYWwgbG9naWMgY2VydGFpbmx5IGtub3dzIGlmIGl0J3MgZHJpdmluZyBEUCBvciBUTURT
LiBJCmp1c3QgZG9uJ3QgcmVtZW1iZXIgaG93IGl0IGtub3dzIHRoaXMuCgogIC1pbGlhCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
