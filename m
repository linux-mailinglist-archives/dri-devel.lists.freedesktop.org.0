Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBCB6C195
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 21:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DD36E294;
	Wed, 17 Jul 2019 19:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7E06E294
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 19:39:41 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:50508 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hnpX8-007p5d-7P; Wed, 17 Jul 2019 15:24:10 -0400
Subject: Re: [PATCH 01/10] drm: Add SPI connector type
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-2-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <c31cf63d-801c-a6e4-070a-83c072c8eb04@lechnology.com>
Date: Wed, 17 Jul 2019 14:24:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717115817.30110-2-noralf@tronnes.org>
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
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/TxE5PJMJh0w58kvqlAThqFgV/sjLrukanAwn6VFW1U=; b=VSz0Ec5j9ztkifBBk8UmhY6rI7
 Kf7C1p7g/kNg+4uyse84AAcESJ3tBBHmfgAmrfDca1X+NiaSiWCoBcLfa5PYpvtCZ3p8ca2y6zF8T
 tDNJ4VXQNiDz7/E+bivGLYBkhYP6AzZcNz62vn4SuGDqu8ahl9MKh3tYhrF3BdvmeG9jYznKziNb/
 Epbq1OIF2kxokFV4JOQ7yI+OQjd6vMKWEZqNtxsXXT/5dUistnNXBFAv6+AgsLMu5whldDW4tZ/W7
 egTGtcOqSkneFtR2b6v61HZwGMj8/m2Qa9pbzd+TlG1IyZCQrss7QevaIW9+kYM35a8Z1kBRvx6kT
 ubXFrmlg==;
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

T24gNy8xNy8xOSA2OjU4IEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gdGlueWRybSBkcml2
ZXJzIGFubm91bmNlIERSTV9NT0RFX0NPTk5FQ1RPUl9WSVJUVUFMIGZvciBpdHMgU1BJIGRyaXZl
cnMuCj4gU3RvcCBseWluZyBhbmQgYWRkIGEgU1BJIGNvbm5lY3RvciB0eXBlCj4gCj4gQ2M6IERh
dmlkIExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5vcmFs
ZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+IC0tLQoKQWNrZWQtYnk6IERhdmlkIExl
Y2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
