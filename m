Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C744EADD205
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 17:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E8010E780;
	Tue, 17 Jun 2025 15:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WZHbmXQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ADC10E78C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750174677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=C8v5tWfo/g/a9ZVbc2bzUPGkFbC8TCiNtrao35Fyruk=;
 b=WZHbmXQ2JY41XSCYOM1apF7H7b3yw9y0rzkdlE5nR4OXhqGbaTMZKAJNOV+J5q65l4OBND
 LYUu040tBm6cIFqmDp1TnTaX805Rx2mLTxP5GqTVPLWuknv5q8TJnjLPOXNdra6i0Z1NJa
 /lZBP3SfD7LTBdFdF6hwnt3eM+weJxI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-0WoX9dzOM7WhU9y3cmOfNA-1; Tue, 17 Jun 2025 11:37:54 -0400
X-MC-Unique: 0WoX9dzOM7WhU9y3cmOfNA-1
X-Mimecast-MFC-AGG-ID: 0WoX9dzOM7WhU9y3cmOfNA_1750174674
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-70e5e6ab756so82427867b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 08:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750174673; x=1750779473;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C8v5tWfo/g/a9ZVbc2bzUPGkFbC8TCiNtrao35Fyruk=;
 b=xDojUBIc/BZTwu1mjwCccOKDXQiyQX7w10H0LGKmmCBSkYQB44t6zIbszKAA9ZSSd6
 2LcW2zhAwSW++OkjGc9A8ntEWbrIV3GU//yW2pxqdh8GakFQH1YUQDy9evWjPtPPPmzS
 LvQwvVqQg3iZkrPcScMFR5zl//w66vKXhWmnrTLwkC0M74ccD/mrQtEXHI6tx9qGEDNN
 iieIqj5N9CH1RJBasPxRJdEwnvCtvrO6TkMd+JekbovyF8a0NhN0LEZiZz1Og0ynSIy5
 +p1HtwAsQDHtG7pEsWcD1WaSvL9mh8RAuk8vR9AnpUwv7BJZTK5am67miz5DBdgxyWI/
 P73g==
X-Gm-Message-State: AOJu0YzwyGXfDCx7wIEeZ77GHqyk40KISAvVuaUhlwjAvioRReruDVqn
 zo0rf4ih8YxToA2Uov8878q6SyPyOl7MOOIQIz9g7efy4zalbx/yM6olrp4gAbzfOmdSnJ/SvLy
 YCBQcSt6B42fgFSoGFWzV2CWQxLTZvYZAfpUTE0MdlM+/kKeICwpYdEC7XAGJw3EMjbrdt80A3j
 tuVmiyq2hp/dCxx0m4t/LaPP85sXnYI/JdV1O718FrxMn17km3LDZLzlg=
X-Gm-Gg: ASbGncvVOTNaMEilbTMVnTl3iagV56eiqXDn8F0E1XOPbYNDy+L6d3Z5JI+AOtzPqk+
 hGMzQScNiC06UNqJ4Y3zWZXjX1F5nCqTT06QkMOBQD3C10wzm9OSJ80rkNML6/OMnZXpRMVVSiS
 f8qQ==
X-Received: by 2002:a05:690c:7305:b0:70e:15e7:59e2 with SMTP id
 00721157ae682-7117541a96bmr192162067b3.24.1750174673669; 
 Tue, 17 Jun 2025 08:37:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJPFiJcZatMHcketY8ifSBxh/YvzfomCAKMEEwHH65UDQMnnq2oQNg9s0vWjyXvSBLvKz7h2lnOtJmYOehWTk=
X-Received: by 2002:a05:690c:7305:b0:70e:15e7:59e2 with SMTP id
 00721157ae682-7117541a96bmr192161657b3.24.1750174673319; Tue, 17 Jun 2025
 08:37:53 -0700 (PDT)
MIME-Version: 1.0
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 17 Jun 2025 10:36:34 -0500
X-Gm-Features: AX0GCFtPpQ92rrNx-chu_YSoXo-zQqScn-G-Pn2KDG9bWZLCOEdDMjh0dfMZg_Y
Message-ID: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
Subject: bridge/microchip_lvds panel usage
To: dri-devel@lists.freedesktop.org
Cc: manikandan.m@microchip.com, dharma.b@microchip.com, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jr0BmPayxkxRsufHgyNyB_0sgefQ17z_iLaXau13wCI_1750174674
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b2c99b0637c64b8e"
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

--000000000000b2c99b0637c64b8e
Content-Type: text/plain; charset="UTF-8"

Hey folks,

Can someone please explain why the driver looks for a panel here:
https://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu/drm/bridge/microchip-lvds.c#L182
and doesnt use it or set it up anywhere?

I bumped into this while working on converting of_drm_find_panel() callers
and the lvds->panel usage in this driver felt off. Am I missing something?


Thanks,
Anusha

--000000000000b2c99b0637c64b8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey folks,</div><div><br></div><div>Can someone pleas=
e explain why the driver looks for a panel here:</div><div><a href=3D"https=
://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu/drm/bridge/microchi=
p-lvds.c#L182">https://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu=
/drm/bridge/microchip-lvds.c#L182</a> and doesnt use it or set it up anywhe=
re?</div><div><br></div><div>I bumped into this while working on converting=
 of_drm_find_panel() callers and the lvds-&gt;panel usage in this driver fe=
lt off. Am I missing something?</div><div><br></div><div><br></div><div>Tha=
nks,</div><div>Anusha</div></div>

--000000000000b2c99b0637c64b8e--

