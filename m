Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E51065444E2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC1511251D;
	Thu,  9 Jun 2022 07:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8F5112A3E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:30:58 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id w2so37396164ybi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lncv2LVsA56QWTTY7ejCus0yb5RlxQsdBDJmYqFl50A=;
 b=d6kPR1wrbGMetGMiPuVDa8PgYxfO6Oy3Kx+hDhVxhJOHasK/neqeFn5v9tm80VcExw
 YsWXm737TOrXh2ez7hCy+2uDwt7WBoX+As/axDkAGsgv7g4Kyj33BGPhSgj2U4DBKmRr
 6dwMqIRhlcKa8z4jfXecFbrLnSomZL9jMvzmP/+Y2cNQoIWTiYaPDRbNB363T46edhur
 8iRDx0N22I8WYnZTFfDQtRG4HrRmELJhWwZRFTPRcAjfy98cGHqvAUs3ynSGpJWVA2YX
 jJg8zM6m0zA4eDdfRY8eAntXgj44nO+FnnO/j7buuD+5i/TvI3NcS947FpLbxtRGr3vD
 +fvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lncv2LVsA56QWTTY7ejCus0yb5RlxQsdBDJmYqFl50A=;
 b=LBxQAX9Zsu+tMuzogyQuWPoYbvYNdb7LI8og/oco1l4Pf2tIBmACd8KjHW73s9BAEC
 SvTWLXpz2C7GgVS31EF9uR6gknaC8zE/ukQ/pyEkvB6ReMCtesIU4eqwBZTSEpNQ3ayj
 MZPfSqTJdiFSinavxHUGm1jW4yw3WBdcqNHXpYceSrA3CKfDSBJwD1lNrHWZGWiUFLEm
 AAltGC+/KSkpnWsyrk5sipD+F9ZOSCzl8ghxuM7vywM8JMB20Tc0lpvQYhkSJF83QmpA
 yVn8z4u1S9Dbtox8cobztOKRK4u9NF5PtqL1ZyRqD6cpOH8IUbUPiRIYkMPpaHrj1RQj
 h8MQ==
X-Gm-Message-State: AOAM532h9X6x26RdqTK0YWVk0nZQ5sFXu17x50qIfVQE1kVxnuC5JiKe
 0CjyMc6YW65pDMegPQB6eEPr01p8wWwrOe8JCPg1PA==
X-Google-Smtp-Source: ABdhPJwGIrZ38ILyApGaOemHeQHIedRTY6AQ2KwNS9fEHrjBBtNnfh44eQx6dgap2EmVvI+3YvXh0vSM+RKAlK5Z1zo=
X-Received: by 2002:a25:76c1:0:b0:65d:211c:a0da with SMTP id
 r184-20020a2576c1000000b0065d211ca0damr35709544ybc.475.1654705857687; Wed, 08
 Jun 2022 09:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220401001810.81507-1-jo@jsfamily.in>
 <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
 <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 8 Jun 2022 22:00:46 +0530
Message-ID: <CAO_48GH5V2-Z0cqGJoF68hzZjqhY6_aGxReSk+ByC_zrLWusYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
To: Joel Selvaraj <jo@jsfamily.in>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Jun 2022 07:36:52 +0000
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joel,

On Wed, 8 Jun 2022 at 00:01, Joel Selvaraj <jo@jsfamily.in> wrote:
>
> Hi,
>
> I can see that the dts changes from this patch series has been applied
> to 5.19-rc1 release. However, this patch that has the related change to
> the panel driver, is not applied in the 5.19-rc1 release. Any particular
> reason why it's not picked up? or just that, it got missed out? Kindly
> let me know if changes are required from my end.

This is entirely my fault - It somehow missed my radar, and I didn't
queue it up. I will push it via drm-misc tree tonight. Apologies
again!
>
> With Regards,
> Joel Selvaraj

Best,
Sumit.
