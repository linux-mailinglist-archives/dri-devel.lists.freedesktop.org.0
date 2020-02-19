Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 511FA164D73
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D51C6EC65;
	Wed, 19 Feb 2020 18:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E83D6EC65
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:12:59 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id y3so564095uae.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXmxWE/rJ+zaGlIR3A4zbDbcEB88quQ0SbvUghXGbtc=;
 b=pT1mYCwz6jPMX6CxdjbTUHXQwzgIMRq0y7X+VO3Dsi1aUoUC/2B0VUp0ENsqiQ1+MB
 PlqTF/qiH5suc9BKbQH3IrzoyyTMAugpC6Z9lmvjOqMGbU/LGyRzPFn9dG4p3XoCkpSL
 akm2j/IIlJwy/iKu4APqcL66ofo/jinh5bBDvma573F+moBnxEMIY/iEfzTJfVjWSKu8
 KOww5LpW0KEr1rsT48rP4cV2pNVgTux2tfRnYvpJdNaYMUOSGla0kPf02C16e/Bd04rj
 VTtE0bHrwv7LsRVHqZ5FHsfqDZ7oCZoDtG6azVagLXBw4SXOJ5UrG4GLwbONRRfUroZs
 wY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXmxWE/rJ+zaGlIR3A4zbDbcEB88quQ0SbvUghXGbtc=;
 b=R+gP0Kp37xswaEVuhbOvT67y3yFujNAFR08kWwZ4u4/zzuqA/9FaOVLlxFRmkNAY7T
 rj37Zi87rBZILfzxxEy2l8oBIUtW5rprf4APWZVOWT3+n00upK71a/2EmylqAtweuQze
 fZXtneyVsfqdOHeyJ+dW5eomgzzcI+354Mta0v0IghldMEqtzg0072nI1/k6XCX4uEeE
 AhmYH7gHNQCIrQEXV//5LcGFYyUreads+8aH3F2qqjcAJtZXte/1GsutGRjTJz3cEWwU
 qI1ASbuowozrhcfl1rTqSZNnfj7tAYxX8iuh66BohSsu9xNZgm549rncjLaDguhqBXFE
 RjYg==
X-Gm-Message-State: APjAAAVqO7DnLvtPs9xEE67mtYm2nel930B+Uhnw0P8EqUyaEQfGQOtC
 6zLdkPEILJeVh/LD1Fn+Uzk8Hi99pUBojb+g6uM=
X-Google-Smtp-Source: APXvYqy1KCk2jZN9iLwSBwi/bAXx7LdbsnW2neCfpx283eyQuT4LZ8mF3QCTABprpA/k6Tz/FQtIhjvfLiRIAotxrD8=
X-Received: by 2002:ab0:4ea0:: with SMTP id l32mr14383570uah.69.1582135978306; 
 Wed, 19 Feb 2020 10:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20200219175640.809-1-gurchetansingh@chromium.org>
 <20200219175640.809-3-gurchetansingh@chromium.org>
In-Reply-To: <20200219175640.809-3-gurchetansingh@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 18:12:48 +0000
Message-ID: <CACvgo51adjX9LoPXmT0oaeg6vhQZxDj-vuCKQrH_FQebnc9VBg@mail.gmail.com>
Subject: Re: [PATCH 3/5 v5] drm/virtio: track whether or not a context has
 been initiated
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 17:56, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> Use an atomic variable to track whether a context has been
> initiated.
>
> v5: Fix possible race and sleep via mutex (@olv)
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
