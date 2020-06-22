Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CBD2043D0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 00:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FC96E1ED;
	Mon, 22 Jun 2020 22:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294FE6E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 22:43:23 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g12so8213028pll.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=7sJlh8mTqMMVGGRGPmGdis+KAhpQkSnkGxPpFCRucz4=;
 b=o2xCtanL8ODfPn/UTNBOWQQB+TAT2girD+UigaTEp4DeTAsmFfePy80P1nqC30ZVzj
 oaA9t8AGW3OcSMnqr/5q4OtOXtvOwpxTxNcuaFtHU/cG56s+rljiIfhsg3G4UC/tRe62
 GXw+nYjVmsZFIpFldfOxI4LrZwlIVe/Mk4wyTZQJ8BMEH42j7Zw1ZH15WMP1mgGHb1Rm
 UDSA1xFGd47qvGJo1/HKlNQDow7cu5uB6amm5usNvN9zw837i3FvpncqyJs+NkI5JMUG
 pvVS6Z3zXQeWzNO2/2UdV+yHJvdzJprBJKIj6T398ZpVTmmuQf1PcYA9UulSumkp2nph
 QZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7sJlh8mTqMMVGGRGPmGdis+KAhpQkSnkGxPpFCRucz4=;
 b=hZuLsf5omNrnFSE5FVpmp66LehisQ6qtl1afTWO/9+otX6tcRXjsT8rY9AWxR3WCjv
 Y9SGCe6O1/OPZ6DYhsGXdFNt6vDuYMJRH9tihvx8jloUFVKcT+29UsJfEQTPXL03WQkH
 PsSSEiuY1Tcja6U5lnT8di/PuoKyccVbP5BgVyJyugUhkrxXNkMet++Ry91Ioane2PxY
 sHZ/EqVhtUM0TtwFL6WA6T1XtXTbKA8W3CIewZhudO5+OIvPemjzaRvV+FLcgCunOOT0
 FZQ/wR9p0kEGmxJPMSzE3MD0ca4wOe6R81PisTz5duov70Y43waLPohfPNTQGQUbfJQP
 RDQQ==
X-Gm-Message-State: AOAM532zhYuiIZctB/eqnZ9pC3lxrlL80mfa3XrbysPkB+sp6Dbo0ra1
 QqTU7uabGaltFJWoelr1Zac=
X-Google-Smtp-Source: ABdhPJyKgbIcdaiIqEDpP8cteo6S4Uuv5X/JU2P+m1Ri/0bY1KmTfSh3ekbKQm5bkE8cTsFe9QD9yA==
X-Received: by 2002:a17:90a:1aa2:: with SMTP id
 p31mr21506738pjp.227.1592865802790; 
 Mon, 22 Jun 2020 15:43:22 -0700 (PDT)
Received: from arch ([2601:600:9500:4390::d3ee])
 by smtp.gmail.com with ESMTPSA id n9sm508927pjj.23.2020.06.22.15.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 15:43:22 -0700 (PDT)
Message-ID: <af5ebef18bcce1272ab1e02daa0b04cc4284ed9e.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 22 Jun 2020 15:43:21 -0700
In-Reply-To: <20200622151913.GA655276@ravnborg.org>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622151913.GA655276@ravnborg.org>
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Wei Hu <weh@microsoft.com>, K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> 
> Just a buch of drive-by comments while browsing the code.
> In general code looks good, especialyl for a v1.
> 
> There is a few places that triggers warnings with checkpatch --strict
> Most looks like things that should be fixed.
> 
> 

Thanks Sam for the review. Will take care of the suggestions in next
iteration.

Response inlined below:


> > +struct pipe_msg_hdr {
> > +	u32 type;
> > +	u32 size; /* size of message after this field */
> > +} __packed;
> > +
> > +struct hvd_screen_info {
> > +	u16 width;
> > +	u16 height;
> > +} __packed;
> > +
> > +struct synthvid_msg_hdr {
> > +	u32 type;
> > +	u32 size;  /* size of this header + payload after this field*/
> Add space before closing "*/"
> 
> I wonder what is the difference between what is considered a message
> and
> what is considered payload in the above comments.
> Maybe that just because I do not know this stuff at all and the
> comment
> can be ignored.

message = struct pipe_msg_hdr + struct synthvid_msg_hdr + payload

Will try to make it more clear.

> 
> > +} __packed;
> > +
> > +struct synthvid_version_req {
> > +	u32 version;
> > +} __packed;
> > +
> > +struct synthvid_version_resp {
> > +	u32 version;
> > +	u8 is_accepted;
> > +	u8 max_video_outputs;
> > +} __packed;
> > +
> > +struct synthvid_vram_location {
> > +	u64 user_ctx;
> > +	u8 is_vram_gpa_specified;
> > +	u64 vram_gpa;
> > +} __packed;
> Not an alignmnet friendly layout - but I guess the layout is fixed.
> Same goes in otther places.

Yes nothing can be done for this.


> 
> > +static int synthvid_update_situation(struct hv_device *hdev, u8
> > active, u32 bpp,
> > +				     u32 w, u32 h, u32 pitch)
> > +{
> > +	struct synthvid_msg msg;
> 
> Sometimes synthvid_msg is hv->init_buf.
> Sometimes a local variable.
> I wonder why there is a difference.

When a reply is expected, hv->init_buf should be used, though I haven't
verified this. Just kept the same logic as in framebuffer driver.



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
