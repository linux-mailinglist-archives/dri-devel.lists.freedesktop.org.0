Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE17A4E794
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3010E660;
	Tue,  4 Mar 2025 17:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SzBDTps/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A97010E660
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:06:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43996e95114so40377435e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741108009; x=1741712809; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OvRj0E10E4ED7StnvmHDLIorc653QipKcyQOvlsD40o=;
 b=SzBDTps/C7nHniH0NQJWxN4s69NYaG+t+iFW+rmKij0TKPhQ/ZXwZrhfK74fDRG33g
 jquu37jbWgfJfeCDzu8ffAjmshzc0m+Ei7SGwjkxndH5n5PNWzF0zUJA9uBLBQGjOIbz
 IWWYcj/Vcb8WYmeArZkEdMvNqTMiHjUDdbeZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741108009; x=1741712809;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvRj0E10E4ED7StnvmHDLIorc653QipKcyQOvlsD40o=;
 b=PTWKQMh+fZdDDxKbjQTz4aBIaNEgJi8Q7e3CW9z/JBYz5M9ShXdpYzS8O8GgMc9gwT
 DAoKHCmKJCGf/bn/TRLMOPDawc2jvYwjYl9IMIh0mtauHoJ2Xg5mmfIdERR7G9aQGZC2
 l2gC8VLdr2OJGVr7uCMNPDhQWZls9ehv/k3TH74R7fYs/83pWCKLdp4KS/rwkG9561pn
 9A4f9Ov/yMz6JX6o49I4PE5O8esi65DWpWvL1sZ2di1oDR4XQUpMTIv4oRpIKNS9EvP7
 xkyk/cAKGm0Qau+/333fwNfAkV0CdvRWnP2F9yiOhx6fdP7LG9KhWflaQ03VAHQ4NlKb
 pjEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi0RZ7/Yv7ylsoKceFwvv5n8e8AdEhOF7V0r86ZS2VqV2qngtnaoWqA95GR8WjHQKQtAXXBtqXRl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPDpJB9K1tEMsUoHyEdnce04Svz7gRh6YJWnDOjVXYIgWnLe26
 /SV5Tu+dK02SmiOgN9+bL9V0OIQWSx+eMZOW6iJOJmOHZynb3iPAEwalS9OdNTk=
X-Gm-Gg: ASbGncu3xSGxgNGvTw91V7CBEtqOzAXkQuo35b40oxyMJPJUM+4a9TgpJlxbbU77CDf
 PNC3nmYPUnEs9fMhBXyoSsA+lqitWnIhjKfs2tGpxLVdbd9bo65j78vl3+lBr1G07uD4QNFavGo
 bWthHFPj/6xE36GL7pv6wraDJI8kirhOyZkQdDJVYnrFldrsZEHHkrsEFwzbcUruQHpTHKXZ76i
 hyHmWT50YWATqvJ9HtJhzEIbsY3JAhOMheipBiPe/7H6Roe5qNrNVvGtmWoasA3tB0XyhW61VRW
 ZtStAh4mjjMkH8p2cd0f0b7SmA2ve65igzyz9f+AJgEJWnJ230/EH3dK
X-Google-Smtp-Source: AGHT+IHuTyjUwC5fzeCJrYyrhG0iOzq/tjY2hIR7hTNi+8qHgfah7UFFilhEr6qIfMvKSIKtphxXgw==
X-Received: by 2002:a05:600c:2292:b0:43b:c0fa:f9ce with SMTP id
 5b1f17b1804b1-43bc0fafff1mr70675735e9.14.1741108008280; 
 Tue, 04 Mar 2025 09:06:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b737074d8sm204751935e9.16.2025.03.04.09.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 09:06:47 -0800 (PST)
Date: Tue, 4 Mar 2025 18:06:45 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>
Subject: Re: firmware requirements
Message-ID: <Z8czJa7QsCBGfQRd@phenom.ffwll.local>
References: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
 <50869fd0-00df-40ab-8dfa-844670e6e850@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50869fd0-00df-40ab-8dfa-844670e6e850@linux.intel.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

Hi Jacek!

Bit late reply, was sick last week and still recovering from missed mails.

On Thu, Feb 20, 2025 at 11:50:10AM +0100, Jacek Lawrynowicz wrote:
> On 2/19/2025 10:01 PM, Dave Airlie wrote:
> > I'd just like to remind everyone of the firmware requirements for
> > vendors that control their firmware and the driver upstreams:
> > 
> > https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html
> > 
> > Intel VPU it seems like you are not currently shipping upstream
> > firmware, and might have tied your fw and userspace together.
> 
> Yep, this is correct :/
> 
> > I'm cc'ing the AMD XDNA driver as it recently landed and I'd like them
> > to confirm they are following the above requirements.
> > 
> > The main reason we don't allow userspace/fw direct linkage is if a
> > user deploys two containers with two different userspace drivers in
> > them on the same hardware, what is the kernel driver supposed to do?
> 
> This makes sense, but I didn't see anything in the firmware usage

Well, when Dave wrote that documentation section and I reviewed it we
figured that's clear from the rules we have. There's two rules:

- firmware is not allowed to break the kernel. This is not limited to
  "does the kernel driver keep loading", but fully extends to anything the
  kernel driver does or needs to fullfill its job.
- the kernel is not allowed to break userspace. This is not limited to the
  uapi structures, but anything they point at or implicitly reference, any
  implementation details userspace relies on, any other hidden semantics
  that aren't entirely transparent. Everything really that can result in a
  bug report from users.

If the firmware upgrade still works with the kernel, but changes the
how the overall uapi works, then the firmware broke the kernel.

I think the two individiual steps above are very clear already, but I
guess that both together mean that firmware isn't allowed to break
userspace isn't clear. Can you please send a patch to add that as another
very explicit bullet to the existing list in the fw guidelines?

> guidelines about needing user-space and firmware to be compatible.
> It is focused on making sure the kernel driver works well with the
> firmware.
> Our intel_vpu driver sticks to the basics with the firmware ABI, so
> we've got backward and forward compatibility covered from the initial
> release.
> 
> Now, when it comes to user space and firmware, that's a whole other
> story. We've made some headway, but there's still a lot to do.
> Our firmware is pretty massive (like 10 times bigger than your average
> GPU firmware) which makes things trickier than what other drivers deal
> with.
> That's why we didn't put the firmware in linux-firmware right away, but
> we'll get the next release in there.
> 
> We will continue working on separating user space from the firmware more
> to make things smoother.
> 
> > Firmware should be abstracted in the kernel if it is not possible to
> > build proper fw APIs for userspace to use directly, by proper I mean
> > forward and backwards compatible.
> 
> This dependents on a project. In our case only user space should provide
> this compatibility.
> We don't even parse command buffers at the moment in kernel space.
> 
> For your reference, we release updates for both the user space and
> firmware every couple of weeks here:
> https://github.com/intel/linux-npu-driver/releases

Yeah you need to fix this. With containers and other packages runtimes
there's really no connection between the base os image, and the userspace
you're running. Which means you really cannot assume that on any given
system there's only one abi version across the firmware and userspace
libraries. So even without upstreams "no breaking uapi" guarantee this
does not work in production.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
