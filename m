Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EAAD3BFBC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 07:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1572C10E134;
	Tue, 20 Jan 2026 06:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jcqbUD3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434710E134
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 06:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=rwQYoc7FfLonmLav2nCC0G02VV/qam4U2QvPk9INtHY=; b=j
 cqbUD3jBzd/Y/gVT7uV0cAW10zEVS9GUOS8XS9PyhA5iuV3JKQyHp+7/kSaXP2Mm
 cErXD/YhYarKaL+uJ0PPLXBVfGXGuGiLHMfygmaSF8CuBguZogtCbsG5abwRWsXq
 sX4zRdFTaVhkB+wFbKbwvnzJD5qvEdqITEoXoq4JWQ=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Tue, 20 Jan 2026 14:54:46 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 20 Jan 2026 14:54:46 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, "Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:[PATCH] drm/rockchip: inno-hdmi: make inno_hdmi.h header
 self-contained
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260107152704.2290146-1-jani.nikula@intel.com>
References: <20260107152704.2290146-1-jani.nikula@intel.com>
X-CM-CTRLMSGS: VwIvX3BsdXM9MTc2ODg5MjA4NTk4NF82MDM1OWQ2NzllOGEzZTJjYmQ3YjU0N
 2YyMjI2NzFiYQ==
X-NTES-SC: AL_Qu2dCvSSvUgj4CmcYOkfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6Bkepsb/VI0Db1wmjKgK7iP1Y1mQQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7af9b305.5a33.19bda2f3aac.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgD3P_W3Jm9pZ61aAA--.8369W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhfsS2lvJrdERQAA3g
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

CkhpLAoKQXQgMjAyNi0wMS0wNyAyMzoyNzowNCwgIkphbmkgTmlrdWxhIiA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPiB3cm90ZToKPkluY2x1ZGUgbGludXgvdHlwZXMuaCBmb3IgdTguCj4KPlNpZ25l
ZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgogICBSZXZpZXdl
ZC1ieTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgoKPi0tLQo+IGluY2x1ZGUv
ZHJtL2JyaWRnZS9pbm5vX2hkbWkuaCB8IDIgKysKPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4KPmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9icmlkZ2UvaW5ub19oZG1pLmggYi9p
bmNsdWRlL2RybS9icmlkZ2UvaW5ub19oZG1pLmgKPmluZGV4IDhiMzk2NTUyMTJlMi4uNWJiY2Fl
ZWE5NGUyIDEwMDY0NAo+LS0tIGEvaW5jbHVkZS9kcm0vYnJpZGdlL2lubm9faGRtaS5oCj4rKysg
Yi9pbmNsdWRlL2RybS9icmlkZ2UvaW5ub19oZG1pLmgKPkBAIC02LDYgKzYsOCBAQAo+ICNpZm5k
ZWYgX19JTk5PX0hETUlfXwo+ICNkZWZpbmUgX19JTk5PX0hETUlfXwo+IAo+KyNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgo+Kwo+IHN0cnVjdCBkZXZpY2U7Cj4gc3RydWN0IGRybV9lbmNvZGVyOwo+
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlOwo+LS0gCj4yLjQ3LjMK
