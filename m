Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBDD4646
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 19:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF1C6EC6D;
	Fri, 11 Oct 2019 17:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA91B6EC6D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 17:10:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q64so10508458ljb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 10:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAb7TTIfB1eKP+9X+4TjkS/R2nmg1fZu2y5q/Z7MNno=;
 b=A378hkzLo9lxqVqwCRpGRobRZ3evGK8h+FXIMNW7oVDRImR3WB7a44KKTU31T3rIxb
 rFo4yEzTohvZy2Nw/jNVcPg6FafM/LaFZgc8IkH7w8w5Zezjs7ZzMwJf8aQ9G5DvaayZ
 iSQAQSUDBg35wbo5as/HGK6T5k/AwzJa99rUGdBMyijkQDEBLJx2NlXMZZ9AUuK6/9+g
 qk7MAMlN36jTzhPoONSks+Q4SN+l0rh21+mANkWGrXw+1ja2B20J2bYYjvz972LLhtsY
 MoTy9MAcMRnV7v6ZcpTyfL1Bx1N8uK4oqtmUA1GblEFgBTPM2w0TS4U5EQEG95xmuA0A
 1RSw==
X-Gm-Message-State: APjAAAXf29CmypUtn/EYlhv/Hr5iTm0yObzU88CGTHrbVokuJHJDl9+1
 wWQNE+dzwXY+wr1smBpMl1mNVDtWaNbGExibPzUS3Q==
X-Google-Smtp-Source: APXvYqxicieVD9XpC34f0SjQFrHhduHt4S/eo1Ck+YwKbmGCFbjKQ0/6bLBsMQ64JQyox66EUhPz7GbWdA2M+TAGeXM=
X-Received: by 2002:a2e:2901:: with SMTP id u1mr9968122lje.78.1570813804723;
 Fri, 11 Oct 2019 10:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191011143009.17503-1-rohan.garg@collabora.com>
In-Reply-To: <20191011143009.17503-1-rohan.garg@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 11 Oct 2019 18:09:52 +0100
Message-ID: <CAPj87rOMMdi0zUdjEKeiUsLpfQkTPf3adEfw13ur6UQtNdNUxQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
To: Rohan Garg <rohan.garg@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FAb7TTIfB1eKP+9X+4TjkS/R2nmg1fZu2y5q/Z7MNno=;
 b=fJGm+C0x5kb+JW0XC06cl0YB05fB5cZgEKEyc4s8YV53wuuTS0fjXtJ/bOQR7XO08f
 mFx6UfpFgzQQSC4ZBEGySU+GwF/WoqG7OS65EpmaC3SXjpDDiVmEoVmqM0iRKgx8gK9x
 TK+UO7tMBQ3rKdPURlWpKlcLxebwPHT6s/H7xRlWlmQtAC2eeU37jUeQcRv+bFH9rs3v
 QYHGo4mAXMr+QaIJ4PKRpi2MCOb4V2ep2KilEvs9o3liDwt9XU/GS/d1Z9gnVJTuFVyU
 l//RCNKCLafUC6cNdL2tFl6RIa/Op/NF3XYlcZDmFKYQeM+bikmWvc+cx1p8ckOfVDg4
 b0Ww==
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
Cc: kernel@collabora.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9oYW4sCgpPbiBGcmksIDExIE9jdCAyMDE5IGF0IDE1OjMwLCBSb2hhbiBHYXJnIDxyb2hh
bi5nYXJnQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+IERSTV9JT0NUTF9EVU1CX1NFVF9MQUJFTCBs
ZXRzIHlvdSBsYWJlbCBHRU0gb2JqZWN0cywgbWFraW5nIGl0Cj4gZWFzaWVyIHRvIGRlYnVnIGlz
c3VlcyBpbiB1c2Vyc3BhY2UgYXBwbGljYXRpb25zLgoKSSdtIG5vdCBzdXJlIGlmIHRoaXMgd2Fz
IHBvaW50ZWQgb3V0IGFscmVhZHksIGJ1dCBkdW1iIGJ1ZmZlcnMgIT0gR0VNCmJ1ZmZlcnMuIEdF
TSBidWZmZXJzIF9jYW5fIGJlIGR1bWIsIGJ1dCBtaWdodCBub3QgYmUuCgpDb3VsZCB5b3UgcGxl
YXNlIHJlbmFtZSB0byBHRU1fU0VUX0xBQkVMPwoKQ2hlZXJzLApEYW5pZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
