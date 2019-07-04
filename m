Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EA35F9CC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0778A6E351;
	Thu,  4 Jul 2019 14:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028606E351;
 Thu,  4 Jul 2019 14:12:16 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id 130so646963vkn.9;
 Thu, 04 Jul 2019 07:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RwjzuKWAb+6lrK93GKCiLTg/Hx2Y3ZoRRbWD2cO622U=;
 b=P0anKktRotPHLud8KFXyRBjEdNB7+cG7O40hLrW3+EE7Lgn8w2FUsL/+Uk5oxIQBET
 rBhaH+f9kmmxoPAyFTEqRzFK5DDzt0lKPpfzfuhGYL5ITBGH5wcn2w4LQfoq1L+QwvUJ
 7YWLRcR2lim6itzwJod9iQSvYldf3sm3A2J8kKEJMEXkt8PdBw9C9mmCqjF1WcfeiuS3
 M40D1zzlrZpcBvd6miHoW9q/NcqSrIZwnTWXGKvUVBXTZne5uSautDxueowB1kjSvNze
 O+DSQk457Cv2eM3iOjuj7iWKa8ru8yKzkxAnvClqj2SZq+4gXvFLLmMVChytvGYpvSf3
 7l2Q==
X-Gm-Message-State: APjAAAVcJufcbsywgduHJVHLihYTj5OT7okDPbOIT2ontppcb4kiMcXC
 V7tjhXEGkuNOjMR9/XIHmB5E7f9Wg9fuadoothQ=
X-Google-Smtp-Source: APXvYqy8X3yxVQW7mmHhj2pfnE6gtj/r+XF3IEI0IzGYwRt810JGgoyuihiWEQWD5b9s73RvwHLKrvZOx+G2cwyj0GA=
X-Received: by 2002:a1f:2242:: with SMTP id i63mr8314223vki.69.1562249535108; 
 Thu, 04 Jul 2019 07:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190704023546.4503-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190704023546.4503-1-huangfq.daxian@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 4 Jul 2019 15:12:23 +0100
Message-ID: <CACvgo53Dgdx5NhMaOAc9AhfvvbjX17RfuT71bMLR6G4RKhY=AQ@mail.gmail.com>
Subject: Re: [Patch v2 02/10] drm/msm: using dev_get_drvdata directly
To: Fuqian Huang <huangfq.daxian@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RwjzuKWAb+6lrK93GKCiLTg/Hx2Y3ZoRRbWD2cO622U=;
 b=eyl34Yv8nX2KUyU4Fz2gdHGh6L+62UalJ2nIsVtaOpKgXSDHi7opEv3U5Yzg/59msm
 PnHxUWlp9USlqhzSE0E2TbyMn4cMd5mm/UQw5rbieQxZSfI2433j7KlaWK+95M95Xp/V
 Sv2VgS14C2Dsqipw12Cx/oR0vpLaEkN3TMsRE0PKTPmkYvmQvdOmE1mBFdWdj2fn1zfM
 3/BkK3rgoGe9bZSWtmpiuf5trPShc5Bw/yHu2vV+yDpreZba+MIZ/DdCCPCtGIg/O6WF
 LBPj2NIkS8S5aH7FT+S6HdQzPX+IGGjWN+GUa5jiH6/EHbXvFYkBBsTw9CKZ8/o3/vtQ
 YyxQ==
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCA0IEp1bCAyMDE5IGF0IDA4OjI2LCBGdXFpYW4gSHVhbmcgPGh1YW5nZnEuZGF4aWFu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBTZXZlcmFsIGRyaXZlcnMgY2FzdCBhIHN0cnVjdCBkZXZp
Y2UgcG9pbnRlciB0byBhIHN0cnVjdAo+IHBsYXRmb3JtX2RldmljZSBwb2ludGVyIG9ubHkgdG8g
dGhlbiBjYWxsIHBsYXRmb3JtX2dldF9kcnZkYXRhKCkuCj4gVG8gaW1wcm92ZSByZWFkYWJpbGl0
eSwgdGhlc2UgY29uc3RydWN0cyBjYW4gYmUgc2ltcGxpZmllZAo+IGJ5IHVzaW5nIGRldl9nZXRf
ZHJ2ZGF0YSgpIGRpcmVjdGx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFu
Z2ZxLmRheGlhbkBnbWFpbC5jb20+CgpUaGlzIHBhdGNoIGlzOgpSZXZpZXdlZC1ieTogRW1pbCBW
ZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkkgdGhpbmsgeW91IHdhbnQgdG8g
YWRkIEpvcmRhbidzIGFjay1ieSBmcm9tIFsxXQoKLUVtaWwKWzFdIGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bHkvMjI0OTI4Lmh0bWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
