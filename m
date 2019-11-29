Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7210D130
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 07:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016496E889;
	Fri, 29 Nov 2019 06:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EEA6E889;
 Fri, 29 Nov 2019 06:00:48 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y23so4349296wma.0;
 Thu, 28 Nov 2019 22:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q6sEJMkRXu7hSu+qr1ZpIJGkAq9uE1tMvK5+NCK55eg=;
 b=sID6tv93nCoarFscrYEUCctAvDs6GiRZz5gcyJ91vluFj/h8uK2XUEzi87bJ9JYpI8
 7yzlOmyNMgXSk31b9yLh2/3hr3NL3qA3Tmq0uzDYk/CnkrRjblDbqmhQDTloMzfRm/eh
 k7PlQZGRPMBVhcWW6yEhNBLnYdSsQpR+bKiSZmV9QL+tti5bnN/bPy6ISMIMZ2uGLPDP
 CuVwfM76vHkJz2Kf72u2X7K6ZOsK4uO83Y+mZaiL6oCT+lOYPBr1mnBgjyhZZYNRy8A0
 khE/RerCnAWtBL0pd8tovNS/wuJpVmFCJed9b7mUAx2HkguxvcBF/x+hwxxXegKDyH9v
 yupA==
X-Gm-Message-State: APjAAAWR4pwvAtUK6kTaQGgjdPA7Wom/TcAcfmj4BOj2wzyxrgp+nwS1
 MgfgxEcPEowj4khPCOzP8ru7InCLXaB/LDrmu0RuSXdPWww=
X-Google-Smtp-Source: APXvYqzQY8nI5SjRf3vbkML66dR52hVRuAwaoIiPFMnxNz/dkE8c/gs6gZOSDIpGX+HePBykztRMnjcfBaBDWBidTGQ=
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr12371703wmk.18.1575007247161; 
 Thu, 28 Nov 2019 22:00:47 -0800 (PST)
MIME-Version: 1.0
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-3-Kenny.Ho@amd.com>
 <20191001143106.GA4749@blackbody.suse.cz>
In-Reply-To: <20191001143106.GA4749@blackbody.suse.cz>
From: Kenny Ho <y2kenny@gmail.com>
Date: Fri, 29 Nov 2019 01:00:36 -0500
Message-ID: <CAOWid-ewvs-c-z_WW+Cx=Jaf0p8ZAwkWCkq2E8Xkj+2HvfNjaA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/16] cgroup: Introduce cgroup for drm subsystem
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q6sEJMkRXu7hSu+qr1ZpIJGkAq9uE1tMvK5+NCK55eg=;
 b=nhHXPijILiV784INV/SjVLc2zu+3GpgU4p1vIxj4gYrjylVVlPKYMTFrH8pkMwKy86
 +raTzJbjpP7b1wjMtAr/GCUyIMfNzn0f3gLciIPmOBtGBYiTzjcC0L9P1Ils3y+Mi1ox
 UukcJYbKjryHaVKKx28Y5xTrA373pz4aifxWp6gHBGyFD93dk53YUSWEK5QD2jlmqJTn
 ou7J7C0kM6WfI4AoqUVhShtWCQmRxSr6jlVq8OIhe+AR0jfOs9vzHlSkc9riBJOfxqry
 Y5SeSb2vV6RQveP+mm19ynMIoiYHr0u0avDAeAKc5Gwdo4DRz2XvfRfn5KSNlcuMlIe8
 ZvaA==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Tejun Heo <tj@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAxMDozMSBBTSBNaWNoYWwgS291dG7DvSA8bWtvdXRueUBz
dXNlLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MDU6MTlBTSAtMDQw
MCwgS2VubnkgSG8gPEtlbm55LkhvQGFtZC5jb20+IHdyb3RlOgo+ID4gK3N0cnVjdCBjZ3JvdXBf
c3Vic3lzIGRybV9jZ3JwX3N1YnN5cyA9IHsKPiA+ICsgICAgIC5jc3NfYWxsb2MgICAgICA9IGRy
bWNnX2Nzc19hbGxvYywKPiA+ICsgICAgIC5jc3NfZnJlZSAgICAgICA9IGRybWNnX2Nzc19mcmVl
LAo+ID4gKyAgICAgLmVhcmx5X2luaXQgICAgID0gZmFsc2UsCj4gPiArICAgICAubGVnYWN5X2Nm
dHlwZXMgPSBmaWxlcywKPiBEbyB5b3UgcmVhbGx5IHdhbnQgdG8gZXhwb3NlIHRoZSBEUk0gY29u
dHJvbGxlciBvbiB2MSBoaWVyYXJjaGllcyAod2hlcmUKPiB0aHJlYWRzIG9mIG9uZSBwcm9jZXNz
IGNhbiBiZSBpbiBkaWZmZXJlbnQgY2dyb3Vwcywgb3IgY2hpbGRyZW4gY2dyb3Vwcwo+IGNvbXBl
dGUgd2l0aCB0aGVpciBwYXJlbnRzKT8KCihTb3JyeSBmb3IgdGhlIGRlbGF5LCBJIGhhdmUgYmVl
biBkaXN0cmFjdGVkIGJ5IHNvbWV0aGluZyBlbHNlLikKWWVzLCBJIGFtIGhvcGluZyB0byBtYWtl
IHRoZSBmdW5jdGlvbmFsaXR5IGFzIHdpZGVseSBhdmFpbGFibGUgYXMKcG9zc2libGUgc2luY2Ug
dGhlIGVjb3N5c3RlbSBpcyBzdGlsbCB0cmFuc2l0aW9uaW5nIHRvIHYyLiAgRG8geW91IHNlZQpp
bmhlcmVudCBwcm9ibGVtIHdpdGggdGhpcyBhcHByb2FjaD8KClJlZ2FyZHMsCktlbm55CgoKPgo+
ID4gKyAgICAgLmRmbF9jZnR5cGVzICAgID0gZmlsZXMsCj4gPiArfTsKPgo+IEp1c3QgYXNraW5n
LAo+IE1pY2hhbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
