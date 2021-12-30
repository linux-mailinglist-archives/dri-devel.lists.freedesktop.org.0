Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E18481BED
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 13:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9F10E3AD;
	Thu, 30 Dec 2021 12:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33810E3AD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 12:07:41 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q5so29285528ioj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 04:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkeQvjtAtW3zPrvbKD5gsvbJoOReOLmTGrd70LqAKzw=;
 b=VdWo5yj0VrN5lyuBJnO5hwWoz6zeRI2dNQEldR8vQAO3yTawVAJpuYXR24VLt1HL8Y
 rLTB5W+aRcsmOy0LG82HpqPY/cMachMQHGhLjslYWvWysWc8NTFr+QIT4Utdh7FG0YlO
 /2y0K4U5wHe6ga1R7wlampuvRbTOtUtHl82g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkeQvjtAtW3zPrvbKD5gsvbJoOReOLmTGrd70LqAKzw=;
 b=Y2TMjEcY76IPJIGMffg+gSrQ+jPwMRGDHZdoJNL+uQxM2qb7x5ZDa43YG9kXf1DMQO
 fVmDec0wWI1m0FudvtAPA5dkyo+R0ebAxnglqkZR6U4JnaYjJ1o1PF9xXWB9vspdArhc
 bnssS5R2kScAhoF2Jfjz08+kG9Ev3HH/gCG4lIeNi/oFz+dmblcvq7AVObJ8JZRXNXBT
 xoW7wfqCDWAKz3iqdajMNJPfMaTGMlyD1EyYgGdjHOEq7Rt9Bzwu1sfg4onjOwKdv/5f
 ITdtXF6eSOVfVKm4y3wNmMS7/QNjEYzxQPm3iFJeA7WLe8fnutOiiDMBIq7oR2tad4ef
 lmSQ==
X-Gm-Message-State: AOAM532MD0GOa7BYY0fr8ir4Z6pZXQuaypv1t/wWI2ONbOf+S33m4sL2
 79Br43gVGZi5gSP5OiMZpV6jg56j8T1A9Kh3xOfdNQ==
X-Google-Smtp-Source: ABdhPJyxQpoNsYKYqHqrly02OkCz/px6gS2L/FF/QnOBWNjMgId2yRcRdUSpk3eZaJfK2WWQWixvy9CeMpsMtbGIvLY=
X-Received: by 2002:a6b:a10:: with SMTP id z16mr13081613ioi.204.1640866060817; 
 Thu, 30 Dec 2021 04:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20211108100608.22401-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <CAJMQK-jTRt7OSkfCEmUBvC=2_dDo8vRC0awjJ4Jc+rzHFRUqzg@mail.gmail.com>
In-Reply-To: <CAJMQK-jTRt7OSkfCEmUBvC=2_dDo8vRC0awjJ4Jc+rzHFRUqzg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 30 Dec 2021 20:07:14 +0800
Message-ID: <CAJMQK-ghm-QZfTUMLC_qt3+2o8n6VQ4yQaCfdTNwd3sOjMoBKw@mail.gmail.com>
Subject: Re: [RESEND] drm/panel: Add inx Himax8279d MIPI-DSI LCD panel driver
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 3:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, Nov 8, 2021 at 10:06 AM xiazhengqiao
> <xiazhengqiao@huaqin.corp-partner.google.com> wrote:
> >
> > Add STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
> >
> > Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>

Can you also create this panel's binding document? thanks
