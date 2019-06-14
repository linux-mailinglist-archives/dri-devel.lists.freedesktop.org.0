Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F40B45C73
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339B8928B;
	Fri, 14 Jun 2019 12:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58E89709
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:15:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id z23so2097994wma.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 05:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=MhL/OhKDns81zWDeQeKTyrXDA/2RaV0awHdQ2tJ20p4=;
 b=auvqWi+WgUQXL1ItH5RFBoRn8wsGS3DgvNW43E7OAb3I+hn0EZnYS1M61iffSD1+6D
 sDCWUVeDxb8fdtoFvCymYv1j+T1gRPiBTKDpV++SRjbJfStPfwB5MOd0IEU/wf7vkd4w
 OTlJ3EBDOjOP4nvG4vWEXYP1R5gq1zoy8mV49mWg+uRR+lwIFF3176Lx/n+KF9ojmGE8
 wJO0CR9UEzZhgML5eExjHbVKC10dwI6zj1pglrJJqaENW8I0TD+lfhSucg+b+hN8iwco
 kyZjHNe1iZt9aaLbxYoqCuhqzyYS7iUpOJGLLzDcCuWYN7SwdM2NUp8bST+eLtubT0OI
 JkYA==
X-Gm-Message-State: APjAAAUw1FGAD1/j+gBTWk5ym8pBqIBlNF2xvtrDXeHlQmWdbMmZFHEl
 4qMYe8KYbibnNhXm96nAZDscmGf4
X-Google-Smtp-Source: APXvYqxQewG1jzzbw5oqX2ipyATaI6e3qpjGoy9vLtBFQI6OsaEdPg06hKbsR1MWlb4FYLx8y6ujgA==
X-Received: by 2002:a05:600c:20ca:: with SMTP id
 y10mr7490670wmm.72.1560514529323; 
 Fri, 14 Jun 2019 05:15:29 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id y133sm4556666wmg.5.2019.06.14.05.15.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 05:15:28 -0700 (PDT)
Date: Fri, 14 Jun 2019 13:13:32 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] Allowing user-space alignment for dumb-buffers
Message-ID: <20190614121332.GB32412@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=MhL/OhKDns81zWDeQeKTyrXDA/2RaV0awHdQ2tJ20p4=;
 b=f83Hy7As2wpkEmH7UB3J8akaKVXmF1Orl5sSIScaTtvCfkprn5g4eS7UFxEnWJXdD+
 3dAipmv8eLDntG8WHupx/6K5KfqSIHsdM6+IM/Y8ecQd93Yb2eaFdqBfcp9mEQQDz6aZ
 C7zahcv1JW3RqwDrkxhpdbPt/wKDwp0F1n487GRJX/weNeudRTi2Mki4OUqwKdiEj5dq
 7gYAhD8UxgOZ9YEEK9EZbqpOhs6YpMLeK7gLD/gB5NSP4IdW67VBWDe5FGuwXW8pa0jA
 iMWq8QixOW34OZ2Fq04dBba6uWU4dAPlnlHlXgvT98yzoqkuezeEHkpeRVWXrRvYPlbG
 zPfg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKQ3VycmVudGx5LCBEUk0gZHJpdmVycyBpbXBsZW1lbnRpbmcgZHVtYi1idWZmZXJz
IGFwcGx5IGFsaWdubWVudCB0byB0aGUKcmVxdWVzdGVkIHdpZHRoLCBwYXNzaW5nIHRoZSByZXN1
bHRpbmcgcGl0Y2ggYmFjayB0byB1c2VyLXNwYWNlLiBUaGUKc3BlY2lmaWNzIG9mIHRoZSBhbGln
bm1lbnQgY2FuIGJlIHZhcmlvdXMgLSBmcm9tIENQVS9HUFUgYXJjaGl0ZWN0dXJlCm9yIGJ1cy9p
bnRlcmNvbm5lY3QsIHRvIG5vIGFsaWdubWVudCBhdCBhbGwuCgpCeSB1c2luZyBkdW1iLWJ1ZmZl
cnMgdGhlIENQVSByZWFkcy93cml0ZXMgdGhlIGRhdGEgaXRzZWxmIC0gYSBzb21ld2hhdApzbG93
IHRhc2suIFRvIG1heGltaXNlIHBlcmZvcm1hbmNlLCB1c2VyLXNwYWNlIG1heSBvcHQgZm9yIENQ
VSBzcGVjaWZpYwpvcHRpbWlzYXRpb25zLCBiZSB0aGF0IHVzZSBTSU1ELCBhbGlnbiBkYXRhIHRv
IGNhY2hlIGxpbmVzIG9yIG90aGVyd2lzZS4KClNvIGV2ZW4gd2hlbiB1c2VyLXNwYWNlIHJlcXVl
c3RzIHdpZHRoIHRoZXkgY2FuIG9wdGltYWxseSB1c2UsIHRoZSBEUk0KZHJpdmVyIGlzIGZyZWUg
dG8gZWZmZWN0aXZlbHkgaW52YWxpZGF0ZSBpdC4KClRoaXMgUkZDIHByb3Bvc2VzIHVzZXIgc3Bh
Y2UgYWxpZ25tZW50IHRvIHRoZSBkdW1iLWJ1ZmZlciBpb2N0bC4gSGVuY2UKdGhlIHJlc3VsdGlu
ZyBwaXRjaCByZXR1cm5lZCBieSB0aGUgRFJNIGRyaXZlciB3aWxsIGJlIHN1YmplY3QgdG8gYm90
aAp1c2VyIHNwYWNlIGFuZCBIVy9EUk0gc3BlY2lmaWMgcmVxdWlyZW1lbnRzLgoKV2hhdCBkbyB5
b3UgZ3V5cyB0aGluaz8KClJlZ2FyZHMsCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
