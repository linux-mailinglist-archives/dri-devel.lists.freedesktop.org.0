Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39A45E6E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 15:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B708898C0;
	Fri, 14 Jun 2019 13:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387E8898CC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:39:52 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id p17so2473492ljg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 06:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AjTMOzs837XNR62T4NquNPdEGLL6y8lxVErfJyNIXO0=;
 b=GphPPW0g5o4g/ZZe5MsItggvWWRNSQcQ+aaTtYBn8ZANAtSh4oyUN3SOMwI35MLwLG
 2ePGHBBbjyopuPQMQTwv62p5oXO6lHxrmnB1mIOF1ctimhe+RgpSQOftm8DSAKwsDpp0
 4khemoT63y+Oa/XTXJF6WbzsCIM38z8qeKCHQCCNZyVPMq7BMf3YbGmeZlnvDB9FIXMd
 IpahItochR0S9GXrReEFjdgZb67crUeTVgXuq0m7kqXg3Qxjit8h0WkGzWuTlkElXh3c
 Yz6UlGNJiktTZbSo2JUt2UJiIaU5crp5J2EYMSn+/3IRnMdAe0nwiaKJqYtdVjIo20Oj
 EJZw==
X-Gm-Message-State: APjAAAW56kztRUz4ZLOSmATjO4narjrq7ZGBAkTdhBhgmlHu5Qbd88LV
 N6uIVO3+l1YT3jsQ2DtcgZAL5lIi5UYFXV+t4Sc=
X-Google-Smtp-Source: APXvYqyvVNdTlpd6Io5rnBknL56XP1TrwvTxhod1ZZP0mmr8JqFV9gxxk17cmUn+xEZj8AbjbG917FhYJq9W/JKnqVs=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr31289953lji.115.1560519590606; 
 Fri, 14 Jun 2019 06:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
 <1560513063-24995-3-git-send-email-robert.chiras@nxp.com>
 <CAOMZO5BAborMvk=4cgreWKX6rJjK-237me98dM1dDV53oUnExQ@mail.gmail.com>
 <1560518953.9328.31.camel@nxp.com>
In-Reply-To: <1560518953.9328.31.camel@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Jun 2019 10:39:53 -0300
Message-ID: <CAOMZO5DcvKQPDhP468VSCfQkFy-7roKBkw7uqXxTMn9PTTgS+A@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191
 panel driver
To: Robert Chiras <robert.chiras@nxp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AjTMOzs837XNR62T4NquNPdEGLL6y8lxVErfJyNIXO0=;
 b=pGLDjzc7PXeMDfAMruzk4ufkIzQ6Zvx4sSdb74pyHKqFYVimr7mzjX5QXMhpswfmHO
 fno0X2AWiFKZDRCmwfie8KF2Qq+c6FNPyFVtgQTzmJ4QD1ia5Y4NVnckG+xZ28CStngL
 LpLxNaYtFos4O+m/dFcYsfNPXFxjF3tL/MKMVxKnz5BDRGiq8luzWp0gK4URXWT0yPo7
 9Df741RyrovRWdYFnxviUdnT2TT6czcO2R6Tr2IXBaD3X/ypzxMUAsVfJRaYEHdHcQvd
 OYtex2qyA1rpGYBuC3CsK+VoH6sQqpmsAFWP/v/tVFMzqHZ0voqhndt/dOX7YoygV4Lv
 4siQ==
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MjkgQU0gUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNo
aXJhc0BueHAuY29tPiB3cm90ZToKCj4gVGhlIEdQSU8gaXMgYWN0aXZlIGhpZ2gsIGFuZCB0aGUg
YWJvdmUgc2VxdWVuY2Ugd2FzIHJlY2VpdmVkIGZyb20gdGhlCj4gcGFuZWwgdmVuZG9yIGluIHRo
ZSBmb2xsb3dpbmcgZm9ybToKPiAgICAgICAgIFNFVF9SRVNFVF9QSU4oMSk7Cj4gICAgICAgICBN
REVMQVkoMTApOwo+ICAgICAgICAgU0VUX1JFU0VUX1BJTigwKTsKPiAgICAgICAgIE1ERUxBWSg1
KTsKPiAgICAgICAgIFNFVF9SRVNFVF9QSU4oMSk7Cj4gICAgICAgICBNREVMQVkoMjApOwo+IEkg
Z290IHJpZCBvZiB0aGUgZmlyc3QgdHJhbnNpdGlvbiB0byBoaWdoIHNpbmNlIHNlZW1lZCByZWR1
bmRhbnQuCj4gQWxzbywgYWNjb3JkaW5nIHRvIHRoZSBtYW51YWwgcmVmZXJlbmNlLCB0aGUgUlNU
QiBwaW4gbmVlZHMgdG8gYmUKPiBhY3RpdmUgaGlnaCB3aGlsZSBvcGVyYXRpbmcgdGhlIGRpc3Bs
YXkuCgpUaGF0J3MgZXhhY3RseSBteSBwb2ludCA6LSkKCkluIG5vcm1hbCBvcGVyYXRpb24gdGhl
IEdQSU8gcmVzZXQgbmVlZHMgdG8gYmUgaGlnaC4KCkR1cmluZyByZXNldCB0aGUgR1BJTyByZXNl
dCBuZWVkcyB0byBiZSBsb3cuLCB3aGljaCBtZWFucyB0aGF0IHRoZQpHUElPIHJlc2V0IGlzICJh
Y3RpdmUgbG93Ii4KClNvIHlvdSBzaG91bGQgaW52ZXJ0IGJvdGggdGhlIGR0cyBhbmQgdGhlIGRy
aXZlciB0byBiZWhhdmUgY29ycmVjdGx5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
