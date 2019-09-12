Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A7B0C21
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 12:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030E96ECA0;
	Thu, 12 Sep 2019 10:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE6A6ECA0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 10:00:52 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w6so18865210lfl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 03:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dgRHe0c0zALMw2TSjbVcveDJfiRQV5j8z+Nv6bZbiTU=;
 b=KP/7HNtFNKbjG+MDMARhcwH2zV5sHw1jJBCjACu5g7RZlhvs7+Hgqm6VIGced8bVWL
 ljEbNSMUqgxhH1wC7Qbn+4Pjji1oyLrYJusTK7qtSejPnC7H28wti7B4f+jRgxFqoDvS
 YjQlqTc5/PU5GL82Yi63oeXE64HGV1u5Z8xB3/+yrRsVeJK9Ai1o2kshWkXVXSIfJ1RT
 CZao4JEIvnMx2gRAY0X65F2yJvEEQosfJKJDChVz30u4+mmHOtwTnHTMbVmoE+E8xAt4
 XDjJB/b3WeIAWd13FtkH7RJ4sDGWJFUu/oXf1i6/l9RYh2c7Gky0oseyiYxgO9/MB4GP
 vUpg==
X-Gm-Message-State: APjAAAXO05RrcMz4nOf6/UDRxSeH166Q2fsb7KCuA8//JZb2MSgh2CH0
 pmEcFoRmHlyGNMMglf8rSmpyvA==
X-Google-Smtp-Source: APXvYqxc4YkOSQULHhzw8UnouJkwyCr3fFXRTqlNg0o1TvAscvTc+8yVIN44zsSWfVizJCzuqCdaKg==
X-Received: by 2002:a19:8017:: with SMTP id b23mr26387068lfd.132.1568282451053; 
 Thu, 12 Sep 2019 03:00:51 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4458:7c96:687f:e13:db32:8101?
 ([2a00:1fa0:4458:7c96:687f:e13:db32:8101])
 by smtp.gmail.com with ESMTPSA id l3sm6122626lfc.31.2019.09.12.03.00.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 03:00:49 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
Date: Thu, 12 Sep 2019 13:00:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dgRHe0c0zALMw2TSjbVcveDJfiRQV5j8z+Nv6bZbiTU=;
 b=mCEYHaiknSmh86XK9e03fuskcmgH8JP35BlF2mnj8P4vGddGJJgDkO/Str6PuZEhFJ
 d1fle7Bp5qw0FZd+YOjt95a0BFr8sjKu/UFAH71NB9BQCF4OHxyjt/l4GlrD0mLiyCKi
 EJQMNGKGNGxIjoUeqvg1dQE42v79xFegUa/urL4rV/iW82qETF9ASs4Ccy2vZ6ZnZfHP
 j/E78UGKbUBPikmsnuhGu5RTZvizM6pCJWCRHTW2/TADq0WVYYtam+IVUg5vuoiRH5wR
 yNMqSxXHLuxHo+ZVGVanOpH2wvBnUYyKzJAE6AE508a5anSURDrhzQ/6wEZMghOXdXtF
 owNA==
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpPbiAxMS4wOS4yMDE5IDIyOjI1LCBLaWVyYW4gQmluZ2hhbSB3cm90ZToKCj4gQWRk
IGRpcmVjdCBzdXBwb3J0IGZvciB0aGUgcjhhNzc5ODAgKFYzSCkuCj4gCj4gVGhlIFYzSCBzaGFy
ZXMgYSBjb21tb24sIGNvbXBhdGlibGUgY29uZmlndXJhdGlvbiB3aXRoIHRoZSByOGE3Nzk3MAo+
IChWM00pIHNvIHRoYXQgZGV2aWNlIGluZm8gc3RydWN0dXJlIGlzIHJldXNlZC4KCiAgICBEbyB3
ZSByZWFsbHkgbmVlZCB0byBhZGQgeWV0IGFub3RoZXIgY29tcGF0aWJsZSBpbiB0aGlzIGNhc2U/
CkkganVzdCBhZGRlZCByOGE3Nzk3MCB0byB0aGUgY29tcGF0aWJsZSBwcm9wIGluIHRoZSByOGE3
Nzk4MCBEVC4gVGhhdCdzIHdoeQphIHBhdGNoIGxpa2UgdGhpcyBvbmUgZGlkbid0IGdldCBwb3N0
ZWQgYnkgbWUuCgo+IFNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hh
bStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+ClsuLi5dCgpNQlIsIFNlcmdlaQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
