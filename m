Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73941AB16C4
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 16:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8004310EA47;
	Fri,  9 May 2025 14:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LWCcVoDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAA210E26F;
 Fri,  9 May 2025 14:05:28 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b2000b439e1so170843a12.3; 
 Fri, 09 May 2025 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746799528; x=1747404328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tj/JEekejafSkdrc0ZEEyBzbst7sUCcOveZxNZ3IVjk=;
 b=LWCcVoDCCYIvJ3mIJKNvpz81TCBM0zldgCBWEdPIX26RkXpU3Xlv4in8ShGU4lwCua
 X6+6/x6/453XjqzOEDFpA7qZxMGRDHyN1YMyMT8b2kfJQ/OTtXuDViqnK+kBVmdiYHK3
 vXphVa+IpBVwZPT4Ai/8vn3ihGUStGkcXzz2BeAogy0q8D/4OvYYLCBuYHcs7ytUCOqX
 xh3oUOZFKS4y5HXS5zKKVru9UkNGnlrax5AXFt/pjIcIpy7fQe8Zqe9FDwPbJZLgjZpS
 M4tZit/aV2m/YjhPyKRE12uGWxI+aUMFlOC7fCMUZbssxe24FjSwXRX6BPoO1AOTZvVH
 i8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746799528; x=1747404328;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tj/JEekejafSkdrc0ZEEyBzbst7sUCcOveZxNZ3IVjk=;
 b=b3S6NqR1yJdY8ElzT/O7Cz+27JGTkc+UKHWLFMqgo5gEppOyJTS56ubJ5nfC5GUHCy
 +YEmnGQqjPwPytV9BGyKme8MJBU3U/S9Rm9D3Zk9LISbrqzh4hE7I6Q0FTnfVi8ml93Q
 RvRRBhKVmYN34oY8lHqb1y7gbm+5wS/XMMhWY7I4G+PdDhEjmK1tZymhsBxdxSVLJxeX
 RoxPmDyPsSFabl3pQbobgJJ2477gKKZjYf8lDNNFSgMEBZXpPWaex2f/BuwHt5Ipsu0W
 C5Df2uvZZfpW0CDQ301B81Uj3ckvHxSefDLaFrYOq+gdbSR8ng2yxGNp7/kjwKigMIsm
 WKHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh+QxZPhAvSXeM6x55xU27QVKdxa1BQa6b7peP7aoZRtqxQQLfjd2RZCPUd6fWqypFKUsH72EVnYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUvmz0xMyKwl1KmAK4phLbNAg24GCp6jmcjNgoxyDjQTzpsEfH
 7sc5fM3odQ0dVJuRKPAVgsKvS5YeNW8q4TKEul/R9q8rUBC3d0Fo9yoj08Fe4ZSFt1sE95mJpxm
 VfSl/TGKvH1o2RKWYi4Dlu/AilSHG7jQq
X-Gm-Gg: ASbGncsVfgcx/woblYV5mzR+y6mTabBzDvRtwZ6kbrBJI9VgX51j3mDpg8EniDzrA1X
 O5xqWTeNQp/D007qHY1Sd05dnhAvfAGt3HVtWCc5VIdjeWh1ee31YYYoqkFyE5U7Y8kBnL48Plf
 I5QRsHgvpBRciXgykH8XXuH7XSRWXlJ9VO
X-Google-Smtp-Source: AGHT+IGBDacbIba5I17P6ztMwdd8boFi6c6n07TgfMBDBWYjLr5WvD7JVZytWA9xZDsQsgAVbb7cSV2zt9HVrBDIjP4=
X-Received: by 2002:a17:902:cccc:b0:22e:6a2a:6b65 with SMTP id
 d9443c01a7336-22fc91a211cmr18289905ad.14.1746799527687; Fri, 09 May 2025
 07:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
In-Reply-To: <GXXZVS.Q1GIIU1M9VBL1@att.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 May 2025 10:05:16 -0400
X-Gm-Features: ATxdqUEkwV40gs6yoO7wUREMnfW1MRLZbnxuFd4nqhMqrNi53NYOa5qfW1rd5zA
Message-ID: <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
Subject: Re: Kernels >= 6.3 disable video output
To: Steven J Abner <pheonix.sja@att.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 9, 2025 at 9:39=E2=80=AFAM Steven J Abner <pheonix.sja@att.net>=
 wrote:
>
> On Fri, May 9 2025 at 01:11:17 PM +0000, Alex Deucher
> <alexdeucher@gmail.com> wrote:
> > What display(s) are you using and how are they connected?  Can you
> > bisect?
>
> Not sure the question, but it's a tv thru HDMI.
>
> Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
> DisplayPort-0 disconnected primary (normal left inverted right x axis y
> axis)
> HDMI-A-0 connected 1920x1080+0+0 (normal left inverted right x axis y
> axis) 575mm x 323mm
>    1920x1080 60.00*+ 60.00 50.00 59.94 30.00 25.00 24.00 29.97 23.98
>
> And hopefully to verify, 3 OSs run fine: Ubuntu/Elementary 5.4, PearlOS
> 5.15, and LFS 5.15 thru 6.2.16. 6.3 and above has 70% fail rate with
> firmware built in to kernel, no fail if no firmware. Mainline 6.8 was
> on PearlOS.

Is it specific to that particular TV or can you reproduce the problem
on other HDMI connected displays?  Can you narrow down where it broke?
 E.g., if 6.2.16 works, but 6.2.17 is broken, can you use git to
bisect between 6.2.16 and 6.2.17 to identify the commit which broke
it?

Alex
