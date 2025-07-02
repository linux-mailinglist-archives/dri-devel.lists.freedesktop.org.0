Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B8DAF0FA2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E17810E188;
	Wed,  2 Jul 2025 09:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="C616y9zV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68EBC10E188
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=bHPVeNBoTnZElvxKe/8KwnQOOGHpXQgJXaxKscKwyT4=; b=C
 616y9zVPvy0WzLVZ9taP+BjCsl5yxenJl7BavwxWZ7YHetQtay12mOK96WlZt3aB
 bXCVxc7kyaDUdSz52HJHzrjR9hbIyiwhOFTaJlxrNnQa7ERU5TaWbZU87ALC7v+p
 t93AstM3FADCW3FQx4PmeK/jUgqtEmMXMNMictbN+4=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Wed, 2 Jul 2025 17:16:34 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 2 Jul 2025 17:16:34 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re:[PATCH] drm: Fix one indentation issue in drm_auth.h
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250516092343.3206846-1-andyshrk@163.com>
References: <20250516092343.3206846-1-andyshrk@163.com>
X-NTES-SC: AL_Qu2eA/ifuE8i4ieYYekfmkcVgOw9UcO5v/Qk3oZXOJF8jC/rxCoxfntMEmPnyfOOFCWcrheYUhhh58BWV4JgQoINpAFmLe8dcvu7fJU9O2zIlw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <130edc4.8bc8.197ca6c7416.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgDnP4Ty+GRoErQAAA--.6847W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAh+Xmhk9BukqAABsW
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

CnBpbmcKCkF0IDIwMjUtMDUtMTYgMTc6MjM6MzgsICJBbmR5IFlhbiIgPGFuZHlzaHJrQDE2My5j
b20+IHdyb3RlOgo+VGhpcyBzaG91bGQgYmUgb25lIHNwYWNlLgo+Cj5TaWduZWQtb2ZmLWJ5OiBB
bmR5IFlhbiA8YW5keXNocmtAMTYzLmNvbT4KPi0tLQo+Cj4gaW5jbHVkZS9kcm0vZHJtX2F1dGgu
aCB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdXRoLmggYi9pbmNsdWRlL2RybS9kcm1f
YXV0aC5oCj5pbmRleCA1MDEzMTM4M2VkODEuLjgzMDM4NjgwNGY5MSAxMDA2NDQKPi0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9hdXRoLmgKPisrKyBiL2luY2x1ZGUvZHJtL2RybV9hdXRoLmgKPkBAIC04
Niw3ICs4Niw3IEBAIHN0cnVjdCBkcm1fbWFzdGVyIHsKPiAJICogSUQgZm9yIGxlc3NlZXMuIE93
bmVycyAoaS5lLiBAbGVzc29yIGlzIE5VTEwpIGFsd2F5cyBoYXZlIElEIDAuCj4gCSAqIFByb3Rl
Y3RlZCBieSAmZHJtX2RldmljZS5tb2RlX2NvbmZpZydzICZkcm1fbW9kZV9jb25maWcuaWRyX211
dGV4Lgo+IAkgKi8KPi0JaW50CWxlc3NlZV9pZDsKPisJaW50IGxlc3NlZV9pZDsKPiAKPiAJLyoq
Cj4gCSAqIEBsZXNzZWVfbGlzdDoKPi0tIAo+Mi40My4wCj4KPmJhc2UtY29tbWl0OiBhNGYzYmU0
MjJkODc5NThlZjlmMTdkOTZkZjE0MmU1ZDU3M2QyZjIzCj5icmFuY2g6IGRybS1taXNjLW5leHQK

