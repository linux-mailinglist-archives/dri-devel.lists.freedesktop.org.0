Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A60AC0641
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC17F10E0AC;
	Thu, 22 May 2025 07:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="bruCieqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41BA110E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=e+mEkABP8C6+wf+XwcSnrlG6wBq+UUqB+lqd2bdio5o=; b=b
 ruCieqqeBv1bYlQabWWOHA310S/+fR0mxrK7BSyWLs/967jiAmG/gAJTT3EQQx2L
 h4pBP+kmMzyrr41fQ3oQCUqLZQjrWpFZeFnixFmXw8bp1nBtaZZmspyR8ZUuFDrt
 bbQy439/B25TXHnfiRgMf8CasZHyH05PRZjLq+bepU=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-123 (Coremail) ; Thu, 22 May 2025 15:54:17 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 22 May 2025 15:54:17 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniel@fooishbar.org>
Cc: tzimmermann@suse.de, simona@ffwll.ch, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] drm/gem-framebuffer: log errors when gem size <
 afbc_size
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <CAPj87rMJgJaj8p_2DLdM8p3phB+eQnMm7iAHgEe_R8sjuGox1w@mail.gmail.com>
References: <20250508084811.2472877-1-andyshrk@163.com>
 <CAPj87rMJgJaj8p_2DLdM8p3phB+eQnMm7iAHgEe_R8sjuGox1w@mail.gmail.com>
X-NTES-SC: AL_Qu2fBfWbv0wu4SCabOkfmkcVgOw9UcO5v/Qk3oZXOJF8jAnp4h0vRHlFF0T18sKdCjuCnh6Rezd+48txc5VhR4MF0Qhd3Wi8+fJVnN4ZAxFIiQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6883df90.7132.196f6fc6055.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eygvCgD3v3op2C5o2ZMKAA--.16852W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAVVXmgu1QtbtAABso
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG/vvIwKCgpBdCAyMDI1LTA1LTA4IDE3OjExOjAxLCAiRGFuaWVsIFN0b25lIiA8ZGFuaWVs
QGZvb2lzaGJhci5vcmc+IHdyb3RlOgo+SGkgQW5keSwKPgo+T24gVGh1LCA4IE1heSAyMDI1IGF0
IDExOjQ5LCBBbmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4gd3JvdGU6Cj4+IExldCB0aGUgdXNl
ciBrbm93IHdoYXQgd2VudCB3cm9uZyBpbiBkcm1fZ2VtX2ZiX2FmYmNfaW5pdAo+PiBmYWlsdXJl
IHBhdGhzLgo+Cj5UaGFua3MgZm9yIHRoaXMsIGFuZCB0aGFua3MgYWxzbyBmb3IgdXNpbmcgZHJt
X2RiZ19rbXMoKSB0byBtYWtlIHN1cmUKPnRoYXQgdXNlcnNwYWNlIGNhbid0IGZsb29kIHRoZSBs
b2cgd2l0aCBlcnJvcnMuCj4KPlJldmlld2VkLWJ5OiBEYW5pZWwgU3RvbmUgPGRhbmllbHNAY29s
bGFib3JhLmNvbT4KCgpNYXkgSSBraW5kbHkgYXNrIHdoaWNoIE1haW50YWluZXIgY2FuIHRha2Ug
dGhpcyBwYXRjaD8KCj4KPkNoZWVycywKPkRhbmllbAo=
