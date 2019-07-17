Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A076C248
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 22:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DFD8926D;
	Wed, 17 Jul 2019 20:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636058926D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 20:46:57 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52446 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hnqpD-0080Ce-DR; Wed, 17 Jul 2019 16:46:55 -0400
Subject: Re: [PATCH 10/10] drm/tinydrm: Move tinydrm_display_pipe_init() to
 mipi-dbi
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-11-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <ddb52c29-0063-33aa-96f6-d399117d1b4c@lechnology.com>
Date: Wed, 17 Jul 2019 15:46:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717115817.30110-11-noralf@tronnes.org>
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
 bh=8bO2hH5FciiklxhrobVK4fmiUn2wyum3oC9XQOHycS4=; b=njaHvBueJoIULSzN2g63yt6pkf
 4Ux4AiI484enxfuSmRYxq3px8iz3R+OyANCsg2flePWf4LvkrLsHLg4q3/XkydjMx3RA/XZYc6ndc
 Rx1S8Z7B/A0IhE59xurBP2o0hWXulYDsfWpzZtuPEsd2OmtkVVyQ9v9b9vsfG69TWaBgG5BTvb8nf
 7K2mqWpOERIFj8Yk9eRJCbUKJJmDTsuZb4gWmx0Tu9D77ch3DJvYkOjibBdXwFsUqn7ZELjQ9Wsor
 gAhJQFJptD30uL7g6cLlDKXI1F6jAAv/ZgVOm63HLn7DNp+3bbrqf85v4MM3GwCgnUC5NM3yTHRFS
 H94aRNLA==;
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8xNy8xOSA2OjU4IEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gdGlueWRybV9kaXNw
bGF5X3BpcGVfaW5pdCgpIGhhcyBvbmx5IG9uZSB1c2VyIG5vdywgc28gbW92ZSBpdCB0byBtaXBp
LWRiaS4KPiAKPiBDaGFuZ2VzOgo+IC0gUmVtb3ZlIGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNz
LmRldGVjdCwgaXQncyBhbHdheXMgY29ubmVjdGVkLgo+IC0gU3RvcmUgdGhlIGNvbm5lY3RvciBh
bmQgbW9kZSBpbiBtaXBpX2RiaSBpbnN0ZWFkIG9mIGl0J3Mgb3duIHN0cnVjdC4KPiAKPiBPdGhl
cndpc2UgcmVtb3ZlIHNvbWUgbGVmdG92ZXIgdGlueWRybS1oZWxwZXJzLmggaW5jbHVzaW9ucy4K
CldlcmUgdGhlIHVzZXMgb2YgdGlueWRybS1oZWxwZXJzLmggcmVtb3ZlZCBpbiB0aGlzIHNlcmll
cz8gSWYgc28sIHRoZW4gdGgKI2luY2x1ZGUgc2hvdWxkIHByb2JhYmx5IGJlIHJlbW92ZWQgYXQg
dGhlIHNhbWUgdGltZS4gSWYgbm90LCByZW1vdmluZyB0aGUKI2luY2x1ZGUgbGluZXMgY291bGQg
anVzdCBiZSBhbiBpbmRlcGVuZGVudCBwYXRjaCBmcm9tIHRoaXMgc2VyaWVzLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
