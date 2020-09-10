Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600EE265CD3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FDA6E99D;
	Fri, 11 Sep 2020 09:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3746E248
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 21:58:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c2so10135692ljj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BPOKNfGndEgQTjDQnrhJJIKdjf1I0suM7pRGQu/Ou8U=;
 b=nw2WXvXeyz/rrFCkNo7vvTApdJuNQWjYZ3hZlgVZRnja+AjljAXICgiwYunAKfZhF2
 3drhy6UK3PzcquX2EtckYx9JaFwYN5Pl0x4IWxlGQvZ1kImzXy0fqibpHgeN5NbBaHjd
 VxtyyL8zMML/4jWP+npXbA1ZvkseFtfjiESfetbSvNTwaeegF6ywPWWkHlb0riQ420xy
 S8tJhJafRSi89pI+mcpraFr4Cg6UEbfibnpnHha5wj6U6oIQvtNkjIhDeGu4dcreVR1i
 6ij+LNuvWTZZmrjoTJHkM5Wsqe/3gWbekKxk+0YNUTyuHSBCDWZiAWZQGGsyjtBejBWF
 R71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BPOKNfGndEgQTjDQnrhJJIKdjf1I0suM7pRGQu/Ou8U=;
 b=cL2mxUyHXq5fV4equ7HU1tVadjLcX/aIMvuwsJGXNICO7T3unQP+Gg8jB9Q8Y05iQF
 9GsBdzwaWPVdKT0N0gdWs38PWMcY2qayYpDH1eQPwi+V6P15PgDutAAEJI8vrnprUCoV
 ydmnalTlRuJRBjUuwm8SlXmMAvGlzXp64XIy6Rga/1NiS559Q7xkjlXtB4h3PnOdYU5b
 2l5vGOdfgxWS8zhUCRhQZAmiUskHXZZ0aKO+V6QOB0wciroCR9dwxh+l5gnD1T3LNFcl
 vBoASTD/fFUQryXTl+F4luuSbF3kSJwlsY/eLdt1WJ4UiDbz+08Rfq3Z/k2kTswGb0Dv
 Q/Jw==
X-Gm-Message-State: AOAM532gX7jw/qQSuQ75VzRnUDFCJ86bRvZQcO5zD4OnyIoo3Y/Dyptl
 a7miI39NdgZ73Y6f7ZMvito=
X-Google-Smtp-Source: ABdhPJxqfY1oHEqvUugiPogX+riSXuA+rGsfK7vSJX0OzVPvJRuesoH6Bn4Yua1zoUj/XCvU6g1lYQ==
X-Received: by 2002:a2e:8956:: with SMTP id b22mr5440270ljk.85.1599775130886; 
 Thu, 10 Sep 2020 14:58:50 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id n62sm19167lfa.82.2020.09.10.14.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 14:58:50 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
 (submit_handle_syncpts)
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <ac29394b-6a51-88d3-b52c-8b105f31b215@gmail.com>
 <d063703c-461b-79a8-2483-856793dd2e5f@gmail.com>
 <b18ec13f-5c2d-8457-29af-12fe3521e888@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <47edb3e3-fff1-fd1d-965c-f732d2c25bbd@gmail.com>
Date: Fri, 11 Sep 2020 00:58:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b18ec13f-5c2d-8457-29af-12fe3521e888@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDkuMDkuMjAyMCAxMToyNiwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gT24gOS85LzIw
IDQ6MjQgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDkuMDkuMjAyMCAwNDoxMywgRG1p
dHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IC4uLgo+Pj4gSG93IG1hbnkgc3luYyBwb2ludHMg
d291bGQgdXNlIGFuIGF2ZXJhZ2Ugam9iPyBNYXliZSBpdCBzaG91bGQgYmUgYmV0dGVyCj4+PiB0
byBoYXZlIHRoZSBwcmVkZWZpbmVkIGFycmF5IG9mIHN5bmMgcG9pbnRzIHdpdGhpbiB0aGUgc3Ry
dWN0Cj4+PiBkcm1fdGVncmFfY2hhbm5lbF9zdWJtaXQ/Cj4+Pgo+Pgo+PiBUaGUgc2FtZSBxdWVz
dGlvbiByZWdhcmRpbmcgdGhlIGNvbW1hbmRzLgo+Pgo+PiBXb3VsZG4ndCBpdCBiZSBhIGdvb2Qg
aWRlYSB0byBtYWtlIGJvdGggdXNycHRyIGFycmF5cyBvZiBzeW5jIHBvaW50cyBhbmQKPj4gY29t
bWFuZHMgb3B0aW9uYWwgYnkgaGF2aW5nIGEgc21hbGwgZml4ZWQtc2l6ZSBidWZmZXJzIHdpdGhp
bgo+PiBkcm1fdGVncmFfY2hhbm5lbF9zdWJtaXQ/IFRoZW4gYSBtYWpvcml0eSBvZiBqb2JzIHdv
dWxkIG9ubHkgbmVlZCB0bwo+PiBjb3B5IHRoZSBnYXRoZXIgZGF0YSBmcm9tIHVzZXJzcGFjZS4K
Pj4KPiAKPiBTdXJlLCBJJ2xsIGxvb2sgaW50byBpdC4gRm9yIHN5bmNwb2ludHMsIGl0IHdvdWxk
IGJlIHVzdWFsbHkgMSBidXQKPiBzb21ldGltZXMgMiwgc28gbWF5YmUgbWFrZSBpdCAyLiBGb3Ig
Y29tbWFuZHMsIGF0IGxlYXN0IGZvciBkb3duc3RyZWFtCj4gaXQgd291bGQgdHlwaWNhbGx5IGJl
IDIgKG9uZSB3YWl0IGFuZCBvbmUgZ2F0aGVyKS4gQW55IG9waW5pb24gZnJvbQo+IGdyYXRlLWRy
aXZlcidzIHBvaW50IG9mIHZpZXc/IE5vdCBzdXJlIGlmIHRoZXJlIGlzIGFueSByZWNvbW1lbmRh
dGlvbgo+IHJlZ2FyZGluZyB0aGUgbWF4IHNpemUgb2YgSU9DVEwgZGF0YS4KClRoZSBPcGVudGVn
cmEgd2lsbCBuZWVkIG1vcmUgdGhhbiAyIGNvbW1hbmRzLiBXZSdsbCBuZWVkIHRvIHRha2UgYSBs
b29rCmF0IHdoYXQgYXJlIHRoZSBtaW4vbWF4L2F2ZXJhZ2UgbnVtYmVycyBvZiBjb21tYW5kcyBh
cmUgdXNlZCBieQpPcGVudGVncmEgc2luY2UgaXQgY29tYmluZXMgbXVsdGlwbGUgam9icyBpbnRv
IG9uZSBhbmQgZWFjaCBqb2IgbWF5IGhhdmUKc2V2ZXJhbCB3YWl0IGNvbW1hbmRzLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
