Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3634DC9124
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 20:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C08A6E184;
	Wed,  2 Oct 2019 18:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A162D6E184;
 Wed,  2 Oct 2019 18:53:33 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id u22so27721681qtq.13;
 Wed, 02 Oct 2019 11:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OgMn8hpZTEDtXKP05G/wCdRDIlvQDI9VA80s3qnQFrQ=;
 b=rQ60ckwq3GEhXST9pwPz9nu3NmpyS5GLjJpGs3J1jwPCODo4p4dL6sdILNK/K8WBAd
 Gq2CAEJVcYgUCz6eD2FY5DmnqwFv972SJL22ue1sCS313KTrBODB3EEMxxkk24I+T4oL
 +WFfTI4nqkfTgRWhjRbR3zdqiS2UKMthRGo718kvE8TOg/RiTGJElgu43zNOU2Ui4mjZ
 po/U5i4ssLB9yMbFUunDdhpzABOrZGWjPVkbOyxMqVnsWp5sbZzpt+hZf9lYmW2VOEHy
 3QEQwrgDoTJeDkz0vTa7TvHh+9SVNXSIrakxox8SlbLpDf4iAszx9smMLhONHgaSqgEH
 fuJQ==
X-Gm-Message-State: APjAAAWvGSdmelKTjiuAFRiKEGIu9mmEXkYKPW3PT5jd0eiCYQZz2nZ9
 jGsQ+EGWqW1C7x6bks3xf79umrdD+Hlq6P1lb4I=
X-Google-Smtp-Source: APXvYqxAl+Rxh2NCLtdzmTkMG+IYTvU3DliWCdDujCeb72QNPVpAcUeZwzPLzn0JfNoMiKtrgiWXhaCj8wvWNzjbU3s=
X-Received: by 2002:ac8:1a2e:: with SMTP id v43mr5699655qtj.204.1570042412182; 
 Wed, 02 Oct 2019 11:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <CADnq5_MLg=J5dmSGzx8jC=1--d2S3HJzWH3EHhyzT6da5a3wcA@mail.gmail.com>
In-Reply-To: <CADnq5_MLg=J5dmSGzx8jC=1--d2S3HJzWH3EHhyzT6da5a3wcA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Oct 2019 20:53:16 +0200
Message-ID: <CAK8P3a33yAirHFnZq5GCSJFDM3dpub6vTMyTdpnV429WsP5Eyg@mail.gmail.com>
Subject: Re: [PATCH 0/6] amdgpu build fixes
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCA4OjQ3IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgODowMiBBTSBBcm5k
IEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiA+Cj4gPiBIZXJlIGFyZSBhIGNvdXBs
ZSBvZiBidWlsZCBmaXhlcyBmcm9tIG15IGJhY2tsb2cgaW4gdGhlIHJhbmRjb25maWcKPiA+IHRy
ZWUuIEl0IHdvdWxkIGJlIGdvb2QgdG8gZ2V0IHRoZW0gYWxsIGludG8gbGludXgtNS40Lgo+ID4K
PiA+ICAgICAgQXJuZAo+ID4KPiA+IEFybmQgQmVyZ21hbm4gKDYpOgo+ID4gICBkcm0vYW1kZ3B1
OiBtYWtlIHBtdSBzdXBwb3J0IG9wdGlvbmFsLCBhZ2Fpbgo+ID4gICBkcm0vYW1kZ3B1OiBoaWRl
IGFub3RoZXIgI3dhcm5pbmcKPiA+ICAgZHJtL2FtZGdwdTogZGlzcGxheV9tb2RlX3ZiYV8yMTog
cmVtb3ZlIHVpbnQgdHlwZWRlZgo+ID4gICBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBkY24yMSBNYWtl
ZmlsZSBmb3IgY2xhbmcKPiA+ICAgW1JFU0VORF0gZHJtL2FtZC9kaXNwbGF5OiBoaWRlIGFuIHVu
dXNlZCB2YXJpYWJsZQo+ID4gICBbUkVTRU5EXSBkcm0vYW1kZ3B1OiB3b3JrIGFyb3VuZCBsbHZt
IGJ1ZyAjNDI1NzYKPgo+IEkndmUgYXBwbGllZCAxLTUgYW5kIEknbGwgc2VuZCB0aGVtIGZvciA1
LjQuICBUaGVyZSBzdGlsbCBzZWVtcyB0byBiZQo+IHNvbWUgZGViYXRlIGFib3V0IDYuCgpBd2Vz
b21lLCB0aGFua3MgYSBsb3QhCgogICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
