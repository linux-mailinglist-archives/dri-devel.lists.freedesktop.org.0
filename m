Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33AD332DB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE4E10E1CA;
	Fri, 16 Jan 2026 15:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E/2IgHnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8F310E1CA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 15:28:12 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2b6c1ec0dd6so54393eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:28:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768577291; cv=none;
 d=google.com; s=arc-20240605;
 b=E326+vE1DdZ/d4rN+RPzR0nlnqxvwPkgrhX8FDQLWcT+3bigf6Gt1mUzMSUOiZLQYD
 UL6pmK1R88GMTvfJVttKevjNoc2807WWAJgF3s/mVl01zKjmLkBwmpJOP8BbOpOHdt35
 UvBiYTNF31spY9zQoMSLY5PdiybJXX4fxWjEnmkbrKliXdCYD369+Z5zrlGtb0SfwstI
 2lKBzBcswPCA2bO4Vc1utb681lxtOwhexGznKfsmRKCLd36Zlmt1oD93qKOrVRDfY7Hv
 wqxOKFs7gjhihRT/e7TB+KBrPk/FkfwhNUN+AUyS7JK7h1nqIqUVmkH+K2MGUYconVkc
 yHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1qElG8X2umkIbf03aR+EqOOQskFCiq/AFRNxGOfGRIs=;
 fh=YtQ7hQ2+aosgN3lWja/iGkgoAyq+0NaB5nYjPXc2/IQ=;
 b=aksPM4AdoZWI/NZs9Reep2h1+pgP5ogG5hTCTEOMF1IcE1QsciCidnijFqyfUMhIwo
 WvGJerFRoCsERNHRa//9iyeOzq8DBPcY5i879lmLCAQoJCLSNJu43O9lOyO4h2Nen6a2
 Jv+QrkdwGYco+JQM27h0+kaOHE2cmVh5bctMW5X1pdoYCoLUc+UNIiaBCQ3gRCRXmJGf
 ivp8LwQ8i7tyst8GEPfHjRj1p0m7N1Sz44i3AFD9HSnUolyzz+GIGhhhOTAq8VyjyU0v
 G8Ggkj0YeKrF3fouUEE1ilXnm/5mnvlvg4zx5GupxvCeD40/ZHJTWs3pKAvILwt4R/Oc
 sRkQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768577291; x=1769182091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qElG8X2umkIbf03aR+EqOOQskFCiq/AFRNxGOfGRIs=;
 b=E/2IgHnSi3gqOLDmu/ds/cJEuRbbRKe1sn6KalWCGMlfK54JJMoxg+kBBqh4qYXjRt
 B4nksRWbEm5VNDqCLY75xnlJeTfkBlt+cp4swwMl8OmzYKZJvTfa/tZHL1zFh4jOMMPK
 YdSuXSr8e+1KwtCn++7trC7p6M52Dfo4WiPbg9RhWrOdeUT5ESpM5CcltdJuZ/Pafxv3
 KS5CfxvQuIeCgQEq7Fn8oWEWkqDOxAEI7TtFwTzb+bi9F/A1x0+zdjmqrnWLspNNZ8iO
 rHeEI/0raBb26ZB7HJp6JZVaLhAcj18w+ZDmm5pkBRstDdxVkMu5erXbUptyA+dzczsH
 fZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768577291; x=1769182091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1qElG8X2umkIbf03aR+EqOOQskFCiq/AFRNxGOfGRIs=;
 b=VpEOqF0xSvisYzDyHYU8SasJKsJl7dIdqn0cx8vgLnAvcWbZxF6IK8pA+yCEUYNMEK
 wqiNr0pm4Kc+Njn97APtOqhTLIinIm9Gk+oHvFMn7wye4MH5Ez8ZZWXJSsfnhIGRiVAt
 7bz/IJrCw3LNnO91QaI8zXZFiburGyHMngDoqQgAkV3ODvROdv+5YZ/5/RbA0flP91D0
 Lp7EqeHfIBf+L/12dWB4EBmQLHpiq9Wq7sjWV76M2YGJAKSb8p6xi+mEojqsSIKSzQ7N
 Vt7q7s5baZIcRIwvuXF1imp/hKXLp6a76QuOJblV5gpqKbUNB61bf+lfCY9yvTRz0gNT
 OCfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7StXW0Ihg4JCcfZNjJ95oQ1xGqbyNXE+GkJmCuNOXkKnRWpAbw/qBAaj6fIJDG8IghP3SsFk9SCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf22EgDjofKIfXzhdxcDaM7YxxdGN1I5ALa945Lz43iJcxIKzL
 p2iBw75q9uS6oxM+w8EXTe/RXeqqIy825AAV2kNqJk7tC+E86tRkbnEWpcR2GABnEuqHdwe3dKc
 PTQwnN016GuELwGJOgkmir6o9B5dAkFw=
