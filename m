Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60D57582E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 01:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E609410FA7E;
	Thu, 14 Jul 2022 23:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0456210FA7E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 23:51:40 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id v21so1794181plo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 16:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WQOJ87cxhZVY+IyP6bEM7D5o/BRipLCrV6YOLHFhk1w=;
 b=IIMJ1246IIPKa4Fs/STJlOe4IyjgfiAckNmuhbjPtUIO1nj4eRzEmX0f/jDfkBJXM5
 r7E6CEGq5UqqbXoicOFChB8yFFa9MNdXKs7zON/jTEW7lvcVeAw4lQh/X1oRNTLeQzSW
 Wsf7d0XV+lcxH2oeQGXCXj4bOx+fHApevwf7BSbDKrVPLASQSRFeINMBHfI6T7lo1gwD
 tn8dxzX14KsS14Mo97QiTwIdJLrPCkzw1VC745ROPwvcond6xyH40n5ReE4NADUTbAse
 vAxo+f7u3jJ1gmPb2xJ/fw+RBT9GxVsEaPE/2hDyyg1iH/EhZ9g2L/pG4qg7HtaVF1gd
 0CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=WQOJ87cxhZVY+IyP6bEM7D5o/BRipLCrV6YOLHFhk1w=;
 b=i16ZsVhRdBAp37S1FRJQIVfXAVoQC0TahvH4FULxlkF3I7RljmJB+S92FNKjfIAl7J
 YlyuzsT86E07OMdfEqvXzr+TNzyo1slKL036uMJW6pXBLGtQ5Znp7jPp/fkccR6I7B7e
 ja3ExFoz6pa1vfyqc2Lv+l814kcMzjk4JbhPt1yJp5WySBTZt6mnFSt4iUYfEuJ3jS07
 T7UOPpYgpakKHz8fSFloOfDRe+ZvQ/5zCSMKsvFLWoOSRq+Zw5+2hjrcwzlIQfxJ4CmL
 CpZlVUMrfpXO+By6XyGEQEMjzGg0hXGTqNZ0n25XS2+5t/HUXyH+eeBf3RGp0vULileK
 P05w==
X-Gm-Message-State: AJIora8rj3um1wYEWT8H2C1nYTGCwgKCKeqrqXT3aVyILaTbeRwnt16P
 RLjtjBJS1ti3x5o1sMe5/zE=
X-Google-Smtp-Source: AGRyM1teLs417YHFJ/t2owHCD+vGs4Qr7DfmKbJT20i1kDWBwhWfbe5Bg5RlLbs0eGYr/5Q7QmTJjA==
X-Received: by 2002:a17:90b:19d3:b0:1f0:addf:8ff4 with SMTP id
 nm19-20020a17090b19d300b001f0addf8ff4mr8732227pjb.191.1657842700547; 
 Thu, 14 Jul 2022 16:51:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a6549c3000000b00411acdb1625sm1857442pgs.92.2022.07.14.16.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 16:51:38 -0700 (PDT)
Date: Thu, 14 Jul 2022 16:51:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
Subject: Re: [PATCH v5 4/9] drm: selftest: convert drm_format selftest to KUnit
Message-ID: <20220714235137.GA485839@roeck-us.net>
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-5-maira.canal@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708203052.236290-5-maira.canal@usp.br>
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
Cc: siqueirajordao@riseup.net, David Airlie <airlied@linux.ie>,
 Daniel Latypov <dlatypov@google.com>, brendanhiggins@google.com,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 n@nfraprado.net, Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 michal.winiarski@intel.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 05:30:47PM -0300, Maíra Canal wrote:
> Considering the current adoption of the KUnit framework, convert the
> DRM format selftest to the KUnit API.
> 
> Tested-by: David Gow <davidgow@google.com>
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Maíra Canal <maira.canal@usp.br>

This patch results in:

Building powerpc:allmodconfig ... failed
--------------
Error log:
drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of 3712 bytes is larger than 2048 bytes

presumably due to function nesting.

Guenter
