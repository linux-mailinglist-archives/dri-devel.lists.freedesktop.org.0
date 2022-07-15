Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5CF576E97
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB07810E746;
	Sat, 16 Jul 2022 14:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E79410F9E0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 13:32:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id y9so4653084pff.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YNVoyk6kiyretWQCyGpRkYDTZtsDnNVuxvv1fAqYuPs=;
 b=PH9Z8js+1KWPw9blh6biuBKaZU4U9c/q7QE6pD/DuC7HiDYxb0cDNl5J9kcU7Mi/NN
 bO848GLeit613u8Z1HDGybzA+nrLeI1Creo85O/hHYzXHcSSdOV0w9fOcTJgeI5kLGtF
 xEdYH+zonmkjUveEg488iTt5p/mefF2yVarVPesCdc660dFfHXugpe2F7xdfLJQRhVoX
 aj4XcN2KP/ZMFJUuRsc6K8mVStKRjvK4gCZbhunLQ7cHe5SfWnPZVLQZGQUaYIuktt5z
 I9rXXxX0+fcQ7hTseXzSOhPM2n+PsVYnEknHOzkHUKARjIP0WEw1hoAYiLGeN5o6pZFD
 h9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YNVoyk6kiyretWQCyGpRkYDTZtsDnNVuxvv1fAqYuPs=;
 b=RAN1wY+EQLFu1+R73L3dxTj101Q9qMV/6+RNLFTdvMmAXz9YQrQP6yuaekALDanJ7Q
 xm0fmr+yCPREZzPgy2V3gMz5sEzfyjeQBOOmXAlN06lmq+Lv5mVyxCykJiSAaVje4ddn
 Fog3CZ4JE2mH8hA+nTB+JFc54qykcqsDSnD6BB8TKLXY6xBMVamJA2dQMwERj0lNHTeQ
 P9bTMQN7nGuFkTptX51mg39UzG9LsOq4oPXVcdGVk6EKzMxhT3GRN3urkQIBNfRs8Y+3
 Y9/6+eREpvFzzpq+cB3zrV72upvX+hMvlStGUrJmy0QaaZuG/z4Z0VgojFXfF1Zq4KRH
 QCyQ==
X-Gm-Message-State: AJIora+E0SntZtljwDbz9FtpbDibPiVKrDQbafjyXKDIicfYyB09+Gez
 L6CT0Va78NnyqohswuAN8M+IH3JZ5OmWZUBM7wk=
X-Google-Smtp-Source: AGRyM1t9GTp9rdO7SEllee28oAWWLFw6P4+BYyJCJP58heeVXuIAmRpquzkujzH6yilSD1SIVVILhokIZS7uJNMV9hg=
X-Received: by 2002:a62:6d05:0:b0:528:99a2:b10 with SMTP id
 i5-20020a626d05000000b0052899a20b10mr13829247pfc.72.1657891961187; Fri, 15
 Jul 2022 06:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220715132816.592657-1-f.suligoi@asem.it>
In-Reply-To: <20220715132816.592657-1-f.suligoi@asem.it>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 15 Jul 2022 10:32:28 -0300
Message-ID: <CAOMZO5CkiULcUonY5=ry0B1iDP6mv+gnjny8GpbEPeFmsd=qog@mail.gmail.com>
Subject: Re: [PATCH v1] 2c: imx: fix typo in comment
To: Flavio Suligoi <f.suligoi@asem.it>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Oleksij Rempel <linux@rempel-privat.de>,
 linaro-mm-sig@lists.linaro.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Flavio,

On Fri, Jul 15, 2022 at 10:28 AM Flavio Suligoi <f.suligoi@asem.it> wrote:
>
> to provid --> to provide

There is also a typo in the Subject line: 2c ---> i2c :-)
