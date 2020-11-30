Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A212C8049
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C446F6E413;
	Mon, 30 Nov 2020 08:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2886E413
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:52:25 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x15so6119847pll.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 00:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F8gz64bKeAs0YPQcvkE/rBDqMgLpfaqaTi1XhXTLQ84=;
 b=gd5iuX+jRxP4x+a3Aam2vFbCg949ZJHRAnNoi5327NZzkt5D1cRISvVsv/k4XLNaRj
 5SItMyMDnr3qU2lMLPaX+r4uBxnkfAOHv18hubuUjltGrMGWNJjv58RBwcvgZ9lqj49X
 0R5N4oZ/uppMATZCj+K9YZ2RKsm+19JbLCerk0DrAIDFdAEu+iC8Ct9SBNKuqnXGkMcQ
 ijc9+/d+/01V9aMObVbycymKGK6a9Aa/fJOxGrg69+DVX8T15m3DxPq03KyNZFfEFdre
 2GaEPASE/t7+X0UAZ76cqKOr4IFswvSvUhOoLHKv7m9jTULEpjW7iq5Z0x7rosSS7cOQ
 26qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F8gz64bKeAs0YPQcvkE/rBDqMgLpfaqaTi1XhXTLQ84=;
 b=OfwevkhTAxnChn6yzR9/QCAnUE1f+QBSIMDyVjLzEp+BviyDrbHfnWwkjf9ydzKxLN
 Js5SDzsEKFXWROMzJjIfM4EWVNB/ago9oyg/eSvms0Ek4JHzu+2PB2PQ0AbnUsNdCxa2
 zOrxGTTzDm1y5wpxwg5ejlQxjdyy/kcMBMHS7DmRwCcaKDd0D9Us69UPBT4OzrTiVYcg
 iv7CVmNl5W2yQAa2DjFMpoN0uImAIHwVyTaqKXD+BP2pEdZjgV2EXPPgjdjKFlhCCtkq
 sL7eD0o7RLbYh1l9nukFhygrJ+4ThueWZHpG1AzS9DkSKaFkwOGFuaomhp8lKTRp6mbT
 ejfg==
X-Gm-Message-State: AOAM530hexFwj0T63on2OpPY0JcIuN99QTbJ3lFPGtJf1wVqi0XprV+i
 GLaOQXZzZDLpKiXmcj5zBQ==
X-Google-Smtp-Source: ABdhPJzaha/Dgv2Z2ggaTX+gmjsC/KIZh/3xdpYPWiuzeGkIJCP+avDy0nS4pqqvyehL7W1JY4U+3A==
X-Received: by 2002:a17:902:8212:b029:d9:d097:f9d5 with SMTP id
 x18-20020a1709028212b02900d9d097f9d5mr17756174pln.34.1606726345541; 
 Mon, 30 Nov 2020 00:52:25 -0800 (PST)
Received: from PWN (59-125-13-244.HINET-IP.hinet.net. [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id g31sm14652145pgl.34.2020.11.30.00.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 00:52:24 -0800 (PST)
Date: Mon, 30 Nov 2020 03:52:07 -0500
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug()
 in fbcon
Message-ID: <20201130085207.GA22647@PWN>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-3-sam@ravnborg.org>
 <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
 <fe2a56cd-10bd-962c-4f65-96c23a78cdd7@i-love.sakura.ne.jp>
 <20201129111836.GA1094053@ravnborg.org>
 <20201130063805.GA21500@PWN>
 <20201130075645.GA1442147@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130075645.GA1442147@ravnborg.org>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Jiri Slaby <jirislaby@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 08:56:45AM +0100, Sam Ravnborg wrote:
> Please just keep up the good work cleaning up fbcon and related stuff.
> This is an area that needs some love and care and there is work for many
> long nights yet to do.

Thanks! I will see what I can do,

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
