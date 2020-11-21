Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9B2BBC88
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 04:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD566E964;
	Sat, 21 Nov 2020 03:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E4B6E964
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Nov 2020 03:05:50 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t37so8900359pga.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gYKT1GDgUHKwabD+/L4YI6p0Bq1tA9NESqAu6acmN7k=;
 b=Jt12FkG08jW5RD6a+8HuZt/j09dxpXvkQQf6aOg1kA8ZZ1pRCURlI7aWvDRftqIiMo
 zwrDrO+Nzn3V2Nmp0phJPm5XEuAg61iNmaL1Uf9DhoAYH/MWjyypLjdFdL5Cfzl/4DXb
 ZFYcb0wpf5L3Y7uAiW04ePUbTG3C7fQbEiaU4MMPsHLuThNfCu2afSRcN7s8fKsYaL6I
 UC2Fpb4UTxE/TGHXHVhpV6fqt+7fTOh7VmwJjwEVmw2uAZqaEq/CMm84atPSsMofZzzW
 q1Xc4zunk/oxApuuWOQu7Yj6x7F2DJn7b/rWlIqp7BCm0zKH7h6E2k7pRhA4FMi0YBTH
 4Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gYKT1GDgUHKwabD+/L4YI6p0Bq1tA9NESqAu6acmN7k=;
 b=obV8S1VgQ0wM0hyJRVAL50zTwGO5++J9giBTCiAh+wlLT/zGuyoxyPd2SUDcDRCV5y
 Ui7dkTnJetZWAWrABdplR4Fyn4bMWBdRrNnx0SYAfGVtj/BnSKtNNAAg4UGNLbZIOJS+
 hOpFWLQBdPwlgLfwE9ojlgikITYBiFXjhP0VwX4RDni3nhnuThxybrGgjOUept1hTC9+
 TaciMKF911ean8tBoJ4WDnci/MEu6845bFEURtYXH3pgKOneUT41X0kzokTp5gXGq1M+
 wbRmgKiI3nI+4bsuAeAwvyOEGq1KJBxdMXL0u6dDITIpiVPBcADvBTHRSPAXKICCeh74
 x7VA==
X-Gm-Message-State: AOAM533nM5D8cnHHuPn0XDg+HhghaQyeLuEmQRFDpu/9/E/5ZHtXeJDW
 AHHkTirFE0O9hA5ev8TNnuA=
X-Google-Smtp-Source: ABdhPJyGZGZ+jhkUFhHyn0H6d+ko+ffJV0IZvahprxmJuX505stpS6p4RUoZz7RmUdOJI4PtVv1PKw==
X-Received: by 2002:a17:90b:150c:: with SMTP id
 le12mr13795556pjb.139.1605927949355; 
 Fri, 20 Nov 2020 19:05:49 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id p4sm5582693pjo.6.2020.11.20.19.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 19:05:47 -0800 (PST)
Date: Sat, 21 Nov 2020 12:05:46 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <X7iECnYR+GpXp7xO@jagdpanzerIV.localdomain>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X7fnc+xsVXPg4Op6@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X7fnc+xsVXPg4Op6@alley>
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
Cc: mchehab@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On (20/11/20 16:57), Petr Mladek wrote:
> On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> > 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> The last version looks fine to me.
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
