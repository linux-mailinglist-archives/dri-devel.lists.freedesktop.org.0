Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4887665
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 11:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44906EDA6;
	Fri,  9 Aug 2019 09:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 57441 seconds by postgrey-1.36 at gabe;
 Fri, 09 Aug 2019 09:42:25 UTC
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6E36EDA6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 09:42:25 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0BAF00798B3F6E5DDB9659.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:af00:798b:3f6e:5ddb:9659])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3C3281EC08E5;
 Fri,  9 Aug 2019 11:42:23 +0200 (CEST)
Date: Fri, 9 Aug 2019 11:43:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: 1c74ca7a1a9a ("drm/fb-helper: call vga_remove_vgacon
 automatically.")
Message-ID: <20190809094305.GE2152@zn.tnic>
References: <20190808174542.GN20745@zn.tnic>
 <20190809072133.2xlafq4qxitgky6l@sirius.home.kraxel.org>
 <20190809074700.GD2152@zn.tnic>
 <20190809085441.vwg2psrndjo2366q@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809085441.vwg2psrndjo2366q@sirius.home.kraxel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alien8.de; s=dkim; t=1565343743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=kcUTr2vKKJmTTJUV2gpmT2Dlw2ucARrqI3cL3PkEUuQ=;
 b=GPFqHqKuXb/Idkmokxlw+l4xuJHkBGidz+jHAvOAqBj1jZjAsxy1vXObwMrRMvyTQ7xoqu
 fLhgNOrDjHM+0MbK3eBPk94B79rpxPdEouXjkh6EhhaxLQx1JXjOdi7rHt/auDSHWGXH/n
 5cOl7K41ej4MS9Aung2MBrDLQdcI1EA=
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMTA6NTQ6NDFBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBBIGJpdCBsYXRlcjoKPiAKPiAgICBbICAgIDguMTk4MTM4XSByYWRlb24gMDAwMDow
MDowMS4wOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgcmFkZW9uL1BBTE1fcGZwLmJpbiBmYWls
ZWQgd2l0aCBlcnJvciAtMgo+ICAgIFsgICAgOC4xOTgzNTFdIHI2MDBfY3A6IEZhaWxlZCB0byBs
b2FkIGZpcm13YXJlICJyYWRlb24vUEFMTV9wZnAuYmluIgo+ICAgIFsgICAgOC4xOTg1MTJdIFtk
cm06ZXZlcmdyZWVuX2luaXQgW3JhZGVvbl1dICpFUlJPUiogRmFpbGVkIHRvIGxvYWQgZmlybXdh
cmUhCj4gICAgWyAgICA4LjE5ODU5MF0gcmFkZW9uIDAwMDA6MDA6MDEuMDogRmF0YWwgZXJyb3Ig
ZHVyaW5nIEdQVSBpbml0Cj4gCj4gU28gdGhlIHJhZGVvbiBkcm0gZHJpdmVyIHRyaWVzIHRvIGxv
YWQgYW5kIGZhaWxzIGR1ZSB0byBtaXNzaW5nIGZpcm13YXJlLAo+IHRoYXRzIHdoeSB5b3UgaGF2
ZSBhIG5vbi13b3JraW5nIGRpc3BsYXkuCj4gCj4gU28geW91ciBvcHRpb25zIGFyZToKPiAgIChh
KSBpbnN0YWxsIGxpbnV4LWZpcm13YXJlLCBzbyB0aGUgcmFkZW9uIGRyaXZlciBjYW4gaW5pdGlh
bGl6ZSwgb3IKPiAgIChiKSBib290IHlvdXIga2VybmVsIHdpdGggIm5vbW9kZXNldCIgY29tbWFu
ZCBsaW5lIG9wdGlvbi4gIFRoZSByYWRlb24KPiAgICAgICBkcml2ZXIgd2lsbCBub3QgaW5pdGlh
bGl6ZSB0aGVuLCBhbmQgYWxzbyBub3QgZGlzYWJsZSBjb25mbGljdGluZwo+ICAgICAgIGRpc3Bs
YXkgZHJpdmVycyAodmdhY29uIG9yIGZiY29uIEAgdmVzYWZiL2VmaWZiKS4KCkRhbW4gZmlybXdh
cmUhIEkgc2hvdWxkJ3ZlIHNlZW4gdGhhdCBtZXNzYWdlLiA7LVwKClllYWgsIGRpZCBhKSBhbmQg
dGhhdCB3b3JrZWQuIFRoYW5rcyEKCj4gUG9zc2libHkgaXQgYWxzbyBtYWtlcyBzZW5zZSB0byBo
YXZlIHRoZSByYWRlb24gZHJpdmVyIHRyeSBsb2FkIHRoZSBmaXJtd2FyZQo+IChmcm9tIGRpc2sp
IHJhdGhlciBlYXJseSBpbiB0aGUgaW5pdGlhbGl6YXRpb24gcHJvY2VzcywgYmVmb3JlIGNhbGxp
bmcKPiBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzLCBz
byBmaXJtd2FyZSBub3QgYmVpbmcKPiBpbnN0YWxsZWQgZG9lc24ndCBraWxsIHRoZSBkaXNwbGF5
LgoKVGhhdCB3b3VsZCd2ZSBoZWxwZWQgYW5kIHNhdmVkIGEgbG90IG9mIHRpbWUuCgpUaGFua3Mg
YWdhaW4hCgotLSAKUmVnYXJkcy9HcnVzcywKICAgIEJvcmlzLgoKR29vZCBtYWlsaW5nIHByYWN0
aWNlcyBmb3IgNDAwOiBhdm9pZCB0b3AtcG9zdGluZyBhbmQgdHJpbSB0aGUgcmVwbHkuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
