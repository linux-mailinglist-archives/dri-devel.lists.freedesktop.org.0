Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B421DA831
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 04:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262266E113;
	Wed, 20 May 2020 02:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90CA6E113
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 02:47:18 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id s19so1138272edt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 19:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YwslMiiXO+lo9zoNv07mxOlnXLmf0m6If2gaAnbtI2s=;
 b=Vs830JmCh7O0q5MQCH4gx0E5xiZzNdzo/bLK3LJZ0r4OYq4ogamW6p8t2o1BDmUsz6
 +3gSvB0GLc6mz8XpiF3hSc3VwJ2Phm5f28YQpWKB3bDRSuwn49qBEE6vEYObvEPDBgvs
 FNiWMOa0RPQEYMnRJSrWQ+Vhkfr/jzPr1HGmhEFG4AsZG+dwKOElZSE26K0bdVnQjSvD
 ebCiNCaBRjgU/aM8iMIE8Gj5oXlayJd7ozkze2Ho8fcci6tnDibHEnZXfDitdbuuE03V
 gdr7D/V1qm7syDQ/Yc8YbHi2kPJzFxjY0+bKLq/gNckItS9HuJAVXen5edWU4ftzYtaT
 Ooyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YwslMiiXO+lo9zoNv07mxOlnXLmf0m6If2gaAnbtI2s=;
 b=UKCN4k4apRVGViRUe8A/hU2ZCCmbro2WzYVBUYODYhiglnJwH4PU4L4wPY8SQNsw/M
 TysSn++pLFHeIyLmiX7Zlki4php1VqTaUAzaC1O5ZVM9xuCp2hFe4N0S6ccN0nh9kopp
 nvGMe3tGbKKMHyoNx/HLVX60/yv/lwHEtmUg0Y04Zn5HkuExEoN0gkF5TzMQx/I/d9cW
 dn80VUhk2y6muao3cNxlmwB5pdXQv8mFv1Q6VXrikOk7+iAO8IWaq43cSPO1aFNil4+q
 eMoR7hxz8thD7gVKMuBo/B3x3ljPTFnjzf4bmWKLWA+jnhADdlKH6YLaazir5h2kEkYJ
 Qbsg==
X-Gm-Message-State: AOAM5315nWz8WnP1f4ZOouunnhfnMEEmLmpbtKVx2YWPeCra2xtJQFms
 18DOIRmlljF/Jv5m4f175GE+dC/wLtq50P5Vjl4=
X-Google-Smtp-Source: ABdhPJz6066PUBJs1ekXQDednzpfeZHWsvdChkxJKjzDPRyMxinfZYuAyzTZrTa+0o7QRcfIL6TbSZIppjIj6oQHLIg=
X-Received: by 2002:a50:a365:: with SMTP id 92mr1451499edn.220.1589942837356; 
 Tue, 19 May 2020 19:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200516050433.7298-1-rscheidegger.oss@gmail.com>
In-Reply-To: <20200516050433.7298-1-rscheidegger.oss@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 20 May 2020 12:47:05 +1000
Message-ID: <CAPM=9tws2kec7v7Sxi7zjCX0pUJR2xyLWtPRtT2FPTSA8gN=Yg@mail.gmail.com>
Subject: Re: [git pull] vmwgfx-fixes-5.7
To: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 May 2020 at 15:05, Roland Scheidegger (VMware)
<rscheidegger.oss@gmail.com> wrote:
>
> Dave, Daniel
>
> Some minor fixes and a maintainer change.
>
> The following changes since commit 24085f70a6e1b0cb647ec92623284641d8270637:
>
>   Merge tag 'trace-v5.7-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (2020-05-12 11:06:26 -0700)
>
> are available in the Git repository at:
>
>   git+ssh://sroland@people.freedesktop.org/~sroland/linux vmwgfx-fixes-5.7

Hi Roland,

Please fix the URL you generate here, it should just start with
git://people.freedesktop.org

I've fixed it locally for this round, but please ensure it's a valid
URL I can pull from next time.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
