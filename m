Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8A1B8FE3
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805966E2C7;
	Sun, 26 Apr 2020 12:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0526E49B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 02:55:39 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id c21so4658170plz.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=asnsPXdyirP9oS05sJeDQpJdG3Yhu+JHcjQarVbK0gk=;
 b=m/42paNYk4bTJSAgkYwKRquaje4aOyqgds2AflCUcNPSom+nmtRb/rohJdbkyrAZ4j
 a/l5Y+caMeCjIuX8q3HTHuO9b3BvriFmpwynhXu3NQF9jj0We7IQyTxjFay4RnVe7V7N
 i+YDgva5XOg2biHHGXlRV4FhkmvzojIDkj4DPNKiji/EIIMl8aw7Tq9PWMW621z/RLsS
 5pMr9tQOILDYQYcetoAwwQtza6Dyjr6geiaoh4grKc1QmGUWa0P3QZhQfWa7k3txGhZR
 5xSMr7ts/QnFBm8Q9QNmM5L6GSWn+GzJurQPoSJCRna2qxlW5aSzFIYKR9BcS6xODzGH
 TzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=asnsPXdyirP9oS05sJeDQpJdG3Yhu+JHcjQarVbK0gk=;
 b=mEF0P/GLLFIC7+CZQkQQYm2EkTUXsUILmq+LRWfTFktGo7YDVx1aXzz71YKBCBU6PN
 biHsUnMkWZvQwQTT1ZK/YBUW2BIrwgsQVLjyhSf0T1VdFO89J4+9Zj5uYm3ontc5PeoZ
 UuTOXyC4Paf/GYW/xnAzCkl9fhSjT+DI5mvQYNQs8s7DElMnlEm+U/DYvizecLTn8HV4
 aLymAmdkBqSn7cq2zVwWBK+W0tbZv164S8fqr46PBuh+0QF/Ni6xw/4iN55xpT/p8Qdy
 7Fek75ZVEuNUjBv8OrzHaPjXNA916JlHA7d9Es9uOaatCHAlpSUCwqRa7OEcLB1BuiSt
 +LlQ==
X-Gm-Message-State: AGi0PuYaLGzU8g1RpGAP3zKFFpPm7f20U458w2sgEuQ4oP+YmwKbgFNN
 xcAq4XnxAOVfrMlpK7wPiTs=
X-Google-Smtp-Source: APiQypK1GdDBLwOHRoHmSNhagXQufrO/V6jYWukUGGNElpFTa7XzOuwPiJ8w5GPxjpgKb04FkBxlKg==
X-Received: by 2002:a17:90a:a40e:: with SMTP id
 y14mr16047402pjp.101.1587869739112; 
 Sat, 25 Apr 2020 19:55:39 -0700 (PDT)
Received: from localhost ([176.122.158.64])
 by smtp.gmail.com with ESMTPSA id 79sm8037252pgd.62.2020.04.25.19.55.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 Apr 2020 19:55:38 -0700 (PDT)
Date: Sun, 26 Apr 2020 10:55:34 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v3] console: newport_con: fix an issue about leak related
 system resources
Message-ID: <20200426025534.GA19252@nuc8i5>
References: <20f37865-5af3-5fb9-8b8f-91f9464e4af3@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20f37865-5af3-5fb9-8b8f-91f9464e4af3@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: Andrew Morton <akpm@osdl.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 24, 2020 at 06:54:41PM +0200, Markus Elfring wrote:
> > The corresponding system resources were not released then.
> 
> How do you think about a wording variant like the following?
>
Markus, I think my commit comments is a sufficiently clear description
for this patch. Someone has told me not to send commit comments again
and again when it is enough clear. Because it only wastes the precious
time of the maintainer and very very little help for patch improvement.

BTW, In the past week, you asked me to change the commit comments in my
6 patches like this one. Let me return to the essence of patch, point
out the code problems and better solutions will be more popular.

>    Subject:
>    [PATCH v4] console: newport_con: Fix incomplete releasing of system resources
> 
>    Change description:
>    * A call of the function do_take_over_console() can fail here.
>      The corresponding system resources were not released then.
>      Thus add a call of iounmap() and release_mem_region()
>      together with the check of a failure predicate.
> 
>    * Add also a call of release_mem_region() for the completion
>      of resource clean-up on device removal.
> 
> 
> It can be nicer if all patch reviewers (including me) will be explicitly specified
> as recipients for such messages, can't it?
> 
> Regards,
> Markus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
