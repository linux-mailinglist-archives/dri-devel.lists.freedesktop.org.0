Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3EA05698
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844A410E81C;
	Wed,  8 Jan 2025 09:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y2UCQTn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B7110E6FA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:21:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30036310158so150146761fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 01:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736328033; x=1736932833; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFF5g1suSxFROd8Ao8Ky4FvnhLMNht4ePtM+PUDq5CQ=;
 b=y2UCQTn7fvV6WZhINLMlgXpodAf+EE+MOtVu59wCdjTlBTFwrykZRFcamPOzWKvCyP
 mj9T/O8N//FqCPaJusrRP37RJSNCIdhi85N7cd3BGsbzTdD8KpfUF6jzm0Eb9PCvgDIN
 F5L63av5heSMkPnXS+9Ht0KBZfk27t2Obcm/0L0ILJAfe+jTaOUbXnuOi2peLND5uq4K
 iB6BHc8YrcNoEtMD/zcHQGHjsShINGyInuHd9g3kb2k+Snm2U811PN2nLlIzMvhwbAdL
 fuY68bGch6ZJQUVnm/ulHhC/5DYQ1VgNLzDslCuydky+u/czAlOSzQvXsH2/7tpEsc0A
 QASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736328033; x=1736932833;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFF5g1suSxFROd8Ao8Ky4FvnhLMNht4ePtM+PUDq5CQ=;
 b=JHl9UOwHiizONa/uu/Xd171tSq9liD8GkWo+RI8n0BuaZxkgCGkKH0Rnb9xoycUqW2
 hbOOWlu8U0zF9FtRh4UMwkKqpoqh0803Gdc4uPiYjy3uXvHJCzwhUWTtuXlCxhlSiLEQ
 Uqw+Tbuv2FD1QlxlJGJoKGu93Fd0hi8vm3I/agUxi7x7C/P4kI3gcTEwkJexvsW7zszv
 XOzGAJL6OBFuHeolZdMEYulPEGtdKfEb/9y1SAYuD0W5KAq7dBtBCffh0ZSGcgsxjIIg
 ngcDADaq7SifJ/r6Sty+PAkU6DK1n0bb6PWNdI+Ki99MnAMS+TDuXI+p6dJoiYxwGiNm
 n0Ww==
X-Gm-Message-State: AOJu0YzRlKMLaaWobfSOXMGI8a1//U65qduaiVfQPPo034pwsG29i9jR
 2UeWH5KassHiMI4/HNwDwoHn6lFidK1gX8ynLY1UmBilUnOYDmxxAEWIBjeL0Yr7Rv22KLZSqoN
 w
X-Gm-Gg: ASbGncsHiuYHnIhkp/erFK8EsYDb6/y5JHcCe9++LNSuh+NveMCqPd8zjKn0Rn8oxON
 BFsuLpmtvEd3MT2SB5BM51+zrgdZgVojtsWh+szPoo+HJs1eq0CcSR/62+FBrPBOQWV2+9xPGe8
 mrtJJ/ARHkWKF33MwHdlCaELvfXUh3Ah1dAShYq9F8vX5IJvr9zcMDrg/JRKtZME2J21mOEgG1N
 6kOjkWvOTBTjvmyspoStpyV18nOrlzlujXTGacTioHLwS9DFb0Bt0zEGUlM/w==
X-Google-Smtp-Source: AGHT+IFv+T8LhSpb5cmZW3hobnYam6IuIXAt/zLYJTv9m2tNZQfgTItXUlTxOpCbQhDTC1sYrWAEaA==
X-Received: by 2002:a05:6000:400e:b0:382:38e6:1eb3 with SMTP id
 ffacd0b85a97d-38a872ebd18mr1432182f8f.30.1736327616326; 
 Wed, 08 Jan 2025 01:13:36 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e2275bsm13782475e9.40.2025.01.08.01.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:13:36 -0800 (PST)
Date: Wed, 8 Jan 2025 12:13:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hermes Wu <hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/bridge: it6505: fix HDCP CTS compare V matching
Message-ID: <b1cc3aab-d5c5-4e61-b270-24c2b28df217@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hermes Wu,

Commit 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V
matching") from Dec 30, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/bridge/ite-it6505.c:2253 it6505_hdcp_part2_ksvlist_check()
	warn: ignoring unreachable code.

drivers/gpu/drm/bridge/ite-it6505.c
    2230 static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
    2231 {
    2232         struct device *dev = it6505->dev;
    2233         u8 av[5][4], bv[5][4];
    2234         int i, err, retry;
    2235 
    2236         i = it6505_setup_sha1_input(it6505, it6505->sha1_input);
    2237         if (i <= 0) {
    2238                 dev_err(dev, "SHA-1 Input length error %d", i);
    2239                 return false;
    2240         }
    2241 
    2242         it6505_sha1_digest(it6505, it6505->sha1_input, i, (u8 *)av);
    2243         /*1B-05 V' must retry 3 times */
    2244         for (retry = 0; retry < 3; retry++) {
    2245                 err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
    2246                                       sizeof(bv));
    2247 
    2248                 if (err < 0) {
    2249                         dev_err(dev, "Read V' value Fail %d", retry);
    2250                         continue;
    2251                 }
    2252 
--> 2253                 for (i = 0; i < 5; i++) {

This looks like a loop from 0-4.

    2254                         if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
    2255                             av[i][1] != av[i][2] || bv[i][0] != av[i][3])
    2256                                 break;
    2257 
    2258                         DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
    2259                         return true;

But it is a "loop" from 0-0.

    2260                 }
    2261         }
    2262 
    2263         DRM_DEV_DEBUG_DRIVER(dev, "V' NOT match!! %d", retry);
    2264         return false;
    2265 }

regards,
dan carpenter
