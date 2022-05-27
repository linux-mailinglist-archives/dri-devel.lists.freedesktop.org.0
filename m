Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838A535C3F
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 11:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27FB10EEB5;
	Fri, 27 May 2022 09:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9251C10EEB5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 09:07:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t6so5052208wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=UJBVTCBlNfR7o09N0raMnnAoU4I40RWN+o0wJzKlzU0=;
 b=WeZWffED+tMab/OrHobFFtlpXTsAMJvGbzi3dM+zScWwPiUQ7S0lF6qZBnFqwrRxxL
 hkFIA1JE/hJpYS3YK/JCqrIpSp52Tzl2HFK9/Cd7yse0iC/mH9oboIFB0exsW5o/orSw
 Bz5noAWELeLtI7Njk0G91/ssZpXG8NrTUV88kvEok1JYfKJ+yD9t44ZIKlMEQLnCPC2E
 iWUCQGwJM1PX1zra+SBu2xFnk8O0SV5BIyiOtdQKAB40lDCChWtgXGqNPqJuK3NL2Vtm
 RxzMs3+sqn0odx5EeWHyWxq2fa5boWzIHfZDn6WCls9vPW6Ub8huPRFt7SfN4XjEiLac
 kD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=UJBVTCBlNfR7o09N0raMnnAoU4I40RWN+o0wJzKlzU0=;
 b=3YWvVyfz/lfoeANeRcmZ3+isrCeCR1lhVCyhajwIYGOBCHF1/ien3DOOhiJvuTPmiE
 nAdLH7GLO4zFktUJ5AdpWKlv9RmYaTHkjd6NcVcBOHPjFCxBttY8Iy4RiCZJnUr9jC3F
 Pd60e68K3j5iqpfnmhiqueFVmoypGGcMiIpMt24VKPeo8xNuLEo98P4Nzz5guxi7m62d
 vuYPH0k16+sqys6V05pKapur7K1VCJQpCLZ9M4fdI0vQkpHGY1OjupUSlPfdmWn+CEVa
 hJ+A/u9fRvJss9cgzZHzq1AR3mdWyIOgvJWV42RTOWs5oROFGfb8F1mZu/grzeCA3SHX
 Bxtw==
X-Gm-Message-State: AOAM532cWtRdMVFXWq906Ea7jBJe0GWeLPt1NhHA7/4qIviOV555ABWX
 AeXXcKn8SiAFtAxyn5+VdBc=
X-Google-Smtp-Source: ABdhPJzKi6ymP17wa0aiakShx7mBScEEzVt8jOCTIL08pDTzC/n6niDrTNiBe36KvCaVyQe+EDWedg==
X-Received: by 2002:a5d:4351:0:b0:20c:f52c:f869 with SMTP id
 u17-20020a5d4351000000b0020cf52cf869mr34472072wrr.516.1653642449999; 
 Fri, 27 May 2022 02:07:29 -0700 (PDT)
Received: from debian (host-2-98-37-191.as13285.net. [2.98.37.191])
 by smtp.gmail.com with ESMTPSA id
 t8-20020adfe448000000b0020fe7f7129fsm1133340wrm.100.2022.05.27.02.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 02:07:28 -0700 (PDT)
Date: Fri, 27 May 2022 10:07:25 +0100
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Message-ID: <YpCUzStDnSgQLNFN@debian>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

The latest mainline kernel branch fails to build for arm spear3xx_defconfig
with the error:

In function 'edid_block_data',
    inlined from 'drm_edid_is_valid' at drivers/gpu/drm/drm_edid.c:1904:25:
././include/linux/compiler_types.h:352:45: error: call to '__compiletime_assert_250'
	declared with attribute error: BUILD_BUG_ON failed: sizeof(*edid) != EDID_LENGTH
  352 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

git bisect pointed to f1e4c916f97f ("drm/edid: add EDID block count and size helpers")

And, reverting it on top of mainline branch has fixed the build failure.


--
Regards
Sudip
