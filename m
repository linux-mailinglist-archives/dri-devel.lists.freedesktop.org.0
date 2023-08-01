Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B59776C633
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6A910E4CA;
	Wed,  2 Aug 2023 07:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6A010E048
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:30:36 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-686b9920362so4482627b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932635; x=1691537435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zaHWiEW/Me3thxkNJ56r2Pyq80QApvWwI2tz1dQNoc=;
 b=cBjXpxxw0AtY1hTOCWyN1k+FZrG74Ps+bAvg2BJm6iNewS4PeKBRBrSE9tQ8zSKkUS
 EWaCe+2nOIZYrvJiC9cNmI9GLrELxOM8bEcS9mQP4M8dnWz8DuP7/KcxFhg2ElPDJhAL
 /nXID6ZjRKSP4UlqUnogyZT9afGlN4YnMTQO9iz2Y3rFjB+CZKLstPje7XLn3qCe2Jt5
 Xbq6SNZFaYXu8pGm7bbDyKzV8gQDDU/BWT/AisnJfg/M0KSmFcp3D9PzNtKpammQDDQT
 YvSCcv1GKEQ5ORnz/FFdE4HU2dKM/DUuXvfzOfxjpuRDnbrj4uMaoPZfOuWPqUBfBqwf
 p9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932635; x=1691537435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zaHWiEW/Me3thxkNJ56r2Pyq80QApvWwI2tz1dQNoc=;
 b=gOJOWsDLyUcOx5TT2eVxfmfU4me5ckP5vvmdcPlU0Qz80w21qdZZ9iKA/8zHhiIon8
 izyxpodPOxxO52TUKDnrOJp/GO0LtGWbBqSD5ANfXDm2Ce1aLqZ3ROt01IWf/MS2Mj7L
 2SLsvMbDrgZbajw+L8idRTqHpXUB99CbtZxSawxLn49giQrrbr6/ZXMIcYgmkWHVTqbt
 /FZRtZwqJ7d3CPekNZp56I36oWuUVVs1QFvMosoQqWijtc7ht2PrqYnsKOqq+9n4CCmv
 zBF0wKGG9AyNHmW5VG6IMv4qPSctNBjHMpSoqPBzEIOPNtwNOj74wLlspVNXEb7nmkHZ
 LV5g==
X-Gm-Message-State: ABy/qLaBdkRl+2cu4hk3YypVvblmRIwWwWgrOVQxxRziwfV/3Go//lyS
 qpshIdUYqYPWxZSPCCaMRH8=
X-Google-Smtp-Source: APBJJlE3ZqHkOO61oFs8tDICIrSP5akS6ruW58KYc0SCnq9Pny0BzCcci9zeZj3GF4tS8mIdXNUuqQ==
X-Received: by 2002:a05:6a00:c95:b0:686:6fa8:2b0d with SMTP id
 a21-20020a056a000c9500b006866fa82b0dmr16652018pfv.4.1690932635454; 
 Tue, 01 Aug 2023 16:30:35 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-73-13.dynamic-ip.hinet.net.
 [36.228.73.13]) by smtp.gmail.com with ESMTPSA id
 y15-20020aa7804f000000b0066a4e561beesm10127615pfm.173.2023.08.01.16.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:30:35 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: minhuadotchen@gmail.com
Subject: Re: [PATCH] fbdev: fbmem: mark registered_fb static
Date: Wed,  2 Aug 2023 07:30:31 +0800
Message-Id: <20230801233031.72174-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731162812.25518-1-minhuadotchen@gmail.com>
References: <20230731162812.25518-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:14:07 +0000
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
Cc: linux-kernel@vger.kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>Hi Helge,
>
>>num_registered_fb is still used in:
>>drivers/staging/olpc_dcon/olpc_dcon.c:  if (num_registered_fb < 1) {
>>
>>Helge
>
>Thanks, you're right, num_registered_fb is still being used.
>I'll check this patch and submit v2.

Update:

num_registered_fb and registered_fb are used by olpc_dcon.c, However,
olpc_dcon.c has been marked as broken [1].

I do not have the knowledge to remove the dependency of fbdev from olpc_dcon.c,
I'll leave num_registered_fb and registered_fb as-is.

[1] https://lore.kernel.org/all/20220609223424.907174-1-javierm@redhat.com/

>thanks,
>Min-Hua
>
