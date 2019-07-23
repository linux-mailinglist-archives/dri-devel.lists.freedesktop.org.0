Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC071CC9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 18:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD7F89C69;
	Tue, 23 Jul 2019 16:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E3389C69
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 16:22:46 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52402 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpxYq-00ACvU-41; Tue, 23 Jul 2019 12:22:44 -0400
Subject: Re: [1/3] RFT: drm/pl111: Support grayscale
To: dri-devel@lists.freedesktop.org
References: <20190723133755.22677-2-linus.walleij@linaro.org>
From: David Lechner <david@lechnology.com>
Message-ID: <1c988006-af6a-934c-5661-853cd9842c83@lechnology.com>
Date: Tue, 23 Jul 2019 11:22:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190723133755.22677-2-linus.walleij@linaro.org>
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
 bh=Qo/hPuXqdzw0fbAvUNBNIamCR5J5EyfzbtOH0y97n24=; b=MBHk0SJ9C7C5kyImuTBsuVgjbq
 bD38Fwx6ZyNXFF2TaNmky7AMXNf/ZeC/gdfdhWVGu2g+q6xr8n80XxhZCGFn+hbbkknC0iQrybZ39
 l3qSRHkdee9emKlPqq+M8ilHS7vGR4WhvymMMullBD3JicY6Fme43V8niLwbYH/+1hzHSvhkcFzUa
 o4JuGr+pmW5QNEHRFZboHUmvm73+nH8KkNFfZYbsHZbo60ru5A36+Mr8f680w2godN7c2XtOVIAwp
 l5ccNlKLVivTR7gupC/Drd2WqUbMkXZfbIewH/YoF1+17tWMJXAi+eVxn1z4hB5Vg+iDzX2U/vwYi
 KsxH2xzQ==;
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
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMy8xOSA4OjM3IEFNLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE1pZ3JhdGluZyB0aGUg
VEkgbnNwaXJlIGNhbGN1bGF0b3JzIHRvIHVzZSB0aGUgUEwxMTEgZHJpdmVyIGZvcgo+IGZyYW1l
YnVmZmVyIHJlcXVpcmVzIGdyYXlzY2FsZSBzdXBwb3J0IGZvciB0aGUgZWxkZXIgcGFuZWwKPiB3
aGljaCB1c2VzIDhiaXQgZ3JheXNjYWxlIG9ubHkuCj4gCj4gRFJNIGRvZXMgbm90IHN1cHBvcnQg
OGJpdCBncmF5c2NhbGUgZnJhbWVidWZmZXJzIGluIG1lbW9yeSwKPiBidXQgYnkgZGVmaW5pbmcg
dGhlIGJ1cyBmb3JtYXQgdG8gYmUgTUVESUFfQlVTX0ZNVF9ZOF8xWDggd2UKPiBjYW4gZ2V0IHRo
ZSBoYXJkd2FyZSB0byB0dXJuIG9uIGEgZ3JheXNjYWxpbmcgZmVhdHVyZSBhbmQKPiBjb252ZXJ0
IHRoZSBSR0IgZnJhbWVidWZmZXIgdG8gZ3JheXNjYWxlIGZvciB1cy4KPiAKCgpXaGF0IHdvdWxk
IGl0IHRha2UgdG8gYWRkIHByb3BlciBncmF5c2NhbGUgZnJhbWVidWZmZXIKc3VwcG9ydCB0byBE
Uk0/IEkndmUgYmVlbiB1c2luZyB0aGUgUkdCIHRvIGdyYXkgY29udmVyc2lvbgptZXRob2QgZm9y
IGEgd2hpbGUgbm93IHdpdGggc3Q3NTg2IGFuZCBpdCBpcyBPSyBidXQgaXMKY3JlYXRlcyBleHRy
YSB3b3JrIGlmIHlvdSB3YW50IHRoaW5ncyB0byBhY3R1YWxseSBsb29rCiJnb29kIiBpbnN0ZWFk
IG9mICJPSyIgYmVjYXVzZSB5b3UgaGF2ZSB0byBhZGQgY29kZSB0bwp1c2Vyc3BhY2UgcHJvZ3Jh
bXMgdG8gY3JhZnQgaW1hZ2VzIGluIGEgY2VydGFpbiB3YXkgc28KdGhhdCB0aGV5IGNvbWUgb3V0
IG9uIHRoZSBvdGhlciBzaWRlIGxvb2tpbmcgYXMgaW50ZW5kZWQKb24gdGhlIGFjdHVhbCBkaXNw
bGF5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
