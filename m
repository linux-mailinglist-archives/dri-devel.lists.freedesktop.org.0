Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93184A21F19
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFEB10E802;
	Wed, 29 Jan 2025 14:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="e9wqAoog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D27310E802
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:27:24 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-4afe99e5229so1818373137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738160843; x=1738765643;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7/oMV5lbQDK0Td5ebpjd8P8KhSy/0AXovQ6waXBtVpk=;
 b=e9wqAoogFswBnf6+AKGVs1MXtLJb+d/9ZqZvZTFdSFeu3WlRnMVUWgWZeGcosWXvRG
 RdaA815rVINajsAuKGpVOpu+nqxjprYbHHhimLzrBufs3NXLAVX06vz+lI/EDSMFVh6p
 V91zYrKbPPqbazcIZCgElg/Tl4mdf1HVKLNhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738160843; x=1738765643;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/oMV5lbQDK0Td5ebpjd8P8KhSy/0AXovQ6waXBtVpk=;
 b=TlD+8SWwArRqB6hF9bbk22NJyik3POsKeYjpecZnCzNp30zXLwxYBwgoe5KXDE/hvB
 /WtuRnQ5PU5Kl4UAOmNCfgu3Y73CWApEZl1PGlPmilm6KFcnnB9FNTIjIM67VZg/TK44
 JWKsojFeO5X5sE3/wBoD+hLmHNOE6JjsRQbX6WQi5eQEv/MXaGUT+VK+9FIhYd/BlxGW
 3O9Z7t6Z+7cvXjYhOlYLFlFNzVoPoGo5vRnCw20qgB3sZsvK99wN3t3ataabYt8OO1uB
 +46lhmy17J32n3qZT5bp4QMM947SvT2YMH5xBOEZWiv1jWspSSFP1tgZ3CpsN2EWFH7d
 WljA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXepSihE5N9OIZEzWLc/lLEMfTg8N84kNCMZ0SeH/dlnOaXb6bCSHFUED4SUu3tjPNHNXNJWqaF2Qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6S5dxOU/jESl0yq+VfNWoxl5qqkAavZfKkMtuRTp5OkhSSYdn
 UBm38X09IfLbY++A9eV2LomrNPVH7B9KwvvLmiJ1JbWC+ARag79SOlPCVRL5DA==
X-Gm-Gg: ASbGncuUeCOxJAeW1ocf0yFqsyKhTYjW9G48I3l0JtX1VG36F5vDWIf5UbqvChDQYGI
 Zt6sGKTAAmpVA1T/ZfiLAmFETMbe/iSbOtEc7jckxiU2Le8Sqm/eWiwfWyc7hDwjSh/WzsY+5m6
 7v3744BLR3JPgztk8Soijh0AEUdDMha6y8Otl9JtY6+bGgBQKXR05+a9S28V1r1tOYgCmg7QnCp
 5Fa4yMF07ftCfgKmRm+p9Ut/JlZLFrQEI0n8hFkPB5Oo6U/2kg9SCl9hokg36fJsR2jdQXOSVD0
 prfp0yEmy/FVdaxi+DK5lHambx+d8+DHPFxqqiIUbmI6Jm9QbVc=
X-Google-Smtp-Source: AGHT+IGUdv5XYVRtLMka3MV4+UwsSfhf8obhES/PawePUIOQV/CMGe0VRqCbwZp5wbvLXuEtVA0Gtg==
X-Received: by 2002:a05:6102:c0f:b0:4af:c519:4e86 with SMTP id
 ada2fe7eead31-4b9a4ec4902mr2826161137.1.1738160843557; 
 Wed, 29 Jan 2025 06:27:23 -0800 (PST)
Received: from google.com (34.178.186.35.bc.googleusercontent.com.
 [35.186.178.34]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-864a9ada068sm2870867241.5.2025.01.29.06.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 06:27:23 -0800 (PST)
Date: Wed, 29 Jan 2025 14:27:21 +0000
From: Paz Zcharya <pazz@chromium.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Sean Paul <seanpaul@google.com>, Drew Davenport <ddavenport@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vkms: Add support for ABGR8888 pixel format
Message-ID: <Z5o6yRJFrImztKoU@google.com>
References: <20250127235956.136032-1-pazz@google.com>
 <Z5irsdEc6Ex2v_eP@louis-chauvet-laptop>
 <Z5jzBe48aaImd4F4@google.com>
 <Z5oAcugIxU6zdROD@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5oAcugIxU6zdROD@louis-chauvet-laptop>
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

On Wed, Jan 29, 2025 at 11:18:26AM +0100, Louis Chauvet wrote:
> And I just noticed that "changes in v2" is in the commit log. It should 
> not be there.
> 
> To add a changelog, you must put it after ---, so in your case your commit 
> should be something like:
> 
> 	drm/vkms: Add support for ABGR8888 pixel format
> 
> 	Add support for [...] adoption.
> 
> 	Signed-off-by: Paz Zcharya <pazz@google.com>
> 
> 	---
> 
> 	Changes in v2:
> 	[...]
> 
> Can you send a "real" v2 with the correct commit message and the correct 
> author?
> 
> If you don't know it, you can use b4[1] to help you manage your series and 
> iterations.
> 
> [1]:https://b4.docs.kernel.org/en/latest/
> 
>  

Just resent it.
My email server is using pazz@chromium.org, so I went with that.
I really hope I got it done right this time.
I apologize for any additional work or inconvenience I may have caused.


I greatly appreciate your help,
Paz Zcharya

