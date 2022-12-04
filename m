Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD4641EEB
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 19:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3402410E061;
	Sun,  4 Dec 2022 18:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C666D10E209
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 00:12:51 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id 128so7942053vsz.12
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Dec 2022 16:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jqWnxoQvZbiditV/1/nr8cwEgzJwVCMstnT64OiZh8U=;
 b=8JjgmlPXKjLOMkHTmSeYayuxhkDx7ZmaPuAe31SBD/2C9P5CSjk/5EynO8+r40+QGc
 URP6oZ6O9fHCyhxRtS4d9WhqtVz4NhC2xw4JIkaDx1S1SCjH0Vc0F5VUjyKIwAgmIAC5
 JxLTtAAdncxOOHo5GAZ7PivX1gFofiuG2SExAzSYGQ5fQ07kvAUi7QAVDSTtMxrAgp5q
 9/fPJ5n6PZwofQyxyPIeHMwc9s70PWbJOEiR/P6HhaIfiyU3YncRW+uzDVhjOBvOq1YN
 bD3HhssZm6kiU/VLv4+9SVio28HmmCgR9CwaUs+03Z/4Fggf/U0tyyPh2x8pF9NVAwQu
 WyxQ==
X-Gm-Message-State: ANoB5plWblqd+TCc3R8zpoeN1BlRplX0ISJzdVS1Jsr9GOgcmpJhd6jS
 3NVHjJyEoQ+pES635WJsYd5/7mmF1hVLCZ49
X-Google-Smtp-Source: AA0mqf5TKe9bLnMiLu4H0jLDpuvJ3/i9spkYdYz+i1KjrM+vjuG+9LcJMbmZElQcvpcSz0gXZ8kNew==
X-Received: by 2002:a05:6102:5588:b0:3b0:51ad:7c7a with SMTP id
 dc8-20020a056102558800b003b051ad7c7amr32516666vsb.52.1670112769937; 
 Sat, 03 Dec 2022 16:12:49 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42]) by smtp.gmail.com with ESMTPSA id
 v74-20020a1fac4d000000b003bc4937c38esm1586847vke.41.2022.12.03.16.12.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Dec 2022 16:12:49 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id t5so7967494vsh.8
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Dec 2022 16:12:49 -0800 (PST)
X-Received: by 2002:a05:6102:3c82:b0:3aa:17f4:d63d with SMTP id
 c2-20020a0561023c8200b003aa17f4d63dmr35558496vsv.22.1670112769083; Sat, 03
 Dec 2022 16:12:49 -0800 (PST)
MIME-Version: 1.0
From: "mb@lab.how" <mb@lab.how>
Date: Sat, 3 Dec 2022 17:12:38 -0700
X-Gmail-Original-Message-ID: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
Message-ID: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
To: alex.williamson@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 04 Dec 2022 18:34:46 +0000
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, tzimmermann@suse.de,
 lersek@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I hope it is ok to reply to this old thread. Unfortunately, I found a
problem only now after upgrading to 6.0.

My setup has multiple GPUs (2), and I depend on EFIFB to have a working console.
pre-patch behavior, when I bind the vfio-pci to my secondary GPU both
the passthrough and the EFIFB keep working fine.
post-patch behavior, when I bind the vfio-pci to the secondary GPU,
the EFIFB disappears from the system, binding the console to the
"dummy console".
Whenever you try to access the terminal, you have the screen stuck in
whatever was the last buffer content, which gives the impression of
"freezing," but I can still type.
Everything else works, including the passthrough.

I can only think about a few options:

- Is there a way to have EFIFB show up again? After all it looks like
the kernel has just abandoned it, but the buffer is still there. I
can't find a single message about the secondary card and EFIFB in
dmesg, but there's a message for the primary card and EFIFB.
- Can we have a boolean controlling the behavior of vfio-pci
altogether or at least controlling the behavior of vfio-pci for that
specific ID? I know there's already some option for vfio-pci and VGA
cards, would it be appropriate to attach this behavior to that option?

Thanks,

Carlos Augusto
