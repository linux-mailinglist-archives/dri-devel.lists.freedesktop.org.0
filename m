Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5C3FB185
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 09:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E465A89CF2;
	Mon, 30 Aug 2021 07:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B3D89DBC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 14:14:27 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id ay16so2141358vkb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EGDNt9MP3xwS63RpDootvp0ZtjPO7YHOlfQjp5wm8Mo=;
 b=m2CtO2s27rMeIzOxokgGCDwol12sUTm7TyP9wdDfTEqJNs1tbbAlwo1xmNWRTLgU/G
 mJl//dCHzkZf1L8OwivhH02QmGinJEdwjg94Tc62Ak/PJ/udNdqe3gxWXRUxUzU0dBYt
 5L7i+GClsIQ6u4pm6pj5Nmjt76MZ/mYWE8QYgcJuu8IavQXj9U/xR8BXBWcmNtZ1/A1v
 /cs/yMVOowJwSjZrVzsR/FYavcVJZvk+vl/IYPOo01wqks84w9YAA5vSr2lD8IHQ6q3C
 NWWDkJJmSHw3ddBFyqnsTbSG+7bc+ygkL0lqVb9sqswcsFAmA4lLH6haeGN2e2EpDiYU
 ahvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EGDNt9MP3xwS63RpDootvp0ZtjPO7YHOlfQjp5wm8Mo=;
 b=nx5U85qCyVzK9ysj1C/HHzpH+b+YlmA3xsmOVsJ2IuIFcaMVsLg7VUL7ftj/838yee
 pocV6ub08hnfwXEIXKqS+8UBdoSa/pZWO9mlld6LR6wfo3ubw2H2Fwbn6Oob1pxj46n7
 RuJJRJmi8oZm7GanxWRGgG9mVyyhsi2cBwocE1q5RUo3NerAWqwFdhy/v8bZYAQwMZKo
 SH4rSgTARRWu48AvA9QxaabluK6TmamWuIf5dOo5r2TDmpCMSkDbisapyAXzAVsU0kYN
 I/ZkfTwKV/eDU5INPpX1oXy6iUlb2ihZxsSg3rDSKqEuTWj6I+HEKtwQrqpSReWfbT1f
 7egw==
X-Gm-Message-State: AOAM532i76sjPmjDmMGiiWhP70de2HJxU85FaehsoQ/Wggz0heCAFIgT
 FGbDk7/oZJ/X7+LaBMwHaKxjDsnOsJrLou+9U23JVKstmxY/eA==
X-Google-Smtp-Source: ABdhPJxNdLkMoUu1yxa0LhuY+q8KUjMe+SZiu+QHCgzGzp/CyGKgwm7QzT1hIpPNestvHsEIcKlnXD5Ym1omIF9lmUM=
X-Received: by 2002:a05:6122:12ed:: with SMTP id
 k13mr198989vkp.4.1630246466503; 
 Sun, 29 Aug 2021 07:14:26 -0700 (PDT)
MIME-Version: 1.0
From: ahmad almhmwd <ahmadalmhmwd94@gmail.com>
Date: Sun, 29 Aug 2021 17:14:17 +0300
Message-ID: <CACPq+yN=R0UeOX352FtoHQZ6tHXEnrXQ6FfG9mQceSuvTHPCDA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Remove all strcpy() uses
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000008847dc05cab35563"
X-Mailman-Approved-At: Mon, 30 Aug 2021 07:01:47 +0000
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

--0000000000008847dc05cab35563
Content-Type: text/plain; charset="UTF-8"



--0000000000008847dc05cab35563
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--0000000000008847dc05cab35563--
