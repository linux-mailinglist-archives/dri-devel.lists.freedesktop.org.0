Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4ED85CCAA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 01:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DFE10E5BB;
	Wed, 21 Feb 2024 00:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="B0TFMEPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0482110E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 00:22:45 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6087192b092so677377b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1708474965; x=1709079765;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ox+J2335xf7o3DrZKRT2ykpaGzs6i15BIcnRbNRjJoM=;
 b=B0TFMEPsoK4JGiQg+coNTzU/kMa7DUBinR2JwbjvMpGrhKM9zRFZkztzS9qf4sY9JB
 zz1JJGIN5ZOas+ps/JfFGyZvAjLn1kotLQarAAonYDJqoAaY5zwvkngxFpGfU+7wTAX5
 og14C5GAAs7Q8XvQze5fM/8DP8lU3sjj1Wr1ocYAZRRp/jYe6oDgnl/CQcmz0oUAG00d
 0VIsh0RKAKQ6RR6nhB+lH/fG+Ppbww7Fbrz9yojdvCJfzWJGyc5qyhXtks85EfX/+PGZ
 EQNvhrcwVotLezsgIitBqfYjNpPf0RpMXqzsXACbP3eTI3xTlqDpF2/exw5mghyqA+YD
 ZlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708474965; x=1709079765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ox+J2335xf7o3DrZKRT2ykpaGzs6i15BIcnRbNRjJoM=;
 b=sHoYRVGljSkOjwtg+zpXHzXV4pBX4RbT0xfz+7r87kaZK3pYdtNBF52ZvTlsd1qOIQ
 q/kK2Lur+8mAZSKjSXBSn0WYFva2fjoKAGsoO5kGpKr+GYC9vvo+goC8SPIJp/AWnQO6
 4kn1snoBtQhu7tv558Wj1beKS7t7/8Xmj2dbkfmGVLq0uHmGRB4I2UzOzkj5hgRf4ef8
 PSn53mSvIs5kROgq7xTIdJOOcDg8cB5hvnq71n3PB57I4VpfOyahap62LXOH8yxMhKhX
 vHnQ6F9/b0t0JbNkBoWE7lHOkMJsTuipLJnQOud03Jd7K/D0SOjzoGIlCoaP+Nsx86hD
 TScA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUknf5t5zmhkkmc0lG7TkuoBoiJbIoYYhhT17LA4FRjRV0QkfKWnEtDm3C3Z44FGXfmdYSAfHEgti9/7v7X+Rvtlm1p4CcIFDAXmDU2rN4a
X-Gm-Message-State: AOJu0YzIMP4HfUUTsWLlvPObsDWJ1DzLsD6QovmuXcxwW+KoWFRGUtkZ
 O/FmE+vA6XPZqBSYJYgbR4LtZq3cT+PPhBzffoP7K3rQG0uAcwofsR+doWE/JnoQrMYiQ/TJLNS
 TFGr2qtztxiRFvcRF30LLr9AytYRoPI6QUwWibg==
X-Google-Smtp-Source: AGHT+IFiQm8UhJU2ScRc4XGCSpPwI2oqSRuqhSgKcGPA03l7/llyqlS0KXlgUi+Mosd1o35byt8JG80q/qXFUCWLYJY=
X-Received: by 2002:a0d:ca12:0:b0:607:84d9:9820 with SMTP id
 m18-20020a0dca12000000b0060784d99820mr15215809ywd.24.1708474964822; Tue, 20
 Feb 2024 16:22:44 -0800 (PST)
MIME-Version: 1.0
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
 <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
 <20240221094643.4496313a@canb.auug.org.au>
In-Reply-To: <20240221094643.4496313a@canb.auug.org.au>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 21 Feb 2024 00:22:33 +0000
Message-ID: <CAPj87rPy3yNY26qY4r2Y32Hxn40hnsBGJ35vH6MqcTXitmrayQ@mail.gmail.com>
Subject: Re: drm-misc migration to Gitlab server
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
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

Hi Stephen,

On Tue, 20 Feb 2024 at 22:46, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Tue, 20 Feb 2024 11:25:05 +0000 Daniel Stone <daniel@fooishbar.org> wrote:
> > cc sfr - once we move the DRM repos to a different location, what's
> > the best way to update linux-next?
>
> These are (I think) all the drm trees/branches that I fetch every day:
>
> [...]
>
> If someone could just send me all the new equivalent URLs when the
> change happens, I will fix them up in my config.

Thanks a lot! We'll give you a shout with a couple of days' heads-up
before we move then.

Cheers,
Daniel
