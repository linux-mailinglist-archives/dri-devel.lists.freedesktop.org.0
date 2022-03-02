Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFB4CA003
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943210EE7E;
	Wed,  2 Mar 2022 08:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D2310E2F5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:39:21 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so3060171pjq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 18:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:cc:reply-to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=MtG6z1Jzb89Ndx+jl2cJ0c1G9ZcfiK5kSL2+E0wyCng=;
 b=abfrrGS0XqDXsi7/Xv1Z4tFdV23VfDvlIsqmd4l95dfY7OUh5ZJyiuhIRJ+mFzXvXu
 BKuNxZymZZ+9o/qz+/P4mWxNDsggFyiMKX9WtNN7DeEQAKwvM901P5x8q3wV8kNYLzkC
 ekKEg4poMrbv+9f1tv0+/PTTgnPje9Q6ZLayL35dxtzSpccu9hVxCZ9d0GR8W+obk+2r
 LNLscVM1qONrJG5A8GlomyUwB/1rq/J2qNKuoIchtJ9lmd1ltbb3DwQSMsLB5bZWmPQx
 LkyEdp3dmN7LMztvoMwS2oBTz7Y6jn3zQw2dW83nmUeoTXQwIoLDYtszH8OMTyifNlws
 5A4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:reply-to:from:subject:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=MtG6z1Jzb89Ndx+jl2cJ0c1G9ZcfiK5kSL2+E0wyCng=;
 b=49pWKLAdIykQ2UUvc627zgv7zcflBmyIboFX8QkrwHMLhd4P59lJ7J72RhYYeUGSyK
 fuPB7ubWOGimmtaxF+IPMFLR1UgfGCYgmlW+RlLosdvv48HA8tCBzBrw3uN13h8WFlZz
 eCXk4xQ+kyyN+eekiZtQbJq67kmUz5sDwcNb2kydMs4XjNImRBuiEQZCcg8t3OSvQh5I
 +BiZvHP8CHBZYusoYq88j72bXniqi/Akn9JEOIQ1b73XV+HyMAFkHwDPZVleQWBPevtg
 FgiIIYxoIrVdxIiuDt4LiTzoJDcVRAumrnPsLVl1IhQVqkJO8Lpeknn0vFSb8BHzY48W
 Nh1Q==
X-Gm-Message-State: AOAM532jJEUIrl17Tfca7b27kFge004tf5/F7VzWfqjRQhh6tsfwhCn0
 eQ3fnTABYyx+ivQ9L032lWc=
X-Google-Smtp-Source: ABdhPJzRWPFocHCjcn3D/1crvW6jIAuiApm7zY8OeyhMDlDQKmtpOisKmOaARpeA6aFKmOW7Zn/Ufw==
X-Received: by 2002:a17:902:e549:b0:150:2412:c94c with SMTP id
 n9-20020a170902e54900b001502412c94cmr25176748plf.94.1646188760970; 
 Tue, 01 Mar 2022 18:39:20 -0800 (PST)
Received: from ?IPv6:2600:8802:2207:ac00:38b7:6dcb:b27d:e974?
 ([2600:8802:2207:ac00:38b7:6dcb:b27d:e974])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm18875337pfh.177.2022.03.01.18.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 18:39:20 -0800 (PST)
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: MSM8960: gpu/drm/dp/drm_dp.c:59:27: warning: array subscript 10 is
 outside, array bounds of 'const u8[6]'
Message-ID: <8e13f51a-845b-1fdf-11ea-6053f7d8df9e@gmail.com>
Date: Tue, 1 Mar 2022 18:39:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 02 Mar 2022 08:54:41 +0000
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
Reply-To: CA+G9fYu4PPE6_91mzor0bW7RSzBDNJ3xqqgeeK-jR1jokmhYOQ@mail.gmail.com
Cc: sfr@canb.auug.org.au, tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 dianders@chromium.org, lkft-triage@lists.linaro.org, jani.nikula@intel.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,


I am getting this warning when compiling the kernel for the MSM8960 with 
this defconfig: 
https://raw.githubusercontent.com/apq8064-mainline/linux/qcom-apq8064-next/arch/arm/configs/qcom_apq8064_defconfig


Warning:

../drivers/gpu/drm/dp/drm_dp.c: In function 
'drm_dp_get_adjust_request_post_cursor':
../drivers/gpu/drm/dp/drm_dp.c:59:27: warning: array subscript 10 is 
outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} 
[-Warray-bounds]
    59 |         return link_status[r - DP_LANE0_1_STATUS];
       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/dp/drm_dp.c:210:51: note: while referencing 'link_status'
   210 | u8 drm_dp_get_adjust_request_post_cursor(const u8 
link_status[DP_LINK_STATUS_SIZE],
       | ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

