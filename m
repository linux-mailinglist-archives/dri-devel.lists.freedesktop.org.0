Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E589307110
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3A16E935;
	Thu, 28 Jan 2021 08:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547366E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:08:16 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y205so1263326pfc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=dZ5Apc48PgkcI0iXXqNFunIaMeiv0OUaEYhLHdVP0NQ=;
 b=dJy0+TMILjiVrUpvi7MdKmW8sdrsYcu+xcsBSAgst74BJQi0ZNqyRWhZfzs1szh0p7
 lWS54dhIYPKbyr0rJ0broDLBytoXwoz/mkAv6kRh6Ddq5i8pUKb0JSQ+fIZJ2ARQdD1q
 i6fJMvNgcKx4e4JakNddu3DpJLn/jVtdvgAFaZ4iibiw3zg9IMH6tbjvTHrYAE6kqC1K
 vLukDbyD+W11RS0/l8d3XG3mujP03amTNHJp3UbUbbfNVGrLsyudpD3VFfTKR7jcuGGY
 X7ZHQY/G5OqmAwjod3a/2Il9nyvNf3AE9g6y2I1G5oeXW5Pgw63PTqI0TCFP85SbbvXt
 SA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=dZ5Apc48PgkcI0iXXqNFunIaMeiv0OUaEYhLHdVP0NQ=;
 b=bfuwKBqP0mmxUWOM2M+oB8V5a+W+8RnRi8eV+MxeUCIorzUf+Mu61qzisuR1SL55S5
 yVE0d1wE8pPMZfACcD7AUIPkc+WDVVyxXz4iVlU6GbT60pw2C36k2o31lgjVzInXllLx
 0wnFd0ZySbfqYH2D90ghzh+54serQMI5juGatB7YTj8yM6VfuLH3DucU28mppLGWIS6A
 bH7JStDjFykhsUlZwZU6myIbhhIgOzedvaAnr9TdRjjd8BeYVH0Kn5/GeLsXysxogH6B
 U8VP52qr8DZI0sV1H+JcuJsfFlwQP8NPxMV+HTtoTGCyt9gBg7T7HgqAxVXP/Dl3XnG9
 dzoQ==
X-Gm-Message-State: AOAM533Tb6A+jADcJTEE05c6iSctwj8CfP2XJEjBErQmdugF5z8c7NcK
 lL9+OCB64lqtqQxiXuIzAzs=
X-Google-Smtp-Source: ABdhPJzc7K4wiaIzTiUqaEc8ZDf0bQRgXReBZZ0hBd/naH+2JnDs7iHHAkpIutIYQ12pcivRgHxmZA==
X-Received: by 2002:a65:5241:: with SMTP id q1mr11307536pgp.143.1611756495877; 
 Wed, 27 Jan 2021 06:08:15 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id u3sm2866475pfm.144.2021.01.27.06.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 06:08:15 -0800 (PST)
Date: Wed, 27 Jan 2021 22:08:09 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <20210127220809.000026fb@gmail.com>
In-Reply-To: <YBFv+12xfsoxacDb@kroah.com>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <YBFv+12xfsoxacDb@kroah.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, oliver.graute@kococonnector.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sbrivio@redhat.com, colin.king@canonical.com, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jan 2021 14:51:55 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Jan 27, 2021 at 09:42:52PM +0800, Carlis wrote:
> > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> > 
> > For st7789v ic,when we need continuous full screen refresh, it is
> > best to wait for the TE signal arrive to avoid screen tearing
> > 
> > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>  
> 
> Please slow down and wait at least a day between patch submissions,
> there is no rush here.
> 
> And also, ALWAYS run scripts/checkpatch.pl on your submissions, so
> that you don't have a maintainer asking you about basic problems,
> like are in this current patch :(
> 
> thanks,
> 
> greg k-h

hi,
  This is my first patch contribution to Linux, so some of the rules
are not very clear .In addition, I can confirm that before sending
patch, I check it with checkPatch.py every time.Thank you very much for
your help

regards
zhangxuezhi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
