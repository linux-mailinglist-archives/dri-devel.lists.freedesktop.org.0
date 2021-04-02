Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA16352553
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 04:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0266E041;
	Fri,  2 Apr 2021 02:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650976E03F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 02:04:25 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id j198so3727207ybj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 19:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WRJyxwf4vfEzqQlQHSLRahu6KV0EKoLCxXd2rhgOZeY=;
 b=WwkphSsLWHXzfmmha0FAjVXHzMicJ7CG8IysDCBlqAkvhSCKcCBU9+p/6wjQXcyDTs
 rKUa8Imqu2L3XyQRRU/vDtIqfbyoTtN5rsfyn2t9YxoMLXW66Xm65A9EA6zn72vuwN45
 KgtunsIA7cHysWViQRvtKCSuC05A+V4/UYfna8M6hdGoIQMZSLtDtxlFp/coyZPbmMNq
 XNrgHey1oCVz8KcopUJb0J6gFPRHNrKqilts7qeqwMLnXIu0UHHyGioOXIToOGbYhE8A
 1TztuPEQ/ioA203SDGa38bcAYbYBFU2YuUB4SqO3YqB10+FluHk74udiE/XhUt+MJS7y
 J+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WRJyxwf4vfEzqQlQHSLRahu6KV0EKoLCxXd2rhgOZeY=;
 b=M0bkbqmnNSLMdUFyus1RG+f3I7NwMERI8swpORG87SyZzGEXxl/Uce8L7WsVMkNtZN
 RY4Np7FedrKS8FIbfr1sGe8496TvO40+02bZAd993AMPwd45QcE44qp6kqoZew+rn9AI
 6POjJm7c7lo9aWU86/kKmVAYAqGz++0+DjGZs0mUYvjZVNanhTVYZJd6wz15LMW5sl4a
 aVnuzxKh3cJMUxj/y34xq2nevnNDdYoSAibJqrtbujKR4qPu8VfuBxQMEkZa700RIPin
 bJOJH3VPKxPJXGAnb38jIDV9yuHeuZyeLj8fKs0evDVibdEsFdm1INNSm3UUkNxzq6+r
 jSPQ==
X-Gm-Message-State: AOAM532Qg7K8TqclM0G1WGnvcjLGKfsZyx5ZBtEys3WSihfcq/5FrmXA
 JTaIfZqJtcuh7B0kxU7qJv9wajYbOYwUiz90jDK1tOwPYHzTdMHT
X-Google-Smtp-Source: ABdhPJxhClQODfh1GX7TZBVzYyr0NLm4ge0B54yZ5SVb0dRF9om4n5hKWuUv7GVyNnso3jZhCug4dB8S/QFNwaqAM38=
X-Received: by 2002:a25:2983:: with SMTP id
 p125mr15370514ybp.369.1617329064448; 
 Thu, 01 Apr 2021 19:04:24 -0700 (PDT)
MIME-Version: 1.0
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 2 Apr 2021 10:04:13 +0800
Message-ID: <CAKGbVbvs5QYpg25L1X6VtkLUS_Z=PEfPPXEK0yz4qoksQf2+qQ@mail.gmail.com>
Subject: [X11][Question] Any plan on explicit synchronization for X11?
To: dri-devel <dri-devel@lists.freedesktop.org>, xorg-devel@lists.x.org
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

I have some interest to enable explicit sync for X11, so send a draft
MR to collect feedback:
https://gitlab.freedesktop.org/xorg/proto/xorgproto/-/merge_requests/34

As no comments on the gitlab MR, send this to mailing list and hope to
hear some voice. If NAKed early, it will save me a bunch of time.

Thanks,
Qiang
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
