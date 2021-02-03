Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626D30DED6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 16:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B666EB2A;
	Wed,  3 Feb 2021 15:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391316EB2A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 15:56:32 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id m22so21424524ljj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 07:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SmS8fJSXOKcRKzc31PRNebqokGkdRnQjzOzCbfZJjqs=;
 b=EoAM/5DuaPANjhWeDOjW7ozX8F+qJ8OevRH9BDBesj7ZcWsTjZjFbF5b2hyG/SoArH
 sqMggyzUHtCYslW8/BsPwb9f1wm5nYjQGDPRXg1VnM1iBpAl8mEcbm9pIBVUjC/l/yp+
 NALIvMQpHfBQAYE45rp3HR4R05LMnwbfGm8gkaZ91jwsMDlf8kZaoGTtKDGhysa5s+xz
 FGWucEXdjL6lDNZhZ0z9ZOkmOPR8ZpON+keO+56w/GzlbkHsnVTTukn5w5/Io1oe9P6K
 ZxLSL20rAG48lhiFqdYlMGROR9LTA77N/BOE2CyeJVzIXFzS3Tx9OERWxpmPwjd4GpF/
 wuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SmS8fJSXOKcRKzc31PRNebqokGkdRnQjzOzCbfZJjqs=;
 b=lmt73bdk7xKp4uwafkmrs1kUK+4K5P0g6EsuQdxu185NUYMRLEPYxsB8I7q84cYbUX
 St+6MF2lEg41CO/9ScgUqx31H/qfppwnW4KotLJdm/tXUG50yyXWfM6bDUOVEGdhRQ+n
 dS4BdaYwOOekzpRoK1ZeZ7eTOgekYEqekAW3jSB1fS0Y/+C67VmCNbV/YbOL1uTWcGG6
 QvALTLp8WFER/b4QxyqRvEMcq1XnDiO2TDeiGzlsSiAQWmEi5d3K1LOkUuwrtnIJ7Kcr
 lysqHm3IW/K41FBMgsnucsx5Ni+eM0/KlNyj5Qqdoi6ZqRYnR4W+TyVCCKVwZ960f6z1
 URdQ==
X-Gm-Message-State: AOAM530k1cbqqmGcSIs8wV1nJI7oLjJXbU28jujUxyNL/BkEsdgqbNgr
 9UUki6tIaQ7WDu8w/oRnL+6nI3X/zZq+gDSennk=
X-Google-Smtp-Source: ABdhPJzXQ9dchlysCHnfju7OGV6yKCBg3NxfyFOq2hV7WOko5E5rdRoHSDcmTTqO0BbHKZrcz2JzM4oqhQ1MnEIHCNo=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr2218121ljg.276.1612367790592; 
 Wed, 03 Feb 2021 07:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20210129155439.10128-1-patrik.r.jakobsson@gmail.com>
 <YBp8yGQuP4spzWNJ@phenom.ffwll.local>
 <5f9bc29a-b035-3ebf-47eb-9d7c6452889d@amd.com>
 <6e9ae600-e13e-04a2-cc48-cce776e91b6b@amd.com>
In-Reply-To: <6e9ae600-e13e-04a2-cc48-cce776e91b6b@amd.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 3 Feb 2021 16:56:19 +0100
Message-ID: <CAMeQTsYxYWXw4U+0d5nwXmQopY2Y+zo07PJJNP1C9Y9+DicMgw@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: Fix incorrect return type to timedout_job
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMywgMjAyMSBhdCA0OjU0IFBNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBBbSAwMy4wMi4yMSB1bSAxNjo1MSBzY2hyaWVi
IEx1YmVuIFR1aWtvdjoKPiA+IE9uIDIwMjEtMDItMDMgNTozNiBhLm0uLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+ID4+IE9uIEZyaSwgSmFuIDI5LCAyMDIxIGF0IDA0OjU0OjM5UE0gKzAxMDAsIFBh
dHJpayBKYWtvYnNzb24gd3JvdGU6Cj4gPj4+IFRoZSBjb21taXQgYTZhMWYwMzZjNzRlICgiZHJt
L3NjaGVkdWxlcjogSm9iIHRpbWVvdXQgaGFuZGxlciByZXR1cm5zCj4gPj4+IHN0YXR1cyAodjMp
IikgaW5jb3JyZWN0bHkgdXNlcyAiZW51bSBkcm1fdGFza19zdGF0dXMiIGZvciB2M2QgYW5kIGNh
dXNlcwo+ID4+PiBhIGJ1aWxkIGZhaWx1cmUuICJlbnVtIGRybV90YXNrX3N0YXR1cyIgZ290IGNo
YW5nZWQgaW50byAiZW51bQo+ID4+PiBkcm1fZ3B1X3NjaGVkX3N0YXR1cyIgaW4gdjMgb2YgdGhl
IHBhdGNoIGJ1dCB0aGUgY2hhbmdlIGZvciB2M2QgZ290Cj4gPj4+IGxvc3QuCj4gPj4+Cj4gPj4+
IEZpeGVzOiAoImRybS9zY2hlZHVsZXI6IEpvYiB0aW1lb3V0IGhhbmRsZXIgcmV0dXJucyBzdGF0
dXMgKHYzKSIpCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpayBKYWtvYnNzb24gPHBhdHJpay5y
Lmpha29ic3NvbkBnbWFpbC5jb20+Cj4gPj4gSSB0aGluayBJIHItYidlZCBzdWNoIGEgcGF0Y2gg
YWxyZWFkeSwgYnV0IG1heWJlIG5vdCB5ZXQgbWVyZ2VkLgo+ID4gSSB0aGluayBDaHJpc3RpYW4g
ZGlkIHRoYXQgcGF0Y2ggYWxyZWFkeSBvbiBNb25kYXkuCj4KPiBZZXMsIHRoaXMgaXMgYWxyZWFk
eSBpbnNpZGUgZHJtLW1pc2MtbmV4dC4gSnVzdCBuZWVkcyB0byBidWJibGUgdXAgaW50bwo+IGxp
bnV4LW5leHQgZXRjLi4uCgpHcmVhdCwgdGhhbmtzIQoKLVBhdHJpawpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
