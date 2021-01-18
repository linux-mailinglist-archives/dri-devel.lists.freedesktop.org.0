Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28852F9BE2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 10:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DB76E177;
	Mon, 18 Jan 2021 09:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823B96E177
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:29:38 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l12so10498771wry.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=CTgLJUEqtetOUnV2zas5KqZ4EY9oOOP8M49JHcOPywA=;
 b=I+4oFB0MgkgBjVm5Jj+c26yE7J3Obn5Uivn2n9Fp/Criu/5WvR9jSF+6l5Mftrkyl0
 LywxDJBSpWgUWo+Waeuq7vjxe7019LkJvKBZ9uv52xIojUEC5UNPNBiDsYwwfcZqtttt
 tPWp9hSxYCsHc8M4d3gCPY9KSWXKYYLIS378E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=CTgLJUEqtetOUnV2zas5KqZ4EY9oOOP8M49JHcOPywA=;
 b=pqXpIPr3MfZmpCvrP5CqIbLVM0zZOh1RLDxkERZKbiH1niVpU3gobbB5cirOqlQ6Ua
 3Eooe8CEOKKKee2zKPn4ANSas2nCMDDkZq9zYSr3E5VSnW5GopH0IT3dJrTNWuS6hFfJ
 0/Trk0a2M4PCmVbcjWlD8Pwg3PEudsBCiELjo/tWim3nyZyfDSm22oA5ZVByw6kJcyHm
 +0RP7ZV85ZHEr25eQOwJ356MUB7U/W5bjGjORyNjJs9MAJp9EjaEa9z1icfnQUXV0pW+
 umWdzCIehlzhHQ7oragrxLlDEIhnRENTxLLe2K2Q0Bqn4QdBA5SgDR3S8JZhP6JR2mD3
 XK7Q==
X-Gm-Message-State: AOAM533neOiyz/XenF02wTy5IV7wGRGoiaYA7l6I4RE9xjzbuVln+cfd
 o3th6VeG5YIazJkAG0DXWJD9Gw==
X-Google-Smtp-Source: ABdhPJwZD2NhTSuMUUe1JnXazKkGPQJ8zIJYw38ZA8GsmaChXIwZBv1OUFyczb0noJoTAULMPt4RQQ==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr24721347wrm.90.1610962176960; 
 Mon, 18 Jan 2021 01:29:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d7sm17087960wmb.47.2021.01.18.01.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 01:29:36 -0800 (PST)
Date: Mon, 18 Jan 2021 10:29:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: syzbot <syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 fbcon_cursor
Message-ID: <YAVU/vIwsqAzC7Qm@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com>, 
 b.zolnierkie@samsung.com, daniel.vetter@intel.com,
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 melissa.srw@gmail.com, natechancellor@gmail.com, sam@ravnborg.org,
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de,
 yepeilin.cs@gmail.com
References: <00000000000091111005b435456e@google.com>
 <000000000000c37b3a05b916e95a@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000c37b3a05b916e95a@google.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, george.kennedy@oracle.com, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, daniel.vetter@intel.com, natechancellor@gmail.com,
 jirislaby@kernel.org, yepeilin.cs@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 17, 2021 at 03:29:05AM -0800, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri Oct 9 23:21:56 2020 +0000
> 
>     drm/vkms: fbdev emulation support

Not sure you want to annotate this, but this just makes the bug
reproducible on vkms. It's a preexisting issue (probably a few decades
old) of the fbcon code afaict. It might also be that you can only repro
this when you have multiple fbcon drivers (vkms plus whatever your virtual
machine has I guess).
-Daniel

> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=148e2748d00000
> start commit:   b3a3cbde Add linux-next specific files for 20210115
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=168e2748d00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=128e2748d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6ea08dae6aab586f
> dashboard link: https://syzkaller.appspot.com/bug?extid=b67aaae8d3a927f68d20
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15cd8fe0d00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17af5258d00000
> 
> Reported-by: syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com
> Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
