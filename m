Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A593389E238
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 20:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D70112EA3;
	Tue,  9 Apr 2024 18:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4aJkEQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB76112EA3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 18:11:04 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e3cf5b171eso31169085ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712686264; x=1713291064; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
 b=G4aJkEQSnP8LOPb11oCdwq0Lcq5+JQMG8JLVjupbKCrrcPJEs7btU/37rtGJ51DzmF
 N4tMz8uCt5zT2xS0B4PNzgHTDOjIaBZk+pp57Hi8TiN0fe1q0ahYL4pRlTXz9u9Lwct4
 wUlw0R1UQWuL2yWJrpMiiTNH+hhOI0E3z+q5fItWFs3z1Pse7yz3u9Qcrr8Lb/SdnvyL
 bHgW0li0qnM0/O2GV3Zw+zJxJLgQAH3kZHdDCYo+FvwoLpZ3FVVYZ48BATC8X3H+gXSC
 Pj/1sUEGEwVnW8RiwllGLqZ0YIKK8VbyNvGsC3PBhOI6afaM7WkFcNzhdmiFNRBb2ZnY
 fB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712686264; x=1713291064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9dSAKFdynyhKujjaxO9n/FtMdq9OcS8F/T8JeifJ1k=;
 b=TTt61FyFlcW/ywhl8nFMkbDDj6qniaqgtQ4HOsB51216cjP4K1sKcyleecuF6vxteq
 qqKywePWQf6AReT/sRY4oxpqJJGoTZuNqjwmqiwu+FESfWWmnV/ozoGsHTFo5AwUcTPh
 IpyCwtt/hWg/E8N88tYM6cy2OSaZ1QNNpcY2BabaHJqbvAxrvTm5Q5dTS+7K/Ln9/pee
 c7GGjeaoyO1T0lSTPrx/v3+3c6/leryyKs9Qclk88gcnMJLJidoFtP7DsKA+zODDOhNY
 F0ccyFG70KWsD8XVB6TEwWL7aepUUHEvqY6U00AJFfStEQ2D96UjibKqPydDGzVX2IA8
 HpUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU74leV6M5EBYDA5iGLjKj1wc6JNFWYHx/CwhI5hrSeiOf1xpfKvSlKxlfjyi0+a6dSfpBOi7vkYLO3Byem6EB7OS5zJrS++Btx68CY5n6t
X-Gm-Message-State: AOJu0YwatSkGATue+TBQLoHZQjnUvSyZ97whK9aJm5WaWcfrDt6j8o7b
 0QSA8pCM2PUU0aQ15TZUw3dm/ZVMBs6GmKLIDe85SXzH/hIpa0+X
X-Google-Smtp-Source: AGHT+IGrjPVdFECKS3becNGGDDo38peM0R3uLnfzfKLi+hNrIYGQpqn6EkGBto25qlTyktqlNq6njg==
X-Received: by 2002:a17:902:82c8:b0:1e2:3e1e:3d9 with SMTP id
 u8-20020a17090282c800b001e23e1e03d9mr529751plz.63.1712686263974; 
 Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a170902f25200b001e256cb48f7sm9195770plc.197.2024.04.09.11.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 11:11:03 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:11:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: David Gow <davidgow@google.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v3 03/15] kunit: Add test cases for backtrace warning
 suppression
Message-ID: <aad25d52-83ed-492f-9d56-71d26895173b@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-4-linux@roeck-us.net>
 <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
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

On Tue, Apr 09, 2024 at 04:29:42PM +0800, David Gow wrote:
> > +ifeq ($(CCONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
> 
> s/CCONFIG_/CONFIG_/ ?
> 
> 
Odd, I know I tested this (and it still works ;-).
The additional "C" must have slipped in at some point.
Thanks for noticing!

Guenter
