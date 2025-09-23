Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C07B94FDE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 10:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9229910E58F;
	Tue, 23 Sep 2025 08:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oK9I3gSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9B110E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:29:31 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso2983491f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758616170; x=1759220970; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4H3efbdSwxqDOTY4ewV+hCqf/E/cTKwJvAAgRINhHQ=;
 b=oK9I3gSpLE3gjhsdvu7sNhUpXJCjpK9Vp+PNtu7T2lIDTJJRKQmnILJl1BTX7/noCo
 EuEkoGJ7m8RAA7vhrueNJ9ISLI7TbyTQ3hW/D2t8cZYUVb2Xh5H0r2Q237IU7XMxGL0c
 BqQnETbwXuNPmVjXepoTZ2uFC7imG3hhNhUH3zdqS5CxXbjRSCDfQs/LEYPoYZYTydAI
 8QSOUpjeY2mzTRDW/d98Q+uMdw7LF+dr9McWbU+mOZZmfpJ1DTIcaOKbPC0C1OwECV/D
 +2SKozI7O46gRMlKfvbXOlM7Pfne2JKe61eI8B/uaAHSNn3ideFm5JHUteGThULqXLYE
 2dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758616170; x=1759220970;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4H3efbdSwxqDOTY4ewV+hCqf/E/cTKwJvAAgRINhHQ=;
 b=JpOqkmARzq+YB5E5LDcFfoIpFTmvRX4qrPwljvW4b/+ysBGZY+MaProIUEj/zreGgq
 w3ctUfTOlIPkp+O+rf0LdxySIayGEnOrK46Kq1q2IKpZLIE0mRXx/T2sKfF992/1MR9t
 8DJjaUIa6OlEC/EaisVSOmJ2jZkMVn3TSaUF2ReC28RHNEkGZ3P3vhfu5PPURcqIZ9y+
 Hd60OsKeeXEU2skvLuHc/rRc8igZ5l9awvdawgWjzpQ4jQlYvF3b7tl5clrfdAyIpcRn
 /QhAEGx+4AJFQ7FFd/gIW3F6s7b/vHrOhhpQYwvkpGbgnditcDus8iCBx92SPk9VGtfq
 Ph9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEqGY+AkaebFYW94ckPtmIq4ua4KYOXawiM5GvW0qPFnmbgJn88SyTOTswc7ZJQpjwEC875FxKkkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8fS83UlAaBl2WDFKLwS8reiMwT6boV2zyOpyRWJ0lJx4ffjf1
 CSOssAr2Fe0n5gM3MjlKYNtLSXhaVU1vhLldiJIuejwui9DY1NJTmyCR1H1yc5k2YgA=
X-Gm-Gg: ASbGnctmlwEnglJK05W3GwpaomDpaqU1HKmQ/TJj/TfXU9WtWZoHF6RkCzj4tggUzN4
 0XBW4tP8N5ydVUIfp47s27CueED9CSl2x+LoQtWEqRwwReXzkD6G+VdJ7SI8kNuC8UE2sCVknMv
 s/KKlGVUA064kWeS+BPNn9qLrKitl4/fs2B0LaNyLOemyAJsZdraMj3i2nqeoV6uhTeZ/NXhB+u
 3Z8XI6EuiUiGJaPfiieYIX8JDAiGH+XZPABqRluJ48++mVmEGYc3h8gZqyfYAynDCxSA8TFxBMG
 2AHfwxcbnLXAtX5jQuGhmbFuCwoKNIUSybo7TBSE+vA2y+APJNQOyInmpMwOQ//HvpluSiCidnT
 2p5BXgOUQLGBMTH2AZ/1XbQsikGqd8HaeQeyHGzI=
X-Google-Smtp-Source: AGHT+IHsvSUzwkgJMr2fuGf+beelXF7ViUccT9vVETmtAg6567gvGPlf85mOeUM7tJRvmp045Lmkcg==
X-Received: by 2002:a05:6000:310f:b0:400:6e06:e0ae with SMTP id
 ffacd0b85a97d-405cb5d27d8mr1308843f8f.47.1758616169814; 
 Tue, 23 Sep 2025 01:29:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3ee0fbfedd6sm23425761f8f.60.2025.09.23.01.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 01:29:29 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:29:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 lkp@intel.com, oe-kbuild@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/gud: fix accidentally deleted IS_ERR() check
Message-ID: <aNJaZldQsfTtOBa5@stanley.mountain>
References: <20250922173836.5608-1-rubenru09.ref@aol.com>
 <20250922173836.5608-1-rubenru09@aol.com>
 <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e2ce0c-0aed-41b6-9856-acf62f60551b@suse.de>
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

On Tue, Sep 23, 2025 at 09:57:11AM +0200, Thomas Zimmermann wrote:
> -:15: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately
> followed by Closes: with a URL to the report
> #15:
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> 

I've been meaning to add a lkp@intel.com exception to that rule in
checkpatch...  :/

regards,
dan carpenter

