Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D75170AC2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1E589ED6;
	Mon, 22 Jul 2019 20:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05A389EBD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:36:12 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52674 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpf2Z-007X31-0P; Mon, 22 Jul 2019 16:36:11 -0400
Subject: Re: [PATCH v2 5/9] drm/tinydrm/mipi-dbi: Remove CMA helper dependency
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190722104312.16184-1-noralf@tronnes.org>
 <20190722104312.16184-6-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <bfaf7fe4-0d90-41ea-3227-523bbb81bbd9@lechnology.com>
Date: Mon, 22 Jul 2019 15:36:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722104312.16184-6-noralf@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WpEe2m+KqwdmRHjpHtGIq6eDwkTEkYVaV4f2I5Eeh/0=; b=thBrHWeZ0nonXVA15QyWBG8mtj
 16RGy6t7yW0nOa8CTCK68zLBMug0vybAABmZX1WTII5sTIbYBLf5x/+OFXV8yONdsCWHvLTgvsa4L
 lFfMWwBVq32e05IfDgS+FGTBLBlFrV5EeZLbAlGEdOfNqWv2e3jAZPpmKj3g70i9ZrqYFBrt4JYQR
 FvCc5Ov6aUcX/TFvGuiyLGfCOPM3AD3EpmngB8FLVG5KQEbXe9MziFhuU5b1f4kBCivCjA8/4NbTe
 kwKmWM8PYXBLceX34DHeIgGXQtBg1XwCpLXBU4DfnVCHKWapv5+SxOPbh+lAHuCxHiEaoedZCI8Gn
 YF5ZeYzA==;
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
Cc: sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMi8xOSA1OjQzIEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gbWlwaS1kYmkgZGVw
ZW5kcyBvbiB0aGUgQ01BIGhlbHBlciB0aHJvdWdoIGl0J3MgdXNlIG9mCj4gZHJtX2ZiX2NtYV9n
ZXRfZ2VtX29iaigpLiBUaGlzIGlzIGFuIHVubmVjZXNzYXJ5IGRlcGVuZGVuY3kgdG8gZHJhZyBp
biBmb3IKPiBkcml2ZXJzIHRoYXQgb25seSB3YW50IHRvIHVzZSB0aGUgTUlQSSBEQkkgaW50ZXJm
YWNlIHBhcnQuCj4gQXZvaWQgdGhpcyBieSBvcGVuIGNvZGluZyB0aGUgZnVuY3Rpb24uCj4gCj4g
U2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4gLS0t
CgpSZXZpZXdlZC1ieTogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
