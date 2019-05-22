Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195326603
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A6C89B5F;
	Wed, 22 May 2019 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-f198.google.com (mail-it1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13C889725
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 03:16:01 +0000 (UTC)
Received: by mail-it1-f198.google.com with SMTP id p19so806406itp.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 20:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=3nIzlGw+4wszd7mCGI8udFQIKx5mXZuEZdlx7TUEr8s=;
 b=BatxzSv55Sl7WeIld07b4pMK39roNlXBapuirzebw+EjhYfnmIkREo/wwHqE+nP1Wt
 t2r+7XW2vvAUkihzz9GrW0U0itZpoSYYK6KBhLly/9Wf90oB0ADt3ZLiQnuyiYK2FM5n
 nbzBhn9vDHg3jwH8IAaEm8qGrr25tEXe+91AP0G9riuse99Kh9V8O9Oj/tCZy8hxbJvV
 wTqLp+a7k2eDAhsenOWVgZMUERBsr4fJoujtdoaRL0YRog825bk/jrcFI+YfpMe7umHi
 Z91EGyZteKiaN8QuRLlN3/QMXWSuW4QQJU6JAsx+v89RUbxj0JrzMVbALrfcrAogaVR6
 piEg==
X-Gm-Message-State: APjAAAV40NcUd9KMUaoCkx7dQ6uau+GVSvE0hh2vWWnFobvJ3GfZCV5f
 z0Us/ucB7bEIjgUfvZ+n4BGVXr/sUlKQMYk/mWBIpA0SP6J8
X-Google-Smtp-Source: APXvYqxp+o+WQM7bTF4SCjOC36sALTlwx1QmJGZsN4sPxGpKCkBFjyv3EMuUBqqVKn8wzyZnUI3z37a7vKmMtQ7mfrLWFQqBAHmU
MIME-Version: 1.0
X-Received: by 2002:a5d:9d4f:: with SMTP id k15mr7079076iok.100.1558494961163; 
 Tue, 21 May 2019 20:16:01 -0700 (PDT)
Date: Tue, 21 May 2019 20:16:01 -0700
In-Reply-To: <00000000000033a0120588fac894@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008b645c058971629b@google.com>
Subject: Re: WARNING: locking bug in inet_autobind
From: syzbot <syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com>
To: Yong.Zhao@amd.com, airlied@linux.ie, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, ast@kernel.org, bpf@vger.kernel.org, 
 christian.koenig@amd.com, daniel@ffwll.ch, daniel@iogearbox.net, 
 davem@davemloft.net, david1.zhou@amd.com, dri-devel@lists.freedesktop.org, 
 evan.quan@amd.com, felix.kuehling@amd.com, harry.wentland@amd.com, 
 kafai@fb.com, kuznet@ms2.inr.ac.ru, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, ozeng@amd.com, ray.huang@amd.com, rex.zhu@amd.com, 
 songliubraving@fb.com, syzkaller-bugs@googlegroups.com, yhs@fb.com, 
 yong.zhao@amd.com, yoshfuji@linux-ipv6.org
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGJ1ZyB0bzoKCmNvbW1pdCBjMGQ5MjcxZWNiZDg5MWNk
ZWIwZmFkMWVkY2RkOTllZTcxN2E2NTVmCkF1dGhvcjogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1k
LmNvbT4KRGF0ZTogICBGcmkgRmViIDEgMjM6MzY6MjEgMjAxOSArMDAwMAoKICAgICBkcm0vYW1k
Z3B1OiBEZWxldGUgdXNlciBxdWV1ZSBkb29yYmVsbCB2YXJpYWJsZXMKCmJpc2VjdGlvbiBsb2c6
ICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2Jpc2VjdC50eHQ/eD0xNDMzZWNlNGEw
MDAwMApzdGFydCBjb21taXQ6ICAgZjQ5YWExZGUgTWVyZ2UgdGFnICdmb3ItNS4yLXJjMS10YWcn
IG9mIGdpdDovL2dpdC5rZXJuZWwuby4uCmdpdCB0cmVlOiAgICAgICBuZXQtbmV4dApmaW5hbCBj
cmFzaDogICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXBvcnQudHh0P3g9MTYz
M2VjZTRhMDAwMDAKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3gvbG9nLnR4dD94PTEyMzNlY2U0YTAwMDAwCmtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD1mYzA0NTEzMTQ3Mjk0N2Q3CmRhc2hib2FyZCBs
aW5rOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9OTRjYzJhNjZmYzIy
OGIyM2YzNjAKc3l6IHJlcHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gv
cmVwcm8uc3l6P3g9MTYzNzMxZjhhMDAwMDAKClJlcG9ydGVkLWJ5OiBzeXpib3QrOTRjYzJhNjZm
YzIyOGIyM2YzNjBAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpGaXhlczogYzBkOTI3MWVjYmQ4
ICgiZHJtL2FtZGdwdTogRGVsZXRlIHVzZXIgcXVldWUgZG9vcmJlbGwgdmFyaWFibGVzIikKCkZv
ciBpbmZvcm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6IGh0dHBzOi8vZ29vLmds
L3Rwc21FSiNiaXNlY3Rpb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
