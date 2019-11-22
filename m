Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB21071D2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 12:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539506F53C;
	Fri, 22 Nov 2019 11:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F586F53C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 11:57:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id DE451291F14
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Next round of associating ddc adapters with connectors
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Eric Anholt <eric@anholt.net>,
 Shawn Guo <shawnguo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <00af93c8-4e59-3ff0-6bd0-69289b34846c@collabora.com>
Date: Fri, 22 Nov 2019 12:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
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

RGVhciBNYWludGFpbmVycywKCkNhbiB5b3UgcGxlYXNlIGV4cHJlc3MgeW91ciBvcGluaW9uIG9u
IHRoZXNlIHBhdGNoZXM6CgpbdGVncmFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC8zMjcwOTkvP3Nlcmllcz02NTgzMSZyZXY9MQpbdmM0XSBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzI3MTAyLz9zZXJpZXM9NjU4MzEmcmV2PTEKW3p0ZV0g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMyNzEwNi8/c2VyaWVzPTY1
ODMxJnJldj0xClt6dGVdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8z
MjcxMTIvP3Nlcmllcz02NTgzMSZyZXY9MQpbaTkxNV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzMyNzEyMC8/c2VyaWVzPTY1ODMxJnJldj0xCgo/CgpPZiB0aGUgb3Jp
Z2luYWxseSBwb3N0ZWQgcGF0Y2hlczoKCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9zZXJpZXMvNjI3NjQvCgpvbmx5IHRoZSBhYm92ZSBhcmUgc3RpbGwgb3V0c3RhbmRpbmcsIHRo
ZSBvdGhlcnMgaGF2ZSBiZWVuIGFwcGxpZWQKdG8gYXQgbGVhc3QgZHJtLW1pc2MtbmV4dCBvciBh
cmUgYWxyZWFkeSB1cHN0cmVhbS4KClJlZ2FyZHMsCgpBbmRyemVqCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
