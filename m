Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D00606951
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 22:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACC310E31A;
	Thu, 20 Oct 2022 20:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421D310E31A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 20:05:18 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id y67so903894oiy.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3kqzNKZdLHbQGVRoA6TT9TNlPerDzkcvPk08IZ/y3eE=;
 b=QgRBMUtYjUC9XqyTURdHv/HvgeBxWTHGdNW3yw5i54E18RnwalgNO6voNRgpHVoymn
 Rr3v+cufUCg9rPyXPSJvojTtM/CbhjhFkf4uJan4qZAsWdmo+vwWf4E0VhLqOD4Nqvmk
 49y32Xj/dRz3iFsDIfbSH5a7SYH30pDd3EvLqCXwPF9sMAVsZmeLOrY8j1lPCv7PVZY0
 OvGLVk+3vk6xYGt8S1F52V8CBbZAsMNQZ9U8fBh9X5HwjPOx9lULuIugmxS9PbYI+fFE
 ZSoxAbcuwbBR81JOX2lKivhhBWvRdlh+f1WIEQp37O7v+86Ye8uIkB2BClkMpHMJq7c5
 d0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kqzNKZdLHbQGVRoA6TT9TNlPerDzkcvPk08IZ/y3eE=;
 b=GtqcA5cxsePdoki3tyDedG50MvgnjU7xDeKL/gfVRz2mUUNTOxMRdoVDJV3YHC7u6z
 xE5OUdzEnyye6D/nlB73H6oA0w94LmMTM0rvomdFmhGtkNm+mAqBG99BB4Cxvrc0Wcu0
 gDXz/slHGjz7SdaFyDuf+OQ5utGPKxsFvextb8ppH46J78H2fX9L+f/oqS/m+3YvcSBL
 vtGBZb+6njKqE7NDe1vEA8R+MtJm9oAcI5J6uuOi4tLgpCEAWml1o8+Tvu7gQa3Spvtf
 gbT4gBy7XqDXf9NdKbv40QgNUM59cVvTT0qCYYJt0w5BVXUV+4VAmevCa+Gl9GYVu2ww
 olMQ==
X-Gm-Message-State: ACrzQf2YRu2d7/GYVNhMHikWAdLEPM2lE91Iw09LhDf6DeJWvjvAnIRK
 MasjEazn59ArXBLDwXDUBcd1x8Ck40U=
X-Google-Smtp-Source: AMsMyM7u4FprY/yjd2wr8bzOxdFQJLyXzS3w3BhmoAK/ZqKp4WX7jH/89I7s++EHag0Dp5i+f7rNyw==
X-Received: by 2002:a17:90a:9381:b0:20a:79b7:766a with SMTP id
 q1-20020a17090a938100b0020a79b7766amr54627940pjo.33.1666296306582; 
 Thu, 20 Oct 2022 13:05:06 -0700 (PDT)
Received: from ubuntu ([175.124.254.119]) by smtp.gmail.com with ESMTPSA id
 z7-20020a170903018700b00172e19c2fa9sm13299061plg.9.2022.10.20.13.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 13:05:06 -0700 (PDT)
Date: Thu, 20 Oct 2022 13:05:01 -0700
From: Hyunwoo Kim <imv4bel@gmail.com>
To: ChenXiaoSong <chenxiaosong2@huawei.com>
Subject: Re: Question about patch "fbdev: smscufx: Fix use-after-free in
 ufx_ops_open()"
Message-ID: <20221020200501.GA320135@ubuntu>
References: <363cdfe4-f54d-0ce4-2f03-bcfe998deeef@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <363cdfe4-f54d-0ce4-2f03-bcfe998deeef@huawei.com>
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
Cc: steve.glendinning@shawell.net, linux-fbdev@vger.kernel.org,
 yangerkun@huawei.com, dri-devel@lists.freedesktop.org, imv4bel@gmail.com,
 "zhangxiaoxu \(A\)" <zhangxiaoxu5@huawei.com>, deller@gmx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear,


An additional patch has been submitted for the disconnect->open race condition you reported:
https://lore.kernel.org/linux-fbdev/20221020200113.GA320044@ubuntu/T/#u

Thanks for reporting.


Regards,
Hyunwoo Kim.
