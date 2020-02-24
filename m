Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6DA16A71D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 14:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4E489D4A;
	Mon, 24 Feb 2020 13:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8844489CDD;
 Mon, 24 Feb 2020 13:16:38 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id t12so5615210vso.13;
 Mon, 24 Feb 2020 05:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOTOEEcJr7rQLnFDlUYMQgFpypdNN6QFoaJIjORW4cs=;
 b=KnUz2hwBsJD+dNwgbike0bztFldk0jHTSM0g54BzXJ7jxPwEKfhKTHbSvDKYr2pepH
 /nujD+M8kpmeNGA07Ryu+uhgeSvtRZyfg93KTnscqq1AqEYnShSsObmAWcz8m1WvsWmF
 xpMaA+EocRrnu0ZhldEjprmvh4PQNeWhA53EEvh5QUcIw0MjKDlar0neN+BPbxzGWag8
 o4F65HaTGkdzsv/hTJEy7yMNGWMUgFPojeEOwMGmdlaaqaxN7uBuR24zpzxwCnwGqYlF
 sNbCxOtO9MYAU/5HSLfvhhis8Sl3mLv190x5aW6mTkz5rkLVDh9k8Kymd9UNZIvBzUNf
 O/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOTOEEcJr7rQLnFDlUYMQgFpypdNN6QFoaJIjORW4cs=;
 b=lqOiLm0BH52FoqwWsdanMLAjyrXv0/lLohi4dHYegMzugUyt/VnR2o36cnIdmf1NX5
 ERd2ai1cPFg0Gsvl3tkzy708vf2sDGf/yObo0F4zdxN8sQUwIH0hSt8ZfWXGXO3bmjPP
 TmWxYnB3CLCnqePMnr458ePBZxrEVsiNcNM6Y4fnvz/fW58C/YjgGRhsODbWuycc8Uwz
 vKLv+GwbHtBnO9UwT/y+dlW+03VF/tzonZBnzGIneKIChi1IvRAYUOD9yZfvIa7gcIe6
 xqozzjWcZW5DPcX9Tj5MGWOw7Xn/OvYdP8gf/8Aob6lM1FitElOcM01swCqW1sbiu+5G
 xpNg==
X-Gm-Message-State: APjAAAXxdSW9WnCwbWw7a9VSyj88INbGBz79RMIC1lzIdlQ8wZDTeQra
 R+WXFuSgmOUcZFm7OyhqrSPdUxvQeke9wfV6w7o=
X-Google-Smtp-Source: APXvYqxrIe3+OqZ+A1GsOx/kQ9OY1tQILX3AgVcfwTMKFdaFdrQnqMBaVBWtNo53Pw0AQNC42G6qdvHRI17em09EAvw=
X-Received: by 2002:a05:6102:535:: with SMTP id
 m21mr24976628vsa.95.1582550197643; 
 Mon, 24 Feb 2020 05:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
In-Reply-To: <20200106151655.311413-1-christian.gmeiner@gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 24 Feb 2020 14:16:26 +0100
Message-ID: <CAH9NwWeWZ8BSZ6wNhWZtiLxuNQzAYb5ZKX0_+3XWu2ieqhJLBw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] update hwdw for gc400
To: LKML <linux-kernel@vger.kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gentle ping

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
