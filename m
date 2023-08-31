Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B8478F2E3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 20:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882BF10E1A4;
	Thu, 31 Aug 2023 18:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999C210E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 18:48:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401ec23be82so12076185e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693507703; x=1694112503; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ahmrOVqwwJFu3WxpSfgce+G5opjA33YS4PMyyXAd7ms=;
 b=bv81uogQNH7Dq0nQR7QrIAxKReov9GZlr7CtyxwT605HgIbY6dxK01bLLsh9H1ZhKA
 Gxz6xNL4eFNpqNOzVh6ZAHxHHii5sLSMMDBJ+TMlsi9oWd8WZkkmceCYPlwYTio8+ahb
 Ly9HFqiPH0ROtPAiIjVB2HkXMZBb7IYQenQG9pQZQdKilGwyWfJEIdV75IQYSaJoTnqP
 rF995vbN3+OPN6rQGpheBbe1dxN6o5swELQU7eZo+C7K3BjF1Fdh0BUP8bfG5V0jc8GC
 gGtSsnSJySa/n2rJe886GNpoaS0ygOzQHGwdN6r/nF4d0qKdu7+tZd+uYFamHlCPqDSQ
 7TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693507703; x=1694112503;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ahmrOVqwwJFu3WxpSfgce+G5opjA33YS4PMyyXAd7ms=;
 b=h6vs5NC1gBWQzGnZCN+zhgzXy50nmrA7UaDgO6IxXVn/s2AkC5cgoVdExBntl73kUI
 F45v3UYRMjeUZ3bCRdho2IoIgMQQrdDZzYHRdh25wdm6t1HV7R8iN17xgOcvsBnld2+4
 rDAXax6jyHTdzowilhRpu4aPupYGfFm2wtkdojIoo/9WZklj7VcK4tHzUGyMVdigzFqk
 /norx9E4D/XXcHImr3CBZL5onem1vNArKVko0aoYqAm8/s+VEDXQtb5uYsQ5YqPxI1Wi
 TfvXWju2KeT73u3QRj3aKrCSeiUtYbid75S85a12rCYC7Sq9bxWE/5FiDk75MqlZiu5x
 ixCA==
X-Gm-Message-State: AOJu0Yw/OC7PnlviIFMeQzhELVws5qQJ2Fu7dBQw47+uIXFLv5l2LFKR
 kAlw+v78GVvlm5h35XPlezY=
X-Google-Smtp-Source: AGHT+IGfZb8579Yjvtnal5tdT/GYaF1cGdV5xTKFKo1tpdq7EudzAt4mbBHbPvzHbNAvuygNNe1mGQ==
X-Received: by 2002:a1c:7911:0:b0:401:4542:5edf with SMTP id
 l17-20020a1c7911000000b0040145425edfmr181282wme.0.1693507702525; 
 Thu, 31 Aug 2023 11:48:22 -0700 (PDT)
Received: from debian ([63.135.72.41]) by smtp.gmail.com with ESMTPSA id
 o24-20020a05600c379800b003fed70fb09dsm2745829wmr.26.2023.08.31.11.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 11:48:22 -0700 (PDT)
Date: Thu, 31 Aug 2023 19:48:20 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Subject: mainline build failure due to 501126083855 ("fbdev/g364fb: Use fbdev
 I/O helpers")
Message-ID: <ZPDgdGBbxrTl+m2s@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The latest mainline kernel branch fails to build mips jazz_defconfig with
the error:

drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
  115 |         FB_DEFAULT_IOMEM_HELPERS,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
      |         FB_DEFAULT_IOMEM_OPS


git bisect pointed to 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers").

Reverting the commit has fixed the build failure.

I will be happy to test any patch or provide any extra log if needed.

#regzbot introduced: 5011260838551cefbf23d60b48c3243b6d5530a2

-- 
Regards
Sudip
