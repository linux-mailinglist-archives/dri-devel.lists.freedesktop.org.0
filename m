Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC17612B25
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 16:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CE010E0EB;
	Sun, 30 Oct 2022 15:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2B810E0EB;
 Sun, 30 Oct 2022 15:10:22 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id a27so2885218qtw.10;
 Sun, 30 Oct 2022 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBPcSD/HzZ698uiU/GAOnCKnNQsnT1jecZdFGUx2fds=;
 b=a+92KmqAyb9PVVkyT6lvd7snui+1rQq/G1r4l3uEv4hAA81nwtlY9A9IdVeRsm8B1O
 rzmjwzDCJCTmzzlojpbLNHlraYnJn0wz22VnlXA6/kX45DIOPindJVjjmNLTSupBzX5T
 OmDFW8yxZPV2Kd9MkuVlDvvkUZLqK60i94ORMbFrYxBP5u11u2eiCQYrG7t2mCCU5pRK
 +ZBSv+JKvTp37Y0xwzU8lGXrQi+ya2ccf+N7wHTzGAzTIHN8HpLqaBBZIetztTD/0dUA
 gFFiAXcbStXYajaryL73QRyhAzC4lLpQbO2HyRYkhEekWZ2ry1EQwJhfCy3n6YecqesO
 XnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MBPcSD/HzZ698uiU/GAOnCKnNQsnT1jecZdFGUx2fds=;
 b=b+KtdAuG9qceZyUqttUooIy+9pmLXAeQfHHcZZrwH0hZi98WCkb5W/jv20RpSPRpez
 zzToK//LtI52MxICIjw7sEhvIhMbmUi0W4zzcg5oYRq+DGjn6MBfbMXltYWea0yzfSC3
 XbvqTTMiskYRVV/OdtFMHN4WAQKkbiv0/57pfs6MM/HiR1hfmKH36BEFBuJKYpynOUnF
 0fBY1x+ke4brlcMT+aaz//sK9VOddmHPrkuXr0OMSsZJNgzni++eDwP3k3EbRx50XTfp
 8JHbYaw6Iy66FxQJWvxSZgf6sv+u4Yir37Pc4qvcCRqJRejWvr/Dw1gU2dm7dMsfPKOB
 sctw==
X-Gm-Message-State: ACrzQf06FAR8Mt14mOfckOH5V89rmGruOOcocsg5U2fHHHixijJAn5Za
 il14LYRLL+ZGT+RIT0DCZYBRtiD9tgwcX50labs=
X-Google-Smtp-Source: AMsMyM6X+/aUfLteqbRVpmJeXDZNgv5HNuJ0Nr1j9VzqTf9TLdPDR1cxInofLJiOQA1E0o65MVDm5GsMepWFpZ9WDtk=
X-Received: by 2002:ac8:58c8:0:b0:3a5:a3e:c651 with SMTP id
 u8-20020ac858c8000000b003a50a3ec651mr7366367qta.340.1667142621091; Sun, 30
 Oct 2022 08:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yz8rIxV7bVCcfZb0@kroah.com>
 <20221007013708.1946061-1-zyytlz.wz@163.com>
 <CAPM=9ty0+ouf+rQWhM=9XSKFOA2zxKfa00MsNBvwrQGPQm2uPQ@mail.gmail.com>
 <CAJedcCwxioxr+4TBTdrEjAZh97J3oroSHSgax+bxSNRXCBvkRg@mail.gmail.com>
 <CAPM=9twhAL+c8mOLmidY_tEhEKwCh-CTjfs5yryOk8oGjMxuug@mail.gmail.com>
In-Reply-To: <CAPM=9twhAL+c8mOLmidY_tEhEKwCh-CTjfs5yryOk8oGjMxuug@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Sun, 30 Oct 2022 23:10:10 +0800
Message-ID: <CAJedcCwiyO71aHmgMF=v1qjNRQrL6+ZkiRoGWeqD3RmJMnk6uw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/gvt: fix double free bug in
 split_2MB_gtt_entry
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alex000young@gmail.com, security@kernel.org, airlied@linux.ie,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 1002992920@qq.com, Zheng Wang <zyytlz.wz@163.com>,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave Airlie <airlied@gmail.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8827=E6=97=
=A5=E5=91=A8=E5=9B=9B 13:12=E5=86=99=E9=81=93=EF=BC=9A

> I'll add some more people who can probably look at it.
>
> Dave.

Got it, Thanks Dave.

Regards,
Zheng Wang