X-Gm-Gg: AY/fxX5nNMRB+9b55ds3pmR8dC477OaQgMJVgj9Ad0cePXyGRvyxgretmJNJhqp0Tm7
 3qS+apJzb69xlJAKW/i9y2aa6TmbUfUKE9jj5/aPyr0FHZlccUMnY6jVhu63B7rbkhqGsvy/Cqx
 chnUsLDzK7KW3BeVgYL9s+2vhHsDtSV77NvcmEKX0NXxkXaowpZFjHnlXMBF00vtFZ4XQTwe3QK
 cSy4GMey8oRuNnr+50hMdNoSfS82h6SGOfwFV0nxG12zc8GrHkOznPSxiS/WxcC0XGKNVfW
X-Received: by 2002:a05:7300:aa8d:b0:2ae:5d59:3ef6 with SMTP id
 5a478bee46e88-2b6b410a06bmr1345513eec.9.1768577289827; Fri, 16 Jan 2026
 07:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20250418080130.1844424-1-baolu.lu@linux.intel.com>
 <20250418080130.1844424-3-baolu.lu@linux.intel.com>
 <ygaqzsib7bc.fsf@localhost>
 <20251230011916.GB23056@nvidia.com> <yga3445n4wt.fsf@localhost>
In-Reply-To: <yga3445n4wt.fsf@localhost>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jan 2026 10:27:56 -0500
X-Gm-Features: AZwV_QgWpPav71ZZWpsTh0CgMtSK2L4MVlujgmnMBgyJFyhEizbG3LABS0iTRc4
Message-ID: <CADnq5_NH0DiyE0M44AzaEQhmSksj13wVwEK_Y2JHj3OLEPs9Mg@mail.gmail.com>
Subject: Re: amdxdna breaks suspend (was: Re: [PATCH v5 2/8] iommu: Remove
 IOMMU_DEV_FEAT_SVA)
To: Linus Heckemann <linus@schreibt.jetzt>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Min Ma <min.ma@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 16, 2026 at 10:12=E2=80=AFAM Linus Heckemann <linus@schreibt.je=
tzt> wrote:
>
> Jason Gunthorpe <jgg@nvidia.com> writes:
>
> > On Thu, Dec 25, 2025 at 10:05:59PM +0100, Linus Heckemann wrote:
> >> It appears the code removed here was not in fact entirely dead; my 202=
4
> >> gpd win mini ("G1617-01", with a Ryzen 8840U) fails to suspend
> >> correctly, and I bisected the issue to this commit.
> >
> > The only behavior change this patch had that could be relavent to a
> > Ryzen was in drivers/accel/amdxdna/aie2_pci.c - are you using this
> > driver?
> >
> > Prior to this patch amdxdna would have failed to load in configs
> > without an iommu as iommu_dev_enable_feature() would have
> > failed. After this patch it will load successfully.
> >
> > If so then that driver presmuably doesn't have working power
> > management in your system.
>
> You're right, blacklisting the amdxdna driver fixes suspend, thanks for
> the pointer!
>
> @Min Ma, Lizhi Hou, dri-devel: do you have any insight into why this
> might be happening?

The xdna driver requires SVA and the IOMMU.

Alex
