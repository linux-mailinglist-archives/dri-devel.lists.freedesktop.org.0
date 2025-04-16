Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289BA914FD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3D510EA21;
	Thu, 17 Apr 2025 07:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B3910E8D5;
 Wed, 16 Apr 2025 11:44:03 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7fd35b301bdso7386413a12.2; 
 Wed, 16 Apr 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744803843; x=1745408643; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AZEe1RfOvu1q7GUgcepVbmiSBnsNo8L/yZQuZJXUvpo=;
 b=hKTrvxQgvJG+9mDBHGfVU5MFEjkxbaTsRtqLavM3apmGU/8a0628ncW6HXXnPWCD+2
 VLfg/FS/nuETaZRDGibNKTVGnTws2LKpbTMbHcgXJQLZs28l3mSeY9xw2e/TKZO/w8EB
 x6/9PVGKMrH2zviICJARd11mJNiObO7oZ5zWvqE9k4UXKalrAseNkdCjntAvNtPnlmyW
 4j5yTxlJ7e2t9bobh92O05OlWeEkQQ09FnjKnqiL9UG8+6lvMAR7OYOwso3kyG2hvD03
 Uos/9/x/ujftsCU3FkKLvzbyw3kTHa7ndyyiZk7QAgaUrmXZ6nsG9N1kSmm6wcKU2ejU
 x4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744803843; x=1745408643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZEe1RfOvu1q7GUgcepVbmiSBnsNo8L/yZQuZJXUvpo=;
 b=wP4m7ejgfSjLrXZjUZFZqfUwk6w7FWSYPKSagFrpbcKX77qPCPQPlVtUyOjRL4mWgn
 OMc+5Ewv60qZwofzdvsYOnyaAWOTfqkfFkPV8SeBTu9KGhsir5tAZ5wnzJ4yQuQKF46U
 RDcIyMg4/r6c3sCkFie1qqW5jKLmzMps1q2ayI/NTQEl3/mOW/DQ5pESd/NnHE4BGUZ9
 m8IueJoV/ilVomVAjzHBT5A02VT/q9Vz/YsqqGApbKouU+MiVF/O/2wp2BGfK9yFBJq5
 M6A0iBXepJtPRjeiOd0Cm7NjNB0OcXoPnJedzZ94bHBpzWRt0O3VZVVSCUXLVSgjuyT6
 WSvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIu8+kOrjKJnbdN4djHGvOBO+4GynyzTdZyhIUyjr5y/UA9lD5fn/JAho71eUpNFDRLs31ZFE4xFJm@lists.freedesktop.org,
 AJvYcCVTRHo66GpSo2cPQ8tdkotDQXvs5ArvrgcDj7Kuv9bMBgrtCRC7e8JSE4JNOvD9Khwd7eQMdRbe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX+5s/7nq293XPPtNGhugJMnrGj4/6AR52xI9h0Gub81vdZ1HP
 nuqsZw5ksXeaNXX/LCuRczTcVaPsWMYfVLVW1F2QIp2yaGoJr9rrGzCV5lyH+ljEmMEcH7hqTRo
 kZHyTc89EVGdEkhQ/Tqydjqyg7g==
X-Gm-Gg: ASbGncsPpBGy7tDcXb7hVAmwVk8M3jrDBB+DkhwhRCA67Qp51qxsisx1GDFXSr2KGct
 5NgvzlFtLo6jnqJTfWIMyj9CQre4n47j9y0y+t5ic31nl16kA0D19gbS0I5GudrNIWJdE6A9kCO
 k9TeLMfuIdV+h4lTcGWaYXC5DXuEG7/Ep7vj/7g2hxQQ4zrdXmsthEE9M=
X-Google-Smtp-Source: AGHT+IHRzDwjfA3VhiXoJ9w7CvBGnZUfl1D3wlF7cVjsZnBUO1T3cpj1g1gCRyxquxD7cm2X4+bYulvm0qakj3Q2+Fc=
X-Received: by 2002:a17:90b:1f92:b0:2ee:ad18:b309 with SMTP id
 98e67ed59e1d1-30863d1de84mr2289142a91.3.1744803842763; Wed, 16 Apr 2025
 04:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250416072825.3790-1-ujwal.kundur@gmail.com>
 <241a9bbb-6d59-4c24-8e18-a0acebc6f536@amd.com>
In-Reply-To: <241a9bbb-6d59-4c24-8e18-a0acebc6f536@amd.com>
From: Ujwal Kundur <ujwal.kundur@gmail.com>
Date: Wed, 16 Apr 2025 17:13:50 +0530
X-Gm-Features: ATxdqUHlTjwJQjfOZfGM2sNeVWakgF2t5Ff-hXQ0-Ap1ykAmMwP7TjWL6pmkSIw
Message-ID: <CALkFLLLKT=4LD_YFJdq8QdzybknRQW+W3P-3GnJzT1eoYuGg8A@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/amdgpu: Block userspace mapping of IO
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 lijo.lazar@amd.com, sunil.khatri@amd.com, Hawking.Zhang@amd.com, 
 Jun.Ma2@amd.com, Yunxiang.Li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Apr 2025 07:22:17 +0000
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

Thanks for your response.

> Hui what? Why do you think that grabbing a reference to an interrupt would block userspace mapping of IO registers?

It looks like I am missing a lot of pieces to do this, I'll try again
once I have a better understanding.

Sorry about that and thanks again for your time.

--- Ujwal.
