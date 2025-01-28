Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3845A20CA3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A947E10E26A;
	Tue, 28 Jan 2025 15:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fYEf+4T8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBCA10E26A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:08:56 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-85c4b4cf73aso1104979241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 07:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738076936; x=1738681736;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1x8JpO7DcN38hY3J8baKFeGgrBWCYMR2dBa9BlEgCHs=;
 b=fYEf+4T8TUXSSlptnfzpXopVjhJZDIF7Lll1eE5rq8G3NwLgDqTvftcJSZoTragf8R
 HpgOt5VHg8EMS3SM4tFFZ+7CcmOxdApMgM/8l8aXkn6KvHO6HHJRZVN0dazNLZz84+Po
 ha4VYIW4vMwj7M3GHsgNae5JfYCFXDo7ORFw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738076936; x=1738681736;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1x8JpO7DcN38hY3J8baKFeGgrBWCYMR2dBa9BlEgCHs=;
 b=glFHKttHYyPxa3iki2X3hr9VXeov1BdknLr+6G+o4i+kVf21ymiFuY5WgwWKycBcKW
 Y8p2nXcGJJfuUtqpMjRpU6HErkjlQiOgioOjgQd4gRQ653WG+YdQCVj4o+cfiI7oyhc4
 yFegGBsY1vGfyK+zd1Er6ghEugOEXzx7FZJ7VChfhIK39tLqv3WpUoqLw06PR/8RFn4g
 IAdgiVmT+cWyRzJQj1eYvcZjYuXTExKrAIxkUbrVLONgbcFkjLrvQ6bvgr1JUOoNkP1j
 DoGc5ugdGlL+d1ivIAQ9K+C3Se2pt1D69AU/KJB5VST8BFeYo+mZX/CBu7/VFAPgh/Ur
 4WIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/nrtdkevf0OZcjEKJIJWpCQh2RMNXdfD/MsIgEWmHBV4hp8tqE55F+xVMV1l6TPDB+ci+VqIDg3g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4a1hRLx+wRCe68lz1rnip68OGoO7V7AO6X6JkQf06AnkX32jG
 R9n5V330kjYz892SOa+KUnweC0/yW+IB//iMhMFgNnzcmlw0XokDv8Fr377zkA==
X-Gm-Gg: ASbGncseeY/1W0MMey5gD6lQBI+d6YBXc63xnIAXQ3eCDGkGRhzzHXDjje97a/VJbyM
 pO7pE8/s6JzP1io3oMb2NesilmhBlUhwUNa5Uz1AgQ3Ws0QrUpbj3sRlsSlK/LT1HAeq7oygq4P
 mfr7NwEcV2qA2hOoAhC2KwBUKw4ZnVsCouzI122lkD0TVJmnIarBRr3eNeEdCMICcZdFEi9r+gJ
 ZRXwaG0oC/A+9hLXAzOBTneybjsabbvdkY+zCCfRrdkRQuLxGQ19k/cn2aTxFbbpnzJtw0qKy9o
 TswHEwfJCAzhvnt/dzdzddMo47yQupE9xKHqGh/eZke5MpHpd9o=
X-Google-Smtp-Source: AGHT+IFMQSwG953UmleiV3vpPAwHoxlZH/iMMhNJKjUMlATR2T7nO55O+6S/ZKwwslE1ps7WqD/wgA==
X-Received: by 2002:a05:6122:1682:b0:516:1b30:8797 with SMTP id
 71dfb90a1353d-51d5b377327mr37152727e0c.11.1738076935717; 
 Tue, 28 Jan 2025 07:08:55 -0800 (PST)
Received: from google.com (34.178.186.35.bc.googleusercontent.com.
 [35.186.178.34]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-51e4ea360f6sm1767645e0c.10.2025.01.28.07.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 07:08:55 -0800 (PST)
Date: Tue, 28 Jan 2025 15:08:53 +0000
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
Message-ID: <Z5jzBe48aaImd4F4@google.com>
References: <20250127235956.136032-1-pazz@google.com>
 <Z5irsdEc6Ex2v_eP@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5irsdEc6Ex2v_eP@louis-chauvet-laptop>
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

On Tue, Jan 28, 2025 at 11:04:33AM +0100, Louis Chauvet wrote:
> On 27/01/25 - 23:59, Paz Zcharya wrote:
> > Add support for pixel format ABGR8888, which is the default format
> > on Android devices. This will allow us to use VKMS as the default
> > display driver in Android Emulator (Cuttlefish) and increase VKMS
> > adoption.
> > 
> > Changes in v2:
> > - Rebased on top of tip of tree because it has been 3 months.
> > - No functional changes.
> > 
> > Signed-off-by: Paz Zcharya <pazz@google.com>
> 
> Hi Paz,
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> When applying a patch I got a small warning about a missmatch between your 
> author email and the Signed-off-by:
> 
> 	-:106: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Paz Zcharya <pazz@chromium.org>' != 'Signed-off-by: Paz Zcharya <pazz@google.com>'
> 
> I can fix it for you by adding a Author: / changing the Sign-of-by before 
> applying on drm-misc-next.
> 
> What mail do you want to use? pazz@google.com or pazz@chromium.org?
> 
> Thanks!
> Louis Chauvet

Thank you for the quick review, Louis!

Let's use pazz@google.com.
I apologize about the mistake -- I'll make sure to fix that in the
future.

Greatly appericiate your help!

Thanks a lot,
Paz

