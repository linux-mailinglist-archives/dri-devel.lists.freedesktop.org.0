Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C6521CCD4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 03:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232406E03E;
	Mon, 13 Jul 2020 01:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106DD6E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 01:37:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ga4so13726147ejb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jul 2020 18:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vT+TZsNFcB2eapXxcSXJ7j2DJLELIW7Hh+1pk1XA4+I=;
 b=YvvWh8Tmia2LGsU/DMD8H9Hxhj304JnZkvoyG7PiStHruOS3XNmx+v01jp76M4SvYJ
 EvAN7dLyHDFSsJ5myHjJRNlY15WoXyQseosuHuZb6Mzc6pOAvZIFDTgOoOtearvnR70o
 Vt491OOElYkKFJ0CImmx1TkkIxNEBfqES+KYRZ/yeY20100FmJXRyjzDqCuhFPRNl0ix
 Zj35Th+FvtW6i1kewlWYQdVR+NpKFSLxd64rVy+n7TQf1qGwVvFv9JI0J/6WLcNchcW9
 u0QCFeNqUy9xgtzNDodDS25D4se5y3iwymr3Trl35UBoDf7jOptVcc5+yUD1SIn/hzpA
 IS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vT+TZsNFcB2eapXxcSXJ7j2DJLELIW7Hh+1pk1XA4+I=;
 b=TDapd1/p5z42bd4LbLo53zoaxba/Y55Dc2OLnYbPP0/JHfwACkWwQQJXX5/Q8xH7ov
 NZ+nAJem/Mjvq2p74DICPkzeyVkW3NQVyl2DE8Tv1TSU1Wk+hg8UPZwZPSpGHIKOvCS8
 PVKIycjpBZzURA/9Sv+u1MBFuoWsu0dcqIpfWUXX1loZxDdOrvvH0UlUb/geTXAnWH9Z
 ri8xvZR5HJ0gnttSoOkjcH8J+8fwcVylI+NNN4e63XEVlRf7DY7t4g4XuvFnRBqlhEPz
 pdTj78z3xgZ9TR1PJAqeBLAH9uMINdO3gzN+dplq5uecDGgQ+WyWp9MHidq3mOoWWX8y
 LXoA==
X-Gm-Message-State: AOAM530y2Z9CKOYX8SyA1+xfC8Q5jeDbWoFloxyPYo5Udogs1NbPoWen
 3eICUpN12tLY8VdPjAtWVRFg16kV1fTCP9bs4SI=
X-Google-Smtp-Source: ABdhPJyt48mQ3k3IfU989G+4AvQPS6g2wUPwNRzDQdQgdH5iKRPB29bHlJW/1VyqNPEpqgD2FCBxFGHUEcKlIzL0Q1Y=
X-Received: by 2002:a17:906:da0f:: with SMTP id
 fi15mr69915276ejb.237.1594604252441; 
 Sun, 12 Jul 2020 18:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
In-Reply-To: <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Jul 2020 11:37:20 +1000
Message-ID: <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 James Jones <jajones@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

How are we going with a fix for this regression I can commit?

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
