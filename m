Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061523FB186
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 09:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344F89AAD;
	Mon, 30 Aug 2021 07:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9129989DBC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 14:09:58 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id a21so7429950vsp.12
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XQqfOcrgvGQFxmzjb26+cbMJngnaK2+9xTPqCJOikiM=;
 b=UDc626PxC51OwH9gX4JQESyo2dgiR4QQyZgyiuiCalVZWqTikI/q4Evodu5QpEhoSh
 qPGqhFSHxJ8os6S8UY8yjc1VUB1+LrTqOfaujxVSWCyqYFxThi5qdBymslCB0n7fKrsY
 PJwbyOmG5thHYq3pgwNNjjp/ZxQoYnJJA48b3vr6OQnKbUCahAvsH1h9pz6/BvOAWp49
 AML3TzL1PwBDzkLwDZbXzGfiT6ZcaRMVm1yR8wfm4rWGZWg1IHDi7VsrH8cjqafY+6DD
 gXGCmY1Cf4C+q+nX2pQt0TZzD0YtnjzgdLSvn90iUa2U46bNe9kgktFr9YcSgHiksW+y
 Nuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XQqfOcrgvGQFxmzjb26+cbMJngnaK2+9xTPqCJOikiM=;
 b=UaolxWU3+dtvH+t1eMOL5pwHv1DnEg64ZHlP/2KK0CvdhfeEnE7l9nW3A7RlZwr0bx
 rFvrhJCBsmRV39Wdhtx7vzAKLxvzwNQhTFmAZHkwHYcrkOMUKQKB8Iyg7eSf9yAH6cLY
 RoNIoFICsf3fWH7GCURKgEdr5JqEl8DwRmKWKmN3T2MPb+CvQLT8Da+WXRzoGJpeY436
 M0Q16hC349qQ+0wO7MLY6mLpsCseXNpEFtts4D1/ewm6RjCxfdl1gMeaJwuP2CKXfHfb
 q2q5nam162oivYxeEonX7sUWOdLDG3Nt2/GQyiODGuBuWRGG7HsuzHjMAEqfCLWSiGiq
 7wTg==
X-Gm-Message-State: AOAM532YuSbL0xnpxbnwj28B2jWnALAf9V7B2UtFmbFyJkmA1xIuB/Kr
 pacccYXCqAjrjj2iaTkSO0Jwi3Zv9otMUUbfi1kIVlKarNMtDg==
X-Google-Smtp-Source: ABdhPJx+7iNCG4T+fe8n5dvfEJcQuFMTT3HJOoSljAOJ+8HNrgiIE6o8xsIwjPwKwTORwV6aSD85ZY/ogSakaD/yKDs=
X-Received: by 2002:a05:6102:10c7:: with SMTP id
 t7mr12125426vsr.44.1630246197419; 
 Sun, 29 Aug 2021 07:09:57 -0700 (PDT)
MIME-Version: 1.0
From: ahmad almhmwd <ahmadalmhmwd94@gmail.com>
Date: Sun, 29 Aug 2021 17:09:49 +0300
Message-ID: <CACPq+yMaiv=DL+ocKnzsYM2gfdEm4hUquosHfkm=dkc=_n2cyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/etnaviv: fix dma configuration of the virtual
 device
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000007e620405cab345ad"
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

--0000000000007e620405cab345ad
Content-Type: text/plain; charset="UTF-8"



--0000000000007e620405cab345ad
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--0000000000007e620405cab345ad--
