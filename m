Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B76D6706
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 17:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A3210E1CD;
	Tue,  4 Apr 2023 15:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7110E1CD;
 Tue,  4 Apr 2023 15:17:46 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-54184571389so619941477b3.4; 
 Tue, 04 Apr 2023 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680621465;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dIjj3GIjaRDLMLJjHwmTZj8tsqi4Af4bi2atCwj3M48=;
 b=iNHmpfaD3MdX21OJ834IMqVUpprvvMsk1JFv1JKzMpKchNRqwI6xQ4EEXL4ZdPnUDW
 J88Po8Zqn9GrZq4R3UnyLGJpskRi+4zgijqwc9l16W5vReAokU9C3l1HNxwIibhpL3R7
 +uQ6PSSjT6I3wDuIe+E+7eP/loQGpvjUIE0FzcVz9WQ6dSBRDWQ/O3n9MuPe0Qu48mZX
 IiaSAh5VHvbQ7qRItecxICeSWfab4heOrVe7ZgVBeH4EZidWEP9op70h3muEehfT431l
 H2d2AvcNDlFlJyzy9YQPxy+37jpS9pKRA2dAcGrMhw9e/rd2hFiDGzPLne/XWkBL/LD7
 pfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680621465;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIjj3GIjaRDLMLJjHwmTZj8tsqi4Af4bi2atCwj3M48=;
 b=EIbLt6hvO08/vwz/ivkGzP5o5F233pusA0EhjzbalN9XDlH/OvrdWNNy9CteliF4R3
 Bn5LwGrgmFnujZPc93RM02/0swU1kP7Jmu84JeaaHrvP1LJgAa+852kSYLJMxc7QCodR
 j+lXYERe8JDN0A/0IUkqBtrWfzvD48+dZH82MW5dXiFBorPH9nBBdbMNZJQQ9VOofgVV
 DfkrxUJccf2A/MLWorFWag5j4Rd559R2/9FM4G4QQ8lnfOhCvEbF6jHOlYXeo5D7VuC9
 W6+3GvIKLXHgDUbzk7aOkCB/k4JcHbZSDba99byhkYk1BYoiaho5nJPttY/94Ce5trLv
 /yqg==
X-Gm-Message-State: AAQBX9e1vFfwa8KAD2SAgbe4A4kMNOb8TswEFK+TnrzG1pv8NeHEKCpS
 vYnD5uQJlBlsMmtamAYIci1Ks3Ig5hdtPtUoS78=
X-Google-Smtp-Source: AKy350YHM8w/mrJP6qnVsKs84lsok5KsCbyvHUPSg1SRDnkgpyZq7yxIQpGUAsK0u7LRjz0sgkad7UuYh0MYLI70viU=
X-Received: by 2002:a81:bd09:0:b0:546:4456:78f9 with SMTP id
 b9-20020a81bd09000000b00546445678f9mr1741135ywi.3.1680621464930; Tue, 04 Apr
 2023 08:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230404002601.24136-1-yq882255@163.com>
In-Reply-To: <20230404002601.24136-1-yq882255@163.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 4 Apr 2023 16:17:33 +0100
Message-ID: <CACvgo53mV7Aoe+omtSF0BNg+gVOWqDQ_QAmMkhikjQw-vF55Xw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert lima fdinfo patchset
To: yq882255@163.com
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Apr 2023 at 08:13, <yq882255@163.com> wrote:
>
> From: Qiang Yu <yuq825@gmail.com>
>
> Upstream has reverted the dependant commit
> df622729ddbf ("drm/scheduler: track GPU active time per entity""),
> but this patchset has been pushed to drm-misc-next which still
> has that commit. To avoid other branch build fail after merge
> drm-misc-next, just revert the lima patchset on drm-misc-next too.
>

The bug/revert is unfortunate, although we better keep the build clean
or Linus will go bananas ^_^

Fwiw for the series:
Acked-by: Emil Velikov <emil.l.velikov@gmail.com>

HTH
-Emil
