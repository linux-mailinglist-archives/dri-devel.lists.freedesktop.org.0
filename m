Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF438044F
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A746EE2E;
	Fri, 14 May 2021 07:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D92D6EE11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 06:43:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id di13so33536936edb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=gc8J68FYoIFDVqe0NTFpYDfQa9OoqjzTAaM0ycnVYU4=;
 b=TydDuuH/c5871F8dZ+Dwk7Jl8ZSCjzEsm/TnxDd8inRnAHBqN1vPUECr4QMjoJA4AB
 BRvgOFI7Qmhc8QiwzgcnHp+9OkH+x+iAFBpkvtM1+/bzZkV0hP7K9Xc62YBJsz5oKutB
 m7ciylzp3vo4tz7iWXaH/L2NY7kcBp+vVrXXXsGGfz6H6jWrFOt0VYBZrvbruIXJ5mXX
 uWPM3XfRzUrLxG7+bCM6TB/X5zIzQwZ8rkZui/ckiHuRzkoZYS8N/V2fEvbPuAOs0zAT
 e8LyPLMbCdtJ6JxWfkAPZDTHyl1Al9MOgW8Tq8NMfYwSRlEKfriKQFau3ORA3aMtmWl1
 kNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=gc8J68FYoIFDVqe0NTFpYDfQa9OoqjzTAaM0ycnVYU4=;
 b=eE8qPWbYWytgKRxyZry44DAKQ/Gc5CiaXr4YLHOR2BY4nJiWZW6lA3z6ESO3muJnFQ
 6UAOiGCp3KtWxcR8v/2FMaiqwlXKNpl3gDhtlcG3yD7vMvoo/LHR43eYyHc/8daRYjfz
 ofV0PzgqPmqT7iGL82en+tEv4NOeGAnial4yt/3+P55GwNj+qo75OzMNiTOqBKAFY+ty
 Bu4oWBTr3QZFKtufxBPfcnI9PRc2Ue9ZkRuB7AQmvMzXB7hhy6pLaiGQbZt/R7FuwCoF
 u8EO7gJOKG8zX1JZHPoOETcP+UL3upoxJe+T6vT1Hzj8pjMc+IXno6cXmJdMFYiTY6y8
 cRHA==
X-Gm-Message-State: AOAM532Sjp4ev2sp+to5PZOA65idRLmNgINOTE+A4ceZ6GfiC8l/4L8i
 NMTS10CR8TzwceMrmK0adyWEbL4KXPSRuAMhwcQ=
X-Google-Smtp-Source: ABdhPJwCQH4y/GI4l0XXz0pbFw5EuCy5vm0hgwd29pDTGo4sQ/2MsISi8/494HCExlavQ3JBa2XBXi5Op9L/yHzyCLA=
X-Received: by 2002:a05:6402:111a:: with SMTP id
 u26mr6715056edv.260.1620974588998; 
 Thu, 13 May 2021 23:43:08 -0700 (PDT)
MIME-Version: 1.0
From: Dan Bautista <bautistadan799@gmail.com>
Date: Fri, 14 May 2021 09:42:56 +0300
Message-ID: <CAO8t9Z_swJQBEOAJyPdNF7ViBDnfsYY+QsmcXtSY9Sfo8HxpeQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
To: gregkh@linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000091355f05c2448e5e"
X-Mailman-Approved-At: Fri, 14 May 2021 07:32:49 +0000
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
Cc: robdclark@chromium.org, security@kernel.org, airlied@linux.ie,
 butterflyhuangxx@gmail.com, syzkaller-bugs@googlegroups.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 Sean Paul <seanpaul@chromium.org>, sam@ravnborg.org,
 emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000091355f05c2448e5e
Content-Type: text/plain; charset="UTF-8"

Tse

--00000000000091355f05c2448e5e
Content-Type: text/html; charset="UTF-8"

<div dir="auto"><br><br><div data-smartmail="gmail_signature">Tse </div></div>

--00000000000091355f05c2448e5e--
