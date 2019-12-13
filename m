Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C0411EAB3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 19:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F906EC1A;
	Fri, 13 Dec 2019 18:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499A06EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:49:27 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id t141so232121ywc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N+Z6VHAKomhoL8I7KJYIHhWG6r2PIQkCrCHBBFVk3M8=;
 b=SPBUHi28hjvGvu+WPccLyHNCxisOv1l+XMAr6IP/rYkxfyjDnN9BP3KmFrPfwjSUZ3
 zEcP606qD0U2PHurLvJAtaGCc2IrZ7xelv5NmoMt4GvK8bQ6o6DUMiMDTQz5+kfrNvPD
 xERlF8dVCxakb1Kom5KFMqgLPMzyvwXOUmOof8i5InAwplGHIG3CLoSKzDtjstTM8YvL
 wj94aS5Dk/5cTpJRnPA/reJ6w99iJElNkbBd+evdYi8x5uB7y9sTb+uYezFfAD1VFpHX
 ObY0X2btpQ3glWVAzhYKloq79H1ZlIdTUdOnAmk3cUeBFSDjBcsi+VI/7MQAQ88Y/6WB
 QlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N+Z6VHAKomhoL8I7KJYIHhWG6r2PIQkCrCHBBFVk3M8=;
 b=HH6n2ez3QqflWE1MjyUTRGODZ07Qv8j+yyQookte6zmI+wYiHAdEuooQlEHkYW/GKR
 Wr9od2QNsVWL8UwhnxqYrqHrvX+IUwmzGcpTBc7NYczbRAoa4jwGi3FByFKvAHD3dGIH
 iMihLHd6Ev44EA8wgy934cgffWJFL58PtUfY3VAaUbzlKmzliAgXmdjSEfol4gb6Jx3i
 tJlacsXu6B33quA5ByJccK3W3YDK2CMIldNx7nBhd/IZwCp9APApb212VRoE0MVB6yLH
 hfr/YaHsc9gJiRnA05zTtX5fXV0ZRzzn4/xUbE3xs4Aj+S/fzjZqge6FfwiCj0dmQFv7
 1SUg==
X-Gm-Message-State: APjAAAWa3ZZtmWXwcLgYM1YXjVr68Ws8hEotVvufkA/UKNJjyacj6weG
 kO1VNNnbCKcfccrlcTXE5HCYUg==
X-Google-Smtp-Source: APXvYqwjXbq84BVcdIMwj4ac7ii7guW7dD5pve73cpiJVImeRftGtrrDfATHuX743XImJxP3EPQ+Rw==
X-Received: by 2002:a81:990e:: with SMTP id q14mr9484672ywg.66.1576262966487; 
 Fri, 13 Dec 2019 10:49:26 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id g29sm4546203ywk.31.2019.12.13.10.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 10:49:25 -0800 (PST)
Date: Fri, 13 Dec 2019 13:49:25 -0500
From: Sean Paul <sean@poorly.run>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3] drm: Funnel drm logs to tracepoints
Message-ID: <20191213184925.GD41609@art_vandelay>
References: <20191212203301.142437-1-sean@poorly.run>
 <20191212222050.0bdddc13@rorschach.local.home>
 <20191213164652.GB41609@art_vandelay>
 <20191213115436.4e14a8ae@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213115436.4e14a8ae@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 11:54:36AM -0500, Steven Rostedt wrote:
> On Fri, 13 Dec 2019 11:47:03 -0500
> Sean Paul <sean@poorly.run> wrote:
> 
> > > Why is there a separate trace event for each of these?
> > >   
> > 
> > To make it easier on userspace to enable just a single drm category.
> > 
> 
> But trace events can easily be filtered. Say you have a field called
> category, you could then just set in the trace event filter:
> 
>  echo 'category == 1 || category == 5 || (category > 8 && category < 12)' > /sys/kernel/tracing/drm_print/drm_category_log/filter
>  echo 1 > /sys/kernel/tracing/drm_print/drm_category_log/enable

Hmm, true. I suppose the only downside would be that this would cause all logs
to be processed/assigned as trace events before the filter is applied. That's a
lot of extra work each frame.

Sean

> 
> -- Steve

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
