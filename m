Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D6E87F04E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24F310E3A4;
	Mon, 18 Mar 2024 19:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7JCGARl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8F10E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:18:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-568107a9ff2so5694645a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710789489; x=1711394289; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ytr//eYLa1X9g4yRUoGqc07iAQMxraS4lWr+6zqSZyM=;
 b=I7JCGARlkGbESwZnNNLLM9NMmyWANpXuNxiQ/ziZrHrdurWO8NhKUZ4BVVS1mRc0XG
 /USOLYOUzq/XaBL0oQCpP318dG9KxCrzUOFK5kko/rcS0yNm91frLCUBjao8ErT38qFI
 azPjUtTLedkQIhwiuJPhout2yrzmHahnT8iIVQxpi+F3Spm6bOFIdb4z1oUJuzatJ+bL
 XjMuTn/LMD1fALSUumPnN/hnOnOeAW3aFbK0TjadlYnIuzzQNWfvCb9eZ2uROdRYK1q7
 D9HtvBhS4zqWltOo187hKS92LHztU2XnqoA13JfpGDsasLLb34JD0WH0l5q3Cc3XGPEB
 TXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710789489; x=1711394289;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ytr//eYLa1X9g4yRUoGqc07iAQMxraS4lWr+6zqSZyM=;
 b=KsGZ0PNnRvYD0D1ovhSufGyPcOwqpMBZWrBg5z1UtD6idK6N5Z+7KPyLoj6zGDOE5b
 nRVeWV3XoMkj0cS5ZG3lWU4JrWXHJiJOtVA6dfrc38GgU7yZ9T7nHwozjEB9EDkd05id
 fsoRbvn6q+BRThra+U1G1RAq/cyBgfB08fRxYJq3rZgn5yCrKqjT8tCjjTeRCP2JfrRM
 981AdJTwYlpySrDNWm4osSsdJTYTVHlikxqSrK9YUsUHNJWc0VovpkhnCPMHVOFbPHgP
 2eABE7jFjH6+sd3Ih1BSnh7J8D/S3p0/Ai/dp3Vs8KKUfp8XTomHF1loGznGDcGwrieR
 2MLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfGZ6LE4cm9QtHjr66azWTGrQHAekG1zo1EEa8jpUdKa7Fy/eIYQUJODqtRMK2CWhVrVeD/Dj3J5l94aBr6QkimEzfBZfuP6BS0N3PbquF
X-Gm-Message-State: AOJu0YylXnvB7ZwVDayl6ijgU94VolIbsIXPqMojKybXD/+E3GmCsNuE
 U8W9pdAJzBZI84iF0gZtyB7fWQNw86b5xsFJk1mvcqgUBn68Fwpj
X-Google-Smtp-Source: AGHT+IHFNe/O+tX4h5VGoYJIzSrXl+++Oc4jJ+ncJl/8H9PT8sRcu+e+VkZBVlNdhHtYXHeVMAtjWw==
X-Received: by 2002:a05:6402:4290:b0:565:980d:5ba9 with SMTP id
 g16-20020a056402429000b00565980d5ba9mr7420101edc.32.1710789488644; 
 Mon, 18 Mar 2024 12:18:08 -0700 (PDT)
Received: from mehdi-archlinux ([2a02:8109:aa27:2d00::e094])
 by smtp.gmail.com with ESMTPSA id
 ef6-20020a05640228c600b00568c2ea2cefsm2630438edb.51.2024.03.18.12.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 12:18:07 -0700 (PDT)
Date: Mon, 18 Mar 2024 20:18:05 +0100
From: Mehdi Djait <mehdi.djait.k@gmail.com>
To: tzimmermann@suse.de, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: drm/tiny: QUESTION: What to use instead of drm_simple_display_pipe ?
Message-ID: <ZfiTbYAa7qxXlrPd@mehdi-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello everyone :)

I am implementing a tiny drm driver and I am currently working on the
V2: https://lore.kernel.org/dri-devel/cover.1701267411.git.mehdi.djait@bootlin.com/

I got a review on the v1 telling me not to use the
drm_simple_display_pipe. Can someone please explain this further ? Or
give me an example drm driver that does it the right way ?

--
Kind Regards
Mehdi Djait
