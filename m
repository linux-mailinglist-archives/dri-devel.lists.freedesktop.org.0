Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD81A7449
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6CD6E47E;
	Tue, 14 Apr 2020 07:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320526E452;
 Tue, 14 Apr 2020 06:13:17 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e16so4550048pjp.1;
 Mon, 13 Apr 2020 23:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5vYUlFRrmo48Z6uIstdlFK2RpwU8zu6bS3VJnypHQaI=;
 b=Ni1gJ/SRRaCwlu/HKk4f90wV2rq5KhyBN7v+R1AjcbKhLHf1vXKk3I+QND4167E7bb
 UAsD7F7srr+YA9LY1eh/v+MWu8rpmxIc/xg2hrfXn9Koh+cZuQXUm9qGILWAYiCFtwSp
 IBr9IRJ98NQHuAtZ6l2kUiN4zQMLEPbqwBHW9sAyEl2vcYSyUq4YfjQ5wgliC32RjNzt
 TXUyJOuUYhPvh3X3hlkVjWW2EBuVidlfZ0XCx5KcLPGUsWizWk85N8M1QdgK4nlYg1h1
 5BIao7d/uDEkJgYNvw5xAZ/7VCcNXfCNhsjSgRH/UF3659KoIyxmagvMcFL/wr64noAF
 La9w==
X-Gm-Message-State: AGi0Pub+f+yvMdcJKo8xhzYLpN8O74/83s+e4K9SQD0PTpJP5JIqL8i9
 3f0XEjRxpGAsEKb3M5SIhi8=
X-Google-Smtp-Source: APiQypLHuOqX8NGAjwM3Onpv7qlpUvNmBWIvQMcbKF0BZVkrwkXbgqqRtvcb5m94Vum2lGnSjxaFOQ==
X-Received: by 2002:a17:90a:d0c5:: with SMTP id
 y5mr7451458pjw.26.1586844796676; 
 Mon, 13 Apr 2020 23:13:16 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id h4sm9455050pgg.67.2020.04.13.23.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 23:13:15 -0700 (PDT)
Date: Mon, 13 Apr 2020 23:13:12 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v4] drm/i915: Synchronize active and retire callbacks
Message-ID: <20200414061312.GA90768@sultan-box.localdomain>
References: <20200404024156.GA10382@sultan-box.localdomain>
 <20200407064007.7599-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407064007.7599-1-sultan@kerneltoast.com>
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chris,

Could you please take a look at this? This really is quite an important fix.

Thanks,
Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
