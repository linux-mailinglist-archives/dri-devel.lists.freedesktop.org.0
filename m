Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B485AEF99
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A678C10E04D;
	Tue,  6 Sep 2022 15:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECEF10E04D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 15:59:50 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso9917428wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=jA2IQHHMaFldBSM4/bundv/Eq7jbKvYhPDu/CYs+BIA=;
 b=bRqQ8iZ22SMbm8bwPTWjuMyrSo81qe7+2UUim0fjAn1T1llE12n1XoxMVqjG74J5gk
 zGweAhIbQ+qd3iv1jKO9gHsgjnJtD+Qgbj5gUQ4F34yUQFrD5pbQrjqABUpDz7D1obwj
 uNKXZezHnp7Hm9iQDtLrFzOyFY9zIFPjo/Ouo2xw4qPSvoFdi3P+FNZldCvanMNUNUfK
 HJ4f3bFOhcg0RYujYgsAtUcp1QBK64mOlePQGmf+E3Xk2OcvEBPSQYpi9NhTmVyOYK9w
 S0S0RHv05StXiq8A1FHA7mHskdYw2ucgKLzLmmmSQK+yN/4D2Gbo4tDnKdrrts1t6rCS
 34Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jA2IQHHMaFldBSM4/bundv/Eq7jbKvYhPDu/CYs+BIA=;
 b=Awu4W4oRXzUrUFc12KBqzKhIUsG7hwDelphTTO6OUKPVWnIyqz2SUsHbK3/YZo5b0I
 B+gX92lVPrIH954Ng7ISp4XAAlOSvF5PJ+EvP3xHbWddKBfrPFCzCV+XQo8+swb47j/0
 49t8dxVchkFuIde1yCzT4j6txj+IR0QMYtBMQERZpCUklhE+GA2/AvLpJC148+T7MlrL
 hFAmOL0PB+zib9FR8H3ZILFht/mLzrMbaQ9VRwLhmJlXgMgTk41rz1r2iLV1VkJwpN79
 YWrSpuljDL2+Q5c6Qs0zXzCRwts/at0SjeXy3gqnOYlOTQ7LXecwkIl4l70PegfGkifh
 RZHQ==
X-Gm-Message-State: ACgBeo0N1UNlDmYqqwu9Cc0UMkakxz4f3fCByYU72W+syhfts2rMo9Hi
 dx1dbhzO5Y4wJB1T73+O1aQ=
X-Google-Smtp-Source: AA6agR6jH4Rk+Gk+VBXvjus6DqzaBo8vlayw4Wv8+MoRZTHigH745wno+BTD4FW4NE09uKuQcZ/g2Q==
X-Received: by 2002:a05:600c:34c5:b0:3a5:fd9d:7b2b with SMTP id
 d5-20020a05600c34c500b003a5fd9d7b2bmr14256505wmq.1.1662479988571; 
 Tue, 06 Sep 2022 08:59:48 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c4f8f00b003adf0ae0048sm12150346wmq.45.2022.09.06.08.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:59:48 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:59:46 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: build failure of next-20220906 for vkms
Message-ID: <YxducgSzR6/zyHD7@debian>
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The builds of next-20220906 fails for mips, xtensa and arm allmodconfig.

The errors in mips and xtensa are:

ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!

The error in arm is:

ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!
ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/vkms/vkms.ko] undefined!


Trying to do a git bisect to find out the offending commit.

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip

