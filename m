Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D149F8DC5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 09:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6781010EF13;
	Fri, 20 Dec 2024 08:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GIrVFvBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3138310E2BB
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 10:25:17 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21619108a6bso4740305ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 02:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734603916; x=1735208716; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v5t3NsXxQS/8hO+c8HYTuaHhM+7bct6zTH1hMsA61Ho=;
 b=GIrVFvBPx8YjHx8ykiU59NYb3eKxtIB836kpiJJzRkFQEytBUIT2ORLyBwUmdYxXmT
 Slqg3ZaEYtHJKVGNV7ylFgtDlcr8/XOuzFbfHTwp6+uHJhiGqLX5+kWueXifYPLGcrvU
 n56roDd9trqyqqxf7IUjwm/qWMomXuu4vEOqnrXNGIHWao/HtwC6zE2wCoCYgmhD1F7X
 rMh1lp7RO8tMsn1+llm4KfX+g6MVvYQfrk2Gc05tdDsauQRG80b6gPcZ/6UBLddDOkB+
 TrRJqQZJT6oiID6+1NJ6shkHUdIOrpSfKxsunqzF187nrAW+lhEmBp3U7zw/DvY93oFy
 kmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734603916; x=1735208716;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v5t3NsXxQS/8hO+c8HYTuaHhM+7bct6zTH1hMsA61Ho=;
 b=MzVZ6GmmkaQ8wn901AXJWraO4JNx4vHiwX6wOS8BBOwiLSOYM1SnHIKzzMqgugQ5r+
 1522IItgEw/IOmyNZTeqafhMEe0KJxYMVZG7b+QsXipf49GPhZQp7Y2mywQdQ01lA/nC
 lt6EQTptRqlx8OZVHfwtTgap+dCHStdwwZojhcat84IHC15q9bSnRJGfozrtt5Qwnu43
 FXPpm0YseN2Xlwu7DDrsNmle914f+rlAGWvLMYh6PxEFkWk72BT1FyMPsgJN1m9QbmCZ
 Sopy5a8i+prG+oiQCw65VLlhqUy0yoHDtsCnejaVl/jHLV7V2HdLRUbCcOVlhyqmpsQB
 qqIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcBH2nE0D/Yqu6BNDHbqplU+kYbDUtGOtOlrohwbhXFc02dj5HE+KmkFFGKfHmb/Zp1PxKO0MZQJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy47h0UBmQhSCv8DTgxDhU4qrb180Img9e1CHeZxSV4CI7KpihT
 vh1NSdHDghKea4Ae2BpY2f+pwli6tF93YnvZnAN3tI/9ip+XQFNcNV4//Q==
X-Gm-Gg: ASbGncuBh3pZ4F4fS86FKX40tpzl8NP3cJXJ07vcIxjZZ2kTb++JW7Yi3ye5lEWvc1p
 CG3N8hDsqAjCBMZFSRRawPsasbj2Tq/xsSheFxk5APn0iyYTz7MoCX4+mumd14WjOtnpG+93wL7
 +23dSlcUUy57zpQc7yfmI+MT+7CJip2LjwxC4sPia9KUF86unqX+N4cXRc9EKCqQYcC7dROWsbO
 XVvkRQPHaScCznMLRLRcucxLo5D0zEToBq73VDor3ZaGBsc9bW6jVVO1HII+g==
X-Google-Smtp-Source: AGHT+IFathZ4hGE1Y4fxVfONYzsiy25juwWRdtU1U4Y2tvVnW1dgPkWw9OQ+jCOqDNrSYI7nWyuIDA==
X-Received: by 2002:a17:903:2281:b0:20f:aee9:d8b8 with SMTP id
 d9443c01a7336-219d9626689mr43000985ad.20.1734603916409; 
 Thu, 19 Dec 2024 02:25:16 -0800 (PST)
Received: from HOME-PC ([223.185.132.235]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9705ccsm9424545ad.92.2024.12.19.02.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 02:25:16 -0800 (PST)
Date: Thu, 19 Dec 2024 15:55:13 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: follow-up: Clarification on color parameter in drm_draw_fill24
 function
Message-ID: <Z2P0iY+EyIr7u7DM@HOME-PC>
References: <Z1rLpV+Rx7U0h2J/@HOME-PC>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1rLpV+Rx7U0h2J/@HOME-PC>
X-Mailman-Approved-At: Fri, 20 Dec 2024 08:15:04 +0000
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

On Thu, Dec 12, 2024 at 05:10:21PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> Dear Maintainers,
> 
> I am writing to seek clarification regarding the implementation of the
> drm_draw_fill24 function in the DRM subsystem. Specifically, Coverity has
> flagged (CID 1602416) the issue in the following line in drm/drm_draw.c
> 
> --> iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
> 
> I have some questions about handling of the color parameter in the function.
> 
> The function currently accepts a u16 value as the color parameter and uses
> bitwise operations to extract the RGB components. However, the mask 0x00FF0000
> refers to bits 16–23, which are always zero for a u16 value. Therefore, the
> expression (color & 0x00FF0000) will always result in 0.
> 
> Could you please confirm:
> 
>   1. Is the truncation of 32-bit color value to 16 bits the intended behavior?
>   2. Alternatively, should the function be updated to accept 32-bit values
>      as input as the function is called with 32 bit values elsewhere?
> 
> Thank you for your time. Please let me know if further information or context
> is required.
> 
> -Dheeraj

Dear Maintainers,

I am following up on my earlier query regarding the potential issue flagged by
Coverity (CID 1602416) in the drm_draw_fill24 function in drm/drm_draw.c.

Link to the Coverity issue:
https://scan7.scan.coverity.com/#/project-view/52348/11354?selectedIssue=1602416

The action field on Coverity has also been changed to "Fix required" for
this issue.

To summarize:

	1. The color parameter is declared as a u16, but the bitwise operation
	   (color & 0x00FF0000) targets bits that do not exist within a u16
	   range, effectively always resulting in 0.

	2. My query is whether this truncation is intentional or if the
	   function should be updated to accept a 32-bit color value, aligning
	   with its usage elsewhere.

I wanted to kindly ask if there has been any decision or additional insight
regarding this issue. If needed, I can provide a proposed patch to address the
problem once the intended behavior is clarified.

Thank you again for your time.

-Dheeraj
