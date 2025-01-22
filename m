Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FF2A1A268
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8EB10E7CE;
	Thu, 23 Jan 2025 11:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F6C10E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:08:41 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-5f2d7868ef0so1572517eaf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 06:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737554921; x=1738159721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUsZILg04LBQFCRWPVTFinOLS6IN3xH4se1RK1RCM4M=;
 b=CyL8/90iufvQU+o3gOKtEgC8IHQ9VxPTlj/x8etKfwywQDLLuQsfbvWGh4htbBsaCg
 xsRWsBoH2cyI6RFNLR5VCvpfiE9aabKyoEVofmyZueS6EYN7YWVNj774mfksr3Em39ni
 7uIpAnWcsb9sxnlK1fdF/48bz8UzA2VTolBpDxrC5Q8iPpMgNcUagGHrHqmhj9AKv5Oj
 NhrLtHl50R13KPW/7tv2ryFog7l/IRIz0FkURGoe+EEkWDAQeDG5UdDldEDzjOq3et/W
 BcWe/+dgFiVd1ouhdV22vIDvSHfhD3MarvthFIlG9HroR8moP76HBKYlX7ck9ZU78E43
 uEfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY+JlBFza/dh2n+UdSCeRjXVGA1aPZkqhCCuj4UNn5rWDO2WReG9Jk24GhmFkvL53qZeIC8DX4eAM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyrfH5rZYifMMKeS3bWMvvjJjxELtC3RwreUgsNZnVNKJB8K6W
 9dN6ckX+G/U5xeQ2WpqyRIWDNwiHyopRAeTRivY4CK8AJNSZYwGE
X-Gm-Gg: ASbGncsUkBP2QsJWiO5tpZKwQaH5B1KfqtbU2ayky5S8ujodDcO2LK13m28rjbfDRzA
 gBqueIM+56cuXzwPtAkZMmarXk4s4cmS37r/xs1xsj3tVPIKbksA0lTQbpB9JIizuMV4mmMfZ4A
 hSgB0DKpU543GMAh3BkOqHcivAh0Xo5OX54yPU1SyI1aSX2ygdMjJmlj/eh+WTGzHkxh2TaCZw6
 KjnpDdgsoBNyI2yWHLv4qdsRNb8P7bnBpRvpBg61Qf6pKg3lF1VbodJk+xufbV7FYCieyM=
X-Google-Smtp-Source: AGHT+IGfAvOK55beICDEA/0h82RSyrSDzji6k3MNVa68JbP3M8X7iR9wX04dKNl8O2Br2xZ1pdy6Rg==
X-Received: by 2002:a05:6871:3a8a:b0:29e:4bc4:97ca with SMTP id
 586e51a60fabf-2b1c0a46950mr12209143fac.21.1737554920684; 
 Wed, 22 Jan 2025 06:08:40 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b1b8d54635sm4404581fac.30.2025.01.22.06.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 06:08:39 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: tzimmermann@suse.de
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 fewtarius@steamfork.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 uejji@uejji.net
Subject: Re: [PATCH 0/4] Handheld gaming PC panel orientation quirks
Date: Wed, 22 Jan 2025 14:02:37 +0000
Message-ID: <20250122140258.51014-5-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aabd8691-0797-4ee2-a49a-d26c99329f32@suse.de>
References: <aabd8691-0797-4ee2-a49a-d26c99329f32@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Jan 2025 11:02:12 +0000
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

Hello.

My sincerest apologies.

I used get_maintainer to populate the recipients for this patch series,
but I must have made an error somewhere.

John Edwards


On Wed, Jan 22, 2025 at 1:55 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> (cc'ing Hans)
>
> Hi Hans,
>
> I think this is for you.
>
> Best regards
> Thomas
>
> Am 16.01.25 um 16:50 schrieb John Edwards:
> > Hello.
> >
> > I am submitting a small number of patches to add panel rotation quirks for
> > a few handheld gaming PCs.  These patches were created by the SteamFork
> > team and are in daily use by us and/or members of our community.
> >
> > Thank you for your consideration and for taking the time to review these
> > patches.
> >
> > John Edwards
> >
> > Andrew Wyatt (4):
> >    drm: panel-orientation-quirks: Add support for AYANEO 2S
> >    drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
> >    drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
> >    drm: panel-orientation-quirks: Add new quirk for GPD Win 2
> >
> >   .../gpu/drm/drm_panel_orientation_quirks.c    | 34 +++++++++++++++++--
> >   1 file changed, 32 insertions(+), 2 deletions(-)
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
