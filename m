Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A66F27691E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 08:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E836EAAB;
	Thu, 24 Sep 2020 06:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8F26EAAB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:40:31 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id t16so2215165edw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 23:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/c0H2Ko3NSaHoy0V+AggsskveavjUwSjPaEoV6Et7oE=;
 b=LNc0B0+Njo58UgtW1NCRrJ/+xgI457HYhaM8Ern5dtlA0633XlfEt1GwNtNIeyW58M
 v/HfQqBLq4m1QlxvVQ1ibh4NMeuc98eiDUSdSCMz+zjgkeqmGU3n0LBkooEiGifykPEx
 +KVwbND8vnCngK7GGeZPtKLZVc0AMPrcjJ/wCZpspWncUbuSxQW9qwxu5IpR0g7Xu5/m
 ZLZkwtZHWUMOvZRH742GBc1VnjkFcDGKAsvOuUpRCFjfTA1HXS4RKVQBq9U4G/5immGk
 vKLRY5H0YlgHD1VncnyDw1e0b4zSrxSCSLi0QC4x3DKov+Rmg3mGhVxSB1UTaxvSwEZg
 Z6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/c0H2Ko3NSaHoy0V+AggsskveavjUwSjPaEoV6Et7oE=;
 b=Wf/l9AsQcgG3kwVEDFMP4NdQxWZCSzqw9Ku58/HOiayDZiqvW4YHUQmbZNJguiqToN
 rfvc486mQ2lp4UGYDQ2tEABXp7bSBOj79xXCDrPwWVN0oThoV4ihV5/fPKcgbYVJ7JgE
 h6YlwgP1k3iL6XAbrmx/1QyumFAQBm5nno0M9HT0xW1u5446Cfc2BioiG3+FNsTzvXyC
 ukIGaGrVOUHr5CtJHRzueEAINpb80fuXW1muq6MRVKTTwySQF0ZKBLjSmih7CxCIP/Jf
 oOhntYkgC0dFol9Rz5/WhUZnHu+dc9GeTKks/K1Wl0CGWFFVPH2yCc9kRyC2BO8Qbyyo
 MLGQ==
X-Gm-Message-State: AOAM533YeeAldmPvtExZDRh2HxgVfRvd8iPyhlBAQ7gApkWoTQESteMq
 eU4/nBAfB1kV3YQlMioUL3P3G/Hlk13YqoOUmzOAq4OKmEM=
X-Google-Smtp-Source: ABdhPJxgZLKUq4SsZaCRtEiHVlVP6Up4e8r0iKy5WNvkDdxDCRDuE6ZEDTIo0ovaKvETqMUCxykzZlB1XZh2nmzXM68=
X-Received: by 2002:a05:6402:1219:: with SMTP id
 c25mr3111536edw.220.1600929630441; 
 Wed, 23 Sep 2020 23:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200924051845.397177-1-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Sep 2020 16:40:19 +1000
Message-ID: <CAPM=9tw107xECwLZoHNbvcMeNUZa9xcyjwA9tjke82S-5vobUw@mail.gmail.com>
Subject: Re: [PATCH 00/45] TTM move refactoring
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: "Koenig, Christian" <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Sep 2020 at 15:19, Dave Airlie <airlied@gmail.com> wrote:
>
> This refactors how TTM moves get called between core and drivers.
>

Full series is also:

https://github.com/airlied/linux/tree/ttm-no-more-bind

(it's based on top of Christian's last series).

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
