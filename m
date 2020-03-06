Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C817BAA0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77956E44D;
	Fri,  6 Mar 2020 10:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0596E44D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:41:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u9so1822470wml.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 02:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1wu7CnjB7LWUSgWKY+oPfgF8Ae17D76/Awvhld15JQ=;
 b=FTZpPoySb6SE3kKbyRE9Qqor+wYAfHak7cRwmcekJSuCp2naplvU8zddhGgy0ZmJJh
 ELzBeWVQR8wxQU/CKCEPWE2XNsXl2fKHM6PeW8CPzF1A10dl/2ga/rRwE6tHOR3V8rMo
 eDxC51Gi0HEO/6tjDSkLi261T45zwOcJ5J64M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=c1wu7CnjB7LWUSgWKY+oPfgF8Ae17D76/Awvhld15JQ=;
 b=J5GVhewJRYPCqL9hDN0Cc7RPfSz0GDFze2seUwZ5VUKZuJjGQ7/wTFjvZDu+KsNESx
 rh9zDaKRhoMYQKPYjcRrXC1X7FuZSG+RggRcE6wJlIg6EufbUwNi5xUOux2TilfUbAl+
 elzilm0pv04Jj662vMt59Yi5qlDM0TZMljVJi8l05hZIAFFL28ikdOvgY+b8mNTFVykk
 kJ2J+AcDmgO2Oowh/EWG3uXwyi+4G1An4T021fV9D4LTQjGYOOWua5Kk1wM1afzUkI4d
 4t0JD3M/+B/yQ6TFRHn3vEBe6BOcfgbZeDFyYNt4cdlAq7glgM7By/Qdl39O3qui1P0O
 WIfg==
X-Gm-Message-State: ANhLgQ072NWnuPqU0s8U5xSG0/0+bqBtCt0RdLnNg7zZBpbS41g/ZiZm
 GGc92iIq8YTf0fSWqneh5nBsDg==
X-Google-Smtp-Source: ADFU+vvBTIMi9t1dx9pJC/4HMs9ttoNP7F6u7t1F9V0/9Qx4SEFsHfDu62Y7oZtF2ryRxPNB6eQ90A==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr3529887wma.177.1583491280746; 
 Fri, 06 Mar 2020 02:41:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w8sm14588716wmm.0.2020.03.06.02.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:41:20 -0800 (PST)
Date: Fri, 6 Mar 2020 11:41:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH][next] drm/vboxvideo/vboxvideo.h: Replace zero-length
 array with flexible-array member
Message-ID: <20200306104118.GV2363188@phenom.ffwll.local>
Mail-Followup-To: Hans de Goede <hdegoede@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200305105558.GA19124@embeddedor>
 <8e2ab9a2-fb47-1d61-d09c-0510ad5ee5ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e2ab9a2-fb47-1d61-d09c-0510ad5ee5ff@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 03:22:38PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/5/20 11:55 AM, Gustavo A. R. Silva wrote:
> > The current codebase makes use of the zero-length array language
> > extension to the C90 standard, but the preferred mechanism to declare
> > variable-length types such as these ones is a flexible array member[1][2],
> > introduced in C99:
> > 
> > struct foo {
> >          int stuff;
> >          struct boo array[];
> > };
> > 
> > By making use of the mechanism above, we will get a compiler warning
> > in case the flexible array does not occur last in the structure, which
> > will help us prevent some kind of undefined behavior bugs from being
> > inadvertently introduced[3] to the codebase from now on.
> > 
> > Also, notice that, dynamic memory allocations won't be affected by
> > this change:
> > 
> > "Flexible array members have incomplete type, and so the sizeof operator
> > may not be applied. As a quirk of the original implementation of
> > zero-length arrays, sizeof evaluates to zero."[1]
> > 
> > This issue was found with the help of Coccinelle.
> > 
> > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> > [2] https://github.com/KSPP/linux/issues/21
> > [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> Patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

You're also going to push this? r-b by maintainers without any hint to
what's going to happen is always rather confusing.
-Daniel

> 
> Regards,
> 
> Hans
> 
> 
> > ---
> >   drivers/gpu/drm/vboxvideo/vboxvideo.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> > index 0592004f71aa..a5de40fe1a76 100644
> > --- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
> > +++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> > @@ -138,7 +138,7 @@ struct vbva_buffer {
> >   	u32 data_len;
> >   	/* variable size for the rest of the vbva_buffer area in VRAM. */
> > -	u8 data[0];
> > +	u8 data[];
> >   } __packed;
> >   #define VBVA_MAX_RECORD_SIZE (128 * 1024 * 1024)
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
