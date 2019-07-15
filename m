Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C6569905
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 18:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034F289268;
	Mon, 15 Jul 2019 16:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164B8891BB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 16:29:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6298620026;
 Mon, 15 Jul 2019 18:29:32 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:29:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH v1 12/33] drm/vkms: drop use of drmP.h
Message-ID: <20190715162931.GF27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-13-sam@ravnborg.org>
 <CADKXj+7uPC7psLojq+-T4s5WfvszpE=N0hj=sORhdx2FRmCDsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADKXj+7uPC7psLojq+-T4s5WfvszpE=N0hj=sORhdx2FRmCDsg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=pGLkceISAAAA:8 a=PXtQ4UoCBQ-C_PK3xDUA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDksIDIwMTkgYXQgMTI6MDA6MjBQTSAtMDMwMCwgUm9kcmlnbyBTaXF1ZWly
YSB3cm90ZToKPiBPbiBTdW4sIEp1biAzMCwgMjAxOSBhdCAzOjE5IEFNIFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4gPgo+ID4gRHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0
ZWQgZHJtUC5oIGhlYWRlci4KPiA+IFJlcGxhY2UgaXQgd2l0aCB0aGUgbmVjZXNzYXJ5IGluY2x1
ZGVzIGluIHRoZSBpbmRpdmlkdWFsIC5jIGZpbGVzLgo+ID4gVGhlIGhlYWRlciBmaWxlcyB3YXMg
c2VsZi1jb250YWluZWQsIGFuZCBleHRyYSBpbmNsdWRlcyB3ZXJlIG5vdCBhZGRlZAo+ID4gdGhl
cmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+ID4gQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29t
Pgo+ID4gQ2M6IEhhbmVlbiBNb2hhbW1lZCA8aGFtb2hhbW1lZC5zYUBnbWFpbC5jb20+Cj4gPiBD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KPiAKPiBIaSBTYW0sCj4gCj4gVGhhbmtzIGZvciB5b3UgcGF0Y2gs
IGl0IExHVE0uCj4gCj4gUmV2aWV3ZWQtYnk6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1
ZWlyYW1lbG9AZ21haWwuY29tPgoKVGhhbmtzLCBhcHBsaWVkLgoKCVNhbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
