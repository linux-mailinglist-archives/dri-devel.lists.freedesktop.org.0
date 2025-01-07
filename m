Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED615A03B37
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6493110E3AB;
	Tue,  7 Jan 2025 09:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KfTWaiUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3C410E3AB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 09:32:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43618283d48so110357775e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 01:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736242287; x=1736847087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NYihjbxBvy2f8ejG3REqVaUmpNYaOeHIaj+WHecKSEo=;
 b=KfTWaiUXUmA9QR6pPITTl8nBhXDBMrU/SWmH9zSci1LWQe8nr8SO8vg3XgGD/ViuV0
 VihX0cbNy6oudBcb9/7dnhqez7rS+q77YgWDEMQHDph/0aat4kjm0hF4mYPblsgVrvff
 Mg6hjU64ydLzOughrrDBQyU11JwyBFExVaGlJU53Y3Dat5u28IDQ6BgSAixw/lPye/jR
 mkZKtEd3ViJWnMhCLG8dXmHi2tqA52LJv75zBRbIVY+KED1X4OQFrz8j4tXsrU7Mrcvu
 7VgKul1t0BS/40rtdxPPNcb/tdo2MLhJYbtiKgJLCkwdadVIO0R1gS96cBqBOaCPfl1l
 XJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736242287; x=1736847087;
 h=content-transfer-encoding:cc:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NYihjbxBvy2f8ejG3REqVaUmpNYaOeHIaj+WHecKSEo=;
 b=DeBiaXN2MfxCLP0flk/Ej7DxBEL/GD5PkV6NLp8OjAl28ibOx0FiF05Ar64Bjwfst2
 l+EXDgGjayYZeVHoNt/gtL/uUsovZmaILyE2AzN8+mPL5HdGRIYHkCjtNKF60lQloJQn
 xv0upjLVRcveW39TUEbzdDWNf3C9OGg6AO6wEt79vadEtYhd77y/VgKgzyfEGsAu4VhW
 vQ1KxS1arrv9SzpS6wxlngWVbiWGjqmmDXreU3P4ysdU8Fb9cPRGgCIUvjxEChhbM3vh
 6P9BPHG0VLOcYHprn8DYSOCAYttkNMsTcDZxfrn9E2P8sqXb9z+7OdKFO+tT6+RzuzHx
 Br5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXZtZ5L03uPQZdEpGmemtwBEIkV2QghVCZI99Po2gpyYwLrmWVTn2fiuEgKGeoiyaqx57sYOEXVyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEi4YLlOnscvgLCWJbuHf+/epibBYXtgS99BHNVzkjE5IMSqWz
 vMP0mAFDxUTvVeWO7BnLhZ2SB7ZQJelWXzblIB22Us5CPhONSRGh
X-Gm-Gg: ASbGncvuT1S4/99FK1GHA2QhZ0Wor0vBYdL/S3SBysc0Nj7UIQ7dXez8vr9GVEq9XSt
 y9IqtmUANTJy0/U+XGr5fhA1sqUdlyLDWAmqUt0W39JYP5koQsgE90qjkG5cuc/a63KFp4JRHBh
 aRsj7JJGzM/1kUmCM0q11hDSLHm/ohXm6xZVFrrEwsPkUx0ibVsCFfpWx+3ETbcKYvTk+SpdOW3
 6j0v97MZ5ZE1CtZ57cRV3Ub7R+Bmfo1prD0A/3shqyPxSnxUxjv8VOI8JIF7a/9Vw==
X-Google-Smtp-Source: AGHT+IF+QGx5FMZfOnBB2/EmNmjd0XzhhNOcaaIiTZvF2RS7zDfWnwMRJj5VJQWy7bKj1j1Kx61hxg==
X-Received: by 2002:adf:b302:0:b0:38a:3732:444e with SMTP id
 ffacd0b85a97d-38a37324592mr36018223f8f.55.1736242287075; 
 Tue, 07 Jan 2025 01:31:27 -0800 (PST)
Received: from [192.168.1.240] ([194.120.133.72])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8a6e19sm49691635f8f.100.2025.01.07.01.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 01:31:26 -0800 (PST)
Message-ID: <22e6bda9-bb5b-43a2-b256-64ff789bbf69@gmail.com>
Date: Tue, 7 Jan 2025 09:31:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hermes Wu <hermes.wu@ite.com.tw>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: re: drm/bridge: it6505: fix HDCP CTS compare V matching
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

static analysis on Linux-next has found a potential issue with the 
following commit:

commit 0989c02c7a5c887c70deafen80c64d0291624e1a7
Author: Hermes Wu <hermes.wu@ite.com.tw>
Date:   Mon Dec 30 18:51:26 2024 +0800

     drm/bridge: it6505: fix HDCP CTS compare V matching


The issue is as follows:

Source: drivers/gpu/drm/bridge/ite-it6505.c, function: 
it6505_hdcp_part2_ksvlist_check:

             for (i = 0; i < 5; i++) {
                    if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
                        av[i][1] != av[i][2] || bv[i][0] != av[i][3])
                             break;

                     DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", 
retry, i);
                     return true;
             }


in the above for-loop, only iteration with i = 0 is performed, either 
the if statement breaks out of the loop if the condition is true or
we reach the return true statement. Both conditions means the loop is 
never iterated, yet the loop is expected to iterate for 5 times. This 
looks incorrect.

Colin



