Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B555B8B8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0FF113EDC;
	Mon, 27 Jun 2022 08:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7DB113ED5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:47:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n185so4924133wmn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmXxME+uNJVkVZ9trvR46NnCjeAQJKd6DY2jQBz+oPs=;
 b=La9Lq2uF++jKkxat90ApM5v9JRDARjmbUF/Au7fPkkkvrCiMZZ5uTcEFrV9/5j6Y58
 3Mo9u0GqzyUWGCEJaZNFO2UyVN9ZfXMdZouLDwxtdakiLw20DhEt567v+bBmwnzNS9ZP
 v8XFcbX8wbDKhg0jT+VtFORSrK0cSdCsOzeV1+rWP50JVPLtHEVgw3kgckcsUCm0io4k
 FVhQJ7N4l7GrwM4oMuJUIXTzXwNNQzKLXQpCZjhHSi4u9TGB95jook1mUJTYAy8pFTZm
 9pkXAmJSwEQElsVU6YcAdPLTOXnPafLuLHWgcJeq3Kwl/HvKrXZdVMy6ad8KoiprHxCP
 PdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LmXxME+uNJVkVZ9trvR46NnCjeAQJKd6DY2jQBz+oPs=;
 b=w5T3HXStiVYd7eH5mE+OPlRV8BvIzxt5HhiZVtAFR4HPN04MxMDfOlycJcoGXYdGB0
 pXfkYDwOxabQMmT3okeijYtgyL9cxDGTMX7E29/sIHonE92LrE4ZT/mY037opIEFpjiv
 ktS62lefiY2W2opWk/XlYDYkznIwt0aC19eF7rFvAjrz4KqFPnYZojJhVfd8N8awIJ0k
 llWH6fDlcyBWuJVAOhwxnzobbhQ/YWgz+lhlEh2+AnjZSG821AM5iFV7xLwlKX/yHs2n
 liPZ8hdQRfRhU52+8nxF//isflNp1spttajeFjilszhGNUHi1qEDAGjPAfzKuo2Q57j5
 kMKA==
X-Gm-Message-State: AJIora+2xazYzBNlUXu/K7RxeMHRdmYHH981jPwJu01QpsbsCDqBNZai
 xUfh9Tv1vmr3A+rxbFw97XU=
X-Google-Smtp-Source: AGRyM1uK0Mhl+GMgWCOO6FsR4TsSV1dv4xOGrbwt6BBS+fdtO5VrxRrEI9Feo4JvCBKqp8pvqDG+ZQ==
X-Received: by 2002:a05:600c:1589:b0:3a0:2da9:bac0 with SMTP id
 r9-20020a05600c158900b003a02da9bac0mr18754522wmf.178.1656319655747; 
 Mon, 27 Jun 2022 01:47:35 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05600c2d0c00b003a04a9504b0sm2660010wmf.40.2022.06.27.01.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 01:47:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: maxime@cerno.tech
Subject: Re:[PATCH] drm/vc4: perfmon: Fix variable dereferenced before check
Date: Mon, 27 Jun 2022 10:47:03 +0200
Message-Id: <20220627084703.230986-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622080243.22119-1-maxime@cerno.tech>
References: <20220622080243.22119-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: lkp@intel.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 daniel.vetter@intel.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard wrote:
> Commit 30f8c74ca9b7 ("drm/vc4: Warn if some v3d code is run on BCM2711")
> introduced a check in vc4_perfmon_get() that dereferences a pointer before
> we checked whether that pointer is valid or not.
>
> Let's rework that function a bit to do things in the proper order.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 30f8c74ca9b7 ("drm/vc4: Warn if some v3d code is run on BCM2711")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

I was about to send the same patch because Coverity reported this issue
today, but you already found and fixed it :D

Best wishes,
José Expósito

