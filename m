Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4945616
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFF489911;
	Fri, 14 Jun 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D53A8928B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 20:13:16 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id 33so15945653qtr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wvS6rY6fiOclRJfIV/D2hBg/6UXfJIIPm4B4bACKZz8=;
 b=uAlICKHkutKsJ44Na9YqSls8KX/BN+9JPrpnqbd3q7q/5aAlO8ZM24Sts+TA3RqVqH
 /CmciqPAcBbskyvjZgo1JiABwzKrWdgaP9OmXeiT11t4jEpRBUlbyuQ09G5hlZN1+TWF
 G9wY/5SgmZUbiT49kPZhiCONKBvwCLeKrz5rynx7soCHHJlMKeeuj1Nj2qTUIHPIMMte
 l6Z1Ouh27G9OGXopZ4+HOA+wGnVsmz5NjHxais6Y9ibgwpOoYRLUi5AO22oEkJ5Nt8aG
 FY6C2B3kGCxKQ5O0okvIMNrdAzfAqsYVdHbcw8W7DN+UnGN8DRRgzuwzQ9Ye577JNy14
 YMYg==
X-Gm-Message-State: APjAAAWepNa7bjO4yc6us8rr0/n+Lb3SmPRHkbqXQcW9AZGE7QojQ6tP
 W5nr2iSukvc0EIlofsdf4fZ/2iDqhObvfJpprYp8hw==
X-Google-Smtp-Source: APXvYqxWyFG99Ct6+QLgIzYtC2nFrJPWli73Mpub+sqBtV6mrY7PVaaQNI1DAnxScJGvgATRbOeFqOwsixGDdCryNzE=
X-Received: by 2002:a0c:add8:: with SMTP id x24mr5123019qvc.167.1560456795436; 
 Thu, 13 Jun 2019 13:13:15 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Huckleberry <nhuck@google.com>
Date: Thu, 13 Jun 2019 13:13:04 -0700
Message-ID: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
Subject: Cleanup of -Wunused-const-variable in
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To: jsanka@codeaurora.org, robdclark@gmail.com, sean@poorly.run, 
 airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wvS6rY6fiOclRJfIV/D2hBg/6UXfJIIPm4B4bACKZz8=;
 b=HYg9YO4tNI0fAvnYBqGA4GHJTrCc+LilCgHH9hKNNNHCrPFgKufk5stqe+dbMkNVqr
 HqerBE0ZU1S9XNvUlRzSNM2WVfb2xR/bOlOfyodDJ4rOQ6cuoFu9mjF0jIs9YfSSrNsZ
 yiYSGIAs1Q2l35lfEnbUESGmL4kEUxqLPcRnrXfi/sUCae4UDijczQOtXXl0ooIXVmir
 tqIrBRxS9WHRSWV1q+R2sX9hRJ1aua7zkTpBanPHAR3BJpvZ2+aI+uUalMJGZWoCGDiN
 +3FBbwVNVFJ4zzxiidZrklYOyVcH1E+ivsDndTFaNYnLVHR535KTDmdvYbZ1Rvcjvo5e
 i9yw==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IGFsbCwKCkknbSBsb29raW5nIGludG8gY2xlYW5pbmcgdXAgaWdub3JlZCB3YXJuaW5ncyBp
biB0aGUga2VybmVsIHNvIHdlIGNhbgpyZW1vdmUgY29tcGlsZXIgZmxhZ3MgdG8gaWdub3JlIHdh
cm5pbmdzLgoKVGhlcmUgYXJlIHNldmVyYWwgdW51c2VkIHZhcmlhYmxlcyBpbiBkcHVfZm9ybWF0
cy5jCignZHB1X2Zvcm1hdF9tYXBfdGlsZScsICdkcHVfZm9ybWF0X21hcF9wMDEwJywKJ2RwdV9m
b3JtYXRfbWFwX3AwMTBfdWJ3YycsICdkcHVfZm9ybWF0X21hcF90cDEwX3Vid2MnKS4KVGhleSBs
b29rIGxpa2UgbW9kaWZpZXJzIHRoYXQgd2VyZSBuZXZlciBpbXBsZW1lbnRlZC4gSSdkIGxpa2Ug
dG8KcmVtb3ZlIHRoZXNlIHZhcmlhYmxlcyBpZiB0aGVyZSBhcmUgbm8gcGxhbnMgbW92aW5nIGZv
cndhcmQgdG8KaW1wbGVtZW50IHRoZW0uIE90aGVyd2lzZSBJJ2xsIGp1c3QgbGVhdmUgdGhlbS4K
Cmh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzUyOAoKVGhh
bmtzLApOYXRoYW4gSHVja2xlYmVycnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
