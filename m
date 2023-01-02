Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E6965B342
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 15:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65CE10E347;
	Mon,  2 Jan 2023 14:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F51510E347;
 Mon,  2 Jan 2023 14:17:09 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q2so29164069ljp.6;
 Mon, 02 Jan 2023 06:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5eDCfRWak7WjzcJrVJ87WGs9sC09qEtPHBY0lhigWsk=;
 b=bzt/zVqcL4dO0+9oAWHk71070RmkWBKqqYkEVqyQpVelltbUmmN5g1vA8pyM1elWhd
 krPdCxHzKPjrWSqVyR5ZgI1dase2Uz0MF90YK8UPesJ3YjcS5lg8pe446zO6Cfv9ynEN
 oUYfjRjGfV74uTTk9xNtE024DQfiChn3lWEKSeHlqevkfZLcRKZUfVnpDsAem2aD/qKW
 Hz+oxiLpw57vFe2D+jfGjQCDNI0CN1kVqqu9/gy8i8mMiYz0Lt0JwZScw1CxjACf7ixx
 HeqJ/Fxp4KrqoWNTGYJrT9IOVWDoOsyH+swpt2rCeC03IopusOBaKeTxDM3B5clNOpNS
 Ch4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5eDCfRWak7WjzcJrVJ87WGs9sC09qEtPHBY0lhigWsk=;
 b=OcC4sE/ErVUIRp8JEo1ODoymzrBrhu+YiSIIwvOa1AJk/PCKKIHE24fKGaOSZVmxK1
 WX5OuFQYbq4y7rE5BlBAAoLyQS9F0BuRgPDYx/2oQ00+uZwUpqSFx1HVemnrS50yfZwR
 Z15eIF5FfeG4QBR0O8B5Qp0UzlCqo8JhL1HRY4xzXc+cdNuGLan9dLBE6i4/0Sp2i4xK
 PsCbqFPbN6S92Tuf5VWxLTuszRAp1ZwEtOWSqJYmI4hvPLQUcTTAn/zJ0JYm3f5JskuX
 1f/O4okerp2oRnilst9Smcxkfdi9paLz5mUvgwRriiTNfoCgx2jV4Qwr0/H6tSIdubzz
 Mp9w==
X-Gm-Message-State: AFqh2kqBHzGNUUeYqxJZeZLk6B+y1WlXCV0vghCJFw1LH0Q99LYaQ15T
 oX7WOnhqW0PhbjiJlqJ+m2teMPKjDptitWFCaToBBSm8
X-Google-Smtp-Source: AMrXdXsJ9eNbKvYJgTW6iP7SGuBqn3GMKNN0GLu35vqPA8KncHYCg+7KJBerz1Sdow9jSzMMoEkFmygGq9veb9S/2YM=
X-Received: by 2002:a2e:7e05:0:b0:27f:bf18:e5f2 with SMTP id
 z5-20020a2e7e05000000b0027fbf18e5f2mr1521788ljc.476.1672669027454; Mon, 02
 Jan 2023 06:17:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:7791:0:b0:203:5a56:d66a with HTTP; Mon, 2 Jan 2023
 06:17:06 -0800 (PST)
In-Reply-To: <6ef84968-2874-49b0-9fbc-bdc897382b0e@collabora.com>
References: <CAF6AEGv=GJm5Hyea7a0oDgWDYXw72HwTB4sreeppYVEKCsw0Ew@mail.gmail.com>
 <20230101182907.1662-1-youling257@gmail.com>
 <6ef84968-2874-49b0-9fbc-bdc897382b0e@collabora.com>
From: youling 257 <youling257@gmail.com>
Date: Mon, 2 Jan 2023 22:17:06 +0800
Message-ID: <CAOzgRda9JCguwJa6UT+q7hJ7pzcfxhJU5rxjTmoCb79DtWMqOw@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: jonathan@marek.ca, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

which patch?

