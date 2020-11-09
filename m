Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11F2AB788
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A358982E;
	Mon,  9 Nov 2020 11:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CE78982E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:52:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id r17so4276358ljg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 03:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gb555tBVeDZ1152wJBFs/zqQc+I15TdKsfg5+AjAFMY=;
 b=VheQ6P+eFa43DzlthNUnMdFi3GfOfXKp3Gk0+ex0JvkJMOlv8YVeNPK6MhHY3U9TKc
 ehqpu7eVB8sYuUuPj2VhAi3/lGh3eM4Yiw8VmO9jrfljaLl0lTKmoSzXX/HkW8+xWuTo
 TJmr1Hm32xUoChiFhiPBpReNTzpl3hY8BQr3eDRw9mLMlJ5oaLRS3PQzKeTM+30FhbkM
 N6rR0MHpObqwxrn1yTGh+rnc1qwtXvqIoE0VtREkQxD9za0F26/0sdfXcBSlEwbv8qO9
 2S1EsdAHJHIbCGblmxivG7jeyfd1hoi9CilzOQiVaPBZeVTBp6qZF2DCv7JPplceUq8J
 84zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gb555tBVeDZ1152wJBFs/zqQc+I15TdKsfg5+AjAFMY=;
 b=Yn9tEKrmgrbJZWemtL6JYDe49zNfZoQqju0phHbfudi+sUdA/J0Pbwpx4ieUpuqifR
 5S0GFuRPepqIB6tBr2ipCFEBc9DBFuronglKAHOsS8MTHJokefaqJB6HnZqTr0OJPfgj
 oJmlTsTOyyAyXKBYi2LorGdn29yUp7/1RwWMIQhjoOpArC6oJEQfsi3d80J+qIyBiYvZ
 7D79g6kW+b1DuJ6DdiGWY9tjLkQGFmJ5qh4W10zuIgmPKLEgTc4bcksLHdRnjgoMi2v/
 3kIssGBzplhy8D4h9yHB+TWTlC9dEr1qWI1smt67bSxaR2GuDGp1degwa3lMYlNZeEPt
 +ocA==
X-Gm-Message-State: AOAM531Nge5GeVMW5jk8jc9Mb3yO8S59dRBElN+YBcChdx8dpiBxWw20
 9VTqUg0s03oliFDdE0SjKnc/BQ==
X-Google-Smtp-Source: ABdhPJyRS8LuIOxeZsIQW7aTMGVRK0Ph4X5yUBJ8354EvpwmhPb6OLkvY8F7e5IU4191BSlhW9JvtA==
X-Received: by 2002:a2e:958d:: with SMTP id w13mr5811033ljh.204.1604922728699; 
 Mon, 09 Nov 2020 03:52:08 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id i4sm1752128lfd.190.2020.11.09.03.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:52:07 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id 76842102840; Mon,  9 Nov 2020 14:52:09 +0300 (+03)
Date: Mon, 9 Nov 2020 14:52:09 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
Message-ID: <20201109115209.rwhoe4zttaxirx6c@box>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
 <71dc852e52bfeafc8c03a6fa3cd5f3cdd4eb6609.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71dc852e52bfeafc8c03a6fa3cd5f3cdd4eb6609.camel@redhat.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 04:58:14PM -0500, Lyude Paul wrote:
> ACK, I will send out a patch for this asap

Any update. AFAICS, v5.10-rc3 is still buggy.

-- 
 Kirill A. Shutemov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
