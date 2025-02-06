Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C8A2AC46
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29DA10E88C;
	Thu,  6 Feb 2025 15:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtmhkfKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99010E88C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:17:30 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e46ac799015so762964276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 07:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738855049; x=1739459849; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GLeHLJ4dTP7E8iZuxbVL1Lx//H3fKAthDU+RMMxQi9I=;
 b=JtmhkfKDfshC2Ok+sZX5dpqY6bsTr4fJyYsNTtJD9T3JN4C11M2ujgN2Sv2xIqFbim
 WWV22zHEfIX2zcbgJRvrCmTFA/ne+JNJHHlNAvcfQC4ZOnh6H+jLCKM5DqeTiE6x7wnV
 QgVVFfu3O6PzGvlFMvS5GLCx4gKU+qNeAo3AbHVU3OwgmN+CbsvsbsdrLSvCc4a1OXXJ
 kceItEG/J1lqSjHDVX2OmDWRN0ShZsNIWwZmyS2AJDcPHO7CMZDoFVVHdBM6hgXmL3so
 L5Apfef//yRCVzVC6LDZHik1ZRTO2FORTaBoczudXymjaCutTc0kG4Pft2NoJEtBbnMB
 WQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738855049; x=1739459849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GLeHLJ4dTP7E8iZuxbVL1Lx//H3fKAthDU+RMMxQi9I=;
 b=SBClfRlBVHeIAmvs2FwaIgx5ZZDbFmXOZZ8afsTKQ5TleVjJNv5VFu7W16E59tfhW4
 C5T9ZxdqfN3DFyQnCcyZ9pcSdS7FOJLgRhihmrYdH9QajI9rDtwiRLp7qD75TRAdM1Dj
 wfhuzf2n8e+mOz7htxlpo2dwWaur9uLhj8LRJTN1QWkncEC6/g48czhtUbzn8mdmElu/
 NxuqkkwVR5cIGKm8kGCH80Akuvm7KCrWR2hbAxQsJPDYiMzbuV8TMFj7aiQjHwxVmnJC
 CzR5lF2KlDvcGlD0jq1doUHQfzO4zOCua9IpPUgd336J8dECqq9A5no672ohtj+Z41jw
 3pVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuKtTH6uYFx6IJbSEwqfH64UgmZaeRYOSBqgX7El7qs9x2et8IZ7ln4M9l2ozpOg/oCWujaQkmA6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRw4Odn9UrauA6GljlL0k7k2TxSQzsv6/COMhnCyQ3aWgL6Y6i
 BlvTF3v9LbTHfrpUK9VS0GCHV/agD2kdE8YW7GMOk1wmfICh1zmw/8qoHuLh+N1UcEMcD9BJhmx
 OR6SbUxG5ZN36GKqIrFwZWOvbT0Y=
X-Gm-Gg: ASbGncuuRmsdbt9zpJDBeXes6th4hsWURS6P0Um0QV/hOqPiEG/naUoyJ523gms2Y/2
 mL/n9ieNejn5VRoRBf2RnL+7XoVVaHNVnkuIW8YgpolzyMb103qWF+4tAblwkAgoZt8KN87m4iQ
 ==
X-Google-Smtp-Source: AGHT+IGMAk7h1l+VLuXpBW9KdulzM/beZO9YobXDgKF7w4a7gcBwfC19sP3jRcJt5I6wjLwOWd9tlWLXouwVhAPTRoo=
X-Received: by 2002:a05:6902:1610:b0:e5a:e6eb:d43f with SMTP id
 3f1490d57ef6-e5b25bd8578mr7254506276.39.1738855049274; Thu, 06 Feb 2025
 07:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com>
 <2f3394a5-0c63-49bf-bc85-f43388050ab8@collabora.com>
In-Reply-To: <2f3394a5-0c63-49bf-bc85-f43388050ab8@collabora.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Feb 2025 16:17:18 +0100
X-Gm-Features: AWEUYZmak8RYbRBdTfGCYVsVD52QCFajpZoD8KmZtk7U4DxgRQTHDHmLd0XqdII
Message-ID: <CAMT+MTQrKWzNfsUqiDawCv=s84XOvUGwsrv34aqmZ6rR482OqA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Align host mapping request to maximum
 platform page size
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
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

On Wed, 29 Jan 2025 at 15:40, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Otherwise, the proper solution would be to pass info about host's page
> size to guest using extended virtio protocol.

It is not fully clear to me, as to what exactly is meant by that.
IIUC, virtio is a spec managed externally, so does that mean
that i should write to the virtio people to add the relevant bits
to the specification?
