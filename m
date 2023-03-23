Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA46C6C61
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 16:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F1F10E476;
	Thu, 23 Mar 2023 15:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD14010E475
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 15:34:38 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id k15so12032415pgt.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679585678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yt7G+Vx35jiNRqx/4CbUvfSNsnSXjoz9hZ8bjwJTmRg=;
 b=HXNabD1rmVa3EmMZ0VI4nWe+JSSM9K9JqDd2ryVbdLHrShDYfi0YwU2HZFGLwh6YtN
 7D0q32xB+p3pQ4f8V+nY7MIBfSg+/YqXOj5LX1WsDtKTzFc2tkf6QdUIHeif8p7+YIeo
 b2nUXFhKEmEcGuoR8dWVNkWt5pIlVfMacheaIvJRJyg/0K91q2N4ac9sUv2zIgbP/yg4
 ePvnZSc+RFKkF28YgkiNoNYT05usB62KT+buwijkWvl7sj8kb+0p9laD/CADfYKmLvBa
 89VRipFQLK+NwJJNB02OMZVA6KGPpQ0Gq0kLpYq7F7gHQc/LhOF0F3YQbJHDo7HRXeF5
 auNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679585678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yt7G+Vx35jiNRqx/4CbUvfSNsnSXjoz9hZ8bjwJTmRg=;
 b=GI6YlEGWhaXz7NU6XWMgaGKPBHO+JoogRLuXBNQCHfdv244M0ipV8UwNiTu3RqF2Nj
 Vch0PiI01wWOh6mLSwvwjai+k7HkBb6ZBVAzMbQPrkCpu73Djt374T7GP9WjkkWcLY8+
 X8zEIVsiAos7/uGuYMxJr1i1FNjTp1GFG1kVmMBG6jzsBogYRc8Iqm+95kKPZqfv9wbu
 f6aGe+Rvmr2+LtRWoLm0YdyCmZQ9qaJXELJAPTZxBVXWoQggplrLkgKvQT65kxj4q0cu
 BDThLZxVMyYdCMav5oxnHHZbHPakFoVA6sdjq3CFgrltWSdFJLn+X3dhCEO0OaFGO02l
 Y9sg==
X-Gm-Message-State: AO0yUKXSIqfMEKJYQrjlZuaoYpena8V8Bf6dmo1iEr0WLY0Am8SWhYWD
 /lF5c8FBH0fqA2jgSVuav/qech7mMaYcBCEIvFw=
X-Google-Smtp-Source: AK7set+6wuYyRamh87vkrzZ2uGC7oaZvrvUgSq1WAHQFu92Ck749a8vmxr3SCJdhX/w7eePUzlR669mX2U99CLXm0Qk=
X-Received: by 2002:a05:6a00:21d4:b0:624:1261:918f with SMTP id
 t20-20020a056a0021d400b006241261918fmr1612660pfj.1.1679585678123; Thu, 23 Mar
 2023 08:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
 <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
 <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
In-Reply-To: <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 23 Mar 2023 12:34:26 -0300
Message-ID: <CAOMZO5ArYAf72oSY-WMSdfH6w5HAvvrLz24eR+4YBzOASp7U-Q@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To: Inki Dae <daeinki@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki,

On Mon, Mar 13, 2023 at 9:51=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:

>> Could you please apply v16?
>
>
> I am planning to merge this patch series soon, but I will be proceeding w=
ith the pull-request next week. As the DSIM driver is being moved to the br=
idge folder, I would like to wait for acknowledgment from the bridge mainta=
iners. However, if there are no further comments until next week, I will pr=
oceed with the pull-request.

A friendly reminder: do you think you can proceed with the pull-request now=
?

Thanks
