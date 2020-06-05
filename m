Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE41EFA23
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 16:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FBA6E904;
	Fri,  5 Jun 2020 14:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4486E904
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 14:11:19 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id o2so5677285vsr.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 07:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YdadKwDXXX0T4RvtZh+rNWG+cNbp5wTsVL4P09m1mt0=;
 b=R7SCWhxzKVwg27GmL2Ijd5GW+WkbVCa7VYjT1hIwZgHdyNx86jbJ5wlUN26X2B+O8G
 HdXfEv1yqBnm1arhRfvEnp9B+akHztqpGt8Me48c8coABHP7fjVwpnDtK/opxsmo92gj
 8tDgQQIrhFCvH4lTbLHyTBaPTJQNG+GL4/+fXCk0AKvy+Pkq8F63z51jd0akv8KyUS6L
 FRtg+U7kTBP0ezKMZzu3Brtg+h7TPl9MCk+Y4BFSgFTT1+tO4ULgK3ZVOxevphFb4Tov
 zMSBoRWKlMNrX+uCr442mccH06sP9lcCv4qozkRikmjuNlM5rci38lf/NIwpADsTTclO
 p/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YdadKwDXXX0T4RvtZh+rNWG+cNbp5wTsVL4P09m1mt0=;
 b=evIvU+qsn72naRmpPrFgkVumdZQ4yz1ClRYMLwXQejMncweiLsA89mHrdzTRf5CPdc
 gozraD2UyrNICbTPGT6vmtddaCLc6QpJvd4m6XopMPJjTTFR31mY4fsi4i1zfg0vbwga
 J98kC45r4sofPOntTf05QnQJJjBceLcLILyYGoyLGgI4aP2wfEQW7HItj/t29PV+3Vex
 uHy6dbWc6tfUrlq85kbLIKpIMNiFG7t40mw0PLhSGbGoVWwAg0YvNzKf/S7qWvCsYmbk
 b910HR2kuki8eUo0k1twx1D/dsPSUSpVAsTzfkzZ0Wg2J00c5gTh8lzgvJsrmEVBvZDF
 5R5Q==
X-Gm-Message-State: AOAM530myL5tjzsXWHwZJ5Y/j7mU8/lM8eLF8Qx03cjdtxtbhf8jy9us
 C1QdCEWqcqfe0gGf4ZnEwaHO9IkzXVELMHt5vs+sNA==
X-Google-Smtp-Source: ABdhPJwB528mXydqpgfSr4DVP67A02DK97qbNbQ71Q1FOC6uD5bGjiaCIu5cC2hlW/vkbcoGwr1BTTs9cZFzof9gpYs=
X-Received: by 2002:a67:69d1:: with SMTP id e200mr7405587vsc.118.1591366278969; 
 Fri, 05 Jun 2020 07:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
 <efe3f43b-e743-d4b8-e942-23fbf23b0118@vmware.com>
In-Reply-To: <efe3f43b-e743-d4b8-e942-23fbf23b0118@vmware.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 5 Jun 2020 15:07:56 +0100
Message-ID: <CACvgo52PLgMA-zFeOTQwzyuTXxwYOq3o37Fh1Ym4tMfM8jgvQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: vmwgfx: remove drm_driver::master_set()
 return typ
To: Roland Scheidegger <sroland@vmware.com>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Jun 2020 at 19:37, Roland Scheidegger <sroland@vmware.com> wrote:
>
> Looks like a nice cleanup to me. (No idea if at some point there
> actually was a reason for a return value...)
>
It was required up-to quite recently actually:

commit 9c84aeba67cce6514374f134c9ce2c5f35ac3831
Author: Thomas Hellstrom <thellstrom@vmware.com>
AuthorDate: Tue May 28 08:08:55 2019 +0200
Commit:     Thomas Hellstrom <thellstrom@vmware.com>
CommitDate: Thu Aug 15 08:39:27 2019 +0200

    drm/vmwgfx: Kill unneeded legacy security features

> Reviewed-by: Roland Scheidegger <sroland@vmware.com>
>
Thank you. Will push to drm-misc in a moment.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
