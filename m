Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F458C1572
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 21:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC510F165;
	Thu,  9 May 2024 19:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="izaCufKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465AD10F165;
 Thu,  9 May 2024 19:28:00 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2b239b5fedaso1068775a91.0; 
 Thu, 09 May 2024 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715282879; x=1715887679; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4q15vxk3U5tCW6AqzqeDT1BCURgzaUxT8LIVZ+ub84w=;
 b=izaCufKRC+Wuqk/9aQ55DDHzKny9EccCG6LIIuGWEGDG4SV3sp7GOIywIGO3q60+v7
 oMnP7M6e/pb+pjjt0mTWFcU4958A/T06DLlisPPbJsLhFJ3q5yDqZ5PQIi8/BSJr7qRO
 q5WuAYQhdysvW0moaaWbU1fW4JFM4waaKgjokOGiTT4gk99gkwBJT/DYaxc+J6fDPD+Y
 FsubCU2HZeiPxn0LUS9bXvth5lqkZdCu7nNEWfoclpA+oEISMBxlHiU4teGIy8+zf81a
 NDWMz7oHnWhXDV46XMJRMJH5ZpwqFu9uZ4G/G4wEEm2u/MAHX7z/paMQzGdwmzzPdYUc
 b5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715282879; x=1715887679;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4q15vxk3U5tCW6AqzqeDT1BCURgzaUxT8LIVZ+ub84w=;
 b=kkpXdJhmH/DXW6Jud9ANlqNPObX8lFw/m2ts97VBZZPE7RAsW7LeVXjt3tbxQupYOn
 ASILFS2wHg3tbeTMCXhRDT4dfktDTGZJ6OpOvtP5cWm+Y8rhVWreL+y5HBo0qFd7sOEL
 HD7sn9HczY9RErnk3JfudKQ5E+JYu4lENuUDpWh2ZmElKZ9utOAigYKP96DaS1jynSEr
 MAnLR98k5oyZNtqXXsyrm1f1YAY7rj+mKHEGFS8ZiPObj1Wayv42YIMWnM4Z13nuOCSb
 dP5uhu/iAcgrRikUjGJHKyfvff2INAxu5SKhzp8pmxl+WlT3BCUJvoIt+yQ4ZZCxmnhl
 blRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzuiVdwTnIomi2JG2wSoiyql2QatzM684xbKYyuSX4Ibyb5xjhQTvhgnxyaMrBdhNFOli7jpn25/VLgIm22AlfYsGuRKWhATOMe84f5fmZpHN34UDv9SneJ0Q0zU3foBRCe84xc1JjGUyc/FDc1s4J
X-Gm-Message-State: AOJu0YwObshjHd46eWi1PK7h2CryFH/r+3mrLLvG6E8eUImtSjdn139s
 6Qce84qgrSM0lAFiXgjfHH/mfWTUeGP2mhM6DxxKWqh4auWvWqzHgivAk2bf9tix5K3hLVrmANY
 cZhfwnfDHpfJIDwccyPTQBrqRBMw=
X-Google-Smtp-Source: AGHT+IFD2St8xMS5+Rfyw+Ljbcn5AcM1Wr/haO1ug4eK3rhYqRM3DPV+yzOiYy33989tocEobfL+9d6S07ZnmExnzgs=
X-Received: by 2002:a17:90b:185:b0:2b6:c4d7:fbf9 with SMTP id
 98e67ed59e1d1-2b6cc758aa9mr396866a91.13.1715282879509; Thu, 09 May 2024
 12:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
 <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
In-Reply-To: <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Thu, 9 May 2024 21:27:48 +0200
Message-ID: <CAGsSOWXFoFte_Ubbzudo3Ru=s35xsuiSwkOC3zHnZHM7_zj7pQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

There was some previously sent patch series made by Dmitry for these soc,
msm8996 was sent together by sdm660 but in the last version it was dropped.
I have recreated msm8996 DPU support from that series but it will need
some more test.
I am testing msm8953 series but it is depend on msm8996.
