Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A7287F05A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6341210FDE5;
	Mon, 18 Mar 2024 19:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AyueREGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C8310FDE5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:21:50 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5148ea935b8so1018480e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710789708; x=1711394508; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=euQVyNb7pnK4bYmyXoWjONnMEhXoEF7EGsu6/hlhooQ=;
 b=AyueREGc8t3WAl3V8kWQWYa98t+U61+sOt8n5o2que4jsjXTTpah30/UXQK77UvgOh
 a4W9H96C6RnZc3uFbVvRZOOmDJEjO9vRRihM9mkilwPejis2oO8HmaTCbiZruNmx/L4T
 PIdQUN6QxmrNDt+u8KAJofLitC/7LvBuqMyXzNV1vFgdspGJMCaBNiPfcvts95tuPEC7
 3D81BLu8b+mTZZ6qHkfP0Mu3XapziX13ahAn97DuU9Oi2wGqX2BxdOafJQJQ1ShZVXL/
 zvxw0zIsCfiqYAmFKnDxT1DNNrFCbYdmcMTZS2wdp828ncvI0WFCZB8k9aAWku1JGC+9
 jxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710789708; x=1711394508;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euQVyNb7pnK4bYmyXoWjONnMEhXoEF7EGsu6/hlhooQ=;
 b=ZzQWCOJwjNQSvkJdzvAFBv/4Fi8Awead3HxulI95TRRJMJrfLE2ePF0Ua4bZUQFZXI
 YgZ0WnANY9UHWCXW68irxstVRJ+ygir5qnq+5W4aqsfX+w7JOUFy8X+eMgblohBNyJgP
 G3Y+DySNIoe7yWMx4K0OUpiawSwFkSbaQfLktdvJfA63Dk6oftX4INl9P3Nm4Zt6WmU3
 F/xjm1JSJV1BNPKtsjry61HQEP78inOCe/u8AV026ntatdwNbc9EZGeStxHDWTbmJTRm
 E0anrOYGEbgH/BdD8BnyuJAxwH/atC6Oc1Y3kE5pvKwnlr1Z5e29CUaGNICXxyb6ZI5U
 X+0w==
X-Gm-Message-State: AOJu0YyvLK0kfmzAvRlFSRzrZP89C+eWEaKAjS/Cnge9+KTs9PUtETRK
 gQ1seoIfVlQ2kYJmJ7u3TPWmse3mZlr/YkXZASRgm2vLysVMZA99
X-Google-Smtp-Source: AGHT+IFzlUzULLvziB7EIXKLti/g36Z9oDR1evlsr8YKyPFcym7N5T2p2fbqRasSOKvh3O6acV9qdg==
X-Received: by 2002:a19:6914:0:b0:513:ec32:aa86 with SMTP id
 e20-20020a196914000000b00513ec32aa86mr298754lfc.1.1710789707650; 
 Mon, 18 Mar 2024 12:21:47 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com.
 [213.67.237.183]) by smtp.gmail.com with ESMTPSA id
 k8-20020a0565123d8800b00513c7c7879fsm1665711lfv.259.2024.03.18.12.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 12:21:47 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2] helo=ester)
 by betty.fdsoft.se with esmtp (Exim 4.97.1)
 (envelope-from <frej.drejhammar@gmail.com>)
 id 1rmIYM-000000004jv-286r; Mon, 18 Mar 2024 20:21:46 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Cc: dri-devel@lists.freedesktop.org,  Jyri Sarha <jyri.sarha@iki.fi>,  Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  =?utf-8?Q?Ma?=
 =?utf-8?Q?=C3=ADra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/tilcdc: Set preferred depth
In-Reply-To: <ZfePYNWY5_1XwS_A@pek-khao-d3> (Kevin Hao's message of "Mon, 18
 Mar 2024 08:48:32 +0800")
References: <20240317033918.535716-1-haokexin@gmail.com>
 <kh6h4bra6.fsf@gmail.com> <ZfePYNWY5_1XwS_A@pek-khao-d3>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Mon, 18 Mar 2024 20:21:46 +0100
Message-ID: <kle6f8hx1.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi, Kevin

Kevin Hao <haokexin@gmail.com> writes:

> I had also thought about a similar modification before, but personally,
> I considered such changes a bit aggressive for a patch that needs to be
> backported to a stable kernel (especially for a LTS kernel such as v6.6
> which I am working on). That's why I opted for minimal changes to fix this
> regression, reducing the risk when we backport it to the stable kernel.

Personally I only work with the latest stable mainline kernel, so I want
to fix both the regression and enable a 24 bit color depth...

> Additionally, my patch and your patch don't conflict semantically, and
> setting a driver's preferred_depth shouldn't cause any other issues.

True, we'll see what the maintainers say.

Regards,

--Frej
