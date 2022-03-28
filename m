Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8414E8BE9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 04:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6618410E13C;
	Mon, 28 Mar 2022 02:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69C910E13C;
 Mon, 28 Mar 2022 02:09:10 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id m22so12679136pja.0;
 Sun, 27 Mar 2022 19:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2dCQ/vF0SeGrJ8RhQQvy7/J4z9rXZ1GpCIEt4kS4KPo=;
 b=OpLPgdYRINKmrL7xrgd2J14yQPwt0N31PsTWW0f4LeqVoQFCejx2P1LdduF4uzQOr/
 0zTTcpy+dRQtPLKvRVzNjl21DKeK57IX/2Nvy/q3D+7LP19rJaJxt/J0uYGvvWuOL83j
 a+IO9YnkKya33wo45XgG7GcqT/vu4m9+OAWARWJCc0a/qtSyEM9Byjjif/nk6CBSILYK
 lM6YrS2FmlW5iCXj/Nm+Ok2Y9tE+4uUUa2NjiU59faCRBFLSR+SSc+IDE4Q+AYzJ8Sge
 2ynH7aZRKcS20I7kMeihkjC1t5qbZ+Q9BSbnS2l7rDdKz6I5dXVz28YvU5RwPPydtdTl
 xmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2dCQ/vF0SeGrJ8RhQQvy7/J4z9rXZ1GpCIEt4kS4KPo=;
 b=2F7qkIjHe1AGQ/dn33jYdiAn7nXDOglqQQaNu785NzFcFjT3RRufdFo7AQm05MYNOH
 UOxfb9SFdApHIy1ofsNQ6FDXm825Nicv1zAPmFKuRm2O938/YHpqhpAg1hkPRNDcHCY/
 eCYF1pcTvw02ZVr+Ux3wrpBoCzPfNK777r1sdz/LMmY5V5NS+frjFEKfaLqnbKrSPw2g
 sFonaqMJflVZFBvgyVVwEgV57Is1zmW67nVaQqsyEcLZf2Pr3c+K8wg8QwgwHoZty8ZN
 n7DehjuyyL4sELUi5XF4Rv58TWzndiwsCITxIUNWRAUkU0HVNtxB0zdM+i4oMYH9sW89
 /kSA==
X-Gm-Message-State: AOAM5339w67YFnoehCxRIKXSmA5n4gOZDWfLkl4MLC/GiZtt2uEQgt12
 VoHZ8N/F4e2o9Ijx3ebZATY=
X-Google-Smtp-Source: ABdhPJyqaVpbob+fqPul71KENy+IsyImv0wRFpr7UNCtfG6Q1nwHd+/o9Att122DE+kpVOpKiFhwGA==
X-Received: by 2002:a17:90a:2b86:b0:1c7:6e7a:3e00 with SMTP id
 u6-20020a17090a2b8600b001c76e7a3e00mr34609009pjd.115.1648433350273; 
 Sun, 27 Mar 2022 19:09:10 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
 by smtp.googlemail.com with ESMTPSA id
 lb3-20020a17090b4a4300b001c726c65facsm18880311pjb.43.2022.03.27.19.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 19:09:09 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: emil.l.velikov@gmail.com
Subject: Re: [PATCH] dispnv50: atom: fix an incorrect NULL check on list
 iterator
Date: Mon, 28 Mar 2022 10:09:02 +0800
Message-Id: <20220328020902.19369-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CACvgo50pK3rr5UH_FyfR1pADmPRjEawi43cAecoaz7nM5AFgBg@mail.gmail.com>
References: <CACvgo50pK3rr5UH_FyfR1pADmPRjEawi43cAecoaz7nM5AFgBg@mail.gmail.com>
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 xiam0nd.tong@gmail.com, bskeggs@redhat.com, yangyingliang@huawei.com,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

on Sun, 27 Mar 2022 16:59:28 +0100, Emil Velikov wrote:
> On Sun, 27 Mar 2022 at 08:39, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> >
> > The bug is here:
> >         return encoder;
> >
> > The list iterator value 'encoder' will *always* be set and non-NULL
> > by drm_for_each_encoder_mask(), so it is incorrect to assume that the
> > iterator value will be NULL if the list is empty or no element found.
> > Otherwise it will bypass some NULL checks and lead to invalid memory
> > access passing the check.
> >
> > To fix this bug, just return 'encoder' when found, otherwise return
> > NULL.
> >
> 
> Isn't this covered by the upcoming list* iterator rework [1] or is
> this another iterator glitch?

Actually, it is a part of the upcoming work.

> IMHO we should be looking at fixing the implementation and not the
> hundreds of users through the kernel.
>
> HTH
> -Emil
> [1] https://lwn.net/Articles/887097/

Yes, you are right. This has also been taken into account by the upcoming
list iterator rework to avoid a lot uesr' changes as much as possible.

However, this patch is fixing a potential bug caused by incorrect use of
list iterator outside the loop, which can not be fixed by the implementation
itself.

--
Xiaomeng Tong
