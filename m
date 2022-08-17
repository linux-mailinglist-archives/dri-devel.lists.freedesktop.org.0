Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AFA59796A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 00:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45ACAD34B;
	Wed, 17 Aug 2022 22:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED75AD33E;
 Wed, 17 Aug 2022 22:02:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r16so8446844wrm.6;
 Wed, 17 Aug 2022 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=+rVwhS/v1efZjV9JaiQiNDDadLmE+6Njk1w34Ca9k3s=;
 b=XC0F6SDky0pcb1VFOdnxjJvPeVSDKqiNxcXX088bL9G9xhMK1RUTYCqAdWvq8uuuUY
 qYkeK9LRsDtuzj5t4FY+QSB+qq8qJ9XUEgRXU8MjsnJwAJo7M31TvvIeDkPDMjLpwyTr
 VLXnUD5T2htBN8gJPoLRHTzm5lVliCxJEKXY+K3E1oKsx/UzO/6kO1oD7DvAk8Rpmx5I
 jrrTHZI0lAo0s/iLg5hs5GnG1hFaWe0mQ59DkZFNQCQ6gYGgS/nj6liT8LGHSNitNQnL
 /6Ueqdr6iYCTreaneR32mEgIh+nLmdXMHoU1Zz2ZG2fCcESArQhPQVhVuYOCH6QGwmi+
 6ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=+rVwhS/v1efZjV9JaiQiNDDadLmE+6Njk1w34Ca9k3s=;
 b=FM3gkQiwprZXaOzR8Ircc/KJGh5/UMEhjzHKbz1M0Tij9Xyk5t4+maGsngMALDRsSq
 SonSA/rZT2sIT5qr7Y37xQ1Q+6tkb+otXKEdbxNpupmbmlJu+F2fnspf0RYzBa5XQa+o
 qZudRXdXl62AHt4CM6amV1C/Abpf4nl5ugF3vMxcRVw7dsZWQ+luTf2qMwxWR+zrRR9N
 i15Zdq2IoMK55d2G0V/z015xT4jNyFpMjda15X7nJ4g7RG5dwxCRTLgQqrK8sIU3MNYb
 7k1Q4s//530jSPfPxeckHv+bVbtNXuiKvXZcKrK6LZk4dp+bSO/A4FBtw1FvZ7Za9fyb
 Jzaw==
X-Gm-Message-State: ACgBeo3vYOUlLkEr1H8CHC5oSyE1bawYKDKCJTudPFkhg/vXdOJcESVH
 I4/Waiwof3N7N015GfukcHM=
X-Google-Smtp-Source: AA6agR5cCdcYKHWI60JmXEIFfCQFOyocwmx57gVltGNwUl1UoanmElTicNY+iUpwS8YjycA/T/nesA==
X-Received: by 2002:a5d:4752:0:b0:225:1fb1:862f with SMTP id
 o18-20020a5d4752000000b002251fb1862fmr40442wrs.458.1660773757262; 
 Wed, 17 Aug 2022 15:02:37 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
 by smtp.gmail.com with ESMTPSA id
 n189-20020a1ca4c6000000b003a540fef440sm3666767wme.1.2022.08.17.15.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 15:02:36 -0700 (PDT)
Date: Wed, 17 Aug 2022 23:02:34 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: build failure of next-20220817 for amdgpu
Message-ID: <Yv1lepjhg/6QKyQl@debian>
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
Cc: linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Not sure if it has been reported, build of next-20220817 fails with the
error:

ERROR: modpost: "cpu_smallcore_map" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Trying to do a git bisect to find out the offending commit.

I will be happy to test any patch or provide any extra log if needed.


--
Regards
Sudip
