Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB6A1D2EA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 10:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9D10E4DA;
	Mon, 27 Jan 2025 09:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fzz+6vhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E072810E4DA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 09:05:48 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso7228610276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 01:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737968748; x=1738573548; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sQGiOSFXQcB/cuKBWCQj3aB6Enw5rpIAAdVFTilt6zE=;
 b=fzz+6vhizOkO52vtjMa7OLZVkFE+WKPTgDsXLJQYd7Wi097pgxr2L/hwdHXm41+T4f
 zypAn52hbZJLQW+27YsmsUNmm5grA/U6h3b8OehuPUbcw5pjOC6BVGiMddizF3t7/PBJ
 i/i3eWBwBzv49p/RrehBBXebGlxdh4luQohs+3FVBaPSfxQTMbfq8vJXQs5izCU24nJD
 5oK+eodDt2j9pnyGSAcuTmJ1oNNOUP32IBrRDwgM/CkxaoI0pndHnshZQij7hdoLJy3C
 twUGuIMp4yPHYAiVqzEx7xgwBwHcwPHy/TCvhs7Xzzifg0FbA+AzNXdt9I9SAtza3JXH
 DNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737968748; x=1738573548;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQGiOSFXQcB/cuKBWCQj3aB6Enw5rpIAAdVFTilt6zE=;
 b=uorfQvyxjP6Z9W5M19xR4e+62MLiXLulcucvMkDRPzsgZKi7MwS1SXpUTBttqCN/4B
 7l3uTl6a+MApvV97N1aqsb1kwTCxWe5UjM1BXqq2B00p87Ws+n4khBm9tPadJG4dDVr3
 tvcDuMWB9mpI3szl4z5lD5w68m9y5ZAXEzyHt8N+2uxLp5e6mfoZhO5tPOh7FVdS9HsU
 kDwheyQ0qTbklBKXTjc5m0NbW6T7R783mgzhqZ4DyCh4WiD9v8TFYvOcJsuBq5+DjSS7
 jEFeTu4NVUsY2qLDeL+llGw2VMIvk9VMTDW/IEsuos6XGBh6ac5KkT5ip28LZ7dt0Iwb
 dolQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHWJcg+2LA1r8hdQJY1pl5nznCLGvX52YvnVh5wjWFje091ODrnEP61H5iSTPWKaiWB9Tcjkryn7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCrEc/+uNmXQkUUr2Qd6KMpQYVxlPBzLDWnG+ytMUbe3cagctn
 Vjk73MDAO68FElhxWXzA1CzzWv/hUzRr1GyVxBM2Ox64xHPny2JTMtMPStwfIcXzhkAESnF4eVY
 vNEeZ6QENzUlGnsqIB18AbPvK3Ss=
X-Gm-Gg: ASbGncvHyOLCRVruFwrfE/A5Z/NSj+lG9gdeYVWzycNewAS6MVInRQBKxNtL5u6VzcS
 5t1LLvvYuZcyH4XhEVpimq8zbBHt0FL7NsC6I8PpT+eCfAst2a0NydEKHiXVn7Yc=
X-Google-Smtp-Source: AGHT+IGa7Yl6B8MJ5QHXf3TY07Rd7fNWx9mqcOicUKXP0SfBOOhR8dEmrgHpYp6Q1QN7SewjsNLFXRP6Yo9F5OKf/IM=
X-Received: by 2002:a05:6902:981:b0:e57:2a07:a975 with SMTP id
 3f1490d57ef6-e57b109e39bmr26749441276.29.1737968747818; Mon, 27 Jan 2025
 01:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com>
 <4a1c7ab2-66b8-49ec-9662-6827c811ab69@suse.de>
In-Reply-To: <4a1c7ab2-66b8-49ec-9662-6827c811ab69@suse.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 27 Jan 2025 10:05:36 +0100
X-Gm-Features: AWEUYZkb1KQh_RTJk_H3d8w0L3RB1N-n2GhnQODabid2mVrXgB_zFRDciDlhCzU
Message-ID: <CAMT+MTQY3JFuCUK1OeQ8zBoe51fqPyHs6x6QmuY0eHP_e61Hfw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: Align host mapping request to maximum
 platform page size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, "arnd@arndb.de" <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>
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

On Mon, 27 Jan 2025 at 08:31, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> This is per-architecture code and does not belong in a DRM driver.

I agree that this is not quite the place, and ideally i'd use MAX_PAGE_SIZE
from https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/
however that series has not landed yet. Would a todo comment
with instructions to replace it with that when that lands be ok?
