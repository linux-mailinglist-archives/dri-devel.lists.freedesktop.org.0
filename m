Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB67825482
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 14:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094C210E5F6;
	Fri,  5 Jan 2024 13:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5709E10E5FE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 13:33:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e5a9bcec9so1994041e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 05:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704461620; x=1705066420; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kDa+bWPe+L04ie3zk0iYVMfic3JToEuuY681zN4ite4=;
 b=T5j7fZTtDKjWPuY2lHL5iC6qWdKcRWbxOPKs5a2u2enADfdGqHloqYI8H0B88PpoGw
 boW4fVBrnFsT1wknN6FSCzc1+Q+JzDVKH2NOdnS/VJl+Jhk2HiqfSdJ6H9fGwAqp0xPL
 wBE4OZ5kkZdUwh9oo0hALd+UzNFZl4+ZZvU3EEpniGM2T0p9PzSYd+dKgq0nFNouBlsj
 MidUaCP9FHa9tQpLeqS+mKPchzndn8aLJKVbi0rUqPWvf98Vq0tYInw3VmTNUCHZaucX
 gddLnG0cwtybJwviWp8dogD029caMxCHV/PtG9+HFdrGFz7nbD0NLYJwv7YF3h6F14wW
 f3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704461620; x=1705066420;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kDa+bWPe+L04ie3zk0iYVMfic3JToEuuY681zN4ite4=;
 b=CbEsV6Cou5qAWWdQK62xngKgLq6OrY5x3mGq/po8za5Mm8A7KJCUUv1dmYI16zwyI/
 7r+O8d6v7huMAY36bOkQ2Je4u4jBYuqyemDCIBP2ebuhcw5GMZYWY9+gW/xkmlgpgtMz
 2Yr3gdP9J6g+7FmyEwHaNbBm446uyC+DPXPxRmiLoVsoDJDU+zMkw7RR9lUXsCeiu2FC
 tNEoMyl5iBxhOMTSqG5kxz7iEsUKk17grnwiKbFJEaaouxOZqUpp1+a46jIoid6nlyW/
 2MUSJhNLvE5gca/r4r3u+PWwbGVYRVHVaD0Sk1lHYQ/FBGX32TI7EIlDwTIMG7lWknjT
 OYKA==
X-Gm-Message-State: AOJu0Yy8XTwE6T1nkiUX1dG6ohSkdC3ZM5WS0pq05VlS9VA1a0h6p61b
 TA4ugQKL1RDPeqgWVD6pvXVnOgJdZfdlZw==
X-Google-Smtp-Source: AGHT+IFDQ3SG6UVtfNOkwiaxL0QSV7wBjlFD1egz8ghv9s8qQkWEB3MWi8R2qERtMrvIa/Q2X1JElg==
X-Received: by 2002:ac2:4c33:0:b0:50e:3158:c53a with SMTP id
 u19-20020ac24c33000000b0050e3158c53amr1083112lfq.124.1704461620475; 
 Fri, 05 Jan 2024 05:33:40 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 t20-20020a170906609400b00a28badcf367sm897949ejj.54.2024.01.05.05.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:33:40 -0800 (PST)
Date: Fri, 5 Jan 2024 16:33:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: peytolee@amd.com
Subject: [bug report] drm/amdgpu/vpe: enable vpe dpm
Message-ID: <efbcd813-8f22-44ad-a6e1-6bee6d3bb18c@moroto.mountain>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Peyton Lee,

The patch 5f82a0c90cca: "drm/amdgpu/vpe: enable vpe dpm" from Dec 12,
2023 (linux-next), leads to the following Smatch static checker
warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:62 vpe_u1_8_from_fraction() warn: unsigned 'numerator' is never less than zero.
drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:63 vpe_u1_8_from_fraction() warn: unsigned 'denominator' is never less than zero.

drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
    60 static uint16_t vpe_u1_8_from_fraction(uint16_t numerator, uint16_t denominator)
    61 {
--> 62         bool arg1_negative = numerator < 0;
    63         bool arg2_negative = denominator < 0;

uint16_t can't be negative.

    64 
    65         uint16_t arg1_value = (uint16_t)(arg1_negative ? -numerator : numerator);
    66         uint16_t arg2_value = (uint16_t)(arg2_negative ? -denominator : denominator);
    67 
    68         uint16_t remainder;
    69 

regards,
dan carpenter
