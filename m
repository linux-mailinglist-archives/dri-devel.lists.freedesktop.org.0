Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF83549988
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7DF10F020;
	Mon, 13 Jun 2022 17:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E6310F020
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:07:51 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 31so4441129pgv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eAH8FOzSxZNF4KtNc6UxLfkJY7ofAKT92ulnqloHmyU=;
 b=G2j5V4T3mSrSLcy/D2hdEh+Ny7FIJXBHTM+jqfw0dE589mimmnYbaPMGmA5f/w93Jc
 IaxYvmciVtsxRsXCEKq0dLnvJDgXWw4ECLjhbyEMQhCdAfY8hExHddKn+EMHU7IxTl85
 o3crQKW4TSQrcxr1c2vKHO4ga2mYiMyf8ywKLjYvtHpOYDJ0PlSdb6APFofTQUCGXfQi
 p7q0c7wcTLr8Ztij54+RmdIeBXRQ+8jyFiWXxUaoIRsUDcgfkLh6ZjTweAjVrgIA1gJa
 YTtrAj1DjPpXA8gyUMst55uwdyahoP4+tsMTJ77T2lfu0D8omV6nopOnifTvCo4RSj4F
 STEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAH8FOzSxZNF4KtNc6UxLfkJY7ofAKT92ulnqloHmyU=;
 b=cH5U4ovpX+N6/u7Meg7m4ehFpUIxbz3aOuImNr8ZJjLiitn8n8VcKMOH3y8oYTK4qk
 SgidQkkte8iy2ATVvd5lOBvHH6C9+8nH50Qx7k2VNU0h7dh996/DrG4CtShQSkmxBVRC
 OTkLX7BG222q23H/RjS/jQfzDpF1Ud6NB/jXE5lhbYyPP4OTdP0902bVrpZZyoKI8XUM
 Glj6NUHCFjkuCOQUsRs+ayVA/EJnODUkAJlJyV9i8mikk6uzQgzi+MVyPc38fod2G6e8
 H6C1PERlXsZDVDmir613NPAl3gVIHCX5/wLDi15h5FBpcUGQLEAqzabCyCn2AFOjBl2W
 kZlw==
X-Gm-Message-State: AOAM530XW4cKCM0rLA2AV4NiLzrQaw7fLBh5riuKJ35nNyGssQ7YAlVJ
 Ffvwg7Yo19nBTeVXtGoHIymZm+iuJvs=
X-Google-Smtp-Source: ABdhPJw17IOWEYRzt1gG8ccPm0koQcTR5jZhAT2yAAS5Qfjyots/7DwkmkQno3xELxU8GbpuMdyuIw==
X-Received: by 2002:a63:90c1:0:b0:3fc:7de1:b2b9 with SMTP id
 a184-20020a6390c1000000b003fc7de1b2b9mr521343pge.440.1655140071302; 
 Mon, 13 Jun 2022 10:07:51 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 a27-20020a637f1b000000b0040898e7e30csm1134969pgd.94.2022.06.13.10.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:07:50 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
 Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 4/6] ARM: dts: bcm2711: Enable V3D
Date: Mon, 13 Jun 2022 10:07:49 -0700
Message-Id: <20220613170749.237882-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603092610.1909675-5-pbrobinson@gmail.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <20220603092610.1909675-5-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  3 Jun 2022 10:26:08 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> This adds the entry for V3D for bcm2711 (used in the Raspberry Pi 4)
> and the associated firmware clock entry.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
