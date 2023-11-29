Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B757FE370
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 23:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6762F10E699;
	Wed, 29 Nov 2023 22:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D035A10E699
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 22:44:05 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2858eda2919so80655a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nelint-com.20230601.gappssmtp.com; s=20230601; t=1701297845; x=1701902645;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfr5wx5GyK0kvpGE0NyCez6ovV8Gwb7uxSqXbQ7mH1g=;
 b=QT/Ul36KPRPyMKsJBhhZ7TCAQDvDTixTRjFfc1uTza021/aJD3i3ihsusDc+G7dXm4
 5sEB3rsPtY+LIOfTgFuVeb7pOMZ6vmw4c5l+mlw7bLdSxsabQ5ASC24nGEFJYfOqw2QG
 6cm4JSqiQYpOIevtFF2aiaLBx6yfFfFh1djTGj2WzYnAgUzYGNTSxf6zIjMg3GeRwQ8x
 1X38RaS8I5/lrGHU1qBHNTmLjP9ogLi5pus+PYLHKn+ocSOjspHF08IV9lFEXRo9nPTr
 Rht1KiCzCtem0Pm/pakHSzzG4h6qVIHCiFw2uQ+r2Z8mDM1K7Y6aoOgXUVzuUBOy5OWF
 CXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701297845; x=1701902645;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zfr5wx5GyK0kvpGE0NyCez6ovV8Gwb7uxSqXbQ7mH1g=;
 b=Yewo1IWkqdfV+TwmtAmnGmakBol5D4DxrfG4+Ai88HY+LlCZ3iys8v8UJIOUjw2gd0
 ShUMsa0lKf8IA3PEzANqmlrLqDkqCLpvGGis0cTyBmmqvNUnT22EZ2GhjRVNHRlGMILX
 22lIinYn55Rlfu/Ojzc+izvZKG0PHi26DgI8a+ItG7juWhKSfA7Bql39eXJlskVZTarl
 eNPzhiHSIcsYDv3Piup1LPTthwYsk/xJM4rJ+NlqHeNRX6rNvj3cRAjXJC4swqQA0Kc/
 QCuqDPVlN3XkgqsL+ppD452w84aXivNiCLRE+6CNUs+3VfS2THT/eT9Z7x6MudecsbkT
 q0cA==
X-Gm-Message-State: AOJu0YwH7fkjOcn5k8pb9lydCLLHHeymG64x5tvO/hZNrxQ1WInd4Feo
 zffBTi0JhKcCwy5ei6QCBRqhTuUFOv2Q+aQhUrw=
X-Google-Smtp-Source: AGHT+IHYjvZQMd5o7/ta34vkX7EIYp/2H3ujie4yH/wViRFN4iG4UCG5tUcvxRgkSWNyF8Hn2Yg2Sg==
X-Received: by 2002:a17:902:ee84:b0:1cf:636f:1bbc with SMTP id
 a4-20020a170902ee8400b001cf636f1bbcmr22591827pld.4.1701297844799; 
 Wed, 29 Nov 2023 14:44:04 -0800 (PST)
Received: from ?IPV6:2600:8800:1715:bc00:5dcb:312e:65fd:e00?
 ([2600:8800:1715:bc00:5dcb:312e:65fd:e00])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170902e5c500b001c62e3e1286sm10247607plf.166.2023.11.29.14.44.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 14:44:04 -0800 (PST)
Message-ID: <96343bd1-2c61-47da-965f-26bc385ad268@nelint.com>
Date: Wed, 29 Nov 2023 15:44:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Eric Nelson <eric@nelint.com>
Subject: fbcon on one of multiple displays
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi all,

Is there a way to configure a framebuffer console on a specific display 
on a machine with multiple displays?

