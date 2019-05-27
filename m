Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A62ACC2
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 03:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597389725;
	Mon, 27 May 2019 01:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDE889725
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 01:08:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b18so15146234wrq.12
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 18:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mime-version:content-disposition:user-agent;
 bh=6B2BdOCKCrG1hA2h6aEOrhniKpPhguqMXaM08L8d3as=;
 b=CoZKuv6zSqUqLVBP0+aoTxNC/fZ2M+Ekt39pj/WwXLUDgJb3zTXP8aXKR6j7s0vkGR
 5K/YJjeST6Jmaoj9ufKAz5LoFdNFNRS4vI24RNd3AZYip78+GXOAKsmZPRmnmWcF4CEI
 OLiDJPb5fMOY+XIAslkdz0qpj8iiecSk5WBGgllcQXYBZYhztrPYeG6zHAnJ62gWL9Hg
 62g3z4A1dF35Jt2T+nerXwHDSZZDwTmWhth0tBoRPpDJoZh8U8gyj/h3YyZ2ChYEPzjY
 P8PuoAHupPZuEAOYh5aJwv5xnBTAGTaqEOjbzJJTgQQq1J7edONHbHV2t7HCGnu+oRcp
 6vFg==
X-Gm-Message-State: APjAAAVWlEZUNK4TkRe6nIoWatePm6PwI0AUSWRV0CCah4Ks2I53/yZi
 V3708i898rZXYDJx7StBnSM=
X-Google-Smtp-Source: APXvYqzoiUbZ4GT0aYLxpnVbv0kG/nekOk8FgxeRANyb+DwdRpRmGxlrfo6ee/I99gfwZaikcSghxA==
X-Received: by 2002:adf:9c8a:: with SMTP id d10mr19190374wre.9.1558919280766; 
 Sun, 26 May 2019 18:08:00 -0700 (PDT)
Received: from smart-ThinkPad-T410 ([89.187.177.105])
 by smtp.gmail.com with ESMTPSA id r4sm6883091wrv.34.2019.05.26.18.07.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 18:08:00 -0700 (PDT)
Date: Mon, 27 May 2019 05:37:54 +0430
From: nasser afshin <afshin.nasser@gmail.com>
To: vikasmpatil@gmail.com
Subject: [ADV7393] DRM Encoder Slave or DRM Bridge
Message-ID: <20190527010753.GA15000@smart-ThinkPad-T410>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version
 :content-disposition:user-agent;
 bh=6B2BdOCKCrG1hA2h6aEOrhniKpPhguqMXaM08L8d3as=;
 b=sHqOGiJx5kQFxr0qzVw2gxyhxavJHlx3gNYWuCXgvTH9zRgc+mIM2+wwOl7GFXy2Td
 fEzvq6SYBk0FzcLNri51DSKpJoNMXewTz0fAt8Uk0qT7PloPIs1gsYqyDIrJcHywxSmu
 QkIuQ9Gh968rZkCpQu5B2QgmXj6mBsc+Yutrhm5LCOnhO3Q9JtYdubKZ3U52WjB4Y/NV
 CE22TvvxS2rh8iM1tSHKW/6WXxWDy+QYJvIq5zJOjUrEd6PyMWlPm76uFYcdL9uPMGot
 lP81Fu5EPCu97nZo2Zf01Aips2ROG1eREGk5Qfn5kQwdnVJsc8MibASxdDMe6Ca2OIb6
 Fr6Q==
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
Reply-To: CA+kt3u11xsbjhZ2mNRfJUBbqtrPaUJHsEMk9CfzLdEED=xBXSw@mail.gmail.com
Cc: tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlrYXNoLAoKQXMgaXQncyBiZWVuIHF1aXRlIGEgd2hpbGUsIEkgd2FudCB0byBrbm93IGlm
IHRoZSBwcm9ibGVtIGlzIHNvbHZlZCBzdWNjZXNzZnVsbHkKSWYgc28sIGNvdWxkIHlvdSBwbGVh
c2Ugc2hlZCBzb21lIGxpZ2h0IG9uIHRoZSBwcm9ibGVtIHNvbHZpbmcgcGF0aD8KCldvcmtpbmcg
b24gYSBjdXN0b20gaGFyZHdhcmUgYmFzZWQgb24gVEkgQU01NzI4LCBhbmQgaGF2aW5nIHRoZSBz
YW1lCnByb2JsZW0gYXQgaGFuZCwgSSBqdXN0IHdhcyBjdXJpb3VzIGlmIHNvbWUgb25lIGhhcyBi
ZWVuIGFibGUgdG8gd3JpdGUgYQpvbWFwZHJtIGJhc2VkIGRyaXZlciBmb3IgQURWNzM5My4KCkFu
eSBoZWxwIHdvdWxkIGdyZWF0bHkgYmUgYXBwcmVjaWF0ZWQuCgpLaW5kIFJlZ2FyZHMsCk5hc3Nl
ciBBZnNoaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
