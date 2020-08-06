Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2C23D663
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 07:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABAA89D2E;
	Thu,  6 Aug 2020 05:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DD889D2E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 05:21:13 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id g19so35077568ejc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 22:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=LCgy1gxM30M22PIsWbId11v5IBUbSCtj3cxS/cRrXtE=;
 b=GirpY+wZXX7p6BoHdV2hswVVPptmCIgxr8Uvp1tQS47Vv9qlzxirlsA75NBJA3s9SZ
 fpRV+0Tu9cfedWg+HTSQaq8oTWCOK5X8IBQ49YvgoHAgNakNxyvh0j4bub8snwIzWbw1
 n2bYTD+ZB+mO1NgcCCkqhd0MyjWwko+t/T8467+FNep9J84SOqd33CkUxZmoZ27Hws87
 Q3SWWzR8U3sxPltIBBl0425/BxFRED2oEIv8z71+92Im77aLeclk91icnt829fW0pqKa
 kVlthdCls13+5GknX9fMZqZNprhhcnDsZrHJEV+e3iSMDurJjc68NNkD0SJ6I/xzEOLf
 RRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=LCgy1gxM30M22PIsWbId11v5IBUbSCtj3cxS/cRrXtE=;
 b=l4CquEOuXvI2ncQSraDa5fVVhw3nljZmFMuZTjMmxcWCsoxJy/Ldvu2rW9rnrGovn8
 yknSVNj26CejsCXXl5RjQKiK01Y0S9mk8ISQxYoHYhupJnikg0BxojfvyACw+eW6EhiE
 m/q+BLRben4/r5tOt45kHBxwWRIzA31AK+x0WaxldFrY7R7caGv9CeH2gy9kvTOelYyc
 bY5eW1ihBW4qP+eyAlaJXzD+V0dHjEOCpMIjYKNzvN7dsvFHpVDmmVRBQcs1Zfl9knIo
 wza0kAad9oPasVBBc7Ag+USwNnE7TgR5l9R2YypUfiQp/jKxs2okbjt+UW7cBj/sy1hb
 KKWg==
X-Gm-Message-State: AOAM5334kKsTx+ON3pLuz1qvTzlS0lsY25xCr2uk2FB6ruRZlSCD8DQw
 +K/jCon/0klbePkHPewAuea9OUDft953SjJ3FOuQWA==
X-Google-Smtp-Source: ABdhPJwiaEUGXJ3Y9PpbbVVLJXfYgIsFFolFkWW+uB9EWIr5k5bNzoK8oPI5n2v0n1E/TUJPDSYT6W3m3pNGXQKZcto=
X-Received: by 2002:a17:907:72c8:: with SMTP id
 du8mr2533656ejc.237.1596691271965; 
 Wed, 05 Aug 2020 22:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200806043903.4024333-1-airlied@gmail.com>
 <20200806043903.4024333-2-airlied@gmail.com>
In-Reply-To: <20200806043903.4024333-2-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Aug 2020 15:21:00 +1000
Message-ID: <CAPM=9tzCZCWr8K8NHhiroRCnjtN34LNRBEQYQJ5paUWh2Lq+ew@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: drop size from resource manager base class.
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Aug 2020 at 14:39, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>

Just realised this is on an unpublished base, I'd had amended one
amdgpu ttm patch to avoid kzalloc, but not sent it out, but hadn't
rebased it either.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
