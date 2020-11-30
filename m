Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B95372C7E44
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 07:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BB589C0A;
	Mon, 30 Nov 2020 06:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96F789C0A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:38:25 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id iq13so723873pjb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 22:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T6+dtAknrkqA4Yimni0jD+y5oA5qluuBuclYUMOPvYg=;
 b=bUz+jKFEZHNMSTnQV8CYtCPlSYJuu/mBseIRKD8DY/OSFYJYJV3sp5NaPPHdKR/DIV
 5IqMwPNiKvmq99PuQ658ITTSRpE1tnFnDa9dvzHCpYXXz04UhFBJWfWwgleQDm+0CQpm
 PhJeeFHdUZqItzeYLiJWSRixdpLCkTHPR6PuyVZipqoVkOzbwExGnfBC6AehsraGxM/U
 TNZ5AMk6m7ewz8y+mAgUUV9KcTuoNKetrSOI2q1m9q5pl0BoqAO3QN7Rh2hdkRKxTFVu
 V9G7+y6E8+jr2BESPvWTwdnI31Ywpj7JWg0INjJN+plaHk3tNVZKvffXkCwPQlvU+Luz
 rd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T6+dtAknrkqA4Yimni0jD+y5oA5qluuBuclYUMOPvYg=;
 b=hpgeXAs01rSuF2Bn6EdFzE0CUa/+5dKvLYxtlcb08FLO+eMMOZnkV8p/Bm/SlkVnpW
 JvvpN7xJ+b1Vr+xizcteUMj7J7n+o0dd1WQFNThKMaBK96wi2MzrN3uzgHFFpoQMmxcm
 bP6hA/yJ8V562zJ766ucz6/io4vXTjUjuP3XvNu4mMREOvMBDaT/YJbc3do+Bs1ebz9t
 SrS+/4p8CxXoPg1SM+z8P2gjxHdS6+QJHU3AUTeRPe5kWXe691ALYute1YKhmCZQL67d
 vnR89hAkxBrhDTljnxjQt9wPS8v7cAX57W1o500dLbGysTprMVVGdK5E0MWmlQcwqH3x
 kf3Q==
X-Gm-Message-State: AOAM530lzx5MLzY+jbneW2y0PZoUdhAvyrrbst7V5GM2KYaSPDk1JTwA
 69U3v7JO8+Bshuu4b39b2Q==
X-Google-Smtp-Source: ABdhPJw/6diNBVLIYytdwfhMkFQV2NjjkvrdG6vZhAGOx4lsjHNVmh8FJMnbdxqi/bQhWoncrY6V0A==
X-Received: by 2002:a17:902:d210:b029:da:578f:741 with SMTP id
 t16-20020a170902d210b02900da578f0741mr11311326ply.82.1606718305406; 
 Sun, 29 Nov 2020 22:38:25 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id f15sm2692399pju.49.2020.11.29.22.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 22:38:24 -0800 (PST)
Date: Mon, 30 Nov 2020 01:38:05 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug()
 in fbcon
Message-ID: <20201130063805.GA21500@PWN>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-3-sam@ravnborg.org>
 <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
 <fe2a56cd-10bd-962c-4f65-96c23a78cdd7@i-love.sakura.ne.jp>
 <20201129111836.GA1094053@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201129111836.GA1094053@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Sun, Nov 29, 2020 at 12:18:36PM +0100, Sam Ravnborg wrote:
> On Sun, Nov 29, 2020 at 07:28:08PM +0900, Tetsuo Handa wrote:
> > But replacing printk(KERN_DEBUG) with pr_debug() prevents __func__ from being printed
> > when FBCONDEBUG is defined. Is such change what the author of this module expects?
> 
> When someone goes and enable DEBUG for fbcon they are also able to
> recognize the logging, so the printing of the function name is redundant
> in this case.
> 
> There is likely limited to no use for these few logging entries, but if
> they should be dropped then I expect Peilin Ye to do so as he is the
> only one doing active maintenance of fbcon lately.

Sure, I will take another look at them. Also sorry for the delay in that
printk() -> dev_*() patch you suggested, overwhelmed by some other
things this week. Sometimes fbcon.c accesses dev structs in a pretty
weird way (e.g. registered_fb[con2fb_map[vc->vc_num]]->dev), I will get
back to it when I understand this better.

Thanks,
Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
