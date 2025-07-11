Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5BB026DD
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 00:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0404610E28A;
	Fri, 11 Jul 2025 22:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KMyHcnJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FE410E28A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 22:19:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ae0d7b32322so411483366b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752272358; x=1752877158;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hD1RvSl+QN1nzm7kw4Vc4aGimUiL6opjjB0+F8WN/BE=;
 b=KMyHcnJdXOxOlWM4OK7O+6ys0v4KyIsXnPodUGP4W1BLfsm49f29lz93glyeq6FiAu
 yIvBjAREMMoQFkmYVIq9OkjAkiCGateGfmEBzcilNWScuU8UMdyomzo7jG63HgMiZ/wa
 vLdAN49C2S6AEDFy7Ys6M548LFiW9HCfB47/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752272358; x=1752877158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hD1RvSl+QN1nzm7kw4Vc4aGimUiL6opjjB0+F8WN/BE=;
 b=IVL+L7RfNA2ymXvEBwGmvYrUX2PyeX1XnqDbP4pOSgrSOAM+MGxoh9R7AmqF+iCpNN
 gcfElQf/6hlsIPkUpX/wARhT+0gMQzmFEVgwcaC72kzvDCekuTexox7svvQD+ONTT83c
 7nOipiBcCnpSpLCN0aM7ThNoa3582tJiKKk18yxHOKfGiKviwcmJds8r9RdOlZ8hzh8q
 +V00JF1rCtpTFEcpeJuHViDjfCEmzZSK4mG/OyPuQeZqjjySV1CxURgkkb86XDjTptDK
 ZnERlUeE90bDgW8kYQvc9wueYGAPH92YOI6OrVtAkJEKSMy785Je86GwoRAE1Dl2D/BI
 P5kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd29xGbufjxmBUWl6/lYXl8SDnNFlvZhsVCEE6X46CVvivhTUNcAJsAWgH+nZ8zogMWS9X+z6EVUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDF+Ra+6QxBs8lBo0snCeaZXtWcQypRMn1TjnEpL5VoUStQFtO
 k/QjHzBNiIwT5+lbbzBRXvHYSCfyZC7k65VDQEIP5Z3P1TYKdtHnuNu1XFEhU5Kh7ThQGOi8qcy
 zXo8NkWduCw==
X-Gm-Gg: ASbGncuPuLf1coRA83yjCEEaP5KDY3Li95qo2C70c5GZr9QtXioVk/wIRdKfJsqWYyb
 KzKrdzzFpFIl6rGJNI3AOoIQ1s0Z2/rM7wSbMc2+ydJHFMADGOH/zTcru98FGI4greiJiMXqXnY
 ohABrALNiiq2BBBbfNVAJXmTBGxB9iGcIpLWwXI9EVS4keZrqSAbAE8to+ewXmbocdWIjSBy46R
 8pvBWxAH7sFTMcsBtr8MeqkHBGM6vqyLLHruioxDRy5Gcasd3PYdD+F6YeFavZrgHCQjJXtjOZv
 koXzkDs1iqFDqCd5DqiJ9izy6IWQy6d9EbXS8v2t2QzF18U6LrH/aQ/UHLFGCcOSy1b5N8I0vfl
 UqUr9DKdKyfW5G5XAOEqEwbO83RdcfvJVkOiaVjIq6/a79uEQPs8Au62lCTauLyQkmouIJgyA
X-Google-Smtp-Source: AGHT+IGwXYmLRc7X8PiVveqBEmbPtLSQuI3fmI2BkEHbyQWPF3dV60DpXbWxn0/Yg8o0YvJ1lSoS2A==
X-Received: by 2002:a17:906:d7dc:b0:ae0:d798:2ebd with SMTP id
 a640c23a62f3a-ae6fc200c2emr470077966b.35.1752272358191; 
 Fri, 11 Jul 2025 15:19:18 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8266992sm362166366b.82.2025.07.11.15.19.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 15:19:17 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-60dffae17f3so3776695a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 15:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXqjVP9LYTMY0aF7RCUFbVFlDTxRi2LRlWVDZR7MOhaeU8T0HmQJvut78tHjNf2o3Q0/z1kJU0aEhc=@lists.freedesktop.org
X-Received: by 2002:a05:6402:26d5:b0:607:2469:68af with SMTP id
 4fb4d7f45d1cf-611e763864emr3673212a12.9.1752272356713; Fri, 11 Jul 2025
 15:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
 <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
 <20250711125349.0ccc4ac0@kernel.org>
 <CAHk-=wjp9vnw46tJ_7r-+Q73EWABHsO0EBvBM2ww8ibK9XfSZg@mail.gmail.com>
 <CAHk-=wjv_uCzWGFoYZVg0_A--jOBSPMWCvdpFo0rW2NnZ=QyLQ@mail.gmail.com>
 <CAHk-=wi8+Ecn9VJH8WYPb7BR4ECYRZGKiiWdhcCjTKZbNkbTkQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi8+Ecn9VJH8WYPb7BR4ECYRZGKiiWdhcCjTKZbNkbTkQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 15:19:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiMJWwgJ4HYsLzJ4_OkhzJ75ah0HrfBBk+W-RGjk4-h2g@mail.gmail.com>
X-Gm-Features: Ac12FXwhFwpN-9mAZlnlZx9S5volUcLxcJpIoAPgiTJHzwbOULl1vFp-wYR4lIE
Message-ID: <CAHk-=wiMJWwgJ4HYsLzJ4_OkhzJ75ah0HrfBBk+W-RGjk4-h2g@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>, Nam Cao <namcao@linutronix.de>, 
 Christian Brauner <brauner@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Jul 2025 at 14:46, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I've only tested the previous commit being good twice now, but I'll go
> back to the head of tree and try a revert to verify that this is
> really it. Because maybe it's the now Nth time I found something that
> hides the problem, not the real issue.
>
> Fingers crossed that this very timing-dependent odd problem really did
> bisect right finally, after many false starts.

Ok, verified. Finally.

I've rebooted this machine five times now with the revert in place,
and now that I know to recognize all the subtler signs of breakage,
I'm pretty sure I finally got the right culprit.

Sometimes the breakage is literally just something like "it takes an
extra ten or fifteen seconds to start up some app" and then everything
ends up working, which is why it was so easy to overlook, and why my
other bisection attempts were such abject failures.

But that last bisection when I was more careful and knew what to look
for ended up laser-guided to that thing.

And apologies to the drm and netlink people who I initially blamed
just because there were unrelated bugs that just got merged in the
timeframe when I started noticing oddities. You may have had your own
bugs, but you were blameless on this issue that I basically spent the
last day on (I'd say "wasted" the last day on, but right now I feel
good about finding it, so I guess it wasn't wasted time after all).

Anyway, I think reverting that commit 8c44dac8add7 ("eventpoll: Fix
priority inversion problem") is the right thing for 6.16, and
hopefully Nam Cao & co can figure out what went wrong and we'll
revisit this in the future.

               Linus
