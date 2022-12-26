Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE93E656402
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 17:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D06B10E11D;
	Mon, 26 Dec 2022 16:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0424A10E119
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 16:05:38 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id v14so5924818qtq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 08:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:content-language:mime-version:user-agent
 :date:message-id:subject:from:cc:to:in-reply-to:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5mrryhywXcVQ+99FhPdbrrjGk/MlPS/iyE4Wd0+Drdk=;
 b=xRQcs8go/oYs+75+uVt+EpMi8itGzeLk6GzHfiILf+IQhiYujeAcAlkoPVBQ+YIYHm
 VrfixhxqLzmCKVTrEFxAF9t9lffJ+yL7ErPsX0NRWhghAhmzAFjaT+6sgHWiFnhQe36A
 TpsQ9o0eJNMn5iGpwzNnlmlUscRH9O1qsg2q4TmyTDyHsuKs3oWr8TKrbCpRmo5/E2ca
 GBVsgLdzREwKzIU3HGxts8GwTMgq8v8LWe6Q0VaKh2CceaQDL+6DLCNG9zb3KtJYCMuQ
 k0JPWCTyOmfeOj0IMGoHCjMcKWsuEGoiS8Qg4D4o0gI7vFyo+IrTVHeRRqbyTXICu7DU
 SM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:mime-version:user-agent
 :date:message-id:subject:from:cc:to:in-reply-to:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mrryhywXcVQ+99FhPdbrrjGk/MlPS/iyE4Wd0+Drdk=;
 b=MXOvJvrOvTKUZPwi5s6WvsuddLALn7919PhFH3Km40rGKvgVRc6uDOJstqp2O4iYGY
 8V4S7qqdoypNov8Ya8x1fGUpMpI1MHA7SH7QOV43931KSegDTUY/hBaziv89bCDmtg+7
 fjH0/Ffkme2VcFLp/Zcd4TJIG/EmDPduff2hoTfMfPP+dvk0zZOMRkpYwu0OVkg1Koi4
 Jrti66v2Ny/k6iixNUhOJHU05MC7/qXBEi+B4iCs/XTaaG75/r4i+tokMwdoB7bmBqiD
 sQQd0J9T3Se35/cZWYUK1AGyiJURmz2oczeNU3g4dYPLqKTneuxCWZD8mS2gj7vND/SC
 UzXw==
X-Gm-Message-State: AFqh2koULsBF353lrFyHu4NyUkMwc3rcESGcKgdYZmkd7hx+HIWCJC15
 WdP0Zzkff59v/kz7nbXfTvqh2Q==
X-Google-Smtp-Source: AMrXdXtV0SaCG5zDmR3M1vqUvSqwk9DZZiTx3gV6oTfliEhpEPlqw8VRrDhlXJy0JJpgZ/s22WzYww==
X-Received: by 2002:ac8:6782:0:b0:3a8:2d7:af66 with SMTP id
 b2-20020ac86782000000b003a802d7af66mr27150751qtp.21.1672070737547; 
 Mon, 26 Dec 2022 08:05:37 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca.
 [135.19.110.125]) by smtp.gmail.com with ESMTPSA id
 6-20020ac85646000000b003a6947863e1sm6827148qtt.11.2022.12.26.08.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 08:05:37 -0800 (PST)
In-Reply-To: <20221014084641.128280-13-christian.koenig@amd.com>
To: christian.koenig@amd.com
From: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [12/13] drm/scheduler: rework entity flush, kill and fini
Message-ID: <5c462a00-03f6-c2c1-592e-22301db6d7fc@marek.ca>
Date: Mon, 26 Dec 2022 11:01:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch broke drm/msm in 6.2-rc1 for me. drm_sched_entity_destroy() 
never returns when exiting a process from gdb if it has a drm/msm fd 
opened (if the fd is closed normally then it doesn't have this problem).
