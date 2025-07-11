Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC89B025D2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 22:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1911F10E3D0;
	Fri, 11 Jul 2025 20:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J6RX2b1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BD710E3D0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 20:35:23 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ae3ec622d2fso438517766b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752266121; x=1752870921;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3WSd1C2YEpBcSCAUHObR5B794dxVqLICPHfsBmrzbCQ=;
 b=J6RX2b1FUHkdgr8X9tkTdFuZUgcKa9WZjFb5BqE59p2QJ69vI/KfEGqb1ntUIQS1e8
 2FgebcMglk3ANv3btUpSZdwPZ+The9GHRHtREFU7Gyv2M3J4QunLvl+qjfkvXJSDRRVq
 wf3ce0MpPj3nzUNXEOau1OPKhad5UrV3mCUJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752266121; x=1752870921;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3WSd1C2YEpBcSCAUHObR5B794dxVqLICPHfsBmrzbCQ=;
 b=ZjNoQa/Thxc6Z33a+3+z9kNv3erYyiJF0evcbsihQdPBjpJIe5uGtL/aVmUo4gLvvM
 AA5rk36e7+hRUuuCnALHMfhZcDKL0FgJCgdybahm1n+cL08jNpX1BFmbIKd8udKUckU8
 xevIkY1vFFUrvSXFgWNijLw1HpDOBSzsEf+yElwzk0P8czPOzKEcq4jBuI63TdvYtP65
 M3PZdO9i6lDOguBWWUHtqoTpS/vBqXt1Tw/5cJswwizqKGiX+RjrD4bs65eAua8aiia8
 ccN9jDaOKf+vPTXYdpRIUrmLL7E4g7L/xv1kJilLYun6rOA8dhIMn/JwT6pbO0BktXm1
 s23g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhpyeeckdXkhgYWEiXhl1NUS32egrJnjRAlEAVhhBv2db5huBDJoBZYbxHZHGd+c/TUTn8S3pRe/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHgQeDPhB9MSK4aEiAi33gu0GgN8ceJkdsu8E/m5y7m4ZyDu80
 PF5/FpdzS2KizKYECj2mJg8zOW4mCRnBrt1umbvgm+ld+yUFTgxJyGy3o+WQPXO+lCgGcxscu1z
 wLCUBUW9+6w==
X-Gm-Gg: ASbGncv8Fz1hs991Bwm1iWM7v7x/X35dtRBGHSZY3EFjTpQOhQ/+eGPBa3afx/QZYCt
 182BHkfwlGRYe07rDzrKrwyD/Yn9is1vXqDK20Xcq1YI89/6P2qwjySQdlOy9hTMntKY4yXgmuy
 WRtd/QGEN8dWnPaTybTcc7PERiFgJlHbeWO+RlF0ZE3u7JVUSxCIEEiv86xhOOv+VF4oPB++Ro8
 k+ThsSaEk9V8Wpf0ipzfyPTiDSsxXMtrE896NlbnG7VIrHEgsuwFodR4CHmJLE6u9PLWIQqhqwb
 ZAU/giA97ogje5Rb+aytk0L8ZFE7MqBH9Vz5TnJK6rTBZvvZcR7yvX4dYPp7PeV+87pavutBcqu
 +3xD9YVrZaYtaNyfrxKhtnNIqExVCzAaDGpiez4ZiChVMGMAoGhiFKpjc/JXpcCwW2Ai7vcIA
X-Google-Smtp-Source: AGHT+IGVDifTTTtvJsYHya7yyZE3PSp5Mtm3Sgt2lkOJQWpLu1wNDcoelePBrK8jwVvpjJjcAkLQ8w==
X-Received: by 2002:a17:907:1b08:b0:ae1:f1e3:ccea with SMTP id
 a640c23a62f3a-ae6fbf40993mr532734766b.7.1752266121476; 
 Fri, 11 Jul 2025 13:35:21 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8294bd9sm353070566b.132.2025.07.11.13.35.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 13:35:20 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae0d7b32322so401655766b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:35:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWykT91pojv/vtBv7ojrbTU5YGWKMxpRD+HR/+B9PsH9W+HviPzZyqUSi27hO+rapAMwZC4+B4fJBE=@lists.freedesktop.org
X-Received: by 2002:a17:906:9fd1:b0:ae6:e1ba:30a with SMTP id
 a640c23a62f3a-ae6fc3d7e07mr437795566b.54.1752266120408; Fri, 11 Jul 2025
 13:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
 <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
 <20250711125349.0ccc4ac0@kernel.org>
 <CAHk-=wjp9vnw46tJ_7r-+Q73EWABHsO0EBvBM2ww8ibK9XfSZg@mail.gmail.com>
In-Reply-To: <CAHk-=wjp9vnw46tJ_7r-+Q73EWABHsO0EBvBM2ww8ibK9XfSZg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 13:35:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjv_uCzWGFoYZVg0_A--jOBSPMWCvdpFo0rW2NnZ=QyLQ@mail.gmail.com>
X-Gm-Features: Ac12FXw06ng89sgg6lACD8raxtg8tIsOj2V4Q2Quo5hdT7JGF5RzQP8YU9BhymY
Message-ID: <CAHk-=wjv_uCzWGFoYZVg0_A--jOBSPMWCvdpFo0rW2NnZ=QyLQ@mail.gmail.com>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 11 Jul 2025 at 13:07, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Oh well. I think I'll just have to go back to bisecting this thing.
> I've tried to do that several times, and it has failed due to being
> too flaky, but I think I've learnt the signs to look out for better
> too.

Indeed. It turns out that the problem actually started somewhere
between rc4 and rc5, and all my previous bisections never even came
close, because kernels usually work well enough that I never realized
that it went back that far.

                Linus