2023-01-02 17:24 GMT+08:00, Dmitry Osipenko <dmitry.osipenko@collabora.com>:
> On 1/1/23 21:29, youling257 wrote:
>> Linux 6.2-rc1 has memory leak on amdgpu, git bisect bad commit is
>> "drm/scheduler: rework entity flush, kill and fini".
>> git bisect start
>> # status: waiting for both good and bad commits
>> # good: [eb7081409f94a9a8608593d0fb63a1aa3d6f95d8] Linux 6.1-rc6
>> git bisect good eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
>> # status: waiting for bad commit, 1 good commit known
>> # bad: [66efff515a6500d4b4976fbab3bee8b92a1137fb] Merge tag
>> 'amd-drm-next-6.2-2022-12-07' of
>> https://gitlab.freedesktop.org/agd5f/linux into drm-next
>> git bisect bad 66efff515a6500d4b4976fbab3bee8b92a1137fb
>> # good: [49e8e6343df688d68b12c2af50791ca37520f0b7] Merge tag
>> 'amd-drm-next-6.2-2022-11-04' of
>> https://gitlab.freedesktop.org/agd5f/linux into drm-next
>> git bisect good 49e8e6343df688d68b12c2af50791ca37520f0b7
>> # bad: [fc58764bbf602b65a6f63c53e5fd6feae76c510c] Merge tag
>> 'amd-drm-next-6.2-2022-11-18' of
>> https://gitlab.freedesktop.org/agd5f/linux into drm-next
>> git bisect bad fc58764bbf602b65a6f63c53e5fd6feae76c510c
>> # bad: [4e291f2f585313efa5200cce655e17c94906e50a] Merge tag
>> 'drm-misc-next-2022-11-10-1' of git://anongit.freedesktop.org/drm/drm-misc
>> into drm-next
>> git bisect bad 4e291f2f585313efa5200cce655e17c94906e50a
>> # good: [78a43c7e3b2ff5aed1809f93b4f87a418355789e] drm/nouveau/gr/gf100-:
>> make global attrib_cb actually global
>> git bisect good 78a43c7e3b2ff5aed1809f93b4f87a418355789e
>> # bad: [611fc22c9e5e13276c819a7f7a7d19b794bbed1a] drm/arm/hdlcd: remove
>> calls to drm_mode_config_cleanup()
>> git bisect bad 611fc22c9e5e13276c819a7f7a7d19b794bbed1a
>> # bad: [a8d9621b9fc67957b3de334cc1b5f47570fb90a0] drm/ingenic: Don't set
>> struct drm_driver.output_poll_changed
>> git bisect bad a8d9621b9fc67957b3de334cc1b5f47570fb90a0
>> # good: [2cf9886e281678ae9ee57e24a656749071d543bb] drm/scheduler: remove
>> drm_sched_dependency_optimized
>> git bisect good 2cf9886e281678ae9ee57e24a656749071d543bb
>> # bad: [8e4e4c2f53ffcb0ef746dc3b87ce1a57c5c94c7d] Merge drm/drm-next into
>> drm-misc-next
>> git bisect bad 8e4e4c2f53ffcb0ef746dc3b87ce1a57c5c94c7d
>> # bad: [47078311b8efebdefd5b3b2f87e2b02b14f49c66] drm/ingenic: Fix missing
>> platform_driver_unregister() call in ingenic_drm_init()
>> git bisect bad 47078311b8efebdefd5b3b2f87e2b02b14f49c66
>> # bad: [a82f30b04c6aaefe62cbbfd297e1bb23435b6b3a] drm/scheduler: rename
>> dependency callback into prepare_job
>> git bisect bad a82f30b04c6aaefe62cbbfd297e1bb23435b6b3a
>> # bad: [2fdb8a8f07c2f1353770a324fd19b8114e4329ac] drm/scheduler: rework
>> entity flush, kill and fini
>> git bisect bad 2fdb8a8f07c2f1353770a324fd19b8114e4329ac
>> # first bad commit: [2fdb8a8f07c2f1353770a324fd19b8114e4329ac]
>> drm/scheduler: rework entity flush, kill and fini
>>
>> @Rob Clark, i test your patch fixed my problem.
>
> The linux-next already carried the fix for a couple weeks. It will land
> to 6.2-rc once drm-fixes branch will be synced with the 6.2.
>
> --
> Best regards,
> Dmitry
>
>
