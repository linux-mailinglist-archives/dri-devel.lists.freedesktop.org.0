Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AD5A66A6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 16:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3641E10E105;
	Tue, 30 Aug 2022 14:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24CC10E105
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 14:51:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v16so11834131wrm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc;
 bh=Mu2WuN1UBLVgxsG5PQfNNp6YWfgQO7bTyIokirnc4Lc=;
 b=ZIoSsk14sjaGoG8r1ZCCUrsZ/xGHcf15KxEkmp/WBogpg++WrEi0y6frFFvYTnCSzJ
 barG5SjMlCxZolK9GOALGfNDeEp+KTk1YcxPaBjVBbr/kSJgC0GxTI8ZJhdXYG3+I1U0
 GUIbqvFkvv17K5S5bSmZLmFwK17pZeEgfHPTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc;
 bh=Mu2WuN1UBLVgxsG5PQfNNp6YWfgQO7bTyIokirnc4Lc=;
 b=WI2vknB6QPdGlRqYx5xV0tR9fQiYQCWZlwByaUeKMWJ/zlCUox+MT6skBvUklUx0Kh
 KglmlR3ubCNoZQFsaNm9a/CLvEM9euGSVDVOpu1Hjw3IRlo+p1HjXX8qSZeqIdn3iQnK
 dG2s6xJXFtrcLLZ+cVGyUoohowX5T89ugHkvmIp0gT059gF8V5ofxTNb3gO0uGmTXJMs
 5p1LFMIw8T6VElYij2BJuGvZJ0Rvrib77ITeYgYHUa4cMMFk566rHQ0WYLskPMZMOH11
 8bN0aaod03Li4K6OnSLamXTJLmiWG5sAaMFJ6vIP19VCN4JnBByAidbaKXn7V6nSJXEl
 2bNw==
X-Gm-Message-State: ACgBeo24RJeZTfxY3D2py5r9TEUbHjpcsZED6SFItcvrkpIPtDpzBtg+
 mo6tiLVeuzckkPv9NHEhyW3dug==
X-Google-Smtp-Source: AA6agR6cYSwvnY+wIA5clnVjqWa7b0Lv7yqs8VdXHj0BT3qDJbv/UWSK3xDfakNtYnq9enHsl2kgJw==
X-Received: by 2002:adf:eb10:0:b0:225:70d5:e994 with SMTP id
 s16-20020adfeb10000000b0022570d5e994mr9046215wrn.425.1661871092386; 
 Tue, 30 Aug 2022 07:51:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z14-20020adfd0ce000000b002253fd19a6asm11557392wrh.18.2022.08.30.07.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 07:51:31 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:51:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tty/vt: Remove printable variable
Message-ID: <Yw4j8Vs+Kx7ftaWX@phenom.ffwll.local>
Mail-Followup-To: LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 nick black <dankamongmen@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Yangxi Xiang <xyangxi5@gmail.com>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>
References: <20220830132803.403744-1-daniel.vetter@ffwll.ch>
 <20220830134117.416003-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830134117.416003-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: Yangxi Xiang <xyangxi5@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Xuezhi Zhang <zhangxuezhi1@coolpad.com>, nick black <dankamongmen@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 03:41:17PM +0200, Daniel Vetter wrote:
> Every since the 0.99.7A release when console_register() was introduced
> it's become impossible to call vt_console_print (called
> console_print() back then still) directly. Which means the
> initialization issue this variable protected against is no more.
> 
> Give it a send off with style and let it rest in peace.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: nick black <dankamongmen@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Yangxi Xiang <xyangxi5@gmail.com>
> Cc: Xuezhi Zhang <zhangxuezhi1@coolpad.com>

Please disregard this, sent it accidentally instead of v2 of "tty/vt: Add
console_lock check to vt_console_print()".
-Daniel

> ---
>  drivers/tty/vt/vt.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index ae9c926acd6f..4d29e4a17db7 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -157,7 +157,6 @@ static void set_palette(struct vc_data *vc);
>  
>  #define vt_get_kmsg_redirect() vt_kmsg_redirect(-1)
>  
> -static int printable;		/* Is console ready for printing? */
>  int default_utf8 = true;
>  module_param(default_utf8, int, S_IRUGO | S_IWUSR);
>  int global_cursor_default = -1;
> @@ -3085,8 +3084,6 @@ static void vt_console_print(struct console *co, const char *b, unsigned count)
>  	int kmsg_console;
>  
>  	/* console busy or not yet initialized */
> -	if (!printable)
> -		return;
>  	if (!spin_trylock(&printing_lock))
>  		return;
>  
> @@ -3537,7 +3534,6 @@ static int __init con_init(void)
>  	pr_info("Console: %s %s %dx%d\n",
>  		vc->vc_can_do_color ? "colour" : "mono",
>  		display_desc, vc->vc_cols, vc->vc_rows);
> -	printable = 1;
>  
>  	console_unlock();
>  
> -- 
> 2.37.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
